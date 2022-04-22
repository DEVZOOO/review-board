<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Review Board</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="google-signin-client_id" content="304712160807-u2p02tf0la7t6uq6sjdgd3b3vf94i1m0.apps.googleusercontent.com">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  body {
    font: 15px Montserrat, "맑은 고딕";
    line-height: 1.8;
    color: #777;
  }
  p {font-size: 16px;}
  .margin {margin-bottom: 45px;}
  .bg-1 { 
    background-color: #1abc9c; /* Green */
    color: #ffffff;
  }
  .bg-2 { 
    background-color: #474e5d; /* Dark Blue */
    color: #ffffff;
  }
  .bg-3 { 
    background-color: #ffffff; /* White */
    color: #555555;
  }
  .bg-4 { 
    background-color: #236960;	/*#2f2f2f;  Black Gray */
    color: #fff;
  }
  .container-fluid {
    padding-top: 35px;
    padding-bottom: 70px;
  }
  .navbar {
    padding-top: 15px;
    padding-bottom: 15px;
    border: 0;
    border-radius: 0;
    margin-bottom: 0;
    font-size: 12px;
    letter-spacing: 5px;
    background-color: #C8D7D6; 
  }
  .navbar-nav  li a:hover {
    color: #1abc9c !important;
  }
  <%-- =========================================== --%>
  table th {
  	text-align: center;
  	vertical-align: middle;
  }
  table td {
  	text-align: center;
  }
  textarea { resize: none;	}
  #LOGOheader {
  	position: absolute;
  	// top: 0;
  	// width: 85px;
	top: 17px;
	height: inherit;	
  }
  #LOGOfooter {
	 height: 100px;
	}
  #noticeTable { text-align: center; }
  #eventTable { text-align: center; }
  #centerTable { text-align: center; }
  	#wrapper {
  		margin-top: 100px;
  		<%--margin-bottom: 50px;--%>
  	}
	#visual .carousel{
		height: 580px;
	}
	#visual img {
		height: 580px;
	}

	#event {
		height: 350px;
		margin: 2%;
	}
	
	.eventimg { margin:0; padding:0; overflow: hidden; }
	.eventimg li {
		text-align: center;
		float: left; list-style-type: none;	<%--width: 25%; --%>
		padding: 3px;	// 내부 여백
	}
	.eventimg li img {
		width: 100%;
		height: 218px;
	}
	
	#calc {
		height: 220px;

		background-color: #F6F3F2;	<%--#ffb8c9;--%>
	}
	
	#model {
		height: 330px;
		margin: 2%;
	}
	.modelimg { margin:0; padding:0; overflow: hidden; }
	.modelimg li {
		float: left; list-style-type: none;	width: 25%;
		padding: 3px;	// 내부 여백
	}
	.modelimg li img { width: 100%; }
	
	#service {
		height: 220px;
		background-color: #E3E3E3;
	}
	#map {
		height: 205px;
	}
	
	#social {
		height: 270px;
		background-color: #F6F3F2;	<%--#ffb8c9;--%>
		overflow: hidden;
	}
	.socialimg { margin:0; padding:0; overflow: hidden; }
	.socialimg li {
		width: 20%; float: left; list-style-type: none;
		padding: 7px;	// 내부 여백
	}
	.socialimg li img { width: 100%; }
	.socialimg li a {	<%-- 텍스트 넘치는것 말줄임표 --%>
		text-overflow: ellipsis;
		overflow: hidden;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
	 }
	 
	#customer {
		height: 200px;
		
	}
	#info {
		height: 200px; 
		background-color: #E3E3E3;
		overflow: hidden;
	}
	#info li {	<%-- 텍스트 넘치는것 말줄임표 --%>
		text-overflow: ellipsis;
		overflow: hidden;
		display: -webkit-box;
		-webkit-line-clamp: 1;
		-webkit-box-orient: vertical;
	 } 
	 footer a {
	 	color: white;
	 }
	 
	
	.table .maps {   left: 15%; }
	.table .mapsrow {padding: 0px;   }
	
	.calcImg {
		width: 100%;
	}
  </style>
</head>
<body>
<%	String name = "";
	boolean login = false;
	if(session.getAttribute("id") != null) {
		login = true;
		// 소셜
		if((String)session.getAttribute("social") != null) {
			if(session.getAttribute("social").equals("naver"))
				name = ((String)session.getAttribute("email")).split("@")[0];
			else if(session.getAttribute("social").equals("kakao"))
				name = (String)session.getAttribute("nickname");
			else if(session.getAttribute("social").equals("google"))
				name = (String)session.getAttribute("name");
		}
		else
			name = (String)session.getAttribute("id");
	}
%>
<!-- Navbar -->
<nav class="navbar navbar-default navbar-fixed-top" style="margin-bottom: 100px;">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.jsp">
      	<img src="<%=request.getContextPath()%>/images/logo.png" alt="MJ MOTORS" id="LOGOheader"/>
      </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="http://kimmj9611.cafe24.com/Portfolio">MJ Motors</a></li>
<!--       	<li class="dropdown"> -->
<!--       		<a class="dropdown-toggle" data-toggle="dropdown" href="#"> -->
<!--       		MORE -->
<!--       		<span class="caret"></span></a> -->
<!--       	</li> -->
      	<%--
        <li><a href="#">WHO</a></li>
        <li><a href="#">WHAT</a></li>
        <li><a href="#">WHERE</a></li>
         --%>
      </ul>
    </div>
  </div>
</nav>