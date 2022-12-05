<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Routine" %>
<%@ page import="dao.RoutineRepository" %>
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
		resultId = "R" + exerciseId;
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
	String sql = "insert into routine values(?,?,?,?,?,?,?,?,?,?)";
	pstmt = connection.prepareStatement(sql);
	pstmt.setString(1, resultId);
	pstmt.setString(2, exerciseId);
	pstmt.setInt(3, resultNumber);
	pstmt.setInt(4, resultSets);
	pstmt.setInt(5, resultMinutes);
	pstmt.setInt(6, resultSeconds);
	pstmt.setString(7, memo1);
	pstmt.setString(8, filename1);
	pstmt.setString(9, memo2);
	pstmt.setString(10, filename2);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (connection != null)
		connection.close();
	
	response.sendRedirect("home.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Process Add Routine</title>
</head>
<body>

</body>
</html>