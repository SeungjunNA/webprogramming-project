<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>심희스토리</title>
</head>
<body>
	<h1>홈 화면</h1>
	<jsp:include page="menubar.jsp"></jsp:include>	
	
	<%
		Connection conn = null;
	
	String url = "jdbc:mysql://localhost:3306/WEB_PROJECT";
	String id = "root";
	String pwd = "nsj0316";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, id, pwd);
	
	out.println("<h1>Mysql db 연결 성공!</h1>");
	%>
	
	
</body>
</html>