<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="dto.Routine" %>
<%@ page import="dao.RoutineRepository" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Process Add Routine</title>
</head>
<body>
	<%@ include file="connectDB.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String folder = "./images/";
		String filePath = application.getRealPath(folder);
		int maxSize = 5 * 1024 * 1024;
		String encType = "utf-8";
		
		MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, encType, new DefaultFileRenamePolicy());
		
		String routineId = multi.getParameter("routineId");
		String exerciseId = multi.getParameter("exerciseId");
		String number = multi.getParameter("number");
		String sets = multi.getParameter("sets");
		String minutes = multi.getParameter("minutes");
		String seconds = multi.getParameter("seconds");
		String memo1 = multi.getParameter("memo1");
		String memo2 = multi.getParameter("memo2");
		
		String resultId;
		
		if(routineId == null)
			resultId = exerciseId + "123";
		else
			resultId = routineId;
		
		Integer resultNumber;
		
		if(number.isEmpty())
			resultNumber = 0;
		else
			resultNumber = Integer.valueOf(number);
		
		Integer resultSets;
		
		if(sets.isEmpty())
			resultSets = 0;
		else
			resultSets = Integer.valueOf(sets);
		
		Integer resultMinutes;
		
		if(minutes.isEmpty())
			resultMinutes = 0;
		else
			resultMinutes = Integer.valueOf(minutes);
		
		Integer resultSeconds;
		
		if(seconds.isEmpty())
			resultSeconds = 0;
		else
			resultSeconds = Integer.valueOf(seconds);
		
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement();
		String filename1 = multi.getFilesystemName(file);
		
		file = (String)files.nextElement();
		String filename2 = multi.getFilesystemName(file);
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "update routine set exercise_id=?, number=?, sets=?, minutes=?, seconds=? ,memo1=?, filename1=?, memo2=?, filename2=? where id=?";
		
		pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, exerciseId);
		pstmt.setInt(2, resultNumber);
		pstmt.setInt(3, resultSets);
		pstmt.setInt(4, resultMinutes);
		pstmt.setInt(5, resultSeconds);
		pstmt.setString(6, memo1);
		pstmt.setString(7, filename1);
		pstmt.setString(8, memo2);
		pstmt.setString(9, filename2);
		pstmt.setString(10, routineId);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
		response.sendRedirect("home.jsp");
	%>
</body>
</html>