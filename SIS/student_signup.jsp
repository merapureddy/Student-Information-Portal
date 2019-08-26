<!DOCTYPE html>
<html lang="en">
    <head>
        
        <title>Student Information Database System</title>
        
    </head>
    <body bgcolor=#5DADE2>
        <div>
            <div>
                <form id="reg-form" action="sign_up_validate.jsp"><br><br>
                    <div>
					<center><b><h3>STUDENT SIGN UP PAGE</h3></b><br><br></center>
                        <div">
                            <input id="first_name" type="text" maxlength="25" required name="first_name">
                            <label for="first_name">First Name</label>
                        </div><br>
                        <div">
                            <input id="last_name" type="text" maxlength="23" required name="last_name">
                            <label for="last_name">Last Name</label>
                        </div><br>
                    </div>
                    <div>
                        <div">
                            <input id="roll" type="number" required name="roll">
                            <label for="Registration Number">Registration Number</label>
                        </div><br>
                    </div>
                    <div>
                        <div>
                            <input id="password" type="password" minlength="5" maxlength="19" required name="pass1">
                            <label for="password" >Password</label>
                        </div><br>
                    </div>
                    <div>
                        <div>
                            <input id="password" type="password" minlength="5" maxlength="19" required name="pass2">
                            <label for="Re-password">Re-enter Password</label>
                        </div><br>
                    </div>
                    <div>
                        <div>
                            <button type="submit" name="action">Register
                                <i>done</i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <%

        String status=(String)session.getAttribute("sign_up");

        if(status!=null && status.equals("pass_err"))
        {
             %>
            <script type="text/javascript">
                window.alert("password and re-enter password do not match");
            </script>
            <%
            session.setAttribute("sign_up",null);
        }
        else if(status!=null && status.equals("already_exsists"))
        {
            %>
            <script type="text/javascript">
                window.alert("Account already exsists");
            </script>
            <%
            session.setAttribute("sign_up",null);
        }
        %>
        
    </body>
</html>
