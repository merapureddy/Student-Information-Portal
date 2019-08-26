<!DOCTYPE html>
<%
        String userid=(String)session.getAttribute("userid");
        
        if(userid==null)
        {
            response.sendRedirect("/student information portal/student_login_page.jsp");
            session.setAttribute("userid","login_first");
        }
      %>
<html>
    <head>
       
        <title>Student Information Database System</title>
        
        
    </head>
    <body bgcolor=#F5B7B1>
        <header id="header-1">
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
                                                 
                            <li>
</li>
                        </ul>
                        
                    </div>
                    
                </div>
                
            </nav>
            
        </header>
          <%@page import="java.sql.*" %>
          <%
          int batch=Integer.parseInt(request.getParameter("show_atten_batch"));
          int sem=Integer.parseInt(request.getParameter("show_atten_sem"));
          String branch=request.getParameter("show_atten_branch");
          String roll=request.getParameter("show_atten_roll");
          int aid=0; int total_classes=1,student_attendance=0;
          float stu_attendance=0;
          Class.forName("oracle.jdbc.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","merapureddy");
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select aid,total_classes from class_details where branch='"+branch+"' and batch='"+batch+"' and sem='"+sem+"'");
           while(rs.next())
           {
             aid=rs.getInt(1);
             total_classes=(rs.getInt(2));
           }
           rs=st.executeQuery("select stu_attendance from attendance where sid='"+roll+"' and aid='"+aid+"'");
           while(rs.next())
           {
             student_attendance=(rs.getInt(1));
           }
           //out.println(student_attendance+" "+total_classes);
           out.println("<br>");
           stu_attendance=Math.round(((float)student_attendance/(float)total_classes)*100);
%>
            <div class="z-depth-2 text-success bg-success text-left container top_pad" style="border-radius:5px;">
    <div class="row margin-top20 margin-bottom20" data-pg-collapsed> 
        <h4 style="padding-left:30px;" class="pad20">Your attendance is: <%=stu_attendance%>%</h4> 
    </div>
    <div class="row right-align pad10 pad-bottom10" data-pg-collapsed>
        <a href="student_attendance_info.jsp" style="border-radius:3px;">Back</a>
    </div>
</div>


         
    </body>
</html>
