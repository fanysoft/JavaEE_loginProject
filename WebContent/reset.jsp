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


	<jsp:useBean id="user_reset" class="bean.User_reset" scope="session"></jsp:useBean>
	<jsp:setProperty name="user_reset" property="*" />


	<%
		String action = request.getParameter("action");

		if (action !=null && action.equals("submitted")) {

			if (user_reset.validate()) {
				System.out.println("Reset ok !");
				// kam přesměrovat po reset ?
				// request.getRequestDispatcher("/servlet").forward(request,	response);
			}
		}
	%>

	

	<br><br>
	
	<div class="login-block">
	
		<form action="${pageContext.request.contextPath}/reset.jsp" method="post">
			
			<h2>ZAPOMENUTE HESLO</h2>
		
			<input type="hidden" name="action" value="submitted" />Email : 
			<input type="text" name="email" value="<jsp:getProperty name= "user_reset" property ="email" />" /> <br> 
			<input type="submit" value="OK" />
			
		</form>
		
		<div class="error">
			<h2><jsp:getProperty name="user_reset" property="message" /></h2>
		</div>

	</div>
	<br>
	<div class="login-block">	
		<a href='forms.jsp' >Zpet na login</a>
	</div>
</body>
</html>