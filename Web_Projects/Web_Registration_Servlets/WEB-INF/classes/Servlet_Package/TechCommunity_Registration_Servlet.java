package Servlet_Package;
import java.sql.*;
import java.net.*;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


class Data_Base
{
    String URL = "jdbc:mysql://localhost:3306/",usrnam = "root",pword="$hivRam@9900#",DB="tech_community",table="Members",VAL;
    StringBuilder url,val;
    Connection link;
    Statement stat;
    ResultSet res; 
    TechCommunity_Registration_Servlet ts;
    Data_Base(TechCommunity_Registration_Servlet ts ) throws SQLException
    {
        this.ts = ts;
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
        //save(list);
    }
    public void save(String[] data)
    {
        VAL = " VALUES(";
        for(int i=0;i<7;i++)
        {
            VAL+="'"+data[i]+"',";
        }
        val = new StringBuilder(VAL);
        val.setCharAt(VAL.length()-1,')');
        try
        {
            stat.executeUpdate("Insert into "+table+val);
        }
        catch(Exception e)
        {
            //ts.pw.print("<html>error111</html>");
            System.out.print(e);
        }
        //ts.pw.print("<html>success</html>");
    }
}

public class TechCommunity_Registration_Servlet    extends HttpServlet
{
    String[] vals = new String[10];
    Data_Base db;
    public PrintWriter pw ;
    //String[] list1= {"Shivram U","2003-10-12","XXXXXXXXX","YYYYYYY","321@","9361258685","ddddd"};
    //String[] list= {"123","1239-12-22","123","123","321@","213","213"};
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        pw = response.getWriter();
        vals[0] = request.getParameter("Name");
        vals[1] = request.getParameter("DOB");
        vals[2] = request.getParameter("Address");
        vals[3] = request.getParameter("Prof_Educ");
        vals[4] = request.getParameter("MailID");
        vals[5] = request.getParameter("PhNum");
        vals[6] = request.getParameter("Pword");
        //pw.print("<html><body>meow</html>");
        //pw.print("<html><br>"+vals+"<br></html>");
        try
        {
            db = new Data_Base(this);
        }
        catch(Exception e)
        {
            //pw.print("<html><br>"+vals+"<br></html>");
            System.out.print(e);
        }
        //pw.print("<html>meow1</html>");
        db.save(vals);
        pw.print("<html>done</html>");
    }
}
