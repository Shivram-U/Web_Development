<html>
    <script>
        var pg = "Login.jsp";
    </script>
    <%
        if(session.getAttribute("UserName")!=null)
        {
    %>
        <script>
            pg = "User.jsp";
        </script>
    <%
        }
    %>
    <link rel="stylesheet" href="CSS\Home.css">
    <body>
        <img src="CSS\RES\Media\HF.jpg" alt="Description of the image" id="bg">
        <div class="cont" id="sg">
            if you are new to our firm please register an user account, in our firm and get hype offers.
            <button id="b1" class="bt">Sign up</button>
        </div>
        <div class="cont" id="lgin">
            if you have an User account, feel free to book rooms and services from our hotel, after logging in
            <button id="b2" class="bt">Log in</button>
        </div>
        <div class="cont" id="bk">
            Let's go and book rooms, if your are logged in.
            <div>
                <button id="b3" style="display:inline;"class="bt1">Book</button><button id="b4" style="display:inline;" class="bt1">Look up</button>
            </div>
        </div>
    </body>
    <script>
        var b1,b2,b3,b4;
        b1 = document.getElementById("b1");
        b2 = document.getElementById("b2");
        b3 = document.getElementById("b3");
        b4 = document.getElementById("b4");
        function lgin()
        {
            parent.window.location.href = "index.jsp?Tab="+encodeURIComponent(pg);            
        }
        b1.onclick = () => {lgin()};
        b2.onclick = () => {lgin()};
        b3.onclick = () => { window.location.href = "forward.jsp?to=Book.jsp"; };
        b4.onclick = () => { window.location.href = "forward.jsp?to=Bookings.jsp"; };
        function Check_Parameters()
        {
            var urlparams = new URLSearchParams(window.location.search);
            var cmd = urlparams.get("cmd");
            var msg = urlparams.get("message");
            if(cmd!=null)
            {
                if(cmd=="Logout")
                {
                    window.location.href = "reset.jsp";
                }
            }
            if(msg!=null)
            {
                var mesg = decodeURIComponent(msg);
                msg = document.createElement("div");
                msg.className="msg";
                msg.textContent=mesg;
                document.body.appendChild(msg);
                setTimeout(removemsg,3000);
            }
        }
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