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
    <body bgcolor=#5DADE2>
        <header id="header-1">
            <nav>
                <div>
                    
                    <div>
                        <ul>
                            <li>
                                <a href="#">Home</a>
                                 </li>
                            <li>
                              
                                <a href="#"><%= userid%></a>
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
         int aid=Integer.parseInt(request.getParameter("aid")),i;
         String str_roll=request.getParameter("roll_start"),stu;
         int class_strength=Integer.parseInt(request.getParameter("size"));
         int temp_attendance,flag=0;
         long roll_num;
         Class.forName("oracle.jdbc.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","merapureddy");
        PreparedStatement pst;  Statement st; ResultSet rs;
       st=con.createStatement();

       for(i=0;i<class_strength;i++)
       {
          stu="student"+Integer.toString(i);
          temp_attendance=Integer.parseInt(request.getParameter(stu));
          pst=con.prepareStatement("update attendance set stu_attendance=stu_attendance+'"+temp_attendance+"' where aid='"+aid+"' and sid='"+str_roll+"' ");
          flag=pst.executeUpdate();
          if(flag==0)
          {
          	pst=con.prepareStatement("insert into attendance values(?,?,?)");
          	pst.setString(1,str_roll);
          	pst.setInt(2,aid);
          	pst.setInt(3,temp_attendance);
          	pst.executeUpdate();
          }
          roll_num=Long.parseLong(str_roll);
          roll_num++;
          str_roll=Long.toString(roll_num);
       }

       //out.println("attendance updated"); 
       %> 
     <br> <br> <br> 
              <div style="border-radius:5px;">
                <br>
                <h3 style="color:green;text-align:center;">Attendance Updated!!!</h3> 
              <br>
              <div style="padding-right:20px">
        <a href="class_details.jsp"  style="border-radius:3px;padding-right:20px">Back</a>
    </div>
</div>
     

</body>
</html>