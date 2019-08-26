<!DOCTYPE html>
<%
        String userid=(String)session.getAttribute("userid");
        if(userid!=null)
        {
            session.setAttribute("userid",null);
        }
        %>
<html lang="en" >
    <head>      
       <title>Student Information Database System</title>      
        
    </head>
    <body bgcolor=#E67E22>
       
                    
                           <h1>  <a href="#">Home</a></h1>
                            </li>
                            <li>
                            <button>    <a href="student_login_page.jsp">Login</a></button>
                            </li><br>
                            <li>
                            <button>      <a href="student_signup.jsp">Sign Up</a> </button> 
                            </li><br>
                                                   
                            <li>
                            <button>      <a href="#about">About</a> </button> 
                            </li>
                        </ul>
                        
                    </div>
                    
                </div>
                
           
            
        </header>
        
        
        <div  id="login"><br><br>
            <center><div >
                <button onclick="document.location.href='student_login_page.jsp';">
                    <h3>Student Login</h3> 
                  </button>
                   <br><br>
                </div>
                <button onclick="document.location.href='faculty_login_page.jsp';">
                    <h3>Faculty Login</h3> 
                   </button></center>
                </div>
            </div>
        </div>
        <div  id="about">
            <div >
                <label>
                    <h2 style="padding-left:30px;">
            ABOUT</h2>
                </label>
                <p style="padding-left:30px;padding-top:10px;padding-bottom:20px;font-size:1.4em;">
    Student Information Database System</p>
            </div>
        </div>
       
        
        
    </body>
</html>
