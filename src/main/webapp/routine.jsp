<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>루틴 상세 정보</title>
	<script type="text/javascript">
		function deleteConfirm(id) {
			if (confirm("해당 루틴을 삭제하시겠습니까?") == true)
				location.href = "./deleteRoutine.jsp?id=" + id;
			else
				return;
		}
	</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%@ include file="connectDB.jsp" %>
	<%
		String routineId = request.getParameter("id");
		
		PreparedStatement pstmt = null;
		ResultSet result = null;
		
		String sql = "select * from routine join exercise on routine.exercise_id = exercise.id where routine.id = ?";
		pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, routineId);
		result = pstmt.executeQuery();
		if (result.next()) {
	%>
	<div class="container">
		<h1 class="text-center p-4"><%=result.getString("name")%></h1>
		<div class="row mb-4">
			<div class="col-md-6 d-flex flex-column align-items-center">
				<h2 class="mb-4">운동 정보</h2>
				<div class="mb-4">
					<img src="./images/<%=result.getString("filename")%>" style="width:100%" alt="<%=result.getString("name")%>">
				</div>
				<div class="row w-100">
					<label class="col-sm-2 text-center">설명</label>
					<p class="col-sm-10"><%=result.getString("description")%></p>
				</div>
				<div class="row w-100">
					<label class="col-sm-2 text-center">운동 부위</label>
					<p class="col-sm-10"><%=result.getString("part")%></p>
				</div>
			</div>
			<div class="col-md-6 d-flex flex-column align-items-center">
				<h2 class="mb-4">나의 루틴</h2>
				<p class="text-center mb-4">
					<%=result.getInt("number")%>회 <%=result.getInt("sets")%>세트<br/>
					<%=result.getInt("minutes")%>분 <%=result.getInt("seconds")%>초
				</p>
				<div class="row w-100 mb-4">
					<div class="col-md-6 d-flex flex-column align-items-center">
						<div class="mb-2">
							<img src="./images/<%=result.getString("filename1")%>" style="width:100%">
						</div>
						<p><%=result.getString("memo1")%></p>
					</div>
					<div class="col-md-6 d-flex flex-column align-items-center">
						<div class="mb-2">
							<img src="./images/<%=result.getString("filename2")%>" style="width:100%">
						</div>
						<p><%=result.getString("memo2")%></p>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-end">
			<a class="btn btn-success text-light mr-4" href="./updateRoutine.jsp?id=<%=result.getString("id")%>" role="button">수정 &raquo;</a>
			<a class="btn btn-danger text-light" onclick="deleteConfirm('<%=result.getString("id")%>')" role="button">삭제 &raquo;</a>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>