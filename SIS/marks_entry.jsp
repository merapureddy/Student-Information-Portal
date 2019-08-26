<!DOCTYPE html>
<%
        String userid=(String)session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("faculty_login_page.jsp");
            session.setAttribute("userid","login_first");
        }
        %>
<html>
    <head>
       
        <title>Student Information Database System</title>
       
    </head>
    <body bgcolor=#A9CCE3>
        <header id="header-1" >
                 
                                <a href="#"><%= userid%> <i></i></a>
                                    <li>
                                        <a href="index.jsp">Log out</a>
                                    </li>

        </header>
        <div>
            <form action="test_info.jsp" method="POST" id="test_info_insert"><center>
                <div>
                    <div>
                        <h5>
                        Branch</h5>
                        <select class="form-control" name="marks_insert_branch" form="test_info_insert"> 
                            <option>CSE</option>
                            <option>ECE</option>                             
                            <option>MECH</option>
                            <option>CIVIL</option>
                        </select>
                    </div>
                    <div>
                        <h5>
                        semester</h5>
                        <select name="marks_insert_sem" form="test_info_insert"> 
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
                        <h5>
                        Batch</h5>
                        <input type="number" placeholder="eg:2015" name="marks_insert_batch" required="">
                    </div>
                    <div> 
                        <h5>Internal </h5>
                        <select name="marks_insert_internal" form="test_info_insert"> 
                            <option value="1">Internal 1</option>                             
                            <option value="2">Internal 2</option>                             
                            <option value="3">Internal 3</option>                             
                        </select>
                    </div>
                    <div>
                        <h5>Date of Conduct</h5>
                        <input type="date" name="marks_insert_date" required="">
                    </div>
                    <div>
                        <h5>Test marks</h5>
                        <input type="number" name="tot_marks" required="">
                    </div>
                </div>
                <div>
                    <a href="faculty.jsp" >Back to Home Page</a>

                    <input type="submit" value="submit" style="border-radius:5px;font-size:1rem;">
                </div>
            </form></center>
        </div>
    </body>
</html>
