<!DOCTYPE html> 
<html lang="en"> 
    <head> 
        <title>Student Information Database System</title>         
        
    </head>     
    <body bgcolor=#F1C40F> 
	<center><b><h2>Faculty Login Page</h2></b></center>
        <div> 
            <div> 
                <div style="padding-bottom:90px;"> 
                                      
                    <form action="facl_login_validate.jsp" method="post"> 
                        <center>
                        <div data-validate="Enter your username."> 
                            <input type="number" name="fid" placeholder="Faculty ID"> 
                              </div>  <br>                       
                        <div data-validate="Password is required"> 
                            <input type="password" name="pass" placeholder="Password"> 
                          
                            <span> <i aria-hidden="true"></i> </span> 
                        </div><br>
                        <div>
                            <button> 
                                Login
</button>                             
                        </div> </center>                        
                    </form>                     
                </div>                 
            </div>             
        </div>     
        <%

        String userid=(String)session.getAttribute("userid");

        if(userid!=null && userid.equals("error"))
        {
            %>
            <script type="text/javascript">
                window.alert("Invalid Username or password");
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