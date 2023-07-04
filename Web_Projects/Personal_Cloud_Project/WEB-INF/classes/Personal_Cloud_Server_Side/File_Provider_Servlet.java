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
import java.io.InputStream;
import java.io.OutputStream;
import java.io.FileInputStream;
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
public class File_Provider_Servlet extends HttpServlet 
{
	public String Cloud_Directory = "C:\\OneDrive\\Software\\Projects\\Personal_Cloud_Storage\\",Cloud_Directory_Name="Personal_Cloud_Storage";
	public File Cloud_Directory_Acc,fl;
	public File[] conts;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Map<String,String[]> Request_Parameters = request.getParameterMap();
		String File_Type,File_Name,File,File_Path;
		File_Type = request.getParameter("File_Type");
		File_Name = request.getParameter("File_Name");
		File=File_Name+"."+File_Type;
		File_Path=Cloud_Directory+File;
		// CONTENT TRANSFER - FILE CREATION AT THE CLIENT SYSTEM
		// The response.getWriter().append(CONTENT) can be used to supply the Content, to the Client Browser, 
		// directly from the Java Code, which when received at the Client Browser Side, will be Stored in a new File and Stored at the Client System.

		// response.getWriter().append("File Requested: "+File+"\n");
		// response.getWriter().append("File path of Requested File: "+File_Path+"\n");
		
		// File View Mode- from Client Side
		// 1. Only File Download - If the below two Lines are provided, then the File Request from the Client, after File Transfer, will directly download at the Client.
		// 2. File-View/Download - If the below two Lines are not provided, then the File Request from the Client, after File Transfer, can be configured by the Client JavaScript, whether to View the File from the Browser, or to Download.
		// response.setContentType("application/"+File_Type);
		// response.setHeader("Content-Disposition", "attachment; filename=\"" + File + "\"");
		
		// The below try is `try with Resource` for Resource Management in Java.
		// The try-with-resources statement is used for automatic resource management, ensuring that the resources opened within the statement are properly closed when the block is exited, 
		// regardless of whether an exception occurs or not. 
	
		try(InputStream ins = new FileInputStream(File_Path);OutputStream Response_Output = response.getOutputStream())
		{
			byte[] Data_Buffer = new byte[4096];
			int Data_Bytes_Read_Count;
			while((Data_Bytes_Read_Count=ins.read(Data_Buffer))!=-1)
			{
				Response_Output.write(Data_Buffer,0,Data_Bytes_Read_Count);
			}

		}
	}
	public static void main(String args[])	throws IOException
	{
	}
}

