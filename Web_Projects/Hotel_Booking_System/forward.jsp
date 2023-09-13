<%
if(session.getAttribute("UserName") == null)
{
    response.sendRedirect("http://localhost:8080/Hotel_Booking_System/Home.jsp?message=Please log in or sign up, before booking.");
    
}
else
{
    if(request.getParameter("to").equals("Book.jsp"))
        response.sendRedirect("http://localhost:8080/Hotel_Booking_System/Book.jsp");
    else
        response.sendRedirect("http://localhost:8080/Hotel_Booking_System/Bookings.jsp");
}
%>