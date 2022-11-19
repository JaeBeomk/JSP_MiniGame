<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@page import="dao.Udao"%>
<%@page import="dto.User"%>

<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>회원수정</title>
</head>
<body>
<jsp:useBean id="user" class="dto.User" scope="page"/>

<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<%
String userID = request.getParameter("userID");
System.out.println(userID+"유저 아이디");
Udao udao=new Udao();

User u=udao.uSelect(userID);
String dbid = u.getUserID();
String dbpw = u.getUserPassword();
String dbname = u.getUserName();
String dbemail = u.getUserEmail(); 
System.out.println(dbid);
System.out.println(dbpw);
System.out.println(dbname);
System.out.println(dbemail);
%>
 	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="./main.jsp">jsp 게시판웹</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="./main.jsp">메인</a></li>
				<li><a href="../bbs.jsp">게시판</a></li>
			</ul>
		</div>
	</nav>
<div class="container">
		<div class="col-lg-9">
			<div class="jumbotron" style="padding-top:20px;">
				<form method="post" action="<%= request.getContextPath() %>/uUpdateAction.jsp?">
				<h3 style="text-align:center;">회원수정</h3>
				<div class="form-group">아이디
					<input type="text" class="form-control" placeholder="아이디" name="userID" value="<%=userID %>" maxlength="20">
				</div>
				<div class="form-group" >비밀번호
					<input type="password"  id="userpw" class="form-control" placeholder="비밀번호" name="userPassword" value="<%=dbpw%>" maxlength="20">
				</div>
				<div class="form-group" >비밀번호 확인
					<input type="password" id="checkPw" class="form-control" placeholder="비밀번호 확인"  maxlength="20">
					<p style="font-size:font-size: 15px;"></p>
				</div>				
				<div class="form-group">이름
					<input type="text" class="form-control" placeholder="이름" name="userName" value="<%=dbname%>" maxlength="20">
				</div>
				<div class="form-group">이메일
				<input type="email" class="form-control" placeholder="이메일" name="userEmail" value="<%=dbemail %>" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="회원 수정">				
	
				</form>
			</div>password
		</div>
	</div>
<script>
const $checkPw = document.getElementById('checkPw');
$checkPw.addEventListener('blur', function(){
    console.log({event});
    const $PW = document.querySelector('input[name="userPassword"]');
    const checkPw = event.target; 
    if($PW.value != checkPw.value){
      checkPw.nextElementSibling.textContent = '입력하신 비밀번호와 일치하지않습니다.';
      checkPw.focus();
      return false;
    }
    checkPw.nextElementSibling.textContent = '';
  });
</script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>