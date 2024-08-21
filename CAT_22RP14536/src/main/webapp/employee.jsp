<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<h1>Employee Management System</h1><br>
   <form method="POST">
   	<h2>Insert a employee</h2>
		  <hr>
	<input type="text" name="name" placeholder="Enter  empname"><br><br>
	<input type="text" name="salary" placeholder="Enter  emp salary"><br><br>
	<input type="text" name="age" placeholder="Enter  emp age"><br><br>
   	<button  name="submit">Send</button>
   </form>
   </div>
    <%
            if (request.getParameter("submit") != null) {
                String name = request.getParameter("name");
                String quantity = request.getParameter("salary");
                String price = request.getParameter("age");
                
                String url = "jdbc:mysql://localhost:3306/emp_22RP14536";
                String user = "root"; 
                String pass = "";

                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    conn = DriverManager.getConnection(url, user, pass);
                    
                   
                    String sql = "INSERT INTO employees (empname,salary,age) VALUES (?,?,?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, name);
                   // pstmt.setString(2,salary);
                   // pstmt.setString(3,age);
                   
                    pstmt.executeUpdate();

                    out.println("<h3>New employee Recorded Successful!</h3>");
                    out.println("<p>Name: " + name + "</p>");
                    response.sendRedirect("dashboard.jsp");
                } catch (Exception e) {
                    out.println("<h3>Error: " + e.getMessage() + "</h3>");
                    }
                    finally{
                    if(pstmt != null)try{pstmt.close();}
                    catch(SQLException e){}
                    if(conn != null)try{conn.close();}
                    catch(SQLException e){}
                    }}
                    %>
                    </body>
                    </html>