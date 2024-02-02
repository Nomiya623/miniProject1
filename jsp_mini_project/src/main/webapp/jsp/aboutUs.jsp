<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../db/dbconn.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Satish Interiors</title>
        
        <script>
           
         $(document).ready(function(){
       
       $('a[href="aboutUs.jsp"]').parent().addClass('active');
       $('a[href="aboutUs.jsp"]').css('color','black');

});
</script>
    </head>
    <body>
        <body>
        
        
   <div class="row" >
      <div class="col-md-6 col-md-offset-3" style="margin-top: -40px" >
        <div class="page-header"><h1>About us</h1></div>
       <div class="well">
         Sample
       </div>
      </div>
    </div>
    </body>
</html>
