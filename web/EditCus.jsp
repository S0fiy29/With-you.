<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Customer</title>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="css/AdminJS.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/custom.css"> <!-- Add your custom CSS file here -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>

<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css'><link rel="stylesheet" href="./style.css">
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script><script  src="./script.js"></script>

    <script src="js/Admin.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const saveButton = document.getElementById("saveButton");

            saveButton.addEventListener("click", function () {
                const formData = new FormData(document.getElementById("editForm"));

                fetch("EditCustomerServlet", {
                    method: "POST",
                    body: formData
                })
                .then(response => {
                    if (response.ok) {
                        return response.text();
                    } else {
                        throw new Error("Error updating data");
                    }
                })
                .then(data => {
                    console.log(data); // Handle success response
                })
                .catch(error => {
                    console.error(error); // Handle error response
                });
            });
        });
    </script>
    
</head>
<body>
<div class="container">

    <form class="well form-horizontal" action="EditCustomerServlet" method="POST"  id="editform">
<fieldset>

<!-- Form Name -->
<legend>Edit Customer</legend>

<!-- Text input-->

<div class="form-group">
  <label for="datetime" class="col-md-4 control-label">Date and Time</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="datetime" id="datetime" class="form-control"  type="datetime-local">
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label for="packs" class="col-md-4 control-label" >Number of Guest</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="numGuest" class="form-control"  type="number" id="packs" >
    </div>
  </div>
</div>

<!-- Select Basic -->
   
<div class="form-group"> 
  <label for="package" class="col-md-4 control-label">Package</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
    <select id="package" name="package" class="form-control selectpicker" >
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
    </select>
  </div>
</div>
</div>

<div class="form-group"> 
  <label for="venue" class="col-md-4 control-label">Venue</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
    <select id="venue" name="venue" class="form-control selectpicker" >
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
    </select>
  </div>
</div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
    <input type="hidden" name="id" value="<%= request.getParameter("id")%>">
    <button type="submit" id="saveButton" class="btn btn-warning">Save</button>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
    <button class="btn btn-warning"><a href="edit.jsp" style="text-decoration: none; color: white;">Back</a></button>
  </div>
</div>

</fieldset>
</form>
</div>
</body>
</html>