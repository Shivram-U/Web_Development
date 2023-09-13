<html>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.sql.*"%>
    <%@ page import="DB.*"%>
    <script>
        var message;
    </script>
    <%
        DataBase_Mgmt db;
        String name="",em,ph,pswrd,msg,gnd,ntn,on=null;
        String[] st = new String[6];
        // String[] st = {"Shivam","i","i","i","i","i","i"};
        
    %>
    <%
        on = request.getParameter("oldname");
        st[0] = request.getParameter("UserName");
        st[1] = request.getParameter("EmailID");
        st[2] = request.getParameter("Phone_Number");
        st[3] = request.getParameter("Password");
        st[4] = request.getParameter("Gender");
        st[5] = request.getParameter("Nationality");
        db = new DataBase_Mgmt();
        msg = db.Update_User(on,"111111",st);
        %>
        <script>
            message = "<%= msg %>";
        </script>
        <%
        if(db.tsk)
        {
            session.setAttribute("UserName",st[0]);
        }
    %>
    <script>
        // Function to display the message and redirect
        function displayMessageAndRedirect() {
            // Display the message

            // Redirect to another page after 5 seconds (5000 milliseconds)
            setTimeout(function () {
                window.location.href = "User.jsp?message="+encodeURIComponent(message);
            }, 1000); // 5000 milliseconds = 5 seconds
        }
        displayMessageAndRedirect();
    </script>
</html>