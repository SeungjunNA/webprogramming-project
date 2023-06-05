
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="board.SecretBoardDAO"%>
<%@ page import="board.SecretBoard"%>
<%@ page import="java.util.ArrayList"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>심희스토리</title>
<style>
.home-container {
	display: flex;
}
/* 회원정보칸 스타일 */
.member-info {
	flex-basis: 20%;
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	padding: 50px 50px;
	margin-right: 20px;
	margin-top: 250px;
	margin-bottom: 150px;
}

/* 박스 컨테이너 스타일 */
.box-container {
	flex-basis: 75%;
	display: flex;
	justify-content: space-between;
	margin-top: 100px;
}

/* 박스 스타일 */
.box {
	width: calc(50% - 10px);
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-bottom: 1px;
	height: 600px;
}
.box a {
	color: black;
	text-decoration: none;
}
.box hr{
	border-width: 3px;
}
/* 글목록 제목 스타일 */
.post-title {
	font-size: 28px;
	font-weight: bold;
	margin-bottom: 10px;
	padding: 0px 210px;
}
</style>
</head>
<body>
	<jsp:include page="menubar.jsp"></jsp:include>


	<%
		String userID = null;
		String userName = null;
		String userNickname = null;
		String userEmail = null;
		String userGender = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			User user = new UserDAO().getUser(userID);
			userName = user.getUserName();
			userNickname = user.getUserNickname();
			userEmail = user.getUserEmail();
			userGender = user.getUserGender();
		}
	%>
	<div class="home-container">
		<%-- 회원 정보칸 --%>

		<%
			if (userID == null) {
		%>
		<div class="member-info">
			<h3>로그인을 해주세요</h3>
		</div>
		<%
			} else {
		%>
		<div class="member-info">
			<h2>회원 정보</h2>
			<%-- 회원 정보 내용을 여기에 추가 --%>
			<p>
				회원 이름:<%=userName%></p>
			<p>
				아이디:<%=userID%></p>
			<p>
				닉네임:<%=userNickname%></p>
			<p>
				성별:<%=userGender%></p>
		</div>
		<%
			}
		%>

		<%-- 박스 컨테이너 --%>
		<div class="box-container">
			<%-- 박스 1 --%>
			<div class="box">
				<h1 class="post-title">자유게시판</h1>
				<%
					BoardDAO boardDAO = new BoardDAO();
					ArrayList<Board> list1 = boardDAO.getList(1);
					int size1 = list1.size() < 8 ? list1.size() : 8;
					for (int i = 0; i < size1; i++) {
				%>
				<a href="detail.jsp?boardID=<%=list1.get(i).getBoardID()%>"><h2 style="color: black; text-decoration: none;"><%=list1.get(i).getBoardTitle()%></h2></a><hr>
				<%
					}
				%>
			</div>

			<%-- 박스 2 --%>
			<div class="box">
				<h1 class="post-title">비밀게시판</h1>
				<%
					SecretBoardDAO secretBoardDAO = new SecretBoardDAO();
					ArrayList<SecretBoard> list2 = secretBoardDAO.getList(1);
					int size2 = list2.size() < 8 ? list2.size() : 8;
					for (int i = 0; i < size2; i++) {
				%>
				<a href="secretDetail.jsp?boardID=<%=list2.get(i).getBoardID()%>"><h2><%=list2.get(i).getBoardTitle()%></h2></a><hr>
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>