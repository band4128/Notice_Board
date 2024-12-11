<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Update.UpdateDAO"%>
<%@page import="Update.UpdateDTO"%>
<!DOCTYPE html>
<html>
<head>
<%
String notice_no = request.getParameter("notice_no");
UpdateDAO updatedao = new UpdateDAO();
UpdateDTO updatedto = updatedao.getDataByNoticeNo(notice_no);
%>
<meta charset="utf-8">
<link href="./css/Update.css" rel="stylesheet" type="text/css">
<title>수정하기</title>
</head>
<body>
	<form action="UpdateAction.jsp" method="post">
		<div class="container">
			<div class="header">
				<h1>수정하기</h1>
			</div>
			<div class="update">
				<div class="update_title">
					<h1>수정하기</h1>
				</div>
				<div class="update_text">
					<%
					// notice_no에 맞는 데이터가 있으면 수정 폼을 표시
					if (updatedto != null) {
					%>
					<p class="number">번호(수정 불가) : <input name="notice_no" type="text" value="<%=updatedto.getNotice_no()%>" readonly="readonly" /></p>
					<p class="title">제목 : <input name="title" type="text" value="<%=updatedto.getTitle()%>"/></p>
					<p class="name">이름 : <input name="name" type="text" value="<%=updatedto.getName()%>" readonly="readonly"/> </p>
					<p class="text" >내용 : <input name="content" type="text" value="<%=updatedto.getContent()%>"/></p>
					<%
					}
					%>
				</div>
				<div class="update_close">
					<button class="updatebtn">수정</button>
					<button class="closebtn">
						<a href="./Main.jsp">닫기</a>
					</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
