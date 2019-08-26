<!DOCTYPE html> 
<html lang="en"> 
    <head> 
        <title>Student Information Database System</title>         
        
    </head>     
    <body bgcolor=#AED6F1> 
        
       <center> <div> 
            <div> 
                <div> 
                                      
                    <form method="post" action="login_validate.jsp"> <br><br>
                        <center><b><h3> 
						Student Login</h3></b> <br></center>
                        <div> 
                            <input type="number" name="roll" placeholder="Registration Number"> <br>
 
                        </div>   <br>                      
                        <div data-validate="Password is required"> 
                            <input type="password" name="pass" placeholder="Password"> <br>
                            
                           
                        </div><br>
                        <div> 
                            <input type="submit" name="login_submit" value="Login" > <br>
                                                         
                        </div>       <br>                  
                        <div> 
                            <a href="student_signup.jsp"> 
							Create your Account</a> 
                        </div>                         
                    </form>                     
                </div>                 
            </div>             
        </div> 
		</center>
                   
        <%

        String userid=(String)session.getAttribute("userid");

        if(userid!=null && userid.equals("error"))
        {
            %>
            <script type="text/javascript">
                window.alert("Invalid Registration number or password");
            </script>
            <%
            session.setAttribute("userid",null);
        }
        else if(userid!=null && userid.equals("login_first"))
        {
            %>
            <script type="text/javascript">
                window.alert("Please Login First!!!");
            </script>
            <%
            session.setAttribute("userid",null);
        }
        else if(userid!=null)
        {
            session.setAttribute("userid",null);
        }
        %>
             
                 
    </body>     
</html>