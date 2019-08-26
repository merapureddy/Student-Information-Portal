<!DOCTYPE html>
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
    <body bgcolor=#5DADE2>
<center><h3>Student Marks</h3></center>
        <header id="header-1" >
            <nav>
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
            <form action="student_marks.jsp" method="POST" id="test_info_insert">
               <center> <div>
                    <div>
                        <h5>
                        Branch</h5>
                        <select name="marks_show_branch" form="test_info_insert"> 
                            <option>CSE</option>
                            <option>ECE</option>                          
                            <option>MECH</option>
                            <option>CIVIL</option>
                        </select>
                    </div>
                    <div>
                        <h5>
                        semester</h5>
                        <select name="marks_show_sem" form="test_info_insert"> 
                            <option value="1">sem1</option>                             
                            <option value="2">sem2</option>                             
                            <option value="3">sem3</option>                             
                            <option value="4">sem4</option>                             
                            <option value="5">sem5</option>                             
                            <option value="6">sem6</option>                             
                            <option value="7">sem7</option>
                        </select>
                    </div>
                    <div> 
                        <h5>Internal </h5>
                        <select name="marks_show_internal" form="test_info_insert"> 
                            <option value="1">Internal 1</option>                             
                            <option value="2">Internal 2</option>                             
                            <option value="3">Internal 3</option>                             
                        </select>
                    </div>
                    <div>
                        <h5>Date of Conduct</h5>
                        <input type="date" name="marks_show_date" required="">
                    </div><br>
                </div>
                <input type="hidden" name="marks_show_roll" value=<%=userid%> >
                <div>
                    <input type="submit" value="submit" style="border-radius:5px;">
                </div><br><br>
            </form>
			<a href="student.jsp" >Back to Home Page</a><br>
        </div></center>
        
    </body>
</html>
