<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>문의글 수정 페이지</title>
</head>
<body>
	<p align="center">
		이용 문의글 수정페이지입니다<br> <br>
	<form role="form" action="modify" method="post">
		<input type='hidden' name='page' value="${cri.page}"> 
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
		<div class="box-body">

			<div class="form-group">
				<label for="exampleInputEmail1">글번호</label> <input type="text"
					name='qna_no' class="form-control" value="${qnaVO.qna_no}"
					readonly="readonly">
			</div>

			<div class="form-group">
				<label for="exampleInputEmail1">제목</label> <input type="text"
					name='qna_title' class="form-control" value="${qnaVO.qna_title}">
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">내용</label>
				<textarea class="form-control" name="qna_content" rows="3">${qnaVO.qna_content}</textarea>
			</div>

			<div class="form-group">
				<label for="exampleInputEmail1">작성자</label> <input type="text"
					name="qna_writer" class="form-control" value="${qnaVO.qna_writer}"
					readonly="readonly">
			</div>
		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">저장</button>
			<button type="submit" class="btn btn-warning">취소</button>
		</div>
	</form>

	
</body>
</html>