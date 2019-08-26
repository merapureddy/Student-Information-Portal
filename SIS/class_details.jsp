<!DOCTYPE html>
<%
        String userid=(String)session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("faculty_login_page.jsp");
            session.setAttribute("userid","login_first");
        }
        %>
<html >
    <head>
        
        <title>Student Information Database System</title>
        
    </head>
    <body bgcolor=#17A589>
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
                                                    
                            <li>
</li>
                        </ul>
                        
                    </div>
                    
					</div>
                
            </nav>
  
            
        </header>
        <div>
            <form id="cls_detail" action="enter_attendance.jsp" method="post" data-abide="">
                <div>
                    <div>
                        <h5>
                        Branch</h5>
                        <select name="class_detail_branch" form="cls_detail" style="font-size:1.2rem;"> 
                            <option>CSE</option>
                            <option>ECE</option>                             
                            <option>MECH</option>
                            <option>CIVIL</option>
                        </select>
                    </div>
                    <div>
                        <h5>
                        semester</h5>
                        <select name="class_detail_sem" form="cls_detail" style="font-size:1.2rem;"> 
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
                        <input type="number" placeholder="eg:2016" name="class_detail_batch" required="" pattern="number" style="font-size:1.2rem;">
                        <span>Field is required.</span>
                    </div>
                    <div>
                        <label>
                            <h5 style="color:black;">class strength*</h5>
                            <input type="number" name="class_detail_strength" required="" pattern="number" style="font-size:1.2rem;"/>
                            <span class="form-error">Field is required.</span>
                        </label>
                    </div>
                    <div>
                        <h5>total classes per day</h5>
                        <input type="number" required="" name="class_detail_clss" style="font-size:1.2rem;"/>
                        <span>Field is required.</span>
                    </div>
                </div>
                <div>
                     <a href="faculty.jsp" style="border-radius: 3px;
    margin-right: 70px;
    margin-top: 15px;
    font-size:1.2rem;">Back to Home Page</a>

                    <input type="submit" value="submit" style="border-radius:5px;font-size:1rem;">
                </div>
            </form>
        </div>
        

    </body>
</html>
