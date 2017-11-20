<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADIT Internet</title>
<style>
body, html {
    height: 100%;
    background-repeat: no-repeat;
    background-image: linear-gradient(rgb(160,216,239),rgb(221,241,249));
}

.card-container.card {
    max-width: 350px;
    padding: 40px 40px;
}



/*
 * Card component
 */
.card {
    background-color: #F7F7F7;
    /* just in case there no content*/
    padding: 20px 25px 30px;
    margin: 0 auto 25px;
    margin-top: 50px;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}


.form-signin input[type=email],
.form-signin input[type=password],
.form-signin input[type=text],
.form-signin button {
    width: 100%;
    display: block;
    margin-bottom: 10px;
    z-index: 1;
    position: relative;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin .form-control:focus {
    border-color: rgb(104, 145, 162);
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
}

</style>
</head>
<body>
    <div class="container">
        <div class="card card-container">
        	<h3 align="center">User Registration</h3>
        	<br/>
            <form class="form-signin" method="post" action="NewUser" onsubmit="FormSubmit(this)">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="inputUserID" name="inputUserID" class="form-control" placeholder="User ID" required autofocus>
                <input type="text" id="inputFirstName" name="inputFirstName" class="form-control" placeholder="First Name" required autofocus>
                <input type="text" id="inputLastName" name="inputLastName" class="form-control" placeholder="Last Name" required autofocus>
                <input type="text" id="inputEnrollmentNumber" name="inputEnrollmentNumber" class="form-control" placeholder="Enrollment Number" autofocus>
                <input type="email" id="inputEmail" name="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                <input type="text" id="inputContactNumber" name="inputContactNumber" class="form-control" placeholder="Contact Number" required autofocus>
                <div class="form-group">
	                <select id="inputDepartment" name="inputDepartment" class="form-control" onchange="DropDownChanged(this);" required>
	                  <option value="" selected disabled hidden>Select Department</option>
	                  <option value="Information Technology">Information Technology</option>
	                  <option value="Computer Engineering">Computer Engineering</option>
	                  <option value="Mechanical Engineering">Mechanical Engineering</option>
	                  <option value="Civil Engineering">Civil Engineering</option>
	                  <option value="Electrical Engineering">Electrical Engineering</option>
	                  <option value="Electronics and Communication Engineering">Electronics and Communication Engineering</option>
	                  <option value="Food Processing Technology">Food Processing Technology</option>
	                  <option value="Automobile Engineering">Automobile Engineering</option>
	                  <option value="">Other</option>
	                </select>
                </div>
                <input type="text" style="display:none;" name="inputDepartment" id="inputDepartmentOther" class="form-control" placeholder="Enter Department" autofocus/>
                <div class="form-group">
	                <select id="inputUserType" name="inputUserType" class="form-control" required>
	                  <option value="" selected disabled hidden>Select User Type</option>
	                  <option value="Student">Student</option>
	                  <option value="Staff">Staff</option>
	                </select>
                </div>
                <br/>
                <button class="btn btn-lg btn-primary" type="submit">Add User</button>
            </form>
        </div>
    </div>
</body>
<script type="text/javascript">
                function DropDownChanged(oDDL) {
                    var oTextbox = oDDL.form.elements["inputDepartmentOther"];
                    if (oTextbox) {
                        oTextbox.style.display = (oDDL.value == "") ? "" : "none";
                        if (oDDL.value == "")
                            oTextbox.focus();
                    }
                }
                
                function FormSubmit(oForm) {
                    var oDDL = oForm.elements["inputDepartment"];
                    var oTextbox = oForm.elements["inputDepartmentOther"];
                    if(oDDL.value == "" && oTextbox.value != "")
                    	document.getElementById("inputDepartment").value = oTextbox.value;  
                }
                
</script> 
</html>