<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<title>글작성</title>
<style>
	.note-editable {
		background-color: #fff;
	}
</style>
</head>
<body>
	<h1>글쓰기 페이지</h1>
	<jsp:include page="menubar.jsp"></jsp:include>

	<form action="secretWriteAction.jsp" method="post"
		style="padding: 10px 300px 0px 300px;">
		<div class="form-group">
			<label>title</label> <input type="text" class="form-control"
				placeholder="title" name="boardTitle">
		</div>
		<div class="form-group">
			<label for="content">content</label>
			<textarea class="form-control" rows="5" id="summernote"
				name="boardContent" maxlength="2048"></textarea>
		</div>
		<div class="form-group" style="padding: 10px; float: right">
			<button type="submit" class="btn btn-primary">글쓰기 등록</button>
		</div>
	</form>
	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				tabsize : 5,
				height : 500
			});
		});
	</script>
</body>
</html>