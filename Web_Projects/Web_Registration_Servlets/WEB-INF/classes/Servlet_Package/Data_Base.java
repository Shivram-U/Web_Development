import java.sql.*;

public class Data_Base
{
    static String URL = "jdbc:mysql://localhost:3306/",usrnam = "root",pword="$hivRam@9900#",DB="tech_community",table="Members",VAL;
    static StringBuilder url,val;
    static Connection link;
    static Statement stat;
    static ResultSet res; 
    public static void main(String args[]) throws SQLException
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            link = DriverManager.getConnection(URL+DB,usrnam,pword);
        }
        catch(Exception e)
        {
            System.out.print(e);
        }
        stat = link.createStatement();
        System.out.print("success");
        String[] list= {"123","1239-12-22","123","123","321@","213","213"};
        save(list);
    }
    public static void save(String[] data)
    {
        VAL = " VALUES(";
        for(int i=0;i<7;i++)
        {
            VAL+="'"+data[i]+"',";
        }
        val = new StringBuilder(VAL);
        val.setCharAt(VAL.length()-1,')');
        System.out.println("Insert into "+table+val);
        System.out.print(val);
        try
        {
            stat.executeUpdate("Insert into "+table+val);
        }
        catch(Exception e)
        {
            System.out.print(e);
        }
    }
}
