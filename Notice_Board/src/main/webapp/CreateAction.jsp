<%@page import="Create.createDAO"%>
<%@page import="Create.createDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 입력한 값을 db로 저장 --%>
	<%
	request.setCharacterEncoding("UTF-8");

	// 1. 파라미터값 받기
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");

	// 2. 입력한 값을 createdto로 묶기
	createDTO createdto = new createDTO();
	createdto.setTitle(title);
	createdto.setName(name);
	createdto.setContent(content);

	// 3. 메소드로 전달하여 생성 작업
	createDAO createdao = new createDAO();
	createdao.CreateInsert(createdto);

	// 4. 생성
	response.sendRedirect("Main.jsp");
	%>
</body>
</html>