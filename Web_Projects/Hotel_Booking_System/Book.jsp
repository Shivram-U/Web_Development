<html>
    <link rel="stylesheet" href="CSS\Book.css">
    <h1> Rooms Booking </h1>
    <body>
        <div id="Bookp">Booking Procedure</div>
        <div id="RC">
            <div class="cont" id="rc1">Rooms </div><div class="cont" id="rc2">Rooms Count</div><div class="cont" id="val">1</div><button class="bt" id="max">+</button>    
        </div>
        <div id="container">

        </div>
        <div id="FN">
            <div id="TP">Total Payment</div><div id="payval">0</div><button id="pay">Pay</button>   
        </div>
    </body>
    <script>
        var count =0,rms=[];
        var rc = document.getElementById("val"); 
        var cont = document.getElementById("container"); 
        var b1 = document.getElementById("max");
        var paym = document.getElementById("payval");
        var paybt = document.getElementById("pay");
        b1.onclick = () => 
        {
            var t = Number(rc.innerText);
            rc.innerText = t+1;
        };
        function Create_RM()
        {
            var rm = document.createElement("div");
            rm.innerText = "Room";
            rm.classList.add("rmn");
            return rm;
        }
        function Create_FA()
        {
            var fa = document.createElement("button");
            fa.innerText = "Food Requirement";
            fa.classList.add("rmsfa");
            return fa;
        }
        function Create_AC()
        {
            var ac = document.createElement("button");
            ac.innerText = "AC";
            ac.classList.add("rmsac");
            return ac;
        }
        function Create_H()
        {
            var ht = document.createElement("button");
            ht.innerText = "Heated";
            ht.classList.add("rmsh");
            return ht;
        }
        function Create_FT()
        {
            var ft = document.createElement("input");
            ft.type="date";
            const cdt = new Date();
            const formattedCurrentDate = cdt.toISOString().split('T')[0];
            ft.value = formattedCurrentDate;
            ft.min = formattedCurrentDate;
            ft.max = formattedCurrentDate;
            ft.id = "rmsft";
            return ft;
        }
        function Create_TT()
        {
            var tt = document.createElement("input");
            tt.type="date";
            const cdt = new Date();
            const formattedCurrentDate = cdt.toISOString().split('T')[0];
            tt.value = formattedCurrentDate;
            tt.min = formattedCurrentDate;
            tt.id = "rmstt";
            return tt;
        }
        function ddiff(a,b)
        {
            const date1 = new Date(a);
            const date2 = new Date(b);

            // Calculate the time difference in milliseconds
            const timeDifference = date1 - date2;

            // Calculate the difference in days
            var daysDifference = timeDifference / (1000 * 60 * 60 * 24);
            return Number(daysDifference)+1;
        }
        function Create_DT()
        {
            var tdt = document.createElement("div");
            tdt.appendChild(Create_FT());
            tdt.appendChild(Create_TT());
            tdt.querySelector("#rmsft").addEventListener('change', function() {
                // Get the value selected in the second date picker (tt) 
                const tt = this.parentNode.querySelector("#rmstt");
                console.log(this.value);
                tt.min = this.value;               
                Total_Payment(this.parentNode.parentNode);
                //Set the maximum date of the first date picker (ft) to the selected date in the second date picker
            });
            tdt.querySelector("#rmstt").addEventListener('change', function() {
                // Get the value selected in the second date picker (tt)
                const ft = this.parentNode.querySelector("#rmsft");
                console.log(this.value);
                ft.max = this.value;
                //console.log(daysDifference);
                Total_Payment(this.parentNode.parentNode);
                // Set the maximum date of the first date picker (ft) to the selected date in the second date picker
              });
            tdt.classList.add("rmsdtc");
            return tdt;
        }
        function Create_PM()
        {
            var pm = document.createElement("div");
            pm.innerText = "2500";
            pm.classList.add("rmspm");
            pm.id = "rmspmid";
            return pm;
        }
        function Total_Payment(elem)
        {
            var t = 2000;
            var pm = elem.querySelector("#rmspmid");
            var ft = elem.querySelector("#rmsft");
            var tt = elem.querySelector("#rmstt");
            var fa = elem.querySelector(".rmsfa");
            var ac = elem.querySelector(".rmsac");
            var ht = elem.querySelector(".rmsh");
            //console.log(ft.value);
            //console.log(tt.value);
            var diff = ddiff(tt.value,ft.value);
            if(fa.style.color == "rgb(0, 255, 0)")
                t+=1000;
            if(ac.style.color =="rgb(0, 255, 255)")
                t+=500;
            else if(ht.style.color =="rgb(255, 169, 41)")
                t+=1000;
            
            pm.innerText = t*diff;
            //console.log("meow");y
            //return t*ddiff(tt.value,ft.value);
        }
        function Rooms()
        {
            var s = Number(rc.innerText);
            for(i=count;i<s;i++)
            {
                var t = document.createElement("div");
                t.classList.add("rms");
                var bt = document.createElement("button");
                bt.classList.add("rmsbt");
                bt.innerText = "X";
                t.appendChild(bt);
                t.appendChild(Create_RM());
                t.appendChild(Create_FA());
                t.appendChild(Create_PM());
                t.appendChild(Create_AC());
                t.appendChild(Create_H());
                t.appendChild(Create_DT());
                t.addEventListener('click', function (event) {
                    if (event.target.classList.contains('rmsfa')) {
                        console.log(event.target.style.background);
                        if(event.target.style.color == "rgb(0, 255, 0)")
                        {
                            event.target.style.color = "#ffffff";
                            Total_Payment(this)
                        }
                        else
                        {
                            event.target.style.color = "#00ff00";
                            Total_Payment(this)
                        }
                    }
                    else if(event.target.classList.contains('rmsac')) {
                        console.log(event.target.style.background);
                        console.log(event.target.style.color);
                        if(event.target.style.color == "rgb(255, 255, 255)")
                        {
                            const ht = event.target.parentNode.querySelector(".rmsh");
                            event.target.style.color = "#00ffff";
                            if(ht.style.color=="rgb(255, 169, 41)" || ht.style.color=="")
                            {
                                ht.style.color="#ffffff";
                            }
                            Total_Payment(this);
                        }
                        else
                        {
                            event.target.style.color = "#ffffff";
                            Total_Payment(this);
                        }
                    }
                    else if(event.target.classList.contains('rmsh')) {
                        //console.log(event.target.style.background);
                        //console.log(event.target.style.color);
                        if(event.target.style.color == "rgb(255, 255, 255)" || event.target.style.color == "")
                        {
                            const ac = event.target.parentNode.querySelector(".rmsac");
                            event.target.style.color = "#ffa929";
                            if(ac.style.color=="rgb(0, 255, 255)" || ac.style.color=="")
                            {
                                ac.style.color="#ffffff";
                            }
                            Total_Payment(this);
                        }
                        else
                        {
                            event.target.style.color = "#ffffff";
                            Total_Payment(this);
                        }
                    }
                    
                });
                cont.appendChild(t);
                rms.push(t);
            }
            count = s;
            let pmt =0;
            function add(i)
            {
                //console.log(i);
                pmt+=Number((i.querySelector("#rmspmid")).innerText);
            }
            rms.forEach(add);
            paym.innerText = pmt;
        }
        // Event Delegation Concept
        // -> Where Events can be added to a parent element instead of adding to every single element. It refers to the process of using event propagation (bubbling) to handle events at a higher level in the DOM than the element on which the event originated.
        cont.addEventListener('click', function (event) {
            if (event.target.classList.contains('rmsbt')) {
                rc.innerText = Number(rc.innerText) - 1;
                event.target.parentNode.parentNode.removeChild(event.target.parentNode);
                rms = rms.filter(item => item!=event.target.parentNode);
            }
        });
        
        paybt.onclick = function()
        {
            var rmfad = [];
            var payment = Number(paym.innerText);
            if(payment>0)
            {
                rmfad.push(Number(rc.innerText));
                rmfad.push(payment);
                function anal(i)
                {
                    var t = [],ac = (i.querySelector(".rmsac"));
                    t.push(Number((i.querySelector("#rmspmid")).innerText));
                    t.push((i.querySelector(".rmsfa")).style.color == "rgb(0, 255, 0)" ? "1" : "0");
                    t.push((ac.style.color == "rgb(0, 255, 255)" || ac.style.color == "") ? "1" : "0");
                    t.push((i.querySelector("#rmsft")).value);
                    t.push(i.querySelector("#rmstt").value);
                    rmfad.push(t);
                }
                rms.forEach(anal);
                console.log(rmfad);
                //console.log(rmfad[2]);
                var rmfadString = rmfad.join(',');
                console.log(rmfadString);
                var url = "http://localhost:8080/Hotel_Booking_System/Bookings_DB.jsp" +
                    "?Rooms=" + encodeURIComponent(rmfadString);
                // Redirect to the new URL
                window.location.href = url;
            }
        }
        setInterval(Rooms,100);
    </script>
</html>

<!--
Try
    try to pass the javascript array in JSON format ans intrepret it from JSP.

-->