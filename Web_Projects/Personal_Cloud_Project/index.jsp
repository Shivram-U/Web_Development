<html>
    <link rel="stylesheet" href="index.css">
    <%-- Personal Cloud - Java Server Page Implementation --%>
    <%!
        String Info="This is a Personalized cloud Storage, created for Individual purposes, and Storage.<br>Feel free to use it.";
    %>
    <h1>Personal Cloud</h1>
    <body>
        <div class="inf"> 
            <% out.println(Info); %>
        </div>
        <!-- <iframe id="page" title="Page" src="Cloud.jsp"><% out.println("meow");%></iframe> => Does not work --> 
        <iframe id="page" title="Page" src="Cloud.jsp"></iframe>
    </body>
    <script>
        // Sample Servlet Data import from Server.
            function Sample_Servlet() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    // Process the response from the servlet
                    var response = this.responseText;
                    console.log("Sample Servlet Test:");
                    console.log(response);
                }
                };
                //xhttp.open("GET", "/Personal_Cloud/Sample_Servlet", true); // Replace "/servlet-url" with the actual URL pattern mapping for your servlet
                xhttp.open("GET", "/Personal_Cloud/Sample_Servlet", true); // Replace "/servlet-url" with the actual URL pattern mapping for your servlet
                xhttp.send();
            }
            window.onload = Sample_Servlet; // Call the function when the page is loaded
    </script>
</html>