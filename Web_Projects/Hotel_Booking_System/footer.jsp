<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <div id="time">
        <div class="dgc" id="hrs"></div><div class="dgc" id="mns"></div><div class="dgc" id="sec"></div><div class="dgc" id="md"></div><div class="dgc" id="day"></div>
    </div>
    <script>
        function Time() {

            const weekday = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
            // Creating object of the Date class
            var date = new Date();
            // console.log(date);

            // Get current hour
            var hour = date.getHours();
            // Get current minute
            var minute = date.getMinutes();
            // Get current second
            var second = date.getSeconds();
           
            var day = date.getDate();

            var dateString = date.toLocaleDateString('en-US', { weekday: 'long' });
            // Variable to store AM / PM
            var period = "";
           
            // Assigning AM / PM according to the current hour
            if (hour >= 12) {
            period = "PM";
            } else {
            period = "AM";
            }
           
            // Converting the hour in 12-hour format
            if (hour == 0) {
            hour = 12;
            } else {
            if (hour > 12) {
            hour = hour - 12;
            }
            }
           
            // Updating hour, minute, and second
            // if they are less than 10
            hour = update(hour);
            minute = update(minute);
            second = update(second);
           
            // Adding time elements to the div
            document.getElementById("hrs").innerText = hour;
            document.getElementById("mns").innerText = minute;
            document.getElementById("sec").innerText = second;
            document.getElementById("md").innerText = period;
            document.getElementById("day").innerText = dateString;
           
            // Set Timer to 1 sec (1000 ms)
            setTimeout(Time, 1000);
           }
           
            // Function to update time elements if they are less than 10
            // Append 0 before time elements if they are less than 10
           function update(t) {
            if (t < 10) {
            return "0" + t;
            }
            else {
            return t;
            }
           }
           Time()
    </script>
</html>