<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="assets/css/bootstrap-united.css" rel="stylesheet" />
  <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
  <style>
    body {
      height: 100%;
      margin: 0;
      background-size: 1440px 800px;
      background-repeat: no-repeat;
      display: block;
    }
  </style>
</head>
<body>
<div class="navbar navbar-default">

  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-responsive-collapse">
      <span class="icon-bar"></span> <span class="icon-bar"></span> <span
            class="icon-bar"></span>
    </button>
  </div>

  <div class="navbar-collapse collapse navbar-responsive-collapse">
    <form class="navbar-form navbar-right">
      <input type="text" class="form-control" placeholder="Search">
    </form>
    <ul class="nav navbar-nav navbar-right">
      <li class="active"><a href="/Pagen">Home</a></li>
      <li><a href="content/signup.jsp">Signup</a></li>
      <li><a href="content/login.jsp">Login</a></li>
      <li class="dropdown"><a href="#" class="dropdown-toggle"
                              data-toggle="dropdown">Explore<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="#">Contact us</a></li>
          <li class="divider"></li>
          <li><a href="#">Further Actions</a></li>
        </ul></li>
    </ul>
  </div>
  <!-- /.nav-collapse -->
</div>
<div class="container">
  <div class="jumbotron">
    <div>
      <h1>Welcome to Pagen!</h1>
      <p>Magic Happens Now</p>
    </div>

    <a class="btn btn-primary" href="content/signup.jsp">Signup » </a> <a
          class="btn btn-primary" href="content/login.jsp">Login » </a>
  </div>

  <div></div>
</div>
<script src="jquery-1.8.3.js">
</script>

<script src="bootstrap/js/bootstrap.js">
</script>

</body>
</html>
