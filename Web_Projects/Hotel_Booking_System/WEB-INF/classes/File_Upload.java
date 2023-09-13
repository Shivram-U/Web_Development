package WebApp;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.oreilly.servlet.MultipartRequest;
 
// Class
// Extending HttpServlet class
public class File_Upload extends HttpServlet {
 
    // Method
    // To handle request response mechanism
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
 
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
 
        MultipartRequest m = new MultipartRequest(request, "C:\\Applications\\Application_Folders\\Servers\\Xampp\\tomcat\\webapps\\Hotel_Booking_System\\CSS\\RES\\temp");
 
        out.print("File uploaded successfully");
    }
}