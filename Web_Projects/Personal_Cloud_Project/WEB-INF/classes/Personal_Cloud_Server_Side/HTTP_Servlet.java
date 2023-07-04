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
public class HTTP_Servlet extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{   
        response.getWriter().append("HTTP SERVLET\n\n");
		//response.getWriter().append("<h1>").append(""+"Server at").append(request.getContextPath()+"<h1><br>");       // HTML Tag inclusion does not work
		response.getWriter().append(""+"Server at").append(request.getContextPath()+"\n\n");

        response.getWriter().append("Request:"+request+"\n");
        response.getWriter().append("Request:"+request.toString()+"\n");
        response.getWriter().append("Request Class:"+request.getClass()+"\n");
        response.getWriter().append("Request Class:"+request.getAuthType()+"\n\n");
        
        response.getWriter().append("Request Server Name:"+request.getServerName()+"\n");
        response.getWriter().append("Request Server Port:"+request.getServerPort()+"\n");
        response.getWriter().append("Request Servlet Path:"+request.getServletPath()+"\n");
        response.getWriter().append("Request Servlet Context:"+request.getServletContext()+"\n\n");
        
        response.getWriter().append("Request URI"+request.getRequestURI()+"\n");
        response.getWriter().append("Request URL:"+request.getRequestURL()+"\n");
        response.getWriter().append("Request Remote Address: "+request.getRemoteAddr()+"\n");
        response.getWriter().append("Request Remote Host: "+request.getRemoteHost()+"\n");
        response.getWriter().append("Request Remote Port: "+request.getRemotePort()+"\n");
        response.getWriter().append("Request Remote User: "+request.getRemoteUser()+"\n");
        response.getWriter().append("Request Local Address:"+request.getLocalAddr()+"\n");
        response.getWriter().append("Request Local Name:"+request.getLocalName()+"\n");
        response.getWriter().append("Request Local Port:"+request.getLocalPort()+"\n");
        response.getWriter().append("Request Path Info:"+request.getPathInfo()+"\n");
        response.getWriter().append("Request Protocol:"+request.getProtocol()+"\n\n");
        
        response.getWriter().append("Request Header Names:"+request.getHeaderNames().toString()+"\n");
        response.getWriter().append("Request Security:"+request.isSecure()+"\n");
        response.getWriter().append("Request Wait:"+"\n");
        try
        {
            request.wait(1000);                 // throws InterruptedException
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        response.getWriter().append("Request Cookies:"+request.getCookies()+"\n");
        response.getWriter().append("Request Character Encoding:"+request.getCharacterEncoding()+"\n");
        response.getWriter().append("Request Parameter Map:"+request.getParameterMap()+"\n");
        response.getWriter().append("Request Parameter Map:"+request.getParameterMap().toString()+"\n");
        
        response.getWriter().append("Request Content Length:"+request.getContentLength()+"\n");
        response.getWriter().append("Request Content Type:"+request.getContentType()+"\n");
        response.getWriter().append("Request Content Path:"+request.getContextPath()+"\n\n");
        
		System.out.println(request);
		System.out.println(request.getClass());
	}
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)  throws IOException
    {
        response.getWriter().append("Username received from the Client by the Server Side Servlet :     "+request.getParameter("UserName")+"\n\n");
        response.getWriter().append("Password received from the Client by the Server Side Servlet :     "+request.getParameter("Password")+"\n\n");
    }
}
