<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Java EE demo</title>
<link rel="stylesheet" type="text/css" href="myStyle.css">
</head>
<body>


	<jsp:useBean id="user1" class="bean.User" scope="session"></jsp:useBean>
	<jsp:setProperty name="user1" property="*" />


	<%
		String action = request.getParameter("action");

		if (action !=null && action.equals("submitted")) {

			if (user1.validate()) {
				System.out.println("Validated ok !");
				request.getRequestDispatcher("/servlet").forward(request,	response);
			}
		}
	%>

	

	<br><br>
	
	<div class="login-block">
	
		<form action="${pageContext.request.contextPath}/forms.jsp" method="post">
		
			<h2>LOGIN</h2>
		
			<input type="hidden" name="action" value="submitted" />
			Email :
			<input type="text" name="email" value="<jsp:getProperty name= "user1" property ="email" />" /> <br> 
			Password : 
			<input type="text" name="password" value="<jsp:getProperty name= "user1" property ="password" />" /><br> 
			<input type="submit" value="OK" />
		</form>
		
		<div class="error">
			<h2><jsp:getProperty name="user1" property="message" /></h2>
		</div>

	</div>
	<br>
	<div class="login-block">	
		<a href='reset.jsp' >Zapomenuté heslo</a>
	</div>
</body>
</html>