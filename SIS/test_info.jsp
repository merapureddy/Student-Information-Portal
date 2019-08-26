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

                                    <li>
                                        <a href="index.jsp">Log out</a>
                                    </li>

                    </div>
                    
                </div>
                
            </nav>
           
        </header>
         
         		<%@page import="java.sql.*" %>
<%

    String branch=request.getParameter("marks_insert_branch");
    int sem,batch,internal,tot_marks,size=1,bcode=1,max=-1,tid=1; long roll; 
    String date,str_roll,str_batch;
    boolean flag=false;
    if(branch!=null)
    	{
    sem=Integer.parseInt(request.getParameter("marks_insert_sem"));
     batch=Integer.parseInt(request.getParameter("marks_insert_batch"));
     internal=Integer.parseInt(request.getParameter("marks_insert_internal"));
    date=request.getParameter("marks_insert_date");
     tot_marks=Integer.parseInt(request.getParameter("tot_marks"));
  
   if(branch.equals("CSE"))
      bcode=1;
    else if(branch.equals("CIVIL"))
        bcode=3;
    else if(branch.equals("ECE"))
        bcode=2;
    else if(branch.equals("MECH"))
        bcode=4;
     int one,two,temp=batch;
     one=temp%10;
     temp/=10;
     two=temp%10;
     str_roll="3"+Integer.toString(two)+Integer.toString(one)+"1292"+Integer.toString(bcode)+"0000";
    
     roll=Long.parseLong(str_roll);
try
{
 Class.forName("oracle.jdbc.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","merapureddy");
   PreparedStatement pst=con.prepareStatement("select max(tid) from test_info");
   ResultSet rs=pst.executeQuery();
   
     while(rs.next())
       max=rs.getInt(1);
   max++;


    pst=con.prepareStatement("insert into test_info values(?,?,?,?,?,?)");
   
   pst.setInt(1,max);
   pst.setString(2,branch);
   pst.setInt(3,sem);
   pst.setString(4,date);
   pst.setInt(5,internal);
   pst.setInt(6,tot_marks);
   
   pst.executeUpdate(); 
   
   tid=max;
}
catch(Exception e)
{
	out.println("ERROR OCCURED");
}
    }
    else
    {     branch=request.getParameter("branch_val");
          sem=Integer.parseInt(request.getParameter("sem_val"));
          flag=true;
          size=Integer.parseInt(request.getParameter("sub_size"));
          roll=Long.parseLong(request.getParameter("roll_no"));
          tid=Integer.parseInt(request.getParameter("tid_val"));
       
    }
      
    String[] sub=new String[15];
    int j=0;
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
        roll++;
        str_roll=Long.toString(roll);
      %>   
      <div>
        <h3>Enter marks:</h3>
      </div>
      <br>
      <br>
        <div>
         	<form action="#" method="POST">		
                <h5><font color="#cacaca">&nbsp;</font>Registration number: <%=str_roll%></h5>

         	<% for(int i=0;i<j;i++) 
         	   {   %>
                  <div>
            <div  style="align:right;color:blue;">
                <h5>
                        <%= sub[i] %>*</h5>
            </div>
            <div>
                <input type="number" style="font-size:1.2rem;" name=<%= "sub"+Integer.toString(i) %> required="" pattern="integer" />
                <span>Field is required.</span>
            </div>
        </div>
            <% }
              %>
              
              <input type="hidden" name="sem_val" value=<%=sem%> />
              <input type="hidden" name="branch_val" value=<%=branch%> />
              <input type="hidden" name="sub_size" value=<%=j%>>
              <input type="hidden" name="roll_no" value=<%=str_roll%>>
              <input type="hidden" name="tid_val" value=<%=tid%>>
            <div>
    <a href="marks_entry.jsp" style="font-size:1.2em;border-radius:5px;margin-right:70px;">Back to faculty page</a> 
    <input type="submit" value="submit" style="font-size:1.2em;border-radius:4px;margin-right:10px;">
</div>
        </form>
        <%
        if(flag)
        {
           int marks[]=new int[size];
           int i;
           for(i=0;i<size;i++)
         marks[i]=Integer.parseInt(request.getParameter("sub"+Integer.toString(i)));

           Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","merapureddy");
roll=Long.parseLong(str_roll);
roll--;
str_roll=Long.toString(roll);
for(i=0;i<size;i++)
{
   PreparedStatement pst=con.prepareStatement("insert into sip_marks values(?,?,?,?)");
   pst.setString(1,str_roll);
   pst.setInt(2,tid);
   pst.setInt(3,marks[i]);
   pst.setInt(4,i);
   pst.executeUpdate();
}
con.close();
        }
        %>
        
</body>
</html>