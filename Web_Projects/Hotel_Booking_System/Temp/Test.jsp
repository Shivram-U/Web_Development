<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DB.*"%>
<%
    Bookings_Mgmt bm = new Bookings_Mgmt();
    out.println(bm.Get_Bookings("i"));
%>