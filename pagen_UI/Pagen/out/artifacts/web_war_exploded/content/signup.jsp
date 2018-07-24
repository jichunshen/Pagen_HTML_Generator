<%--
  Created by IntelliJ IDEA.
  User: czmue
  Date: 3/4/2018
  Time: 2:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Pagen Signup</title>
    <link href="/Pagen/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="/Pagen/datepicker/css/datepicker.css" rel="stylesheet" />
    <link href="/Pagen/assets/css/bootstrap-united.css" rel="stylesheet" />

    <style>
        .green {
            font-weight: bold;
            color: green;
        }

        .message {
            margin-bottom: 10px;
        }

        .error {
            color: #ff0000;
            font-size: 0.9em;
            font-weight: bold;
        }

        .errorblock {
            color: #000;
            background-color: #ffEEEE;
            border: 3px solid #ff0000;
            padding: 8px;
            margin: 16px;
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
            <li><a href="/Pagen">Home</a></li>
            <li class="active"><a href="/Pagen/content/signup.jsp">Signup</a></li>
            <li><a href="/Pagen/content/login.jsp">Login</a></li>
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

<script src="/Pagen/jquery-1.8.3.js">

</script>

<script src="/Pagen/bootstrap/js/bootstrap.js">

</script>

<script src="/Pagen/datepicker/js/bootstrap-datepicker.js">

</script>


<div class="container">
    <div class="jumbotron">
        <div>
            <h1>Welcome to Pagen Signup</h1>
            <p>Signup</p>
        </div>
    </div>

    <div></div>
</div>

<c:if test="${not empty message}">
    <div class="message green">${message}</div>
</c:if>

<div class="col-lg-6 col-lg-offset-3">
    <div class="well">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <form id="myForm" method="post" class="bs-example form-horizontal"
                          action="/Pagen/UserController">
                        <fieldset>
                            <legend>Signup Form</legend>

                            <input type="hidden" name="pageName" value="signup">

                            <div class="form-group">
                                <label for="userNameInput" class="col-lg-3 control-label">User
                                    Name</label>
                                <div class="col-lg-9">
                                    <input type="text" class="form-control" name="userName"
                                           id="userNameInput" placeholder="User Name" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="passwordInput" class="col-lg-3 control-label">Password</label>
                                <div class="col-lg-9">
                                    <input type="password" class="form-control" name="password"
                                           id="passwordInput" placeholder="Password" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="emailAddressInput" class="col-lg-3 control-label">Email
                                    Address</label>
                                <div class="col-lg-9">
                                    <input type="text" class="form-control" name="emailAddress"
                                           id="emailAddressInput" placeholder="Email Address" />
                                </div>
                            </div>

                            <div class="col-lg-9 col-lg-offset-3">
                                <button class="btn btn-default">Cancel</button>

                                <button class="btn btn-primary" data-toggle="modal"
                                        data-target="#themodal">Submit</button>
                                <div id="themodal" class="modal fade" data-backdrop="static">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">&times;</button>
                                                <h3>Signup Form Submission</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>Confirm Signup</p>
                                                <div class="progress progress-striped active">
                                                    <div id="doitprogress" class="progress-bar"></div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                                                <input type="submit" value="Yes" id="yesbutton"
                                                       class="btn btn-primary" data-loading-text="Saving.."
                                                       data-complete-text="Submit Complete!">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function() {
        $('#dateOfBirthInput').datepicker();
    });
</script>

<script type="text/javascript">
    $(function() {
        var yesButton = $("#yesbutton");
        var progress = $("#doitprogress");

        yesButton.click(function() {
            yesButton.button("loading");

            var counter = 0;
            var countDown = function() {
                counter++;
                if (counter == 11) {
                    yesButton.button("complete");
                } else {
                    progress.width(counter * 10 + "%");
                    setTimeout(countDown, 100);
                }
            };

            setTimeout(countDown, 100);
        });

    });
</script>


</body>
</html>
