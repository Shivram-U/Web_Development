<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" type="text/css" href="CSS/Login.css">
    <body>
        <div class="container">
            <div class="bluebg">
                <div class="Box Signin">
                    <h2>Already have an account?</h2>
                    <button class="signin">Sign in</button>
                </div>
                <div class="Box Signup">
                    <h2>Don't have an account?</h2>
                    <button class="signup">Sign up</button>
                </div>
            </div>
            <div class="form">
                <div class="frm signinform">
                    <form id="signinfrm" action="Signin.jsp">
                        <h3>Sign In</h3>
                        <input id="f1" type="text" name="UserName" placeholder="UserName">
                        <input id="f2" type="password" name="Password" placeholder="Password">
                        <input id="sn" type="submit" value="Login">
                    </form>
                </div>
                <div class="frm signupform">
                    <form id="signupfrm" action="Signup.jsp">
                        <h3>Sign Up</h3>
                        <input id="f3" type="text" name = "UserName" placeholder="UserName">
                        <input id="f4" type="text" name = "EmailID" placeholder="Email ID">
                        <input id="f5" type="text" name = "Phone_Number" placeholder="Phone Number">
                        <input id="f6" type="password" name = "Password" placeholder="Password">
                        <input id="sup" type="submit" value="Sign up">
                    </form>
                </div>
            </div>
        </div>
        <script>
            const signin = document.querySelector(".signin");
            const signup = document.querySelector(".signup");
            const signinf = document.getElementById("signinfrm");
            const signupf = document.getElementById("signupfrm");
            const form = document.querySelector(".form");
            const body = document.querySelector('body');

            const f = []
            f.push(document.getElementById("f1"));
            f.push(document.getElementById("f2"));
            f.push(document.getElementById("f3"));
            f.push(document.getElementById("f4"));
            f.push(document.getElementById("f5"));
            f.push(document.getElementById("f6"));
            signup.onclick = function()
            {
                form.classList.add('active');
                body.classList.add('active');
            }
            signin.onclick = function()
            {
                form.classList.remove("active");
                body.classList.remove("active");
            }
            var sn = document.getElementById("sn"),sup = document.getElementById("sup");
            sn.onclick = function()
            {
                event.preventDefault();
                if(f[0].value!="" && f[1].value!="")
                    signinf.submit();
                else    
                    alert("Please enter the values and then submit")
            }
            sup.onclick = function()
            {
                event.preventDefault();
                for(i=3;i<6;i++)
                {
                    if(f[i].value == "")
                    {
                        alert("Please enter the values and then submit");
                        return;
                    }
                }
                signupf.submit();    
            }
            function displayMessage()
            {
                var urlparams = new URLSearchParams(window.location.search);
                var message = urlparams.get("message");
                console.log("meow"+message);
                if(message!=null)
                {
                    var mesg = decodeURIComponent(message);
                    var msg = document.createElement("div");
                    msg.className="msg";
                    msg.textContent=mesg;
                    document.body.appendChild(msg);
                    setTimeout(removemsg,2000);
                    console.log("meowwwqq")
                    if(mesg == "Authentication Successfull" || mesg == "Registration Successfull")
                    {
                        setTimeout(function(){parent.reld("User.jsp");},2000);
                        console.log("reload")
                    }
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
            window.onload = displayMessage;
        </script>
    </body>
</html>