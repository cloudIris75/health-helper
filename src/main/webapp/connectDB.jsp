<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연결</title>
</head>
<body>
	<%
		Connection connection = null;
	
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcURL = "jdbc:mysql://localhost:3306/HealthHelperDB";
		String dbUser = "root";
		String dbPW = "Root!7537";
		
		connection = DriverManager.getConnection(jdbcURL, dbUser, dbPW);
	%>
</body>
</html>