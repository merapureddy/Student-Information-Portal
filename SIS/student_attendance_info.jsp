<!DOCTYPE html>
<%
        String userid=(String)session.getAttribute("userid");
        String batch="2016";
        if(userid==null)
        {
            response.sendRedirect("sids/student_login_page.jsp");
            session.setAttribute("userid","login_first");
        }
        else
        {   
            int one=userid.charAt(1)-'0';
            int two=userid.charAt(2)-'0';         
            batch=Integer.toString(2000+((one*10)+two));        
        }
        %>
    <head>
       
        <title>Student Information Database System</title>
       
       
    </head>
    <body bgcolor=#5DADE2>
<center><b><h2>Student Attendance</h2></b></center>
        <header id="header-1" >
            <nav >
                <div>
                   
                    
                    <div>
                        <ul>
                           
                            <li>
                                <a href="#"><%= userid %> <i></i></a>
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
        <div>
            <form id="cls_detail" action="student_attendance.jsp" method="post" data-abide="">
              <center>  <div>
                    <div>
                        <h5>
                        Branch</h5>
                        <select  name="show_atten_branch" form="cls_detail"> 
                            <option>CSE</option>
                            <option>ECE</option>                             
                            <option>MECH</option>
                            <option>CIVIL</option>
                        </select>
                    </div>
                    <div>
                        <h5>
                        semester</h5>
                        <select  name="show_atten_sem" form="cls_detail"> 
                            <option value="1">sem1</option>                             
                            <option value="2">sem2</option>                             
                            <option value="3">sem3</option>                             
                            <option value="4">sem4</option>                             
                            <option value="5">sem5</option>                             
                            <option value="6">sem6</option>                             
                            <option value="7">sem7</option>
                        </select>
                    </div>
                <input type="hidden" name="show_atten_batch" value=<%=batch%> >
                <input type="hidden" name="show_atten_roll" value=<%=userid%> >
				
            </div><br><br>
                 <input type="submit" value="submit" style="border-radius:5px;"><br><br>
                <div>
                    <a href="student.jsp" >Back to Home Page</a>

                    
                </div></center>
            </form>
        
       
    </body>
</html>
