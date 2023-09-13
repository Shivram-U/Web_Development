<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DB.*"%>
<%
// Assuming you have received the JSON string as a query parameter

    Bookings_Mgmt bdb = new Bookings_Mgmt();
    String name = String.valueOf(session.getAttribute("UserName"));
    String DataString = request.getParameter("Rooms");
    out.println(DataString);
    String[] vals = DataString.split(",");
    int rmcnt = Integer.parseInt(vals[0]);
    int amt = Integer.parseInt(vals[1]),i=2,n = vals.length;
    ArrayList<Integer> amts = new ArrayList<Integer>(); 
    ArrayList<Integer> fa = new ArrayList<Integer>(); 
    ArrayList<Integer> ach = new ArrayList<Integer>(); 
    ArrayList<String> ft = new ArrayList<String>(); 
    ArrayList<String> tt = new ArrayList<String>(); 
    while(i<n)
    {   
        amts.add(Integer.parseInt(vals[i]));
        fa.add(Integer.parseInt(vals[i+1]));
        ach.add(Integer.parseInt(vals[i+2]));
        ft.add(vals[i+3]);
        tt.add(vals[i+4]);
        i+=5;
    }
    // out.println(rmcnt+"<br>");
    // out.println(amt+"<br>");
    // out.println(amts+"<br>");
    // out.println(fa+"<br>");
    // out.println(ach+"<br>");
    // out.println(ft+"<br>");
    // out.println(tt+"<br>");

    String msg = bdb.Book(name,rmcnt,amt,amts,fa,ach,ft,tt);
    out.println(msg);
    response.sendRedirect("http://localhost:8080/Hotel_Booking_System/Bookings.jsp");
%>