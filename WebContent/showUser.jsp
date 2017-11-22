<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="in.ac.adit.internet.bean.InternetUser" %>
<%@ page import="in.ac.adit.internet.dao.AditInternetDAO" %>
<%@ page import="in.ac.adit.internet.bean.UserDevices" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.sql.SQLException" %>

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
	height:100%;
	background-repeat: repeat;	
    background: linear-gradient(rgb(160,216,239),rgb(221,241,249)) no-repeat center center fixed;
}

.card-container.card {
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
.form-signin input[type=date],
.form-signin input[type=number],
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

.table > tbody > tr > td {
     vertical-align: middle;
}

input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
}

.dateclass{
    width:100%;
}

.dateclass.placeholderclass::before{
    width:100%;
    content:attr(placeholder);
    background-color:#FFFFFF;
}

.dateclass.placeholderclass:hover::before{
    width:0%;
    content:"";
}
  
</style>
</head>
<body>
    <div class="container">
    <div class="card card-container-fluid">
    	<div class="row">
  			<div class="col-md-4">
  			<%
  			String userId = (String) request.getAttribute("USERID");
  			
    		AditInternetDAO dao = null; 
    		ServletContext context = getServletContext();
    		String db=context.getInitParameter("db");
    		try {
    			dao = new AditInternetDAO(db);
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		ResultSet user = dao.getUser(userId);
    		
			String firstName=null;
			String lastName=null;
			String enrollmentNo=null;
			String email=null;
			String contactNo=null;
			String department=null;
			String userType=null;
			String userStatus=null;
    		
    		
    		while(user.next()){
    			firstName = user.getString("firstName");
    			lastName = user.getString("lastName");
    			enrollmentNo = user.getString("enrollmentNumber");
    			email = user.getString("emailId");
    			contactNo = user.getString("contactNumber");
    			department = user.getString("department");
    			userType = user.getString("userType");
    		}
    		
    		
    		ResultSet device = dao.getDevice(userId);
    		    		
			int deviceId=0;
			String macAddress=null;
			String ipAddress=null;
			String deviceType=null;
			String StartDate=null;
			String EndDate=null;
  				UserDevices devicedata=null;

        		
        		while(device.next()){
        			deviceId = device.getInt("deviceId");
        			userId = device.getString("userId");
        			macAddress = device.getString("macAddress");
        			ipAddress = device.getString("ipAddress");
        			deviceType = device.getString("deviceType");
        			StartDate = device.getString("startDate");
        			EndDate = device.getString("endDate");
        		}
        	%>

  				<table class="table">
  					<tr>
  					<td colspan="2" valign="middle" style="text-align:center; border:none;"><h3>User Details</h3></td>
  					</tr>
  					<tr>
  						<td><h4>User ID:</h4></td>
  						<td><h4><%= userId %></h4></td>
  					</tr>
  					<tr>
  						<td><h4>First Name:</h4></td>
  						<td><h4><%= firstName + " " + lastName %></h4></td>
  					</tr>
  					<tr>
  						<td><h4>Enrollment No:</h4></td>
  						<td><h4><%= enrollmentNo  %></h4></td>
  					</tr>
  					<tr>
  						<td><h4>Email:</h4></td>
  						<td><h4><%= email %></h4></td>
  					</tr>
  					<tr>
  						<td><h4>Contact No:</h4></td>
  						<td><h4><%= contactNo %></h4></td>
  					</tr>
  					<tr>
  						<td><h4>Department:</h4></td>
  						<td><h4><%= department %></h4></td>
  					</tr>
  					<tr>
  						<td><h4>User Type:</h4></td>
  						<td><h4><%= userType %></h4></td>
  					</tr>
  					<tr>
  						<td><h4>User Status:</h4></td>
  						<td><h4><%= userStatus %></h4></td>
  					</tr>
  				</table>
  			</div>

  			<div id="devices" class="col-md-4">
  				<table class="table">
  					<tr>
  					<td colspan="2" valign="middle" style="text-align:center; border:none;"><h3>Devices</h3></td>
  					</tr>
  					<tr>
  						<td><h4>Device ID:</h4></td>
  						<td><h4><%= deviceId %></h4></td>
  					</tr>
  					<tr>
  						<td><h4>MAC Address:</h4></td>
  						<td><h4><%= macAddress %></h4></td>
  					</tr>
  					<tr>
  						<td><h4>IP Address:</h4></td>
  						<td><h4><%= ipAddress %></h4></td>
  					</tr>
  					<tr>
  						<td><h4>Device Type:</h4></td>
  						<td><h4><%= deviceType %></h4></td>
  					</tr>
  					<tr>
  						<td><h4>Start Date:</h4></td>
  						<td><h4><%= StartDate %></h4></td>
  					</tr>
  					<tr>
  						<td><h4>End Date:</h4></td>
  						<td><h4><%= EndDate %></h4></td>
  					</tr>
  				</table>
  			</div>
  			<div class="col-md-4">
  				<h3 align="center">Add Devices</h3>
	        	<br/>
	            <form class="form-signin" onsubmit="FormSubmit(this)" action="NewDevice" method="get">
	            <div class="add-device">
	                <input type="hidden" id="inputUserId" name="inputUserId" value="<%= userId  %>">
	               	<div class="devices">
	                <input type="text" id="inputMAC" name="inputMAC[1]" class="form-control" placeholder="MAC Address" maxlength="17" required autofocus/>
	                <input type="text" id="inputIP" name="inputIP[1]" class="form-control" placeholder="IP Address" minlength="7" maxlength="15" onkeypress="return isNumber(event);" onblur="confirmIPAddress();" required autofocus/>
	                <div class="form-group">
		                <select id="inputDeviceType" name="inputDeviceType[1]" class="form-control" onchange="DropDownChanged(this);" required>
		                  <option value="" selected disabled hidden>Select Device Type</option>
		                  <option value="Laptop">Laptop</option>
		                  <option value="Desktop">Desktop</option>
		                  <option value="Desktop">Mobile</option>
		                  <option value="Desktop">Tablet</option>
		                  <option value="">Other</option>
		                </select>
	                </div>
	                <input type="text" style="display:none;" name="inputDeviceTypeOther[1]" id="inputDeviceTypeOther" class="form-control" placeholder="Enter Device" autofocus/>
	                <input type="date" id="inputStartDate" name="inputStartDate[1]" class="form-control dateclass placeholderclass" onClick="$(this).removeClass('placeholderclass')" placeholder="Start Date" required autofocus/>
	                <!--  <input type="date" id="inputEndDate" name="inputEndDate" class="form-control dateclass placeholderclass" onClick="$(this).removeClass('placeholderclass')" placeholder="End Date" autofocus/> --> 
	                <input type="number" id="inputValidity" name="inputValidity[1]" class="form-control" placeholder="Validity" autofocus>
	                </div>
	                </div>
	                <br/>
	                <button class="btn btn-lg btn-primary btn-add-device" type="button"><span class="glyphicon glyphicon-plus"></span>Add more device</button>
	                <button class="btn btn-lg btn-primary" type="submit">Add Device</button>
	            </form>
  			</div>
		</div>
		</div>
    </div>
</body>
<script type="text/javascript">
                function DropDownChanged(oDDL) {
                    var oTextbox = oDDL.form.elements["inputDeviceTypeOther"];
                    if (oTextbox) {
                        oTextbox.style.display = (oDDL.value == "") ? "" : "none";
                        if (oDDL.value == "")
                            oTextbox.focus();
                    }
                }
                
                function FormSubmit(oForm) {
                    var oDDL = oForm.elements["inputDeviceType"];
                    var oTextbox = oForm.elements["inputDeviceTypeOther"];
                    if(oDDL.value == "" && oTextbox.value != "")
                    	document.getElementById("inputDeviceType").value = oTextbox.value;  
                    
                }
                
                function isNumber(evt) {
                    evt = (evt) ? evt : window.event;
                    var charCode = (evt.which) ? evt.which : evt.keyCode;
                    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                        return false;
                    }
                    return true;
                }
                
                function confirmIPAddress() {
                	   var ip = document.getElementById("inputIP");
                	   if (ip.value.length >0 && ip.value.length<=15 ) { 
                	      ip.style.background = "white";
                	      var ipSlot=ip.value.split(".");
                	      if(ipSlot.length==4){
                	        for (var i=0;i<ipSlot.length;i++){
                	        var l=ipSlot[i].length;
                	            if (l >0 && l<=3){
                	                if(ipSlot[i]>=0 && ipSlot[i]<256){}
                	                else{
                	                	ip.style.background = "pink";break ;return false;}
                	            }else{
                	                ip.style.background = "pink";break ;return false;
                	            }
                	        }
                	    }else{
                	    	ip.style.background = "pink";return false; }
                	}
                	else{
                		ip.style.background = "pink";
                	}
                }
                

        			
        			

                
                 $(document).ready(function() {

                	if(<%= deviceId %>!=0){
                		$("#devices").show();	
                	}
                	else
                		$("#devices").hide();
                    
                }); 
                

<%--                 window.onload = function() {
                	  var x = document.getElementById('devices');
        				if(<%=device.getDeviceId()%>2!=2){
          					x.style.display("block");
          				}
          				else
          					x.style.display("none");
         
                	}; --%>
                

                
            	$(function(){
            		
        			$(document.body).on('click', '.btn-remove-device' ,function(){
        				$(this).closest('.devices').remove();
        			});
        			
	    			$('.btn-add-device').click(function(){
	
	    				var index = $('.devices').length + 1;
	    				
	    				$('.add-device').append(
	    				'<div class="devices">'+	    						
	    				'<input type="text" id="inputMAC" name="inputMAC['+length+']" class="form-control" placeholder="MAC Address" maxlength="17" required autofocus>'+
		                '<input type="text" id="inputIP" name="inputIP['+length+']" class="form-control" placeholder="IP Address" minlength="7" maxlength="15" onkeypress="return isNumber(event);" onblur="confirmIPAddress();" required autofocus>'+
		                '<div class="form-group">'+
			                '<select id="inputDeviceType" name="inputDeviceType['+length+']" class="form-control" onchange="DropDownChanged(this);" required>'+
			                  '<option value="" selected disabled hidden>Select Device Type</option>'+
			                  '<option value="Laptop">Laptop</option>'+
			                  '<option value="Desktop">Desktop</option>'+
			                  '<option value="Desktop">Mobile</option>'+
			                  '<option value="Desktop">Tablet</option>'+
			                  '<option value="">Other</option>'+
			                '</select>'+
		                '</div>'+
		                '<input type="text" style="display:none;" name="inputDeviceTypeOther['+length+']" id="inputDeviceTypeOther" class="form-control" placeholder="Enter Device" autofocus/>'+
		                '<input type="date" id="inputStartDate" name="inputStartDate['+length+']" class="form-control dateclass placeholderclass" onClick="$(this).removeClass(\'placeholderclass\')" placeholder="Start Date" required autofocus/>'+
		                <!-- input type="date" id="inputEndDate" name="inputEndDate" class="form-control dateclass placeholderclass" onClick="$(this).removeClass('placeholderclass')" placeholder="End Date" autofocus/>  -->
		                '<input type="number" id="inputValidity" name="inputValidity['+length+']" class="form-control" placeholder="Validity" autofocus>'+
						'<button class="btn btn-danger btn-remove-device" type="button"><span class="glyphicon glyphicon-remove"></span>Remove Device</button>'+
						'</div>'
	    				);
	
	    			});
    			
    		});

            		length=1;
                    $("#inputMAC").focusin(function (evt) {
                        $(this).keypress(function () {
                            content=$(this).val();
                            content1 = content.replace(/\:/g, '');
                            length=content1.length;
                            if(((length % 2) == 0) && length < 12 && length > 1){
                                $('#inputMAC').val($('#inputMAC').val() + ':');
                                }
                        });
                    });
            	
                /*
                var macAddress = document.getElementById("inputMAC");

                function formatMAC(e) {
                    var r = /([a-f0-9]{2})([a-f0-9]{2})/i,
                        str = e.target.value.replace(/[^a-f0-9]/ig, "");

                    while (r.test(str)) {
                        str = str.replace(r, '$1' + ':' + '$2');
                    }

                    e.target.value = str.slice(0, 17);
                };

                macAddress.addEventListener("keyup", formatMAC, false); */
                
</script> 
</html>