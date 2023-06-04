<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
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
		
		String userID = null;
		if(request.getParameter("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		User user = new UserDAO().getUser(userID);
		if (request.getParameter("userPassword") == null || request.getParameter("userPassword").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 입력하세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("userEmail") == null || request.getParameter("userEmail").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일을 입력하세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("userNickname") == null || request.getParameter("userNickname").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('닉네임을 입력하세요.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.update(request.getParameter("userID"), request.getParameter("userPassword"), request.getParameter("userEmail"), request.getParameter("userNickname"));
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원정보 수정 실패.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='index.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>