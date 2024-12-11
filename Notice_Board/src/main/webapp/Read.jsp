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
<link href="./css/Read.css" rel="stylesheet" type="text/css">
<title><%=updatedto.getNotice_no() %></title>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1><%=updatedto.getName()%>님의 '<%=updatedto.getTitle()%>'
			</h1>
		</div>
		<div class="read">
			<div class="read_text">
				<%
				// notice_no에 맞는 데이터가 있으면 수정 폼을 표시
				if (updatedto != null) {
				%>
					<p class="title">제목 : <input name="title" type="text" value="<%=updatedto.getTitle()%>" readonly="readonly"/></p>
					<p class="name">이름 : <input name="name" type="text" value="<%=updatedto.getName()%>"  readonly="readonly"/> </p>
					<p class="text" >내용 : <input name="content" type="text" value="<%=updatedto.getContent()%>"  readonly="readonly"/></p>
				<%
				}
				%>
			</div>
			<div class="close">
				<button class="closebtn">
					<a href="./Main.jsp">닫기</a>
				</button>
			</div>
		</div>
	</div>
</body>
</html>
