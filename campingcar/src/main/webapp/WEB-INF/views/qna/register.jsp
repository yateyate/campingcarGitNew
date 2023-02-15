<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>이용 문의글 작성 페이지</title>
</head>
<body>
	<div align="center">이용 문의글 작성</div>
	<br>
	<br>
	<form role="form" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputPassword1">문의글 제목</label>
				<input type="text" name='qna_title' class="form-control" placeholder="Enter Title">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">문의글 내용</label>
				<textarea class="form-control" name="qna_content" rows="3"
					placeholder="Enter....."></textarea>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">작성자</label>
				<input type="text" name="qna_writer" class="form-control" placeholder="Enter Writer">
			</div>
		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">문의글 작성</button>
		</div>
	</form>
</body>
</html>