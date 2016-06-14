package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class User {

	String email="";
	String password="";
	private String message="";
	boolean nalezeno=false;
	
	// JDBC driver name and database URL
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	final String DB_URL = "jdbc:mysql://localhost:3306/db_pepa";
	final String USER = "root";
	final String PASS = "";
	
	Connection conn = null;
	Statement stmt = null;

	// konstuktor - bean musi mit prazdny konstuktor
	public User() {

	}

	// konstruktor
	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean validate()  {

		nalezeno=false;
		// zde podminky kontroly

		System.out.println("User inserted : email=" + email + " password=" + password);
		
		if (email.equals("")) {
			message = "Chyba : Email nemuze byt prazdny";
			return false;
		}
		
		if (password.equals("")) {
			message = "Chyba : Heslo nemuze byt prazdne";
			return false;
		}
		
		if (password.length() < 8) {
			message = "Chyba : Heslo je kratsi nez 8 znaku";
			return false;
		}
		
		
				
		// zde porovnat zadane hodnoty s dB

		try {
		
			  message = "Chyba : Email nebo heslo jsou spatne";
			
			  Class.forName("com.mysql.jdbc.Driver");
		      conn = DriverManager.getConnection(DB_URL,USER,PASS);
		      stmt = conn.createStatement();
		      
		      String sql;
		      sql = "SELECT email, password FROM table_pepa";
		      ResultSet rs = stmt.executeQuery(sql);
	
		      while(rs.next()){
	
		    	  String db_email  = rs.getString("email");
		          String db_password = rs.getString("password");
		          
		          System.out.print("From dB : Email: " + db_email);
		          System.out.print(", Passsword: " + db_password);
		          System.out.print("\n");
		          
		          // validace
		          
		       
		  		  if (password.equals(db_password) && (email.equals(db_email))) {
		  			message = "Uspesne prihlaseni!";
		  			nalezeno=true;
		  		  }
		          
		          
		       }
		      rs.close();
		      stmt.close();
		      conn.close();
		      
		      if (nalezeno==true) {
		    	  return true;
		      }else{
		    	  return false;
		      }
		      
		      
			  }catch(SQLException se){
			      //Handle errors for JDBC
				  se.printStackTrace();
				  System.out.println("JDBC Error " + se);
				  
			  }catch(Exception e){
			      //Handle errors for Class.forName
			      e.printStackTrace();
			      System.out.println("Error " + e);
			      
			  }finally{
			      //finally block used to close resources
			      try{
			         if(stmt!=null)
			            stmt.close();
			      }catch(SQLException se2){
			      }// nothing we can do
			      try{
			         if(conn!=null)
			            conn.close();
			      }catch(SQLException se){
			         se.printStackTrace();
			      }//end finally try
			   }//end try
			
		  
		  return false;
	

	}

}
