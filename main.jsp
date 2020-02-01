<%@ page import = "java.io.* ,java.util.* ,java.sql.Connection ,java.sql.DriverManager ,java.sql.PreparedStatement ,java.sql.ResultSet ,java.sql.SQLException ,java.sql.Statement" %>
    
    <html>
 <head>
  <title>JSP 2.0 Example - Hello World<title/>
 </head>
 <body>

	<%

		String sql = "INSERT INTO Temperatura (Date) VALUES(?)";
			Connection connection = null;
			try {			
				Class.forName("org.sqlite.JDBC");
	        	connection = DriverManager.getConnection("jdbc:sqlite:D:\\DB\\DBTempDate.db");
				PreparedStatement pstmt = connection.prepareStatement(sql);			
				//pstmt.setDouble(1, request.getParameter("first_name"));
				pstmt.setString(1, request.getParameter("last_name"));
				
				pstmt.executeUpdate();			        		        
				}
		    	catch(SQLException e){
		    	 	System.err.println(e.getMessage());
		    	 	throw e;
		    	}
		    	finally {         
				try {
					if(connection != null)
						connection.close();
				}
				catch(SQLException e) {          
					System.err.println(e); 
				}		
            }
	
	%>
 <body>
</html>