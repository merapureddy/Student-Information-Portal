<!DOCTYPE html>
<html lang="en">
<%
        String userid=(String)session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("student_login_page.jsp");
            session.setAttribute("userid","login_first");
        }
        %>
    <head>
        
        <title>Student Information Database System</title>
       
       
    </head>
    <body bgcolor=#82E0AA>
       <center> <h2 style="padding-left:20px;padding-top:30px;">Student Home Page</h2></center>
        <header id="header-1">
            <nav>
                <div>
                    
                   

                    <div>
                       
                                <a href="#"><%= userid %> <i></i></a>
                              

                    </div>

                </div>

            </nav>


        </header>
      <center>  <div>
            <button onclick="document.location.href='student_marks_info.jsp';">
                <h3>Student Marks</h3> </button>
                
            </div><br>
            <button onclick="document.location.href='student_attendance_info.jsp';">
                <h3>Student Attendance</h3></button> 
                
            </div>
        </div><br><br>
		 <a href="index.jsp">Log out</a>
        </center>
        
    </body>
</html>
