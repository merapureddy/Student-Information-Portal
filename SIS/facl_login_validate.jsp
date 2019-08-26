<!DOCTYPE html>
<html>
<head>
	<title>Student Information Database System</title>
</head>
<body bgcolor=#F0B27A>
<%@page import="java.sql.*" %>
<%
        String user=request.getParameter("fid");
        String password=request.getParameter("pass"),tab_pass=null;

        Class.forName("oracle.jdbc.OracleDriver");
     Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","merapureddy");
             Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select password from sip_faculty where fid='"+user+"' ");
           while(rs.next())
           	tab_pass=rs.getString(1);

           if(tab_pass!=null && tab_pass.equals(password))
           {
           	session.setAttribute("userid",user);
           	response.sendRedirect("faculty.jsp");         	
           }
           else 
           {
           	session.setAttribute("userid","error");
           	response.sendRedirect("faculty_login_page.jsp");
           }
            
            %>
</body>
</html>