<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userNickname"/>
<jsp:setProperty name="user" property="userGender"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(user.getUserID()==null || user.getUserPassword()==null || user.getUserEmail()==null
		|| user.getUserName()==null || user.getUserNickname()==null || user.getUserGender()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력 안된 사항 있음.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO= new UserDAO();
			int result = userDAO.join(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미존재하는 아이디.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>