<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <link rel = "stylesheet" type="text/css" href="CSS/index.css">
    <div id="hdr">
        <jsp:include page="header.jsp" />
    </div>
    <iframe id="pgs">
        
    </iframe>
    <div id="ftr">
        <jsp:include page="footer.jsp"/>
    </div>
    <script>
        var tb = document.getElementById("pgs"),pg;
    </script>
        <%
            if(session.getAttribute("UserName")!=null)
            {
        %>
            <script>
                pg = "User.jsp";
                tb.setAttribute('src',"User.jsp");
                document.getElementById("bkgs").onclick=()=> { tb.setAttribute("src","Bookings.jsp")};
            </script>
        <%
            }
            else
            {
        %>
            <script>
                pg = "Login.jsp";
                tb.setAttribute('src',"Home.jsp");
            </script>
        <%
            }
        %>
    <script>
        console.log("Page = "+pg);
        document.getElementById("home").onclick=()=> { tb.setAttribute("src","Home.jsp")};
        document.getElementById("profile").onclick=()=> { tb.setAttribute("src",pg)};
        document.getElementById("cnt").onclick=()=> { tb.setAttribute("src","Contact.jsp")};

        function print_userName()
        {
            var t = "<%=String.valueOf(session.getAttribute("UserName"))%>";
            console.log(t);
        }
        function reld(s)
        {
            if(s == "Logout")
            {
                window.location.href = "index.jsp?cmd="+encodeURIComponent(s);
            }
            else if(s!=null)
                window.location.href = "index.jsp?Tab="+encodeURIComponent(s);
        }
        setInterval(print_userName,2000);
        function Check_Parameters()
        {
            var urlparams = new URLSearchParams(window.location.search);
            var tab = urlparams.get("Tab");
            var cmd = urlparams.get("cmd");
            var msg = urlparams.get("message");
            if(tab!=null)
            {
                console.log(tab);
                tb.setAttribute("src",tab);
            }
            if(cmd!=null)
            {
                if(cmd=="Logout")
                {
                    window.location.href = "reset.jsp";
                }
            }
            if(msg!=null)
            {
                var mesg = decodeURIComponent(message);
                var msg = document.createElement("div");
                msg.className="msg";
                msg.textContent=mesg;
                document.body.appendChild(msg);
                setTimeout(removemsg,3000);
            }
        }
        document.addEventListener('click', (event) => {
            // Check if the click target is outside of the popupContent
            console.log("mwow")
            console.log(popupContent)
            if(popupContent)
            {
                if (!popupContent.contains(event.target) && event.target !== popupButton) {
               //     popupContent.classList.toggle('active');

            }
            }
        });
        function removemsg()
        {
            var msgd = document.querySelector(".msg");
            if(msgd)
            {
                msgd.parentNode.removeChild(msgd);
            }
        }
        window.onload = Check_Parameters
    </script>
</html>