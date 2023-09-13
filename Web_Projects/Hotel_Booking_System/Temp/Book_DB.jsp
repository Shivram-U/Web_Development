<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DB.*"%>
<%
// Assuming you have received the JSON string as a query parameter

    Bookings_Mgmt bdb = new Bookings_Mgmt();
    String name = "i";
    String DataString = request.getParameter("Rooms");
    out.println(DataString);
    String[] vals = DataString.split(",");
    int rmcnt = Integer.parseInt(vals[0]);
    int amt = Integer.parseInt(vals[1]),i=2,n = vals.length;
    ArrayList<Integer> amts = new ArrayList<Integer>(); 
    ArrayList<Integer> fa = new ArrayList<Integer>(); 
    while(i<n)
    {   
        amts.add(Integer.parseInt(vals[i]));
        fa.add(Integer.parseInt(vals[i+1]));
        i+=2;
    }
    out.println(rmcnt);
    out.println(amt);
    out.println(amts);
    out.println(fa);


    //String msg = bdb.Book(String.valueOf(session.getAttribute("UserName")),rmcnt,fa,amt);
    //out.println(msg);

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
        connection = DriverManager.getConnection(jdbcUrl, username, password);
        con = true;
        // Drivers Import
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
    if(con)
        {
            try 
            {
                int rn=0;
                String clid="";
                sql = "SELECT COUNT(*) from bookings";
                pst = connection.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs.next())
                    rn = rs.getInt(1);
                sql = "SELECT ClientID from clients where UserName = '"+name+"';";
                out.println("<br>"+sql);
                pst = connection.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs.next())
                    clid = rs.getString(1);
                String bk = "BK-$"+rn+1;
                sql = "Insert INTO bookings VALUES(?,?,?)";
                pst = connection.prepareStatement(sql);
                int k=1;
                out.println("<br>");
                out.println(clid);
                out.println("<br>");
                out.println(bk);
                out.println("<br>");
                out.println(amt);
                out.println("<br>");
                pst.setString(k++,clid);
                pst.setString(k++,bk);
                pst.setString(k++,String.valueOf(amt));
                pst.executeUpdate();
                
                sql = "Insert into bookingdata VALUES(?,?,?)"; 
                for(i=0;i<rmcnt;i++)
                {
                    pst = connection.prepareStatement(sql);
                    k=1;
                    pst.setString(k++,bk);
                    pst.setString(k++,"Room-"+(i+1));
                    pst.setString(k++,String.valueOf(fa.get(i)));
                    pst.executeUpdate();
                }
            } 
            catch (Exception e) 
            {
                out.println(e.getMessage());
            }
        }
%>