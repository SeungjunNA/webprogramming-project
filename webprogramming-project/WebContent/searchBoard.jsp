<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
/* 메뉴 바 스타일 */
.menu-bar {
	margin-bottom: 20px; /* menu.jsp와의 간격을 조절 */
}

/* 글목록 컨테이너 */
.post-list {
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	padding: 20px;
	max-width: 1000px; /* 최대 너비 설정 */
	margin: 100px 400px 0px 400px; /* 상단 간격 조절 */
}

/* 글목록 항목 스타일 */
.post-item {
	padding: 10px 0;
}

/* 글목록 제목 */
.post-title {
	font-size: 18px;
	font-weight: bold;
}

/* 글목록 날짜 */
.post-date {
	font-size: 12px;
	color: #999999;
}
/* 글작성자 */
.post-author {
	font-size: 12px;
	color: #999999;
}
/* 글작성 버튼 */
.write-button {
	float: right;
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
}
</style>
</head>
<body>
	<jsp:include page="menubar.jsp" />

	<div class="post-list">
		<%
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			int pageNumber = 1;
			if (request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
			String searchText = request.getParameter("searchText");
			if (userID != null) {
		%>
		<button class="btn btn-primary" onclick="location.href = 'write.jsp' "
			style="float: right">글작성</button>
		<%
			}
		%>
		<div class="post-item">
			<h3>
				"<%=searchText%>" 검색 결과
			</h3>
			<%
				UserDAO userDAO = new UserDAO();
				BoardDAO boardDAO = new BoardDAO();
				ArrayList<Board> list = boardDAO.getSearchList(pageNumber, searchText);
				for (int i = 0; i < list.size(); i++) {
					User user = userDAO.getUser(list.get(i).getUserID());
			%>
			<hr>
			<div>
				<a class="post-title"
					href="detail.jsp?boardID=<%=list.get(i).getBoardID()%>"
					style="color: black; text-decoration: none;"> <%=list.get(i).getBoardTitle()%>
				</a>
				<div class="post-author">
					<%=user.getUserNickname()%>
				</div>
			</div>
			<div>
				<div class="post-date"><%=list.get(i).getBoardDate()%></div>
			</div>
			<%
				}
			%>
			<hr>
		</div>
		<%
			if (pageNumber != 1) {
		%>
		<a href="searchBoard.jsp?pageNumber=<%=pageNumber - 1%>"
			class="btn btn-primary">이전</a>
		<%
			}
			if (list.size() != 0) {
				if (list.get(0).getBoardID() / 10 > 0 && list.get(0).getBoardID() % 10 > 0) {
		%>
		<a href="searchBoard.jsp?pageNumber=<%=pageNumber + 1%>"
			class="btn btn-primary">다음</a>
		<%
			}
			} else {
		%>
		<h3>찾으시는 제목의 글이 없습니다.</h3>
		<%
			}
		%>
	</div>
</body>
</html>