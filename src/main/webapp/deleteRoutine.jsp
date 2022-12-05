<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connectDB.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Delete Routine</title>
</head>
<body>
	<%
		String routineId = request.getParameter("id");
	
		PreparedStatement pstmt = null;
		ResultSet result = null;
		
		String sql = "select * from routine";
		pstmt = connection.prepareStatement(sql);
		result = pstmt.executeQuery();
		
		if(result.next()) {
			sql = "delete from routine where id=?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, routineId);
			pstmt.executeUpdate();
		} else 
			out.println("일치하는 루틴이 없습니다.");
		
		if(result != null)
			result.close();
		if(pstmt != null)
			pstmt.close();
		if(connection != null)
			connection.close();
		
		response.sendRedirect("home.jsp");
	%>
</body>
</html>