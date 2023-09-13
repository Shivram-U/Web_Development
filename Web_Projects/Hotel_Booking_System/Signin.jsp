<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="DB.*"%>
<script>
    var message;
</script>
<%
    //String cls = System.getProperty("Database_mgmt");
    //out.println("Classpath: " + cls);
    DataBase_Mgmt db;
    String name,pswrd,msg;
%>
<%
    name = request.getParameter("UserName");
    pswrd = request.getParameter("Password");
    db = new DataBase_Mgmt();
    msg = db.Check_UP(name,pswrd);
    %>
        <script>
            message="<%=msg%>";
            //location.reload();
        </script>
    <%
    if(db.auth)
    {
        session.setAttribute("UserName",name);
    }        
%>
    <script>
        console.log("mwoq");
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