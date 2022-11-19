<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 액션가면</title>
</head>
<body>
	<% 
	//현재 세션 상태 체크
		String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		//로그인 했으면 회원가입이 불가능 하게
		if(userID !=null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되었습니다')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	if(user.getUserID() == null || user.getUserPassword()==null || user.getUserName()==null|| user.getUserGender() == null || user.getUserEmail()==null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('필수 입력 사항입니다.')");
		script.println("</script>");
	}else{
		Udao udao = new Udao();
		int result=udao.join(user);
		if(result==-1){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
			script.println("history.back()");
			
			script.println("</script>");
		}else{
			session.setAttribute("userID", user.getUserID());
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공')");
			script.println("location.href='main.jsp'");
			
			script.println("</script>");
		}
		
	}
	%>
</body>
</html>