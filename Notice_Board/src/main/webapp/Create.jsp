<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="./css/Create.css" rel="stylesheet" type="text/css">
<title>추가하기</title>
</head>
<body>
	<form action="CreateAction.jsp" method="post">
		<div class="container">
			<div class="header">
				<h1>게시판 - 추가하기</h1>
			</div>
			<div class="create">
				<div class="create_title">
					<h1>추가하기</h1>
				</div>
				<div class="create_text">
					<p class="title">제목 : <input name="title" type="text"/></p>
					<p class="name">이름 : <input name="name" type="text"/> </p>
					<p class="text" >내용 : <input name="content" type="text"/></p>
				</div>
				<div class="add_close">
					<button class="add">추가</button>
					<button class="close">
						<a href="./Main.jsp">닫기</a>
					</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
