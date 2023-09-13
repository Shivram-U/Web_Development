package WebApp;
import java.io.*;
import DB.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.oreilly.servlet.MultipartRequest;
 
// Class
// Extending HttpServlet class
public class PrfImg_Upl extends HttpServlet {
 
    // Method
    private String getFileExtension(String fileName) {
        int lastDotIndex = fileName.lastIndexOf(".");
        if (lastDotIndex != -1) {
            return fileName.substring(lastDotIndex);
        }
        return "";
    }
    // To handle request response mechanism
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
 
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String directoryPath = "C:\\Applications\\Application_Folders\\Servers\\Xampp\\tomcat\\webapps\\Hotel_Booking_System\\CSS\\RES\\Media\\temp";
 
        String Name = request.getParameter("on");
        // Create a File object for the directory
        File directory = new File(directoryPath);

        // Check if the directory exists
        if (directory.exists() && directory.isDirectory()) {
            // List all files in the directory
            File[] files = directory.listFiles();

            // Delete each file
            for (File file : files) {
                if (file.isFile()) {
                   file.delete();
                }
            }
        }

        MultipartRequest m = new MultipartRequest(request,directoryPath );

        // Get the original file name
        String originalFileName = m.getOriginalFileName("file");

        // Generate a new file name (you can implement your own logic)
        String newFileName = "temp";
        String fileExtension = getFileExtension(originalFileName);
        newFileName = newFileName+fileExtension;
        // Get the file object
        File uploadedFile = m.getFile("file");

        // Rename the file
        File renamedFile = new File(uploadedFile.getParentFile(), newFileName);
        uploadedFile.renameTo(renamedFile);
        response.getWriter().append(newFileName);

        
        DataBase_Mgmt db = new DataBase_Mgmt();
        String msg = db.Update_User_profile(Name, renamedFile,newFileName);
        // response.getWriter().append(msg);
        //response.redirect("Hotel_Booking_System\\index.jsp?Tab=User.jsp");
    }
}