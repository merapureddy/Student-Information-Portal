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
    <body bgcolor=#FCF3CF>
        <header id="header-1">
            <nav>
                <div>
                    
                    
                    
                    <div>
                        <ul>
                            
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
      String branch=request.getParameter("class_detail_branch"),roll,val_pass;
      int sem=Integer.parseInt(request.getParameter("class_detail_sem"));
      int batch=Integer.parseInt(request.getParameter("class_detail_batch"));
      int strength=Integer.parseInt(request.getParameter("class_detail_strength"));
      int class_per_day=Integer.parseInt(request.getParameter("class_detail_clss"));
     int one,two,temp=batch,bcode=0,aid=0;
     if(branch.equals("CSE"))
      bcode=1;
    else if(branch.equals("CIVIL"))
        bcode=3;
    else if(branch.equals("ECE"))
        bcode=2;
    else if(branch.equals("MECH"))
        bcode=4;
     one=temp%10;
     temp/=10;
     two=temp%10;
     roll="3"+Integer.toString(two)+Integer.toString(one)+"1292"+Integer.toString(bcode)+"0001";
     val_pass=roll;
    
        Class.forName("oracle.jdbc.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","merapureddy");
        PreparedStatement pst;
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select aid from class_details where branch='"+branch+"' and batch='"+batch+"' and sem='"+sem+"'");

        while(rs.next())
        aid=rs.getInt(1);
        
        if(aid==0)
        {
        pst=con.prepareStatement("select max(aid) from class_details");
        rs=pst.executeQuery();
        while(rs.next())
         aid=rs.getInt(1);
        aid++;
        pst=con.prepareStatement("insert into class_details values(?,?,?,?,?)");
        pst.setInt(1,aid);
        pst.setString(2,branch);
        pst.setInt(3,batch);
        pst.setInt(4,sem);
        pst.setInt(5,class_per_day);
        pst.executeUpdate();
       }
       else
       {
         pst=con.prepareStatement("update class_details set total_classes=?+total_classes where aid=?");
         pst.setInt(1,class_per_day);
         pst.setInt(2,aid);
         pst.executeUpdate();
       }
  
      %>
      <br>
      <br>
      <br>
      <div>
    <form data-abide="" action="store_attendance.jsp" method="post">
        <div>
            <h5>Enter total Attendance per day:</h5>
        </div>
        <%
        for(int i=0;i<strength;i++)
           { 
            %>
        <div>
            <div style="align:right;">
                <h5>
                        <%=roll%></h5>
            </div>
            <div>
                <input type="number" style="font-size: 1.2rem;" name=<%="student"+Integer.toString(i)%> required="" pattern="integer">
                <span>Field is required.</span>
            </div>
        </div>
        <%
        long temp_roll=Long.parseLong(roll);
        temp_roll++;
        roll=Long.toString(temp_roll);
    } 
    %>
    <input type="hidden" name="roll_start" value=<%=val_pass%>>
    <input type="hidden" name="aid" value=<%=aid%>>
    <input type="hidden" name="size" value=<%=strength%>>
        <div>
            <a href="class_details.jsp"  style="border-radius:5px;margin-right: 90px;background-color: rgb(255, 165, 0);height:51px;">Back</a>
            <input type="submit"  value="submit"
            style="background-color:#27a9e3;border-radius:5px;height:51px;">
        </div>
    </form>
</div>  
        
    </body>
</html>
