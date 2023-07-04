package Personal_Cloud_Server_Side;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;



// This Servlet is used to implement and show the Lifecycle of a Servlet.
/**
 * Servlet implementation class Life_Cycle_Servlet
 */
public class Sample_Servlet extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.getWriter().append("Sample Servlet running successfully\n");
		response.getWriter().append("Server at").append(request.getContextPath());
	}
}

