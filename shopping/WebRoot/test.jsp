<%@ page language="java" import="java.sql.*" pageEncoding="utf-8" %>
<%@ page language="java" import="admin_db.login" %>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="javabean.adminBean" %>
<%@ page language="java" import="comm.dbconn" %>

<%

login test = new login();
adminBean date = test.getLogin();

%>
<%=date.getPassword()%>
<%=date.getUsername()%>
