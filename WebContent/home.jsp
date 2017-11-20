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

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jq-3.2.1/dt-1.10.16/datatables.min.css"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/DataTables-1.10.16/css/jquery.dataTables.min.css"/>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jq-3.2.1/dt-1.10.16/datatables.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/jQuery-3.2.1/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADIT Internet</title>
<style>
body, html {
    height: 100%;
    
}

.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
}

.btn.btn-adduser {
    /*background-color: #4d90fe; */
    background-color: rgb(104, 145, 162);
    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33)); */
    font-weight: 700;
    font-size: 14px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transition: all 0.218s;
    transition: all 0.218s;
    align:center;
}

.btn.btn-adduser:hover,
.btn.btn-adduser:active,
.btn.btn-adduser:focus {
    background-color: rgb(12, 97, 33);
}



</style>
</head>
<body>
<div class="container">
	<button class="btn btn-primary btn-adduser" type="submit" onclick="location.href='newuser.jsp';">Add User</button>
</div>

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
	
	</body>
	
</html>