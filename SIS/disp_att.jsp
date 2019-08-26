
<%@page import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>


  <%      
        

        try {
           String url = "jdbc:oracle:thin:@localhost:1521:XE";
            Class.forName("oracle.jdbc.driver.OracleDriver");//loading Driver
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","merapureddy");
            String query = "select * from attendance";
            PreparedStatement st = con.prepareStatement(query);
            
            
            ResultSet rs = st.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            
            int cols = rsmd.getColumnCount();
            out.print("<center><table cellpadding=30><tr>");
            for (int i = 1; i <= cols; i++)
            {
                out.print("<td>");
                out.print(rsmd.getColumnName(i));
                out.print("</td>");
            }
            out.print("</tr>");
            while (rs.next()) 
            {
                out.print("<tr>");
                for (int i = 1; i <= cols; i++) 
                {
                    out.print("<td>");
                    out.print(rs.getString(i));
                    out.print("</td>");
                }
              out.print("</tr>");
            }
            out.print("</table></center>");
            rs.close();
            st.close();
            con.close();
        } 
		catch (Exception e) 
		{
            e.printStackTrace();
        } 
%>		
    

