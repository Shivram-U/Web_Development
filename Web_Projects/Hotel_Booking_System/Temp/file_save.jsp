<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DB.*"%>
<%
DataBase_Mgmt db = new DataBase_Mgmt();
File f = new File("C:\\Applications\\Application_Folders\\Servers\\Xampp\\tomcat\\webapps\\Hotel_Booking_System\\CSS\\RES\\Media\\temp");
out.println(f);
out.println(f.getName());

String jdbcUrl,username,password,dbname,sql,name,em,ph,pswrd;
Connection connection;
PreparedStatement pst;
ResultSet rs;
boolean con = false,tsk=false,auth=false;
String[] nms = {"UserName","EmailID","Phone_Number","Password","Gender","Nationality"};

jdbcUrl = "jdbc:mysql://localhost:3306/hail hotel management"; // Update with your MySQL database URL
username = "root";
password = "";

connection = null;
pst = null;
Class.forName("com.mysql.cj.jdbc.Driver");
connection = DriverManager.getConnection(jdbcUrl, username, password);
con = true;
try
{
    File[] fls = f.listFiles();
    if(fls.length>0)
    {
        out.println(fls[0]);
        out.println(fls[0].getName());
        //String msg = db.Update_User_profile("Shivram",fls[0]);
        File imageFile = fls[0];
        FileInputStream fis = new FileInputStream(imageFile);
        byte[] data = new byte[(int) imageFile.length()];
        fis.read(data);
        fis.close();

        // SQL statement to insert the image into the database
        sql = "UPDATE clients set FN = ?,Profile_Image =? where UserName = ?";
        
        pst = connection.prepareStatement(sql);
        // Bind the image data to the parameter
        pst.setString(1,f.getName());
        pst.setBytes(2, data);
        pst.setString(3, "Shivram");
        out.println(sql);
            
            // Execute the SQL statement
        int rowsAffected = pst.executeUpdate();
        out.println(rowsAffected);
    }
}
catch(Exception e)
{
    out.println(e.getMessage());
}
out.println("Success");

%>