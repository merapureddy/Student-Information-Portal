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
    <body bgcolor=#A3E4D7>
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
             String branch=request.getParameter("marks_show_branch");
             int sem=Integer.parseInt(request.getParameter("marks_show_sem"));
             int internal=Integer.parseInt(request.getParameter("marks_show_internal"));
             String date=request.getParameter("marks_show_date");
             String roll=request.getParameter("marks_show_roll");
             int tid=0,total_marks=1,j;
             Class.forName("oracle.jdbc.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","merapureddy");
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery("select tid,total_marks from test_info where doc='"+date+"' and branch='"+branch+"' and sem='"+sem+"' and internal='"+internal+"' ");
             while(rs.next())
             {
                tid=rs.getInt(1);
                total_marks=rs.getInt(2);
             }
             //out.println(tid+" "+total_marks+" "+roll);
             rs=st.executeQuery("select marks,subject from sip_marks where tid='"+tid+"' and sid='"+roll+"' ");
             int mark[]=new int[15],ind=0,count=0;
               while(rs.next())
               { ind=rs.getInt("subject");
                 mark[ind]=rs.getInt(1);
                 //out.println(ind+" "+mark[ind]);
                 count++;
               }
               String[] sub=new String[15];
    
     if(branch.equals("CSE"))
        {             
      if(sem==1)
        {
      String[] temp_sub={"English","Maths 1","Maths 2","Chemistry","CPNM","HST"};
             for(j=0;j<temp_sub.length;j++)
              sub[j]=temp_sub[j];
              
           }
      else if(sem==2)
      {
        String[] temp_sub={"Maths 3","physics","PSQT","Engineering graphics","Ethics and moral values"};
        for(j=0;j<temp_sub.length;j++)
              sub[j]=temp_sub[j];      
      }
      else if(sem==3)
      {
        String[] temp_sub={"data structures","ELE","DMS","OOP","EEE","DLD"};
        for(j=0;j<temp_sub.length;j++)
              sub[j]=temp_sub[j];      
      }
      else if(sem==4)
      {
        String[] temp_sub={"Operating Systems","computer organization","Micro processors","Data communications","ADS","operations research","ES"};
        for(j=0;j<temp_sub.length;j++)
              sub[j]=temp_sub[j];      
      }
      else if(sem==5)
      {
        String[] temp_sub={"computer networks","MOOCS-1","Web technologies","FLAT","DBMS","Elective 1"};
        for(j=0;j<temp_sub.length;j++)
              sub[j]=temp_sub[j];      
      }
       else if(sem==6)
      {
        String[] temp_sub={"DWDM","OOSE","MOOCS-3","DAA","Elective-2","Compiler Design","CNS"};
        for(j=0;j<temp_sub.length;j++)
              sub[j]=temp_sub[j];      
      }
       else if(sem==7)
      {
        String[] temp_sub={"Embedded Systems","Cyber security and digital forensics","Artificial intelligence","Principles of economics and management","MOOCS-4","Big data"};
        for(j=0;j<temp_sub.length;j++)
              sub[j]=temp_sub[j];      
      }
        }
        
        if(count==0)
            {
              %>
              <br> <br> <br> 
              <div style="border-radius:5px;">
                <h3 style="color:blue;text-align:center;"> No Marks found from choosen credintials </h3> 

              <br>
              <%
              }
              else
                { %>
                  <br> <br>
                   <div style="padding-left:15%;padding-right:15%;">
    <table class="table z-depth-1" style="font-size:1.2em;border-radius:10px;"> 
        <thead> 
            <tr> 
                <th>sub.no.</th> 
                <th>Subject</th> 
                <th>Marks</th> 
                <th>total marks</th> 
            </tr>             
        </thead> 
        <tbody>  
        <% 
        int i,sum=0;
        for(i=0;i<count;i++)
        {
          sum+=mark[i];
          %>
            <tr> 
                <td><%=i+1%></td> 
                <td><%=sub[i]%></td> 
                <td><%=mark[i]%></td> 
                <td><%=total_marks%></td> 
            </tr>  
          <%
            }
            %>
           <tr> 
                <td>-</td> 
                <td style="color:blue;">Total</td> 
                <td style="color:green;"><%=sum%></td> 
                <td style="color:green;"><%=total_marks*(i)%></td> 
            </tr> 
            </tbody>
         </table>
       </div>
            <%  
            }
            %>
    <div style="padding-right:20px">
        <a href="student_marks_info.jsp" style="border-radius:3px;padding-right:20px">Back</a>
    </div>
</div>

          

    </body>
</html>