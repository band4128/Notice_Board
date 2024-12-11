<%@page import="Create.createDTO"%>
<%@page import="Update.UpdateDAO"%>
<%@page import="Update.UpdateDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 입력한 값을 수정하여 db에 저장하기 --%>
	<%
	request.setCharacterEncoding("UTF-8");

	// 1. 파라미터값 받기
	String notice_no = request.getParameter("notice_no");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");

	// 2. 받은 파라미터 값을 해당 객체를 통해 설정
	UpdateDTO updatedto = new UpdateDTO();
	updatedto.setNotice_no(notice_no);
	updatedto.setTitle(title);
	updatedto.setName(name);
	updatedto.setContent(content);

	// 3. 메소드에 전달하여 수정 작업
	UpdateDAO updatedao = new UpdateDAO();
	updatedao.Update(updatedto);

	// 4. 수정
	response.sendRedirect("Main.jsp");
	%>
</body>
</html>