<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="DB.*"%>
<%
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

tsk = false;
        int cnt=0;
        if(con)
        {
            // SQL query to insert a record
            try 
            {
                sql = "SELECT COUNT(*) FROM clients";
                pst = connection.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs.next())
                {
                    cnt = rs.getInt(1);
                }
                sql = "INSERT INTO clients (ClientID,UserName,EmailID,Phone_Number,Password,Gender,Nationality) VALUES (?,?,?,?,?,?,?)";
                pst = connection.prepareStatement(sql);
                
                int k=1;

                pst.setString(k++, "ClientID-$"+(cnt+1));
                pst.setString(k++, "i");
                pst.setString(k++, "i");
                pst.setString(k++,"i");
                pst.setString(k++, "i");
                pst.setString(k++, "N");
                pst.setString(k++, "NIL");

                out.println(sql);
                // Execute the query
                pst.executeUpdate();
                tsk = true;
            } 
            catch(Exception e)
            {
                String message = e.getMessage();
                out.println(e.getMessage());
                if(e instanceof java.sql.SQLIntegrityConstraintViolationException)
                {
                    if(message.contains("UserName"))
                    {
                        out.println("User name already exists");
                    }
                    if(message.contains("Phone_Number"))
                    {
                        out.println("Phone Number already exists");
                    }
                    else if(message.contains("EmailID"))
                    {
                        out.println("EmailID already exists");
                    }
                    else
                    {
                        out.println("Password already exists");
                    }
                }
            }
        }
        out.println("Server Error, please try again later");


out.println("Success");

%>