<!DOCTYPE html>
<html>
<head>
	<title>Student Information Database System</title>
</head>
<body bgcolor=#5DADE2>
<%@page import="java.sql.*" %>
<%
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String roll=request.getParameter("roll");
String password=request.getParameter("pass1"),name=null;
String password2=request.getParameter("pass2");
int flag=1;
     if(!(password.equals(password2)))
     {
       response.sendRedirect("student_signup.jsp");
                session.setAttribute("sign_up","pass_err");
                flag=0;
     }

  if(flag==1)
    {
   Class.forName("oracle.jdbc.OracleDriver");
         Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","merapureddy");
             Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select name from sip_student where sid='"+roll+"' ");
              while(rs.next())
              {
                   name=rs.getString(1);
              }
              if(name==null)
              {
              	name=first_name+" "+last_name;
              	st.executeQuery("insert into sip_student values('"+roll+"','"+name+"','"+password+"' )");
              	response.sendRedirect("student_login_page.jsp");
              }
              else
              	{
              	response.sendRedirect("student_signup.jsp");
                session.setAttribute("sign_up","already_exsists");
              }
    }


%>
</body>
</html>