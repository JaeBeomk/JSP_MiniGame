<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="dao.Udao"%>
<%@page import="dto.User"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="dto.User" scope="page"/>
<html>
<head>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
</head>
<body>
    <%
    	String userID=request.getParameter("userID");
	 	Udao udao=new Udao();
		udao.uDelete(userID);
		session.invalidate();
 	%>

<script>
	alert('삭제되었습니다.');
	location.href="main.jsp";
</script>
</body>
</html>