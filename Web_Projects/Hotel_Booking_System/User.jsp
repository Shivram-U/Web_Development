<%
if(session.getAttribute("UserName") == null)    
    response.sendRedirect("http://localhost:8080/Hotel_Booking_System/Login.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="DB.*"%>
 
<html>
    <link rel="stylesheet" type="text/css" href="CSS/User.css">
    <script>
        var prfpath="CSS\\RES\\Media\\temp\\",imgpth="";
    </script>
    <%
        DataBase_Mgmt db = new DataBase_Mgmt();
        String nm=null,em=null,phn=null,ps=null,gnd=null,ntn=null;
        ArrayList<String> al = db.Get_User(String.valueOf(session.getAttribute("UserName")));
        if(al!=null)
        {
            nm = al.get(0);
            em = al.get(1);
            phn = al.get(2);
            ps = al.get(3);
            gnd = al.get(4);
            ntn = al.get(5);
        }
        String directoryPath = "C:\\Applications\\Application_Folders\\Servers\\Xampp\\tomcat\\webapps\\Hotel_Booking_System\\CSS\\RES\\Media\\temp";
 
        String Name = request.getParameter("on");
        // Create a File object for the directory
        File directory = new File(directoryPath);

        // Check if the directory exists
        if (directory.exists() && directory.isDirectory()) {
            // List all files in the directory
            File[] files = directory.listFiles();

            // Delete each file
            for (File file : files) {
                if (file.isFile()) {
                   file.delete();
                }
            }
        }
        
        try
        {
            File f = db.Get_Profile(nm);
            String fn = f.getName();
            File destinationDirectory = new File(directoryPath);

            // Move the source file to the destination directory
            boolean success = f.renameTo(new File(destinationDirectory, f.getName()));
            %>
            <script>
                imgpth = prfpath+"<%=fn%>";
            </script>
            <%
        }
        catch(Exception e)
        {
            out.println(e);
        }
    %>  
    <body>
        <div id="head">
            <div id="prfimgc">
                <input type="file" id="fileInput" style="display: none;" />
                <button id="upld"> Upload Photo</button><img id="prfimg" >
                <form style="display:none;" action="Update.jsp" method="post">
                    <input style=" display:none;" type="text" name="oldname" value="<%=nm%>">
            </div><input id="usn" name="UserName" value="<%=nm%>" id="n"/>
        </div>
        <div id="container">
                <label class="flds">Email ID</label><input name="EmailID" class="vals" value="<%=em%>" id="e"/><br>
                <label class="flds">Phone Number</label><input name="Phone_Number" class="vals" value="<%=phn%>" id="pn"/><br>
                <label class="flds">Password</label><input name="Password" class="vals" value="<%=ps%>" id="pn"/><br>
                <label class="flds">Gender</label><input name="Gender" class="vals" value="<%=gnd%>" id="pn"/><br>
                <label class="flds">Nationality</label><input name="Nationality" class="vals" value="<%=ntn%>" id="pn"/><br>
                <input id="bt" type="submit" value="Update"/>
        </div>
        </form>
    </body>
    <script>
            var prfimg = document.getElementById("prfimg");
            var upldbt = document.getElementById("upld");
            var finpt = document.getElementById("fileInput");
            var updt = document.getElementById("bt");
            prfimg.setAttribute("src",imgpth); 
            parent.dispimg.setAttribute("src",imgpth); 
            updt.onclick = () => {
                
            };
            //prfimg.setAttribute("src",prfpath); 

             // Add a click event listener to the button
        upldbt.addEventListener('click', function () {
            // Trigger the click event on the file input
            finpt.click();
        });

        // Add an event listener to the file input for when a file is selected
        finpt.addEventListener('change', function (event) {
            const fileInput = event.target;
            const selectedFile = fileInput.files[0];

            if (selectedFile) {
                // Create a FormData object to send the file in a POST request
                const formData = new FormData();
                formData.append('file', selectedFile);

                // Make a POST request to your servlet URL
                fetch('/Hotel_Booking_System/PRFLUPL?on='+encodeURIComponent("<%=nm%>"), {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.text())
                .then(data => {
                    console.log("Path:"+prfpath+data);
                    prfimg.src = prfpath + data + '?' + Date.now();
                    parent.dispimg.src = prfpath + data + '?' + Date.now();
                    console.log(dispimg.src);
                    console.log('Server response:', data);
                    // Handle the response from the server as needed
                })
                .catch(error => {
                    console.error('Error:', error);
                });
            }
        });
    </script>
</html>