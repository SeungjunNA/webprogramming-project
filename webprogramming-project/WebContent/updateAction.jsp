<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		Board board = new BoardDAO().getBoard(boardID);
		if (request.getParameter("boardTitle") == null || request.getParameter("boardTitle").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제목을 입력하세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("boardContent") == null || request.getParameter("boardContent").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력하세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BoardDAO boardDAO = new BoardDAO();
			int result = boardDAO.update(board.getBoardID(), request.getParameter("boardTitle"), request.getParameter("boardContent"));
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