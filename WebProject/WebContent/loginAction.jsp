<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(),user.getUserPassword());
		if(result==1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = main.jsp");
			script.println("</script>");
		}
		else if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('no id')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result==-2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('db error')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('wrong pwd')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>