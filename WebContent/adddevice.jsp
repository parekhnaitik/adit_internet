<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jq-3.2.1/dt-1.10.16/datatables.min.css"/>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script> 
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jq-3.2.1/dt-1.10.16/datatables.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADIT Internet</title>
<style>
body, html {
    height: 100%;
    background-repeat: no-repeat;
    background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
}

.card-container.card {
    max-width: 350px;
    padding: 40px 40px;
}

.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
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

.profile-img-card {
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}

/*
 * Form styles
 */
.profile-name-card {
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 10px 0 0;
    min-height: 1em;
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

.btn.btn-signin {
    /*background-color: #4d90fe; */
    background-color: rgb(104, 145, 162);
    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
    padding: 0px;
    font-weight: 700;
    font-size: 14px;
    height: 36px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transition: all 0.218s;
    transition: all 0.218s;
}

.btn.btn-signin:hover,
.btn.btn-signin:active,
.btn.btn-signin:focus {
    background-color: rgb(12, 97, 33);
}

.forgot-password {
    color: rgb(104, 145, 162);
}

.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus{
    color: rgb(12, 97, 33);
}

</style>
</head>
<body>
    <div class="container">
        <div class="card card-container">
        	<h3 align="center">Add Devices</h3>
        	<br/>
            <form class="form-signin" onsubmit="FormSubmit(this)">
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
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Add User</button>
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
                    if (oDDL && oTextbox)
                        oDDL.value = (oDDL.value == "") ? oTextbox.value : oDDL.value;
                }
</script> 
</html>