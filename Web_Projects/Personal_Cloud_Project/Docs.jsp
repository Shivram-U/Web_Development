<html>
    <link rel="stylesheet" href="Docs.css">
    <%-- Personl Cloud Documentation - Java Server Page Implementation --%>
    <%!
        String Info="Personal Cloud is a Cloud Project created to implement a Peronal Cloud Storage, using Apache tomcat Server,<br> with Java Backend and Javascript for frontend.";
    %>
    <h1>Personal Cloud Documentation</h1>
    <body>
        <div class="inf"> 
            <%
                out.println(Info);
            %>
        </div>
        <div class="inf1"> 
            Software used:<br>
                1. Front-End:<br>
                    <% out.println("JavaScript");%><Br>
                2. Back-End:<br>
                    Java - Servlet.<br>
        </div>
        <div class="inf1"> 
            Servlet Implementation:<br>
                The Java Servlet, is the Backend Program implemented in java, to handle the Client Side Requests.<br>
                The Java servlet is a .java Code, and can be compiled using a Java Archive File.<br>
                Serlvet Compilation Command:<br>
                $ `C:\Applications\Application_Folders\Servers\Xampp\tomcat> javac -classpath lib/servlet-api.jar webapps\Personal_Cloud\WEB-INF\classes\Personal_Cloud_Server_Side\Sample_Servlet.java`<br>
        </div>
    </body>
</html>