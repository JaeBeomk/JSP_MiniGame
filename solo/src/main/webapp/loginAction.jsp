<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@page import="dao.Udao"%>
<%@page import="java.io.PrintWriter"%>
    
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="dto.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 액션</title>
</head>
<body>
	<%
	//현재 세션 상태 체크
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	//로그인 했으면 로그인 불가능 하게
	if(userID !=null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되었습니다')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	Udao u = new Udao();
	int result = u.login(user.getUserID(), user.getUserPassword());
	
	if(result==1){
		// 로그인 성공시 세션 부여
		session.setAttribute("userID", user.getUserID());
		session.setAttribute("userName", user.getUserName());
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 성공')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}else if(result==0){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 다릅니다')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result==-1){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result ==-2){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('오류입니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	%>
</body>
</html>