<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<meta charset="UTF-8">
	<title>루틴 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<h1 class="container py-4">루틴 수정</h1>
	<%@ include file="connectDB.jsp" %>
	<%
		String routineId = request.getParameter("id");
	
		PreparedStatement pstmt = null;
		ResultSet result = null;
		
		String sql = "select * from routine where id = ?";
		pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, routineId);
		result = pstmt.executeQuery();
		if (result.next()) {
	%>
	<div class="container">
		<form name="newRoutine" action="./processUpdateRoutine.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="row mb-4">
				<div class="col-md-6">
					<div class="form-group row">
						<label class="col-sm-2">루틴 ID</label>
						<div class="col-sm-6">
							<input type="text" id="routineId" name="routineId" class="form-control mb-2" value='<%=result.getString("id")%>' readonly >
							<p class="text-danger">* 루틴 ID는 수정할 수 없습니다.</p>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">운동 ID *</label>
						<div class="col-sm-6">
							<input type="text" id="exerciseId" name="exerciseId" class="form-control" value='<%=result.getString("exercise_Id")%>' >
						</div>
					</div>
					<hr/>
					<div class="form-group row">
						<div class="col-sm-2">
						</div>
						<div class="col-sm-2">
							<input type="text" id="number" name="number" class="form-control" value='<%=result.getInt("number")%>' >
						</div>
						<label class="col-sm-2">회</label>
						<div class="col-sm-2">
							<input type="text" id="sets" name="sets" class="form-control" value='<%=result.getInt("sets")%>' >
						</div>
						<label class="col-sm-2">세트</label>
					</div>
					<div class="form-group row">
						<div class="col-sm-2">
							<p>또는</p>
						</div>
						<div class="col-sm-2">
							<input type="text" id="minutes" name="minutes" class="form-control" value='<%=result.getInt("minutes")%>' >
						</div>
						<label class="col-sm-2">분</label>
						<div class="col-sm-2">
							<input type="text" id="seconds" name="seconds" class="form-control" value='<%=result.getInt("seconds")%>' >
						</div>
						<label class="col-sm-2">초</label>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group row">
						<label class="col-sm-3">메모 1</label>
						<div class="col-sm-6">
							<input type="file" name="image1" class="form-control" ><br/>
							<textarea name="memo1" cols="50" rows="2" class="form-control" ><%=result.getString("memo1")%></textarea>
						</div>
					</div>
					<hr/>
					<div class="form-group row">
						<label class="col-sm-3">메모 2</label>
						<div class="col-sm-6">
							<input type="file" name="image2" class="form-control" ><br/>
							<textarea name="memo2" cols="50" rows="2" class="form-control" ><%=result.getString("memo2")%></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<input type="submit" class="btn btn-primary" value="저장" >
			</div>
		</form>
	</div>
	<%
		}
		if(result != null)
			result.close();
		if (pstmt != null)
			pstmt.close();
		if (connection != null)
			connection.close();
	%>
</body>
</html>