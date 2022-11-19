<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>miniGameboard</title>

</head>
<body>
		<% 
		//현재 세션 상태 체크
		String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">jsp 게시판웹</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="./bbs.jsp">게시판</a></li>
				
			</ul>
			<%
				//로그인 하지 않았을때
				if(userID==null){
					
					//헤더 우측 영역
				
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기
					<span class="caret"></span></a>
					<!-- 드랍다운 아이템 영역-->
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					
					</ul>
				</li>
			</ul>
		</div>
	</nav>
<!-- 꾸며줄 공간의 div태그를 하나 구현해 준다. -->
	<div class="container">
		<!-- 일반적으로 웹사이트를 소개하는 영역이 있는데 그것을 바로 jumbotron이라고 부른다, bootstrap에서 제공하는 요소이다. -->
		<div class="jumbotron">
			<!-- 공간의 제목 -->
			<h1>김재범의 웹사이트</h1>
			<!-- 내용 -->
			<p>안녕하세요 김재범 입니다.<br>
			배운 내용을 토대로 간단한 미니게임을 만들었으니<br>
			 의견은 게시판에 남겨주세요!<br>
			 (게임은 로그인시 이용가능합니다.)</p>
			<!-- p태그로 감싸서 a태그로 디자인용 button을 하나만든다. 하나쯤 있는게 이쁘기때문에. -->
			<p><a class="btn btn-primary btn-pull" href="https://blog.naver.com/kimjm3435" role="button">자세히 알아보기</a></p>
		</div>
	</div>
			<%
			// 로그인시 보여주는 화면
			}else{
				
			
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원관리
					<span class="caret"></span></a>
					<!-- 드랍다운 아이템 영역-->
					<ul class="dropdown-menu">
						<li><a href="uUpdateform.jsp?userID=<%=userID%>">회원수정</a></li>
						<li><a onclick="return confirm('정말 삭제하시겠습니까?')" href="<%=request.getContextPath() %>/uDeleteAction.jsp?userID=<%= userID %>">회원삭제</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
<!-- 꾸며줄 공간의 div태그를 하나 구현해 준다. -->
	<div class="container">
		<!-- 일반적으로 웹사이트를 소개하는 영역이 있는데 그것을 바로 jumbotron이라고 부른다, bootstrap에서 제공하는 요소이다. -->
		<div class="jumbotron">
			<!-- 공간의 제목 -->
			<h1>김재범의 웹사이트</h1>
			<!-- 내용 -->
			<p>안녕하세요 김재범 입니다.<br>
			배운 내용을 토대로 간단한 미니게임을 만들었으니<br>
			 의견은 게시판에 남겨주세요!</p>
			<!-- p태그로 감싸서 a태그로 디자인용 button을 하나만든다. 하나쯤 있는게 이쁘기때문에. -->
			<p><a class="btn btn-primary btn-pull" href="https://blog.naver.com/kimjm3435" role="button">자세히 알아보기</a></p>
		</div>
	</div>
	<!-- 사진을 넣을 공간을 div로 구현해 준다. -->
	<div class="container">
		<!-- 공간의id는 myCarousel = 사진첩이라고 할 수 있다. -->
		<div id="myCarousel" class="carousel slide" data-rid="carousel">
			<!-- ol태그는 번호를 앞에 붙여 목록을 만드는 형식이다. 지시자를 구현해 준다.-->
			<ol class="carousel-indicators">
				<!-- 넣을 이미지가 3개 이기때문에, 3개를 넣어주고 맨 처음보여줄 부분에 active를 붙여준다. -->
				<li data-target="#myCarousel" data-slice-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slice-to="1"></li>
				<li data-target="#myCarousel" data-slice-to="2"></li>
			</ol>
			<!-- 실질적으로 이미지가 들어 갈 수있는 부분을 구현해 준다.  -->
			<div class="carousel-inner" >
				<!-- 현재 선택이 되어있는 사진을 보여준다, -->
				<div class="item active" >
					<!-- images파일 안에있는 1이라는 사진을 가져온다 -->
					<center><a href="tetris/tetris.html">테트리스<img src="images/1.PNG"></a></center>
				</div>
				<div class="item">
					<center><a href="2048/2048.html">2048<img src="images/2.PNG"></a></center>
				</div>
				<div class="item">
					<center><a href="mathBaseball/Baseball.html">숫자야구<img src="images/3.PNG"></a></center>
				</div>
			</div>
			<!-- 이제 사진을 양 옆으로 넘길 수 있는 버튼을 구현 해준다. -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<!-- 버튼 내에 이모티콘을 구현해 준다. -->
				<span class="glyphicon glyphicon-chevron-left"></span>
			<!-- 이러면 아이콘으로 된 버튼의 왼쪽으로 옮기는 버튼 구현이 끝났다. -->
			</a> 
			<a class="right carousel-control" href="#myCarousel" data-slide="next"> 
			<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>

			<%
			}
			%>

<!-- JavaScript Bundle with Popper -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
