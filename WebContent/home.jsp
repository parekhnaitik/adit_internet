<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="in.ac.adit.internet.dao.AditInternetDAO" %>
<%@ page import="java.sql.SQLException" %>

<%
	String username = (String)session.getAttribute("USERNAME");
		if(username==null)
			response.sendRedirect("index.jsp");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/DataTables-1.10.16/css/jquery.dataTables.min.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/jQuery-3.2.1/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>ADIT Internet</title>
<style>

body, html {
	height:100%;
	background-repeat: repeat;	
    background: linear-gradient(rgb(160,216,239),rgb(221,241,249)) no-repeat center center fixed;
}

.card-container.card {
    padding: 20px;
}

/*
 * Card component
 */
.card {
    background-color: #F7F7F7;
    /* just in case there no content*/
    padding: 10px 15px 10px;
    margin: 0 auto 10px;
    margin-top: 50px;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}


</style>
</head>
<body>
<div class="container">
    <div class="card card-container">
    	<button class="btn btn-primary btn-adduser" type="submit" onclick="location.href='newuser.jsp';">Add User</button>
	Welcome <%=username %>
	<a href="logout.jsp">Logout</a>
	<%
		AditInternetDAO dao = null; 
		ServletContext context = getServletContext();
		String db=context.getInitParameter("db");
		try {
			dao = new AditInternetDAO(db);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResultSet tableData = dao.getActiveUser(); 
	%>
	<br/><br/>
	<table id="example" class="display table table-hover table-striped" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>User Id</th>
				<th>Name</th>
				<th>Enrollment number</th>
				<th>Email Id</th>
				<th>Contact number</th>
				<th>Department</th>
				<th>User type</th>
			</tr>
		</thead>
		<tbody>
	<%	while(tableData.next()){
			String userId = tableData.getString("userId");
			String name = tableData.getString("firstName") + " "+ tableData.getString("lastName");
			String enrollmentNumber = tableData.getString("enrollmentNumber");
			String emailId = tableData.getString("emailId");
			String contactNumber = tableData.getString("contactNumber");
			String department = tableData.getString("department");
			String userType = tableData.getString("userType");
	%>
			<tr>
				<td><%= userId %></td>
				<td><%= name %></td>
				<td><%= enrollmentNumber %></td>
				<td><%= emailId %></td>
				<td><%= contactNumber %></td>
				<td><%= department %></td>
				<td><%= userType %></td>
			</tr>
	<%
		}
	%>
		</tbody>
	</table>
	
	<script>
	$(document).ready(function() {
	    $('#example').DataTable();
	} );
	</script>
	</div>
	</div>
	</body>
	
</html>