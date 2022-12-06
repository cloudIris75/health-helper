<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>루틴 추가</title>
	<script type="text/javascript" src="./js/validation.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<h1 class="container py-4">루틴 추가</h1>
	<div class="container">
		<form name="newRoutine" action="./processAddRoutine.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="row mb-4">
				<div class="col-md-6">
					<div class="form-group row">
						<label class="col-sm-2">루틴 ID</label>
						<div class="col-sm-6">
							<input type="text" id="routineId" name="routineId" class="form-control mb-2" >
							<p class="text-danger">* 루틴 ID는 수정할 수 없습니다.</p>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">운동 *</label>
						<div class="col-sm-6">
							<select name="exerciseId">
								<%@ include file="connectDB.jsp" %>
								<%
									Statement stat = null;
									ResultSet result = null;
									String sql = "select * from exercise";
									
									stat = connection.createStatement();
									result = stat.executeQuery(sql);
									while(result.next()) {
								%>
								<option value="<%=result.getString("id")%>"><%=result.getString("name")%></option>
								<%
									}	
									result.close();
									stat.close();
									connection.close();
								%>	
							</select>
						</div>
					</div>
					<hr/>
					<div class="form-group row">
						<div class="col-sm-2">
						</div>
						<div class="col-sm-2">
							<input type="text" name="number" class="form-control" >
						</div>
						<label class="col-sm-2">회</label>
						<div class="col-sm-2">
							<input type="text" name="sets" class="form-control" >
						</div>
						<label class="col-sm-2">세트</label>
					</div>
					<div class="form-group row">
						<div class="col-sm-2">
							<p>또는</p>
						</div>
						<div class="col-sm-2">
							<input type="text" name="minutes" class="form-control" >
						</div>
						<label class="col-sm-2">분</label>
						<div class="col-sm-2">
							<input type="text" name="seconds" class="form-control" >
						</div>
						<label class="col-sm-2">초</label>
					</div>
					<div class="row w-100">
						<div class="col-sm-2"></div>
						<p>* 운동에 따라 횟수 또는 시간을 입력하세요.</p>
					</div>
					<div class="row">
						<div class="col-sm-2">예시)</div>
						<p>
							<b>15회 3세트 / 0분 0초</b> 또는<br/>
							<b>0회 0세트 / 1분 30초</b>
						</p>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group row">
						<label class="col-sm-3">메모 1</label>
						<div class="col-sm-6">
							<input type="file" name="image1" class="form-control" ><br/>
							<textarea name="memo1" cols="50" rows="2" class="form-control" ></textarea>
						</div>
					</div>
					<hr/>
					<div class="form-group row">
						<label class="col-sm-3">메모 2</label>
						<div class="col-sm-6">
							<input type="file" name="image2" class="form-control" ><br/>
							<textarea name="memo2" cols="50" rows="2" class="form-control" ></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<input type="button" class="btn btn-primary" value="추가" onclick="CheckAddRoutine()" >
			</div>
		</form>
	</div>
</body>
</html>