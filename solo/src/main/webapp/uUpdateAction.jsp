<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
<%@page import="dao.Udao"%>
<%@page import="dto.User"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="dto.User" scope="page"/>

<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>

<%

Udao udao=new Udao();
udao.uUpdate(user);
response.sendRedirect(request.getContextPath()+"/main.jsp");


%>