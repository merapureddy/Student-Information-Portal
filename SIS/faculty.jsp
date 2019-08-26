<!DOCTYPE html>
<html>
<%
        String userid=(String)session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("faculty_login_page.jsp");
            session.setAttribute("userid","login_first");
        }
        %>
    <head>
        
        <title>Student Information Databse System</title>
        
        
        
        
    </head>
    <body bgcolor=#F6DDCC>
	     <center><br><h2 style="padding-left:30px;">Faculty Home Page</h2></br></center>
        <header id="header-1">
            <nav>
                <div>
                    
                    
                    <div>
                        <ul>
                            
                            <li>
                                <a href="#"><%= userid%> </a>
                                <ul>
                                    <li>
                                        <a href="index.jsp">Log out</a>
                                    </li>
                            
                                </ul>                                 
                            </li>                                                                                     
                        </ul>
                        
                    </div>
                    
                </div>
                
            </nav>
            
        </header>
   <center>
        <div  style="border-radius:5px;">
            <div  id="login">
                <div>
                    <div  style="border-radius:5px;" onclick="document.location.href='marks_entry.jsp';">
                       <button> <h3>Enter the Marks</h3> </button>
                        
                    </div><br>
                    <div style="border-radius:5px;" onclick="document.location.href='class_details.jsp';">
                       <button> <h3>Enter the Attendance</h3> </button>
                        
                    </div><br><br><br>
					<button onclick="document.location.href='disp_att.jsp';">Student Attendance </button><br>
					<button onclick="document.location.href='disp_marks.jsp';">Student Marks </button>
                </div>
            </div>
            <br />
            <br />
        </div></center>
        
    </body>
</html>
