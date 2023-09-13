<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DB.*"%>
<%
String jdbcUrl,username,password,dbname,sql,em,ph,pswrd;
    Connection connection=null;
    PreparedStatement pst=null;
    ResultSet rs=null;
    boolean con = false,tsk=false,auth=false;
    jdbcUrl = "jdbc:mysql://localhost:3306/hail hotel management"; // Update with your MySQL database URL
    username = "root";
    password = "";
    try
    {
        connection = null;
        pst = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = true;
        connection = DriverManager.getConnection(jdbcUrl, username, password);
        // Drivers Import
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
String clid="";
try
{
    ArrayList<String> al = new ArrayList<String>();
        String bk="",t="";
        int amt=0;
        sql = "SELECT ClientID from clients where UserName = 'i';";
        pst = connection.prepareStatement(sql);
        rs = pst.executeQuery();
        if(rs.next())
            clid = rs.getString(1);
        sql = "SELECT BookingsID,Amount from bookings where ClientID = '"+clid+"';";
        pst = connection.prepareStatement(sql);
        rs = pst.executeQuery();
        if(rs.next())
        {
            bk = rs.getString("BookingsID");
            amt = rs.getInt("Amount");
        }
        al.add(bk);
        al.add(String.valueOf(amt));
        sql = "SELECT food_allotment from bookingdata where BookingsID = '"+bk+"';";
        pst = connection.prepareStatement(sql);
        rs = pst.executeQuery();
        if(rs.next())
        {
            t = rs.getString("Food_Allotment");
        }
        al.add(t);
        out.println(al); 

}
catch(Exception e)
{
    out.println(e.getMessage());
}
%>