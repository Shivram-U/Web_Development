package Personal_Cloud_Server_Side;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.*;
import org.json.simple.parser.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.io.File;
import java.io.FileWriter;



// This Servlet is used to implement and show the Lifecycle of a Servlet.
/**
 * Servlet implementation class Life_Cycle_Servlet
 */
public class Servlet_Parameter_Anal extends HttpServlet 
{
	public String Cloud_Directory = "C:\\OneDrive\\Software\\Projects\\Personal_Cloud_Storage\\",Cloud_Directory_Name="Personal_Cloud_Storage";
	public File Cloud_Directory_Acc,fl;
	public File[] conts;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
        Map<String,String[]> Request_Parameters = request.getParameterMap();
        // Accessing Parametes through Map Collection Object
            response.getWriter().append("Accessing Parametes through Map Collection Object:\n\n");
            response.getWriter().append(Request_Parameters.toString()+"\n");
            response.getWriter().append(request.getParameterNames().toString()+"\n");
            for(Map.Entry<String,String[]> s : Request_Parameters.entrySet())
            {
                response.getWriter().append(s.getKey()+" :\t"+s.getValue()[0]+"\n");   
                // response.getWriter().append("\n"+s.getKey()+" :\t"+s.getValue()[1]);    // `IndexOutOfBoundsException` Will occur, which will cause a RUN-TIME-ERROR, and stops the Program Execution.
            }
        // Accessing Parameters through Parameter Key Value provided from the Client:
            response.getWriter().append("\nAccessing Parameters through Parameter Key Value provided from the Client:\n\n");
            String[] Request_Parameter_Value_1 = request.getParameterValues("Not_Passed_Parameter_1");
            response.getWriter().append("Request_Parameter_Value_1:\t"+Request_Parameter_Value_1+"\n");
            if(Request_Parameter_Value_1!=null)
            {
                response.getWriter().append("Request_Parameter_Value_1 Values:"+"\n");
                for(String s:Request_Parameter_Value_1)
                {
                    response.getWriter().append(s+"\n");
                }
            }
            String[] Request_Parameter_Value_2 = request.getParameterValues("Passed_Parameter_1");
            response.getWriter().append("Request_Parameter_Value_2:\t"+Request_Parameter_Value_2+"\n");
            if(Request_Parameter_Value_2!=null)
            {
                response.getWriter().append("Request_Parameter_Value_2 Values:"+"\n");
                for(String s:Request_Parameter_Value_2)
                {
                    response.getWriter().append(s+"\n");
                }
            }
	}           
	public static void main(String args[])	throws IOException
	{
	}
}