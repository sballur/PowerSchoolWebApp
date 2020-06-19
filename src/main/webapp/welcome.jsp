<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<nav class="navbar navbar-inverse" style = "background-color: #337ab7;font-weight: bold;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">schoology</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="#">UPGRADE</a></li>
      <li class="active"><a href="#">COURSES</a></li>
      <li><a href="#">GROUPS</a></li>
      <li><a href="#">RESOURCES</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right" style = "margin-right: 30px;">
    	<li></li>
    	<c:if test="${pageContext.request.userPrincipal.name != null}">
    	<form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
	      <li><!-- <a href="#"><span class="glyphicon glyphicon-user"></span> SIGN UP</a> -->
	      	<div class="dropdown" style="margin-top: 9px;">
	  			<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="width: 161px;background-color: transparent;border-width: inherit;">${pageContext.request.userPrincipal.name}</button>
	  			<ul class="dropdown-menu">
	    			<li><a onclick="document.forms['logoutForm'].submit()">LOGOUT</a></li>
	    			
	  			</ul>
			</div>
	      
	      </li>
      </c:if>
      
    </ul>
  </div>
</nav>
<div class="container" >
	<h2>Courses</h2>
	<div id="maincontainer">
	<div><a onclick="openNav()" class="col-md-11 col-md-offset-11" style="margin-top: -40px;color: navy;font-weight: 600;">My Courses</a></div><br>
	<div style="margin-top: 105px;">
	<div class="col-md-10 col-md-offset-4">
	<span>You are not currently enrolled in any courses</span><br></div>
	<div class="col-md-10 col-md-offset-5">
	<button type="button" class="btn btn-primary" style="margin-top: 30px;" >Create a Course</button>
	</div>
	</div>
	</div>
</div>
<div id="myinnertab" style="display: none" class="col-md-15 col-md-offset-0">
	<ul class="nav nav-tabs">
	  <li ><a href="#"></a></li>
	  <li><a href="#"></a></li>
	  <li class="active"><a href="#">My Courses</a></li>
	  <li><a href="#"></a></li>
	</ul>
	<div class="container" >
	<div style="margin-top: 105px;">
	<div class="col-md-10 col-md-offset-4">
	<span>Create a new course and add sections to manage your classes</span><br></div>
	<div class="col-md-10 col-md-offset-5">
	<button type="button" class="btn btn-primary" style="margin-top: 30px;" data-toggle="modal" data-target="#myModal">Join a Course</button>
	<button type="button" class="btn btn-primary" style="margin-top: 30px;" >Create a Course</button>
	</div>
	</div>
	</div>
</div>
<div class="modal-dialog modal-sm">

<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog  modal-sm">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Join a Course</h4>
        </div>
        <div class="modal-body">
          <p style="font-weight: bold">Access Code: *</p> 
          <form id="joincourse" method="POST" action="${contextPath}/joincourse">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="userName" value="${pageContext.request.userPrincipal.name}"/>
       		<input class="form-control" type="text" name="accessCode" id="accesscode" placeholder="Access Code">
         </form>
        </div>
        <div class="modal-footer">
        	<button type="button" class="btn btn-primary" onclick="document.forms['joincourse'].submit()">Join</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</div>
</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script>
function openNav() {
  document.getElementById("maincontainer").style.display = "none";
  document.getElementById("myinnertab").style.display = "block";
}
</script>
</body>
</html>
