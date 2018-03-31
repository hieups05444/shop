<%-- 
    Document   : login
    Created on : Oct 10, 2017, 9:00:29 AM
    Author     : Shun
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="header.jsp"></jsp:include>
        <section id="form"><!--form-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-1">
                        <div class="login-form"><!--login form-->
                            <h2>Login to your account</h2>
                            <form action="Controller" method ="post">
                                <input type="text" name="txtUsername" placeholder="Username" value=""/>
                                <input type="password" name="txtPass" placeholder="Password" value=""/>
                                <span>
                                    <input type="checkbox" class="checkbox"> 
                                    Keep me signed in
                                </span>
                                <button type="submit" name="btAction" value="Login" class="btn btn-default">Login</button>
                            </form>
                        </div><!--/login form-->
                    </div>
                    <div class="col-sm-1">
                        <h2 class="or">OR</h2>
                    </div>
                    <div class="col-sm-4">
                        <div class="signup-form"><!--sign up form-->
                            <h2>New User Signup!</h2>
                            <form action="Controller" method="get" enctype="multipart/form-data">
                                <input type="text" name="txtUsername" placeholder="Username"/>
                                <input type="password"  name="txtPass"  placeholder="Password"/>
                                <input type="text"  name="txtName"  placeholder="Full Name"/>
                                <input type="email" name="txtEmail" placeholder="Email Address"/>
                                <p style="float: left;width: 180px;margin-left: 5px">Check role Administration</p><input type="checkbox" name="chkAdmin" value="ADMIN" style="height: 18px;width: 15px"/><br/>
                                <button type="submit" name="btAction" value="Register" class="btn btn-default">Signup</button>
                            </form>
                        </div><!--/sign up form-->
                    </div>
                </div>
            </div>
        </section><!--/form-->

    <jsp:include page="footer.jsp"></jsp:include>

    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
