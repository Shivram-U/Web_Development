<html>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.sql.*"%>
    <%@ page import="DB.*"%>
    <script>
        var message;
    </script>
    <%
        DataBase_Mgmt db;
        String name="i",em="i",ph="i",pswrd="i",msg="i";
    %>
    <%
        db = new DataBase_Mgmt();
        msg = db.Add_User(name,em,ph,pswrd);
        out.println(msg);
        if(db.tsk)
        {
            session.setAttribute("UserName",name);
        }
    %>
    <script>
        // Function to display the message and redirect

    </script>
</html>