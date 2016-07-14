电商开发笔记：

### 结构
本次未用到其他框架，单纯的理解一下开发模式，与mvc相比，个人在jsp中理解这个模式是：
servlet做控制层，javabean做model层，前面的jsp则是view层

### 大概流程
访问 -> 过滤器 -> jsp -> servlet -> javabean -> servlet -> jsp

#####过滤器
刚学jsp的时候，jsp的编码真的很恶心，动不动就是乱码。其实用一个编码过滤器就能解决了。
过滤器是对所有访问符合匹配规则的都会先经过这个filter

```java
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        chain.doFilter(request, response);
    }
```

web.xml配置：

```xml
  <filter>
    <filter-name>EncodingFilter</filter-name>
    <filter-class>comm.EncodingFilter</filter-class>
  </filter>
  <filter-mapping>
    <filter-name>EncodingFilter</filter-name>
    <url-pattern>/*</url-pattern>
  </filter-mapping>
```

##### servlet
1、所有页面共用值，可以用session

```java
import javax.servlet.http.HttpSession;
HttpSession session = request.getSession();
session.getAttribute("memberUser");
session.setAttribute("memberUser",member.getName());
```

2、servlet与jsp之间的传值用,用的是请求转发(变量可转发过去),在服务端

```java
request.setAttribute("goods",goods);
request.getRequestDispatcher("./update_goods.jsp").forward(request, response);
```

3、如果在想包含一个servlet,就用下面的include方法,不能用forward跳转,不然报错是不能进行包含一个跳转页面,一般可以在页面展示信息交互多的地方使用。

```java
request.getRequestDispatcher("./index/login.jsp").include(request, response);
```

在jsp中带参数的包含:

```java
<jsp:include page="/index.do">
    <jsp:param name="aim" value="header" />
</jsp:include>
```

4、如果只是单纯的重定向,页面url会跳转,在客户端

```java
response.sendRedirect("xxx");
```

5、在servlet中输出文字
servlet里面的System.out.println输出只是在console中，如果想让它输出在客户端的页面的话

```java
import java.io.PrintWriter;
PrintWriter out = response.getWriter();
Message(out, "账号或者密码错误");
private void Message(PrintWriter out, String message) {
    out.println("<script>alert('" + message
        + "!');window.history.back();</script>");
    out.flush();
}
```

##### javabean
主要是对数据进行操作的一些javabean，代码重用没弄好，是对每个表弄了一个javabean，又弄了一个数据库操作的javabean，其中很多表的代码其实可以实现一个重用。

1、数据库连接

```java
static Connection conn = null;
static String driverClass = "com.mysql.jdbc.Driver";
static String url="jdbc:mysql://ip:3306/shopping?useUnicode=true&characterEncoding=UTF8";
static String username = "xxx";
static String password = "xxx";

public static Connection getConnection(){
    if(conn!=null){
        return conn;
    }else{
        try{
            Class.forName(driverClass);
            Connection res = DriverManager.getConnection(url, username, password);
            return res;
        }catch(Exception e){
            System.out.println("Db Error:"+e.getMessage());
            return null;
        }
    }
}
```

2、数据查询
比如查询所有商品信息：

```java
public List<goodsBean> getAll_goods(){
    List<goodsBean> Allgoods = new ArrayList<goodsBean>();
    try{
        Statement stmt = conn.createStatement();
        ResultSet res = stmt.executeQuery("select * from goods order by goods_id desc");
        while(res.next()){
            goodsBean goods = new goodsBean();
            goods.setAdd_time(res.getDate("add_time"));
            goods.setCategory_id(res.getInt("category_id"));
            goods.setDescription(res.getString("description"));
            goods.setGoods_id(res.getInt("goods_id"));
            goods.setImagePath(res.getString("imagePath"));
            goods.setName(res.getNString("name"));
            goods.setPrice(res.getFloat("price"));
            goods.setQuantity(res.getInt("quantity"));
            Allgoods.add(goods);
        }
    }catch(Exception e){
        e.printStackTrace();
    }
    return Allgoods;
}
```

3、数据操作

```java
public void add_goods(goodsBean goods){
    try{
        PreparedStatement pStmt = conn.prepareStatement("insert into goods (`name`,`price`,`quantity`,`description`,`imagePath`,`add_time`,`category_id`) values (?,?,?,?,?,?,?) ");
        pStmt.setString(1, goods.getName());
        pStmt.setLong(2, (long) goods.getPrice());
        pStmt.setLong(3, goods.getQuantity());
        pStmt.setString(4, goods.getDescription());
        pStmt.setString(5, goods.getImagePath());
        pStmt.setDate(6, new Date(goods.getAdd_time().getTime()));
        pStmt.setLong(7, goods.getCategory_id());
        pStmt.executeUpdate();
    }catch(SQLException e){
        e.printStackTrace();
    }
}
```

##### jsp
如果servlet用的是getRequestDispatcher.forward，在jsp这样用c指令接收值

```java
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach items="${Allgoods}" var="goods">
    <tr class="active">
      <td>${goods.goods_id}</td>
      <td>${goods.name}</td>
      <td>${goods.price}</td>
      <td>${goods.quantity}</td>
      <td>
          <a href="<%=path%>/admin/adminGoods?id=${goods.goods_id}"><button class='btn btn-primary' type='button btn-sm'>修改</button></a>
          <a href="<%=path%>/admin/adminGoods?del=${goods.goods_id}"><button class='btn btn-primary' type='button btn-sm'>删除</button></a>
      </td>
    </tr>
</c:forEach>
```

### 购物车功能实现
购物车订单相对其它功能繁杂了一点，将商品弄成一个list放入session中，最后取消订单也可以很方便的直接删，但是有一个严重的问题，就是对session的验证没到位(暂没想出什么方法来实现)，也就是登录注销后，其他用户可以看到这个订单。

jsp：

```
<%
Float Allmoney = (float)0;
try{
    List<orderBean> orderSession = (List<orderBean>)session.getAttribute("orderList");
    for(int i = 0; i < orderSession.size(); i++) {
    orderBean order = orderSession.get(i);
    Float money =  order.getPrice() * order.getBuy_quantity();
    Allmoney = Allmoney + money;
%>
<tr class="active">
    <td><%=order.getGoods_id()%></td>
    <td><%=order.getPrice()%></td>
    <td><%=order.getBuy_quantity()%></td>
    <td><%=money%></td>
</tr>
<%
    }}catch(Exception e){}
%>
```

servlet：

```
/*
* 提交订单
*/
List<orderBean> orderSession = (List<orderBean>)session.getAttribute("orderList");
Float Allmoney = (float)0;
for(int i=0;i<orderSession.size();i++){
orderModel.add_order(orderSession.get(i));
Allmoney = Allmoney + orderSession.get(i).getPrice() * orderSession.get(i).getBuy_quantity();
}

/*
* 用户money减少
*/
orderModel.d_money(Allmoney, (String)session.getAttribute("memberUser"));
session.setAttribute("orderList", null);
response.sendRedirect("./member_info.jsp");
```

### 问题总结
1、jsp页面支持el表达式，为false的时候才会解析表达式

```
＜%@ page isELIgnored＝"true|false"%＞
```

2、jsp页面乱码

```
<%@ page pageEncoding="utf-8"%>
```