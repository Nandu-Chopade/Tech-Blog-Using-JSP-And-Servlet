<%-- 
    Document   : register_page
    Created on : Apr 7, 2023, 6:48:03 PM
    Author     : Welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
          <!--      boostrap css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
     <!-- fontawesome-->
     
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <style>
           .form-control-sm{
               height:30px;
           }
       </style>
    
    </head>
    <body>
        <%@include  file="normal_navebar.jsp" %>
        
        <main class="primary-background pb-2" >
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card" style="margin-top: 20px">
                            <div class="card-header text-center primary-background text-white">
                                <span class="fa fa-2x fa-user-plus"></span>
                            </div>
                            <div class="card-body">
                                <form  action="registerServlet" method="POST" id="register-form" >
                            <div class="form-group">
                              <label for="exampleInputEmail1">User Name</label>
                              <input name="name"  type="text" class="form-control form-control-sm" id="exampleInputEmail1" placeholder="Enter User Name">
                            </div>
                                 
                                 
                              <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input name="email" type="email" class="form-control form-control-sm " id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            
                            <div class="form-group">
                              <label for="exampleInputPassword1">Password</label>
                              <input name="password" type="password" class="form-control form-control-sm" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            
                                 <div>
                                     <label for="gender" >Select gender</label><br>
                                     <input type="radio" id="gender" name="gender" value="male">Male
                                     <input type="radio" id="gender" name="gender" value="female">Female
                                 </div> 
                                 
                            <div class="form-group">
                                <textarea class="form-control " placeholder="Enter something about your self" name="about" ></textarea>
                            </div>
                                 
                            <div class="form-check">
                                <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                              <label class="form-check-label" for="exampleCheck1">agree terms and condition</label>
                            </div>
                                    <div  class="container text-center" id="loader" style="display:none;">
                                <span class="fa fa-refresh fa-spin fa-4x"></span>
                            </div>
<!--                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>-->
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>

                            </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        
        
        
        
        
       <!--        java script-->
         <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myscript.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        <script>
                $(document).ready(function() {
                  console.log("loaded.....");

                  $('#register-form').on('submit', function(event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    
                    $('#submit-btm').hide();
                    $('#loader').show();
                    // send register servlet
                    $.ajax({
                      url: "registerServlet",
                      type: 'POST',
                      data: form,
                      success: function(data, textStatus, jqXHR) {
                        
                         $('#submit-btm').show();
                         $('#loader').hide();
                         
                       if(data.trim() === 'done'){
                             swal("Registered successfully we are redirectiong to login page.")
                            .then((value) => {
                               window.location = "login.jsp";
                            });
                       }else{
                           swal(data);
                            
                       }
                      },
                      error: function(jqXHR, textStatus, errorThrown) {
                            swal("Something went wrong.")
                            $('#submit-btm').show();
                            $('#loader').hide();
                         },
                      processData: false,
                      contentType: false
                    });
                  });
                });            
        </script>
            
    </body>
</html>
