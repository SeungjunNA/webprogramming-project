<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	padding: 0;
	background-color: #f2f2f2;
}

.container {
	max-width: 800px;
	margin: 80px auto 0;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
}

.post-details {
	font-size: 14px;
	color: #888;
	margin-bottom: 20px;
}

.post-content {
	margin-bottom: 20px;
	color: #555;
	line-height: 1.5;
}

.comment-section {
	margin-top: 30px;
	border-top: 1px solid #ccc;
	padding-top: 20px;
}

.comment {
	margin-bottom: 15px;
	padding-bottom: 15px;
	border-bottom: 1px solid #ccc;
}

.comment .comment-details {
	font-size: 12px;
	color: #888;
	margin-bottom: 5px;
}

.comment .comment-content {
	color: #555;
	line-height: 1.3;
}

.comment-form {
	margin-top: 20px;
}

.comment-form textarea {
	width: 100%;
	height: 80px;
	resize: vertical;
}

.comment-form button {
	margin-top: 10px;
}

.back-link {
	display: inline-block;
	margin-top: 10px;
	color: #888;
	text-decoration: none;
}

.back-link:hover {
	text-decoration: underline; . edit-link { position : absolute;
	top: 20px;
	right: 20px;
	color: #888;
	text-decoration: none;
}

.edit-link {
	display: flex;
	color: #888;
	text-decoration: none;
}

}
.edit-link:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<jsp:include page="menubar.jsp"></jsp:include>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = board.jsp");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBoard(boardID);
	%>
	<div class="container">
		<%
			if (userID != null && userID.equals(board.getUserID())) {
		%>
		<a href="update.jsp?boardID=<%=boardID%>" class="edit-link btn btn-primary">수정하기</a> <a
			href="deleteAction.jsp?boardID=<%=boardID%>" class="edit-link btn btn-primary">삭제하기</a>
		<%
			}
		%>
		<h1><%=board.getBoardTitle()%></h1>
		<div class="post-details">
			<span class="post-date">작성일 : <%=board.getBoardDate()%></span> <br>
			<span class="post-author">작성자 : <%=board.getUserID()%></span>
		</div>
		<div class="post-content"><%=board.getBoardContent()%></div>
		<div class="comment-section">
			<div class="comment">
				<%
					CommentDAO commentDAO = new CommentDAO();
					ArrayList<Comment> list = commentDAO.getList(boardID);
					for (int i = 0; i < list.size(); i++) {
				%>
				<div class="comment-details">
					<span class="comment-date">작성일 : <%=list.get(i).getCommentDate() %></span>
					<span class="comment-author">작성자 : <%=list.get(i).getUserID() %></span>
				</div>
				<div class="comment-content"><%=list.get(i).getCommentContent() %></div>
				<%} %>
			</div>
		</div>
		<div class="comment-form">
			<%
				if(userID != null){
			%>
			<form action="commentWriteAction.jsp?boardID=<%=boardID%>" method="post">
				<textarea name="commentContent" placeholder="댓글을 입력하세요" required></textarea>
				<br>
				<button type="submit">댓글 작성</button>
			</form>
			<%
				}
			%>
		</div>
		<a href="javascript:history.back();" class="back-link btn btn-primary">뒤로 가기</a>
	</div>
</body>
</html>
