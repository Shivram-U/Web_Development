<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DB.*"%>

<% 
String jdbcUrl,username,password,dbname,sql="",name="Shivram",em,ph,pswrd;
Connection connection;
PreparedStatement pst;
ResultSet rs,rs1;
boolean con = false,tsk=false,auth=false;

jdbcUrl = "jdbc:mysql://localhost:3306/hail hotel management"; // Update with your MySQL database URL
username = "root";
password = "";


connection = null;
pst = null;
Class.forName("com.mysql.cj.jdbc.Driver");
connection = DriverManager.getConnection(jdbcUrl, username, password);

ArrayList<ArrayList<String>> al = new ArrayList<ArrayList<String>>();
ArrayList<String> tal = null;

try 
{
    String clid="",bk="",t="";
    int amt=0;
    sql = "SELECT ClientID from clients where UserName = '"+name+"';";
    pst = connection.prepareStatement(sql);
    rs = pst.executeQuery();
    if(rs.next())
        clid = rs.getString(1);
    sql = "SELECT * from bookings where ClientID = '"+clid+"';";
    pst = connection.prepareStatement(sql);
    rs = pst.executeQuery();
    out.println(rs+"<br>");
    /*
    while(rs.next())
    {
        bk = rs.getString("BookingsID");
        amt = rs.getInt("Amount");
        out.print(bk+","+amt+"<br>");     
        
    }*/
    while(rs.next())
    {
        bk = rs.getString("BookingsID");
        amt = rs.getInt("Amount");
        out.print(bk+","+amt+"<br>");     
        tal = new ArrayList<String>();
        if(bk!="" && bk!=null)
        {
            tal.add(bk);
            tal.add(String.valueOf(amt));
            sql = "SELECT food_allotment from bookingdata where BookingsID =?";
            pst = connection.prepareStatement(sql);
            pst.setString(1, bk);
            rs1 = pst.executeQuery();
            if(rs1.next())
            {
                t = rs1.getString("Food_Allotment");
            }
            tal.add(t);
        }
        al.add(tal);
        out.println("meow");
    }
    out.print(al+"<br>");     
} 
catch (Exception e) 
{
    out.print(e.getMessage());
    // TODO: handle exception
}
%>