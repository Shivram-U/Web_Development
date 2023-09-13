<html>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.sql.*"%>
    <%@ page import="DB.*"%>
    <script>
        var message;
    </script>
    <%
        DataBase_Mgmt db;
        String name,em,ph,pswrd,msg;
    %>
    <%
        name = request.getParameter("UserName");
        em = request.getParameter("EmailID");
        ph = request.getParameter("Phone_Number");
        pswrd = request.getParameter("Password");
        db = new DataBase_Mgmt();
        msg = db.Add_User(name,em,ph,pswrd);
        %>
        <script>
            message = "<%= msg %>";
        </script>
        <%
        if(db.tsk)
        {
            session.setAttribute("UserName",name);
        }
    %>
    <script>
        // Function to display the message and redirect
        function displayMessageAndRedirect() {
            // Display the message

            // Redirect to another page after 5 seconds (5000 milliseconds)
            setTimeout(function () {
                window.location.href = "Login.jsp?message="+encodeURIComponent(message);
            }, 1000); // 5000 milliseconds = 5 seconds
        }
        displayMessageAndRedirect();
    </script>
</html>