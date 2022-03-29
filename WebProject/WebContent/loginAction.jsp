<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setPropertyname ="user" property="userID" />
<jsp:setPropertyname ="user" property="userPassword" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>JSP 웹사이트</title>
</head>
<body>

	<%
  UserDAO userDAO = new UserDAO();
  int result = userDAO.login(user.getUserID(), user.getUserPassword());
  if(result ==1){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("location.href = 'main.jsp'");
   script.println("</script>");  
  }
  if(result ==0){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('비밀번호가 틀립니다')");
   script.println("history.back()");
   script.println("</script>");  
  }
  if(result == -1){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('존재하지 않는 아이디 입니다.')");
   script.println("history.back()");
   script.println("</script>");  
  }
  
  if(result == -2){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('데이터 베이스 오류가 발생하였습니다. ')");
   script.println("history.back()");
   script.println("</script>");  
  }
  
 %>


</body>
</html>