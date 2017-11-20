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
	height:100%;
	background-repeat: repeat;	
    background: linear-gradient(rgb(160,216,239),rgb(221,241,249)) no-repeat center center fixed;
}

.card-container.card {
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
  				<table class="table">
  					<tr>
  					<td colspan="2" valign="middle" style="text-align:center; border:none;"><h3>User Details</h3></td>
  					</tr>
  					<tr>
  						<td><h4>User ID:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>First Name:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>Last Name:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>Enrollment No:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>Contact No:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>Department:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>User Type:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>User Status:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  				</table>
  			</div>
  			<div class="col-md-4">
  				<table class="table">
  					<tr>
  					<td colspan="2" valign="middle" style="text-align:center; border:none;"><h3>Devices</h3></td>
  					</tr>
  					<tr>
  						<td><h4>User ID:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>First Name:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>Last Name:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>Enrollment No:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>Contact No:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>Department:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>User Type:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  					<tr>
  						<td><h4>User Status:</h4></td>
  						<td><h4>140010116047</h4></td>
  					</tr>
  				</table>
  			</div>
  			<div class="col-md-4">
  				<h3 align="center">Add Devices</h3>
	        	<br/>
	            <form class="form-signin" onsubmit="FormSubmit(this)">
	                <input type="text" id="inputMAC" name="inputMAC" class="form-control" placeholder="MAC Address" maxlength="17" required autofocus>
	                <input type="text" id="inputIP" name="inputIP" class="form-control" placeholder="IP Address" minlength="7" maxlength="15" onkeypress="return isNumber(event);" onblur="confirmIPAddress();" required autofocus>
	                <div class="form-group">
		                <select id="inputDeviceType" name="inputDeviceType" class="form-control" onchange="DropDownChanged(this);" required>
		                  <option value="" selected disabled hidden>Select Device Type</option>
		                  <option value="Laptop">Laptop</option>
		                  <option value="Desktop">Desktop</option>
		                  <option value="Desktop">Mobile</option>
		                  <option value="Desktop">Tablet</option>
		                  <option value="">Other</option>
		                </select>
	                </div>
	                <input type="text" style="display:none;" name="inputDeviceType" id="inputDeviceTypeOther" class="form-control" placeholder="Enter Device" autofocus/>
	                <input type="date" id="inputStartDate" name="inputStartDate" class="form-control dateclass placeholderclass" onClick="$(this).removeClass('placeholderclass')" placeholder="Start Date" required autofocus/>
	                <input type="date" id="inputEndDate" name="inputEndDate" class="form-control dateclass placeholderclass" onClick="$(this).removeClass('placeholderclass')" placeholder="End Date" autofocus/>
	                <input type="number" id="inputValidity" name="inputValidity" class="form-control" placeholder="Validity" autofocus>
	                
	                <br/>
	                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Add Device</button>
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
                    if (oDDL && oTextbox)
                        oDDL.value = (oDDL.value == "") ? oTextbox.value : oDDL.value;
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