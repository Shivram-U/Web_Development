package DB;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
// Java Beans Concept
public class DataBase_Mgmt 
{
    private String jdbcUrl,username,password,dbname,sql,name,em,ph,pswrd;
    private Connection connection;
    private PreparedStatement pst;
    private ResultSet rs;
    public boolean con = false,tsk=false,auth=false;
    public String[] nms = {"UserName","EmailID","Phone_Number","Password","Gender","Nationality"};
    public DataBase_Mgmt(String Username,String password,String jdbcurl,String databasename)
    {
        this.jdbcUrl = jdbcurl; // Update with your MySQL database URL
        this.username = Username;
        this.password = password;
        this.dbname = databasename;
        this.jdbcUrl+=databasename;

        // Drivers Import
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = null;
            this.pst = null;
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
    public DataBase_Mgmt()
    {
        this.jdbcUrl = "jdbc:mysql://localhost:3306/hail hotel management"; // Update with your MySQL database URL
        this.username = "root";
        this.password = "";
        this.DataBaseConnectionEstablishment();
    }
    public void DataBaseConnectionEstablishment()
    {
        try
        {
            this.connection = null;
            this.pst = null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, username, password);
            this.con = true;
            // Drivers Import
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
    public String Check_UP(String un,String ps)
    {
        this.auth = false;
        if(this.con)
        {
            boolean[] vals = new boolean[2];
            vals[0]=false;
            vals[1]=false;
            HashMap<String,String> mp = null;
            mp = new HashMap<String,String>();
            // SQL query to insert a record
            sql = "SELECT UserName,Password from clients;";
            try 
            {     
                pst = connection.prepareStatement(sql);
                rs = pst.executeQuery();
                while(rs.next())
                {
                    mp.put(rs.getString("UserName"),rs.getString("Password"));
                }
            
                for(Map.Entry<String,String> ent : mp.entrySet())
                {
                    //s+=ent.getKey()+","+ent.getValue()+",";
                    if(ent.getKey().equals(un))
                    {
                        vals[0] = true;
                        if(ent.getValue().equals(ps))
                        {
                            vals[1]= true;
                        }
                    }
                }
                if(vals[0])
                {
                    if(vals[1])
                    {
                        this.auth=true;
                        return "Authentication Successfull";
                    }
                    else
                        return "Password incorrect, please check and try again";
                }
                else
                {
                    return "Authentication failed, please check the User name and password ";
                }
            } 
            catch(Exception e)
            {
                System.out.println(e.getMessage());
                return "Server Error, please try again later";
            }
        }
        else
            return "Server Error, please try again later";
    }
    public String Add_User(String name,String em,String phn,String pswrd)
    {
        this.tsk = false;
        int cnt=0;
        if(this.con)
        {
            // SQL query to insert a record
            try 
            {
                String sql = "SELECT COUNT(*) FROM clients";
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
                pst.setString(k++, name);
                pst.setString(k++, em);
                pst.setString(k++,phn);
                pst.setString(k++, pswrd);
                pst.setString(k++, "N");
                pst.setString(k++, "NIL");

                // Execute the query
                pst.executeUpdate();
                this.tsk = true;
                return "Registration Successfull";
            } 
            catch(Exception e)
            {
                String message = e.getMessage();
                //out.println(e.getMessage());
                if(e instanceof java.sql.SQLIntegrityConstraintViolationException)
                {
                    if(message.contains("UserName"))
                    {
                        return "User name already exists";
                    }
                    if(message.contains("Phone_Number"))
                    {
                        return "Phone Number already exists";
                    }
                    else if(message.contains("EmailID"))
                    {
                        return "EmailID already exists";
                    }
                    else
                    {
                        return "Password already exists";
                    }
                }
            }
        }
        return "Server Error, please try again later";
    }
    public ArrayList<String> Get_User(String un)
    {
        ArrayList<String> al = new ArrayList<String>();
        try 
        {
            sql = "Select * from clients where UserName=?";
            pst = connection.prepareStatement(sql);
            pst.setString(1,un);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
                for(int i=0;i<6;i++)
                    al.add(rs.getString(this.nms[i]));
                return al;
            }
        } 
        catch (Exception e) 
        {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public String Update_User(String name,String pms,String[] vals)
    {
        this.tsk = false;
        int cnt=0,i=0,k=0;
        String Error="",clid=null;
        String sql = "Select ClientID from clients where UserName = '"+name+"';",tsql;
        try
        {
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            if(rs.next())
                clid = rs.getString("ClientID");
        }
        catch(Exception e){}
        if(this.con)
        {
            sql = "UPDATE clients set ";
            // SQL query to insert a record
            for(i=0;i<6;i++)
            {
                try
                {
                    if(pms.charAt(0) == '1')
                    {
                        tsql = sql;
                        tsql = tsql+" "+this.nms[i]+" = "+"'"+vals[k++]+"' where ClientID = '"+clid+"';";
                        pst = connection.prepareStatement(tsql);
                        pst.executeUpdate();
                    }
                }
                catch(Exception e)
                {
                    String message = e.getMessage();
                    //out.println(e.getMessage());
                    if(e instanceof java.sql.SQLIntegrityConstraintViolationException)
                    {
                        if(message.contains("UserName"))
                        {
                            Error+="User name already exists";
                        }
                        if(message.contains("Phone_Number"))
                        {
                            Error+="Phone Number already exists";
                        }
                        else if(message.contains("EmailID"))
                        {
                            Error+="EmailID already exists";
                        }
                        else if(message.contains("Password"))
                        {
                            Error+="Password already exists";
                        }
                    }
                }
            }
            this.tsk = true;
        }
        else
            Error+="Server Error, please try again later";
        if(Error!="")
            return Error;
        else
            return "Success";
    }
    public String Update_User_profile(String name,File f,String fn)
    {
        try
        {
            byte[] imageData = readFileToByteArray(f);

            // SQL statement to insert the image into the database
            String sql = "UPDATE clients set FN = ?,Profile_Image =? where UserName = ?";
            
            pst = connection.prepareStatement(sql);
                // Bind the image data to the parameter
            pst.setString(1,fn);
            pst.setBytes(2, imageData);
            pst.setString(3, name);
                
                // Execute the SQL statement
            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) 
            {
                return"Image inserted successfully.";
            } 
            else
            {
                return "Failed to insert image.";
            }
        }
        catch(Exception e) 
        {
            return e.getMessage();
        }
    }
    public File Get_Profile(String name)    
    {
        int imageId = 1; // Replace with the actual image_id you want to retrieve
        try
        {
            String sql = "SELECT Profile_Image,FN FROM clients WHERE UserName = ?";
            pst = connection.prepareStatement(sql);
            pst.setString(1, name);
            rs = pst.executeQuery();
            if (rs.next()) 
            {
                // Retrieve the image data and file name
                byte[] imageData = rs.getBytes("Profile_Image");
                String fileName = rs.getString("FN");

                // Determine the file extension based on the file name
                String fileExtension = getFileExtension(fileName);

                // Create a File object to save the image
                File outputFile = new File("temp." + fileExtension);

                // Write the binary data to the file
                try (FileOutputStream fos = new FileOutputStream(outputFile)) {
                    fos.write(imageData);
                    System.out.println("Image retrieved and saved as: " + outputFile.getAbsolutePath());
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return outputFile;
            } else {
                System.err.println("Image not found.");
                return null;
            }    
        }
        catch(Exception e)
        {
            return null;
        }
    }
    private static String getFileExtension(String fileName) {
        int lastDotIndex = fileName.lastIndexOf(".");
        if (lastDotIndex != -1) {
            return fileName.substring(lastDotIndex + 1);
        }
        return "";
    }
    private static byte[] readFileToByteArray(File file) throws IOException {
        FileInputStream fis = new FileInputStream(file);
        byte[] data = new byte[(int) file.length()];
        fis.read(data);
        fis.close();
        return data;
    }
    public static void main(String[] args)
    {
        DataBase_Mgmt db = new DataBase_Mgmt();
        System.out.println(db.Check_UP("i","i"));
    }
}