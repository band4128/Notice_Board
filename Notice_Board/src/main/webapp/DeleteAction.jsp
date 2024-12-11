<%@page import="Create.createDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Delete.deleteDAO"%>
<%@page import="Delete.deleteDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 삭제 --%>
	<%
	request.setCharacterEncoding("UTF-8");
	
	// 파라미터 값 받기
	String notice_no = request.getParameter("notice_no");
	
	// 받은 notice_no의 값을 해당 객체 setNotice_no 통해 설정
	deleteDTO deletedto = new deleteDTO();
	deletedto.setNotice_no(notice_no);
	
	// 메소드로 전달해 삭제 작업
	deleteDAO deletedao = new deleteDAO();
	deletedao.Delete(deletedto);
	
	// 삭제
	response.sendRedirect("Main.jsp");
	%>
</body>
</html>