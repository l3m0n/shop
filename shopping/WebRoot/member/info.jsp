<%@ page pageEncoding="utf-8"%>
<form class="form-horizontal" role="form">

  <div class="form-group">
    <label for="inputName3" class="col-sm-2 control-label">钱包</label>
    <div class="col-sm-10">
      <div  class="form-control">${memberInfo.money}</div>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputName3" class="col-sm-2 control-label">会员名</label>
    <div class="col-sm-10">
      <div  class="form-control">${memberInfo.name}</div>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputName3" class="col-sm-2 control-label">真实姓名</label>
    <div class="col-sm-10">
      <div  class="form-control">${memberInfo.realname}</div>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputTel3" class="col-sm-2 control-label">tel</label>
    <div class="col-sm-10">
      <div  class="form-control">${memberInfo.tel}</div>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputSite3" class="col-sm-2 control-label">住址</label>
    <div class="col-sm-10">
      <div  class="form-control">${memberInfo.homesite}</div>
    </div>
  </div>
  
</form>