<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Create.createDTO"%>
<%@ page import="Create.createDAO"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/Main.css">
<title>게시판</title>
</head>
<body>
	<%
	createDAO createdao = new createDAO();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	conn = createdao.getConnection();
	String sql = "select * from notice order by notice_no desc";
	
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	%>
	<div class="container">
		<div class="header">
			<h1>게시판</h1>
		</div>
		<div class="session">
			<div class="notice_board_top">
				<button>
					<a href="./Create.jsp">추가하기</a>
				</button>
			</div>
			<div class="notice_board_mid">
				<div class="nbm">
					<div class="nbm_number">
						<p>번호</p>
					</div>
					<div class="nbm_title">
						<p>제목</p>
					</div>
					<div class="nbm_name">
						<p>이름</p>
					</div>
					<div class="nbm_text">
						<p>내용</p>
					</div>
				</div>
				<div class="sub_nbm_content">
					<%
					while(rs.next()){
					%>
					<div class="sub_nbm_table">

						<div class="sub_nbm_number">
							<p><%=rs.getString("notice_no")%></p>
						</div>
						<div class="sub_nbm_title">
							<a href="Read.jsp?notice_no=<%=rs.getString("notice_no")%>"><%=rs.getString("title")%></a>
						</div>
						<div class="sub_nbm_name">
							<p><%=rs.getString("name")%></p>
						</div>
						<div class="sub_nbm_text">
							<p><%=rs.getString("content")%></p>
						</div>
						<div class="delete_update">
							<button class="update">
								<a href="Update.jsp?notice_no=<%=rs.getString("notice_no")%>">수정</a>
							</button>
							<form action="DeleteAction.jsp" method="post">
								<button class="delete">
									<a href="DeleteAction.jsp?notice_no=<%=rs.getString("notice_no")%>">삭제</a>
								</button>
							</form>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
