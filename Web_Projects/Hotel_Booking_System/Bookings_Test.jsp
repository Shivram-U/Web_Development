<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DB.*"%>
<script>
    var amt=0,bk="",fa=[],ach=[],amts=[],fds=[],tds=[],cnt=0;
</script>
<%
    String name = String.valueOf(session.getAttribute("UserName"));
    Bookings_Mgmt bm = new Bookings_Mgmt();
    ArrayList<ArrayList<String>> al = bm.Get_Bookings(name);
    out.println(al+"<br>");
%>