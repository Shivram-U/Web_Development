<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DB.*"%>
<script>
    var amt=0,bk="",rms=[],cnt=0;
</script>
<%
    String name = String.valueOf(session.getAttribute("UserName"));
    Bookings_Mgmt bm = new Bookings_Mgmt();
    ArrayList<ArrayList<String>> al = bm.Get_Bookings(name);
    out.println(al);
    int i=0;
    if(al.size()>0)
    {
        %>
        <html>
            <link rel="stylesheet" href="CSS\Bookings.css">
            <h1><%=String.valueOf(session.getAttribute("UserName"))%> booked rooms </h1>
            <body>
                <%
                String bk;
                int amt;
                int count;
                ArrayList<String> tal = null;
                for(i=0;i<al.size();i++)
                {
                    %>
                    <script>
                        rms = [];
                        bk="";
                        amt=0;
                    </script>
                    <%
                    tal = al.get(i);
                    //out.println(tal);
                    bk = tal.get(0);
                    %>  <script> bk ="<%=bk%>"</script><%
                    amt = Integer.parseInt(tal.get(1));
                    %>  <script> amt = <%=amt%></script><%
                    String[] rms  = tal.get(2).split(",");
                    for(String t : rms)
                    {
                    %>  
                        <script> 
                                rms.push(<%=t%>);
                        </script>
                    <%
                    }
                    count = rms.length;
                    %>  <script> cnt = <%=count%></script>
                        <div id="bkp">Booking ID:</div><div class="Bookp" id="Bookp<%=i%>"></div>
                        <div id="RC">
                            <div class="cont" id="rc1">Rooms Count</div><div class="cont" id="val<%=i%>">1</div> 
                        </div>
                        <div class="container" id="container<%=i%>">

                        </div>
                        <div id="FN">
                            <div id="TP">Total Payment</div><div class="payval" id="payval<%=i%>">0</div>   
                        </div>
                    
                    <script>
                        //console.log(amt);
                        //console.log(bk);
                        //console.log(cnt);
                        //console.log(rms);
                        var rc<%=i%> = document.getElementById("val<%=i%>"); 
                        var hd<%=i%> = document.getElementById("Bookp<%=i%>"); 
                        var cont<%=i%> = document.getElementById("container<%=i%>"); 
                        var paym<%=i%> = document.getElementById("payval<%=i%>");

                        hd<%=i%>.innerText = bk;
                        paym<%=i%>.innerText = amt;
                        rc<%=i%>.innerText = cnt;

                        function Create_RM()
                        {
                            var rm = document.createElement("div");
                            rm.innerText = "Room";
                            rm.classList.add("rmn");
                            return rm;
                        }
                        function Create_FA(i)
                        {
                            var fa = document.createElement("div");
                            fa.innerText = "Food Allotment";
                            if(i == 0)
                                fa.style.background="#ff0000";
                            else
                                fa.style.background="#00ff00";
                            fa.classList.add("rmsfa");
                            return fa;
                        }
                        function Create_PM(i)
                        {
                            var pm = document.createElement("div");
                            if(i == 0)
                                pm.innerText = "200";
                            else
                                pm.innerText = "250";
                            pm.classList.add("rmspm");
                            pm.id = "rmspmid";
                            return pm;
                        }
                        function Rooms()
                        {
                            var s = Number(rc<%=i%>.innerText);
                            for(i=0;i<cnt;i++)
                            {
                                console.log(rms);
                                var t = document.createElement("div");
                                t.classList.add("rms");
                                t.appendChild(Create_RM());
                                t.appendChild(Create_FA(rms[i]));
                                t.appendChild(Create_PM(rms[i]));
                                cont<%=i%>.appendChild(t);
                                rms.push(t);
                            }
                        }
                        
                        Rooms();
                    </script>
                }
            </body>
        </html>
        <%
        }
    }
    else
    {
    %>
    <html>
        <link rel="stylesheet" href="CSS\Bookings.css">
        <h1><%=String.valueOf(session.getAttribute("UserName"))%> booked rooms </h1>
        <div id="msg"> No Bookings have been made</div>
    </html>
    <%
    }
%>
