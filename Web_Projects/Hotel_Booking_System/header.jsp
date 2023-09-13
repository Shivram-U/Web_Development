<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div id = "header">
        <h1> Hail Hotels </h1>
        <button id="cont">H</button>
        <script>
            var pg = "Login.jsp";
        </script>
        <div id="tab">
            <button class="tb" id="home">Home</button>
            <button class="tb" id="profile">Profile</button>
            <%
                if(session.getAttribute("UserName")!=null)
                {
            %>
            <button class="tb" id="bkgs">Bookings</button>
            <script>
                pg = "User.jsp";
            </script>
            <%
                }
            %>
            <button class="tb" id="cnt">Contact</button>
        </div>
    </div>
    <div id="dispcont">
        <button id="hd" class="pb">Hail Hotels</button>
        <script>
            const popupContent = document.getElementById('dispcont');
        </script>
        <%
            if(session.getAttribute("UserName")!=null)
            {
            %>
            <script>
                if(popupContent)
                    popupContent.style.height = "320px";
            </script>
            <div id="usr"><img id="dispimg"><%=session.getAttribute("UserName")%></div>
            <%
        }
        %>
        <button id="hm" class="pb">Home</button>
        <button id="prf" class="pb">Profile</button>
        <%
        if(session.getAttribute("UserName")!=null)
        {
            %>
            <button id="bk" class="pb">Bookings</button>
            <%
            }
        %>
        <button id="cn" class="pb">Contact</button>
        <%
        if(session.getAttribute("UserName")!=null)
        {
            %>
            <button id="lg" class="pb">Log out</button>
            <%
        }
        else
        {
        %>
            <button id="lg" class="pb">Log in</button>
        <%
        }
        %>
    </div>
    <script>
        // Get references to the button and pop-up content
        const popupButton = document.getElementById('cont');
        const dispimg = document.getElementById('dispimg');
        const lg = document.getElementById('lg');
        var hm = document.getElementById('hm');
        
        const prf = document.getElementById('prf');
        const bk = document.getElementById('bk');
        const cnt = document.getElementById('cn');
        var setp=1;
        console.log("Contact:"+cnt);
        hm.onclick = function()
        {
            tb.setAttribute("src","Home.jsp");
        }
        if(bk!=null)
        {
            bk.onclick = function()
            {
                tb.setAttribute("src","Bookings.jsp");
            }
        }
        prf.onclick = function()
        {
            tb.setAttribute("src",pg);
        }
        cnt.onclick = function()
        {
            //console.log("meowqewqw");
            tb.setAttribute("src","Contact.jsp");
        }
        
        if(lg.innerText == "Log in")
        {
            lg.onclick = function()
            {
                tb.setAttribute("src","Login.jsp");
            }
        }
        else
        {
            lg.onclick = function()
            {
                reld("Logout");
            }
        }

        // Open the pop-up when the button is clicked
        popupButton.addEventListener('click', () => {
            popupContent.classList.toggle('active');
        });

        //popupContent.style.display = 'none';
        // Close the pop-up when the close button is clicked
    </script>
</div>
