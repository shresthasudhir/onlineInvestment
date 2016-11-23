<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><tiles:insertAttribute name="title" /></title>
<tiles:insertAttribute name="css"/>
<tiles:insertAttribute name="js"/>
</head>
<style>
	#maincanvass{
		margin-top:50px;
		margin-left:50px;
		margin-right:50px;
		
	}
			body{
				background-color:#CCC;
			}
			header{
				color:white;
				background-color:#00a651;
				height:150px;
				border-style:dashed;
				border-width:0px 0px 5px 0px;
				border-color:white;	
				margin:0px 0px -80px 0px;
				padding:1px 0px 0px 100px;
			}
			#body_section{
				background-color:white;
				height:800px;
				padding:10px;
				border-radius:10px;
				box-shadow:0 0 30px black;
			}
		</style>	
</style>
<body>
    <header>
    	<h1><span class="fa fa-twitter" aria-hidden="true" style="color:cyan"></span>Online Investment Project</h1>
	</header>
	<div class="container" id="body_section">
	<!-- <div id="maincanvass"> -->
		<tiles:insertAttribute name="navigation" />
		<tiles:insertAttribute name="heading" />
		<tiles:insertAttribute name="tagline" />
		<tiles:insertAttribute name="body" />
	</div>
	<tiles:insertAttribute name="footer" />
	<
</body>
</html>
