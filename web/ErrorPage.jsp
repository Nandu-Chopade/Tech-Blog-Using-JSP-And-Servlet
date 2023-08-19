<%-- 
    Document   : ErrorPage
    Created on : Apr 10, 2023, 6:49:23 PM
    Author     : Nandu Chopade
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
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
    </style>
    </head>
    <body>
        
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid" />
            <h3 class="display-3">Sorry ! something went wrong</h3>
            <%= exception %><br>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
        </div>
    </body>
</html>
