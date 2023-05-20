<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="boardTitle" />
<jsp:setProperty name="board" property="boardContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = (String) session.getAttribute("userID");
		if (board.getBoardTitle() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제목을 입력하세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (board.getBoardContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력하세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BoardDAO boardDAO = new BoardDAO();
			int result = boardDAO.write(board.getBoardTitle(), userID, board.getBoardContent());
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 실패.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>