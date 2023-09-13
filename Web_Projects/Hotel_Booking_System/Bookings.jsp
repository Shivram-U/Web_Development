<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DB.*"%>
<script>
    var amt=0,bk="",fa=[],ach=[],amts=[],fds=[],tds=[],cnt=0;
</script>
<%
    String name = String.valueOf(session.getAttribute("UserName"));
    Bookings_Mgmt bm = new Bookings_Mgmt();
    ArrayList<ArrayList<String>> al = bm.Get_Bookings(name);
    // out.println(al+"<br>");
    int i=0,j=0;
    if(al.size()>0)
    {
        %>
            <html>
                <link rel="stylesheet" href="CSS\Bookings.css">
                <h1><%=String.valueOf(session.getAttribute("UserName"))%> booking Records </h1>
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
                        String[] fas  = tal.get(2).split(",");
                        String[] ach  = tal.get(3).split(",");
                        String[] fds  = tal.get(4).split(",");
                        String[] tds  = tal.get(5).split(",");
                        String[] amts  = tal.get(6).split(",");
                        %>
                        <script>
                            fa =[];ach=[];fds=[];tds=[];amts=[];
                        </script>
                        <%
                        for(j=0;j<fas.length;j++)
                        {
                        %>  
                            <script> 
                                    fa.push(<%=fas[j]%>);
                                    ach.push(<%=ach[j]%>);
                                    fds.push("<%=fds[j]%>");
                                    tds.push("<%=tds[j]%>");
                                    amts.push(<%=amts[j]%>);
                                    console.log(fa);
                                    console.log(ach);
                                    console.log(fds);
                                    console.log(tds);
                                    console.log(amts);
                            </script>
                        <%
                        }
                        count = fas.length;
                        %>  <script> cnt = <%=count%></script>
                            <div class="Bookp" id="Bookp<%=i%>"><div id="bkp"> Booking ID</div><div id="bkpcnt"></div></div>
                            <div id="RC">
                                <div id="rc1">Rooms Count</div><div class="cont" id="val<%=i%>">1</div> 
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

                            hd<%=i%>.querySelector("#bkpcnt").innerText=bk;
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
                                    fa.style.color="#ffffff";
                                else
                                    fa.style.color="#00ff00";
                                fa.classList.add("rmsfa");
                                return fa;
                            }
                            function Create_AC(i)
                            {
                                var ac = document.createElement("button");
                                if(i == 1)
                                    ac.style.color="#00ffff";
                                else
                                    ac.style.color="#ffffff";
                                ac.innerText = "AC";
                                ac.classList.add("rmsac");
                                return ac;
                            }
                            function Create_H(i)
                            {
                                var ht = document.createElement("button");
                                if(i == 1)
                                    ht.style.color="#ffa929";
                                else
                                    ht.style.color="#ffffff";
                                
                                ht.innerText = "Heated";
                                ht.classList.add("rmsh");
                                return ht;
                            }
                            function Create_PM(i)
                            {
                                var pm = document.createElement("div");
                                pm.innerText = i;
                                pm.classList.add("rmspm");
                                pm.id = "rmspmid";
                                return pm;
                            }
                            function Create_FT(i)
                            {
                                var ft = document.createElement("div");
                                ft.innerText = i;
                                ft.id = "rmsft";
                                return ft;
                            }
                            function Create_TT(i)
                            {
                                var tt = document.createElement("div");
                                tt.innerText = i;
                                tt.id = "rmstt";
                                return tt;
                            }
                            function Create_DT(a,b)
                            {
                                var tdt = document.createElement("div");
                                tdt.appendChild(Create_FT(a));
                                tdt.appendChild(Create_TT(b));
                                tdt.classList.add("rmsdtc");
                                return tdt;
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
                                    t.appendChild(Create_FA(fa[i]));
                                    t.appendChild(Create_AC(ach[i]));
                                    t.appendChild(Create_H(ach[i] == 0 ? 1:0));
                                    t.appendChild(Create_DT(fds[i],tds[i]));
                                    t.appendChild(Create_PM(amts[i]));
                                    cont<%=i%>.appendChild(t);
                                    rms.push(t);
                                }
                            }
                            Rooms();
                        </script>
                    <%
                    //out.println("meow");
                    }
                    %>
                </body>
            </html>
        <%
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
