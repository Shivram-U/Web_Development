<html>
    <link rel="stylesheet" href="Cloud.css">
    <h1>Cloud Directories</h1>
    <body>
        <!-- <button onclick="Download_File('mw')">hi</button> -->
        <div id="Cloud_Content">
            <p id="Current_Directory_Label">Current Directory</p><p id="Current_Directory"></p>
            <hr>
            <div id="Directories"></div>
            <div id="Files"></div>
        </div>
    </body>
    <script>
        // Sample Script:
            // Sample Cloud Servlet
            function Cloud_Directories_Servlet_Call() 
            {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() 
                {
                    if (this.readyState == 4 && this.status == 200) 
                    {
                        // Process the response from the servlet
                        var response = this.responseText;
                        // All the `\n` occurrences in the response Text is replaced with `<br>` to introduce Line Break when this is displayed in HTML Document.
                        document.getElementById("Cloud_Content").innerHTML = response.replace(/\n/g,"<br>").replace(/\t/g,"<t>");   // Regular Expression `/\n/g` is used to replace all the Occurrences. 
                        console.log(typeof response); 
                        //console.log("Cloud File System:");
                        //console.log(response.replace(/\n/g,"<br>"));
                    }
                };
                xhttp.open("GET", "/Personal_Cloud/Cloud_Directories", true); // Replace "/servlet-url" with the actual URL pattern mapping for your servlet
                xhttp.send();
            }
            // setInterval(Cloud_Directories_Servlet_Call,5000);
            // Project Cloud Servlet
        //Page Script
            // Globals
                var response,Root_Directory,Root_Directory_Name,Cloud_Data="",Current_Directory="",Updated_Cloud_Data="";   
                console.log("Cloud File System Updation Online");
                var Directory_Space = document.getElementById('Directories');
                var File_Space = document.getElementById('Files');
                // Cloud Client Information Setup
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() 
                {
                    if (this.readyState == 4 && this.status == 200) 
                    {
                        // Process the response from the servlet
                        response = this.responseText;
                        Cloud_Data = JSON.parse(response);
                        Root_Directory=Cloud_Data.ROOT_DIRECTORY;
                        Root_Directory_Name = Cloud_Data.ROOT_DIRECTORY_NAME;
                        document.getElementById("Current_Directory").innerHTML = Root_Directory_Name;
                        console.log(Cloud_Data);
                    }
                };
                xhttp.open("GET", "/Personal_Cloud/Cloud_File_System?Request=Personal_Cloud_Root_Info", true); // Replace "/servlet-url" with the actual URL pattern mapping for your servlet
                xhttp.send();
                // Functions:
                function handleClick() 
                {
                    console.log("Button clicked!");
                }
                function Download_File(file_name)
                {
                    console.log("call"+file_name);
                    var path = Current_Directory+"\\"+file_name;
                    console.log(path);
                    File_Components = file_name.split(".");
                    var SERVLET_URL="/Personal_Cloud/File_Provider"; // Servlet URL
                    var FILE_NAME=File_Components[0];                                // Servlet Parameters
                    var FILE_TYPE=File_Components[1];                                // Servlet Parameters
                    var FILE_REQUEST_SERVLET_URL=SERVLET_URL+"?File_Name="+encodeURIComponent(FILE_NAME)+"&File_Type="+encodeURIComponent(FILE_TYPE);
                    var xhr = new XMLHttpRequest();
                    xhr.responseType = "blob";
                    xhr.open("GET",FILE_REQUEST_SERVLET_URL);
                    console.log("Setup Complete");
                    xhr.onload = function()
                    {
                        console.log("Request Sent");
                        if(xhr.status==200)
                        {
                            //console.log(xhr.responseText);
                            var blob = new Blob([xhr.response], { type: "application/txt" });
                            var link = document.createElement("a");
                            link.href = window.URL.createObjectURL(blob);
                            // The `file_name` has to be similar to the Name of the File requested, 
                            // since the File Data will be downloaded, in the Client Browser in this name `file_name` only.
                            link.download = file_name;                      
                            link.click();
                        }
                        console.log("Response received");
                    };
                    xhr.send();
                }
                function Explore_Directory(Directory)
                {
                    console.log("call"+Directory);
                    console.log("call"+Current_Directory);
                    if(Current_Directory == "")
                        Current_Directory = Current_Directory+Directory;
                    else
                        Current_Directory = Current_Directory+"\\"+Directory;
                    console.log(Current_Directory);
                    Current_Directory = Current_Directory.replace("\\","/");
                    Current_Directory = Current_Directory.replace("\\","/");
                    console.log(Current_Directory);
                    var SERVLET_URL="/Personal_Cloud/Cloud_File_System"; // Servlet URL
                    var DIRECTORY_EXPLORE_SERVLET_URL=SERVLET_URL+"?Request=Sub_Directory:"+encodeURIComponent(Current_Directory);
                    console.log(DIRECTORY_EXPLORE_SERVLET_URL);
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET",DIRECTORY_EXPLORE_SERVLET_URL);
                    console.log("Setup Complete");
                    xhr.onload = function()
                    {
                        console.log("Request Sent");
                        if(xhr.status==200)
                        {
                            response = this.responseText;
                            Cloud_Data = JSON.parse(response);
                            // Console.log(response);
                            console.log(Cloud_Data);   
                        }
                        console.log("Response received");
                    };
                    xhr.send();
                    document.getElementById("Current_Directory").innerHTML = document.getElementById("Current_Directory").innerHTML+"\\"+Directory ;
                }
                function Cloud_File_System_Servlet_Call(Requested_Directory) 
                {
                    // console.log(Requested_Directory+"||"+Current_Directory+"||"+Current_Updated_Directory);
                    console.log("Cloud:"+Cloud_Data+Updated_Cloud_Data+(Cloud_Data==Updated_Cloud_Data));
                    console.log("Cloud updated");
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() 
                    {
                        if (this.readyState == 4 && this.status == 200) 
                        {
                            // Process the response from the servlet
                            response = this.responseText;
                            Cloud_Data = JSON.parse(response);
                            // Console.log(response);
                            // console.log(Cloud_Data);
                            // console.log(Updated_Cloud_Data);
                            // console.log("Cloud:"+Cloud_Data+Updated_Cloud_Data+(Cloud_Data==Updated_Cloud_Data));
                            if(JSON.stringify(Updated_Cloud_Data) == JSON.stringify(Cloud_Data))
                            {
                                console.log("No updation required");
                                return;
                            }    
                            Updated_Cloud_Data = Cloud_Data;
                            // All the `\n` occurrences in the response Text is replaced with `<br>` to introduce Line Break when this is displayed in HTML Document.
                            // Document.getElementById("Cloud_Content").innerHTML = "<a>"+Cloud_Data.FILES[0]+"</a>";
                            // Create a hyperlink dynamically
                            // document.getElementById("Current_Directory").innerHTML = Root_Directory_Name;
                            Directory_Space.innerHTML="";
                            for(i=0;i<Cloud_Data.DIRECTORIES.length;i++)
                            {
                                var Dir_Link_Bt = document.createElement('button');
                                 // Add a class to the element
                                Dir_Link_Bt.classList.add("Directory_Links");
                                Dir_Link_Bt.id="Directory_Link_"+i;
                                Dir_Link_Bt.href = Cloud_Data.DIRECTORIES[i]; // Set the link URL
                                var sp = document.createElement('span');
                                sp.innerHTML =  Cloud_Data.DIRECTORIES[i]+"\\";
                                Dir_Link_Bt.appendChild(sp); // Set the link text
                                // Get the <div> element
                                // Append the link to the <div> element
                                // console.log(i);
                                console.log(Cloud_Data);
                                Directory_Space.appendChild(Dir_Link_Bt);
                                Directory_Space.innerHTML=Directory_Space.innerHTML;
                            }
                            for(i=0;i<Cloud_Data.DIRECTORIES.length;i++)
                            {
                                document.getElementById("Directory_Link_"+i).addEventListener("click",function()
                                {
                                    console.log(this.textContent);
                                    Explore_Directory(this.textContent.substring(0,this.textContent.length-1));
                                });  // Works
                            }
                            File_Space.innerHTML="";
                            for(i=0;i<Cloud_Data.FILES.length;i++)
                            {
                                var File_Link_Bt = document.createElement('button') 
                                Icon = document.createElement('img'),
                                Icon.classList.add("Icon");
                                Icon.src="http://localhost:8080/Personal_Cloud/Sources/Cloud_Download_Icon.svg"
                                Icon.alt="Icon";
                                File_Link_Bt.classList.add("File_Links");
                                File_Link_Bt.id="File_Link_"+i;
                                File_Link_Bt.textContent=Cloud_Data.FILES[i];
                                //File_Link_Bt.innerHTML=Cloud_Data.FILES[i];
                                // DONT INCLUDE THE EVENT HERE:
                                // File_Link_Bt.addEventListener("click",function() {  // console.log(",e");    // WONT WORK
                                //     Download_File(this.innerHTML);
                                // });
                                // File_Link_Bt.addEventListener("click",handleClick);                          // WONT WORK
                                // console.log(File_Link_Bt.innerHTML);
                                File_Link_Bt.append(Icon);
                                File_Space.appendChild(File_Link_Bt);
                                File_Space.innerHTML=File_Space.innerHTML;
                                // NOTE : The event for a Button, must be provided, after it has been included in the Web-Page.
                                // document.getElementById("File_Link_"+i).addEventListener("click",handleClick);  // Works
                                // document.getElementById("File_Link_"+i).innerHTML =  Cloud_Data.FILES[i]; // Set the link text
                                // console.log("Inner_HTML:"+document.getElementById("File_Link_"+i).innerHTML);
                                // document.getElementById("File_Link_"+i).addEventListener("click", () => {    // WONT WORK
                                // File_Link_Bt.addEventListener("click",handleClick);                          // WONT WORK
                            }
                            for(i=0;i<Cloud_Data.FILES.length;i++)
                            {
                                document.getElementById("File_Link_"+i).addEventListener("click",function()
                                {
                                    console.log(this.textContent);
                                    Download_File(this.textContent);
                                });  // Works
                            }
                        }
                    };
                    console.log(Requested_Directory);
                    if(Requested_Directory == "")
                        xhttp.open("GET", "/Personal_Cloud/Cloud_File_System?Request=Root_Directory", true); // Replace "/servlet-url" with the actual URL pattern mapping for your servlet
                    else    
                        xhttp.open("GET", "/Personal_Cloud/Cloud_File_System?Request=Sub_Directory:"+Requested_Directory, true); 
                    xhttp.send();
                    Current_Updated_Directory = Current_Directory;
                }
                //setInterval(Cloud_Directories_Servlet_Call,1000); // Call the function within a specific Time Interval
                Cloud_File_System_Servlet_Call("");
                setInterval(
                    function()
                    {
                        Cloud_File_System_Servlet_Call(Current_Directory);
                    }
                    ,1000); // Call the function within a specific Time Interval
        </script>
</html>