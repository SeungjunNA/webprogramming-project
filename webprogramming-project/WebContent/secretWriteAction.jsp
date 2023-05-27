<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.SecretBoardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%	request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="secretBoard" class="board.SecretBoard" scope="page" />
<jsp:setProperty name="secretBoard" property="boardTitle" />
<jsp:setProperty name="secretBoard" property="boardContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = (String) session.getAttribute("userID");
		if (secretBoard.getBoardTitle() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제목을 입력하세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (secretBoard.getBoardContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력하세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			SecretBoardDAO secretBoardDAO = new SecretBoardDAO();
			int result = secretBoardDAO.write(secretBoard.getBoardTitle(), userID, secretBoard.getBoardContent());
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 실패.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='secretBoard.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>