<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Routine" %>
<%@ page import="dao.RoutineRepository" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<meta charset="UTF-8">
		<title>헬스 헬퍼: Health Helper</title>
	</head>
	<body>
		<jsp:include page="menu.jsp" />
		<div class="container p-3">
		<%@ include file="connectDB.jsp" %>
		<%
			Statement stat = null;
			ResultSet result = null;
			String sql = "select * from routine join exercise on routine.exercise_id = exercise.id";
			
			stat = connection.createStatement();
			result = stat.executeQuery(sql);
			while(result.next()) {
		%>
			<div class="row border rounded p-3 d-flex align-items-center" align="center">
				<div class="col-md-2">
					<h3><%=result.getString("name")%></h3>
				</div>
				<div class="col-md-2">
					<p class="text-center m-0">
						<%=result.getInt("number")%>회 <%=result.getInt("sets")%>세트<br/>
						<%=result.getInt("minutes")%>분 <%=result.getInt("seconds")%>초
					</p>
				</div>
				<div class="col-md-3 d-flex align-items-center">
					<img src="./images/<%=result.getString("filename1")%>" style="width:50%">
					<p class="text-center m-0 w-100 pl-2"><%=result.getString("memo1")%></p>
				</div>
				<div class="col-md-3 d-flex align-items-center">
					<img src="./images/<%=result.getString("filename2")%>" style="width:50%">
					<p class="text-center m-0 w-100 pl-2"><%=result.getString("memo2")%></p>
				</div>
				<div class="col-md-2 d-flex justify-content-end">
					<a href="./routine.jsp?id=<%=result.getString("id")%>" class="btn btn-secondary" style="height:40px" role="button">상세 정보 &raquo;</a>
				</div>
			</div>
		<%
			}	
			result.close();
			stat.close();
			connection.close();
		%>	
		</div>
	</body>
</html>