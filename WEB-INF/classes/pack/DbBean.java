package pack; 

import java.sql.*;  
import java.io.*; 
import java.util.Properties;


public class DbBean { 

  public String dbURL = "jdbc:mysql://";
  String dbDriver = "com.mysql.jdbc.Driver"; 
  Properties ps=new Properties();  
  public Connection dbCon; 
  private String userName = "";
  private String password = "";
  private String database = "";
  private String host = "";

  private String configFile="/opt/IITG-PROJECT/SW-IIT/placement_new/WEB-INF/config/config.txt";
public String encodeHtmlTag(String tag) {
if (tag == null)
return null;
int length = tag.length();
StringBuffer encodedTag = new StringBuffer(2 * length);
for (int i=0; i<length; i++) {
char c = tag.charAt(i);
if (c == '<')
encodedTag.append("<");
else if (c == '>')
encodedTag.append(">");
else if (c == '&')
encodedTag.append("&amp;");
else if (c == '"')
encodedTag.append("&quot;"); 
else if (c == ' ')
encodedTag.append("&nbsp;");
else
encodedTag.append(c);
}
return encodedTag.toString();
}


public void setConfigFile(String configFile) {
if (configFile != null)
	{this.configFile = configFile;}
}

public String getconfigFile() {
return configFile;
}


public void setUserName(String userName) {
if (userName != null)
	{this.userName = userName;}
}

public String getUserName() {
return userName;
}

public void setPassword(String password) {
if (password != null){}
	{this.password = password;}
}

public String getPassword() {
return password;
}

public void setDatabase(String database) {
if (database != null)
  this.database = database;
     
}



public String getDatabase() {
return database;
}

public void setDbURL() {
if (dbURL != null){}
	{this.dbURL = "jdbc:mysql://" + host + "/" + database ;}
}

public String getDbURL() {
return dbURL;
}


public void setHost(String host) {
if (host != null)
  this.host = host;
    
}

public String getHost() {
return host;
}

  public DbBean(){  
       super();        
       } 


  public boolean fetchConfigDetails()
	{
	try {
			ps.load(new FileInputStream(configFile));
			userName = ps.getProperty("userName");
			password = ps.getProperty("password");
			host = ps.getProperty("host");
			database = ps.getProperty("database");
			setDbURL(); 
			return true;
		} 
	catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	catch (NullPointerException npe) {
			npe.printStackTrace();
			return false;
		}
	}

  public boolean connect() throws ClassNotFoundException,SQLException{ 
  		  
          Class.forName(dbDriver); 
		  
          dbCon = DriverManager.getConnection(dbURL,userName,password); 
		  //dbURL = "jdbc:mysql://";
		  //database = "";
		  //host = "";
          return true; 

        } 

  

  public void close() throws SQLException{ 
        dbCon.close(); 
       } 

  public ResultSet execSQL(String sql) 
  	{ 
			ResultSet r=null;
			try{
                    Statement s = dbCon.createStatement(); 
                     r = s.executeQuery(sql); 
 				}
			catch(SQLException e)
			{
				System.out.println(e);
			}				
           return (r == null) ? null : r; 

	 } 	

  public int updateSQL(String sql) 
     {              
     System.out.println(sql);       
                int r=0;

			try{
			      Statement s = dbCon.createStatement();
                  s.executeUpdate(sql);
                        r=1;

			}
			catch(SQLException e)
			{
			                r=0;
					e.printStackTrace();
			}
                  return (r == 0) ? 0 : r; 
      } 
   public ResultSet man_stmnt(String sql)
   {
		ResultSet rs=null;
		try{
		Statement stmt = dbCon.createStatement();
		stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
		rs = stmt.getGeneratedKeys();
		}
			catch(SQLException e)
			{
					System.out.println(e);
			}
		return (rs == null) ? null : rs;
   }

}
