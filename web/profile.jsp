<%@page import ="com.tech.blog.entities.User"  %>
<%@page errorPage="ErrorPage.jsp"  %>
<%@page import="com.tech.blog.entities.Message"%>

<% 
  
  User user = (User) session.getAttribute("currentUser");
  if(user == null){
    response.sendRedirect("login.jsp");
    }



%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!--      boostrap css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
     <!--        fontawesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style>
        .background-banner{
      -webkit-clip-path: polygon(100% 0, 100% 100%, 72% 93%, 48% 100%, 23% 94%, 0 100%, 0 0);
clip-path: polygon(100% 0, 100% 100%, 72% 93%, 48% 100%, 23% 94%, 0 100%, 0 0);
        }
        
          .background-banner {
        /* ... (previous CSS) ... */
    }

    .profile-picture-circle {
        border-radius: 50%;
        overflow: hidden;
        width: 150px; /* Set a fixed width and height */
        height: 150px;
        align-content: center;
    }

    .profile-picture-circle img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .profile-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px; /* Optional margin for spacing */
}

    
    </style>
    </head>
    <body>
<!--       nav bar start from here-->

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-flash"></span>Learn with Nandu<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span>Contact</a>
      </li>
      
       <li class="nav-item">
          <a class="nav-link" href="#"><span class="fa fa-post"></span>Post</a>
      </li>
      
    </ul>
      <ul class="navbar-nav mr-right">
         <li class="nav-item">
             <a class="nav-link " href="#!" data-toggle="modal" data-target="#profileModal" > <span class="fa fa-user-circle" ></span> <%= user.getName() %> </a>
      </li> 
          <li class="nav-item">
              <a class="nav-link" href="LogoutServlet" ><span class="fa fa-user-circle-o"></span> logout</a>
      </li> 
      </ul>
  </div>
</nav>

<!--nav bar end here-->
 <%  
                            
                        Message m = (Message) session.getAttribute("msg");
                            if( m != null){
                             
                            %>
                            
                            <div class="alert <%= m.getCssClass() %>" role="alert">
                               <%= m.getContent() %>
                            </div>
                            <%
                                session.removeAttribute("msg");
                            }
                            %>
                            
                            
                            
<!--modal started here -->


<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title " id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
                <div class="profile-container">
        <div class="profile-picture-circle">
            <img src="pics/<%= user.getProfile() %>" alt="Profile Picture">
        </div>
    </div>

              <h5 class="modal-title"> <%= user.getName() %></h5>
             
<!--            profile details-->
              
<div id="profile-details">
    <table class="table">
                   
                    <tbody>
                      <tr>
                        <th scope="row">Id:</th>
                        <td><%= user.getId() %></td>
                       
                      </tr>
                      <tr>
                        <th scope="row">Name:</th>
                        <td><%= user.getName() %></td>
                       
                      </tr>
                      <tr>
                        <th scope="row">Email:</th>
                        <td><%= user.getEmail() %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">Gender:</th>
                        <td><%= user.getGender().toUpperCase() %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">Status:</th>
                        <td><%= user.getAbout() %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">Profile was created:</th>
                        <td><%= user.getDateTime() %></td>
                        
                      </tr>
                     
                    </tbody>
        </table>
</div>

<!--profile edit-->
<div id="profile-edit" style="display:none;">
    <form action="editServlet" method="POST" enctype="multipart/form-data">
    <table class="table">
        <h3>Edit profile carefully </h3>
        <tr> 
            <td>Name:</td>
            <td><input name="user_name" class="form-control" type="text" value="<%= user.getName()%>"></td>
        </tr>
        <tr> 
            <td>Email:</td>
            <td><input name="user_email" class="form-control" type="email" value="<%= user.getEmail()%>"></td>
        </tr>
        <tr> 
            <td>Password:</td>
            <td><input name="user_password" class="form-control" type="password" value="<%= user.getPassword()%>"></td>
        </tr>
        <tr> 
            <td>Gender:</td>
            <td><%= user.getGender().toUpperCase()%></td>
        </tr>
        <tr> 
            <td>About:</td>
            <td><textarea name="user_about" class="form-control" row="3"><%= user.getAbout()%></textarea></td>
        </tr>
        <tr> 
            <td>New Profile:</td>
            <td><input type="file" name="user_file" class="form-control"></td>
        </tr>
        
      
    </table>
       
        <hr>
        <div class="container">
            <button type="submit" class="btn btn-outline-primary">Save</button>
        </div>
</form>
   
    
</div>            
              
      
              
              
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

<!-- model ended here  -->

 
        <!--        java script-->
         <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myscript.js" type="text/javascript"></script>
        <script>
         
             $(document).ready(function(){
                let editStatus = false;
               $('#edit-profile-button').click(function(){
               
               if(editStatus == false){
                       
               $('#profile-details').hide();
               $('#profile-edit').show();
               $(this).text('Back');
              
                    editStatus = true;
                  }else{
                       $('#profile-details').show();
                       $('#profile-edit').hide();
                       $(this).text('Edit');
                       editStatus = false;
                  }
                      
                  
               });
                var messageDiv = $('.alert');
        if (messageDiv.length > 0) {
            messageDiv.show();

            // Set timeout to hide the message after a certain time (e.g., 5000 milliseconds)
            setTimeout(function() {
                messageDiv.hide();
            }, 5000); // Adjust the time as needed
        }

        
             });
        
        
        
        
        
        </script>
        
        
    </body>
</html>
