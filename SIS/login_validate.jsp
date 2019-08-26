<!DOCTYPE html>
<html>
<head>
	<title>Student Information Database System</title>
</head>
<body bgcolor=#5DADE2>
<%@page import="java.sql.*" %>
<%
        String roll=request.getParameter("roll");
        String password=request.getParameter("pass"),tab_pass=null;

        Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","merapureddy");
             Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select password from sip_student where sid='"+roll+"' ");
           while(rs.next())
           	tab_pass=rs.getString(1);

           if(tab_pass!=null && tab_pass.equals(password))
           {
           	session.setAttribute("userid",roll);
           	response.sendRedirect("student.jsp");         	
           }
           else 
           {
           	session.setAttribute("userid","error");
           	response.sendRedirect("student_login_page.jsp");
           }
            
            %>
</body>
</html>