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
import java.io.File;
import java.io.FileWriter;



// This Servlet is used to implement and show the Lifecycle of a Servlet.
/**
 * Servlet implementation class Life_Cycle_Servlet
 */
public class Cloud_Dir_Service_Servlet extends HttpServlet 
{
	public String Cloud_Directory = "C:\\OneDrive\\Software\\Projects\\Personal_Cloud_Storage\\",Cloud_Directory_Name="Personal_Cloud_Storage",Current_Directory;
	public File Cloud_Directory_Acc,fl;
	public File[] conts;
	public JSONObject jsn1,jsn2,jsn3;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// System.out.println(request);
		// System.out.println(request.getClass());
		String t = String.valueOf(request.getParameter("Request"));
		if(t.equals("Personal_Cloud_Root_Info"))
		{
			jsn1 = new JSONObject();
			jsn1.put("ROOT_DIRECTORY",this.Cloud_Directory);
			jsn1.put("ROOT_DIRECTORY_NAME",this.Cloud_Directory_Name);
			response.getWriter().append(jsn1.toJSONString());
		}
		else if(t.equals("Root_Directory"))
		{
			Cloud_Directory_Acc = new File(this.Cloud_Directory+"\\\\");
			conts = Cloud_Directory_Acc.listFiles();
			ArrayList<File> fls,dirs;
			Iterator<File> flst,dirst;
			fls = new ArrayList<File>();
			dirs = new ArrayList<File>();
			jsn1 = new JSONObject();
			jsn1.put("CURRENT_DIRECTORY",this.Cloud_Directory_Name);
			jsn1.put("DIRECTORIES",new ArrayList<Integer>());
			jsn1.put("FILES",new ArrayList<Integer>());
			// jsn1.put("Name","Shivram");
			for(File fil_dr : conts)
			{
				if(fil_dr.isDirectory())
				{
					((ArrayList<String>)jsn1.get("DIRECTORIES")).add(fil_dr.getAbsolutePath().replace(this.Cloud_Directory,""));
					// response.getWriter().append("Directory:\t");
				}
				else
				{
					((ArrayList<String>)jsn1.get("FILES")).add(fil_dr.getAbsolutePath().replace(this.Cloud_Directory,""));
					// response.getWriter().append("File:     \t");
				}
				// response.getWriter().append(fil_dr.getCanonicalPath()+"\n");
			}
			// response.getWriter().append(jsn1);			-- ERROR
			response.getWriter().append(jsn1.toJSONString());
			// System.out.println("Temporary Execution:");
			// JSONObject jsn1 = new JSONObject();
			// jsn1.put("Name","Shivram");
			// //FileWriter flw = new FileWriter("./Json_File.json");
			// //flw.write(jsn1.toJSONString());
			// //flw.close();
			// response.getWriter().append(jsn1.toJSONString());
		}
		else if(t.substring(0,14).equals("Sub_Directory:"))
		{
			Current_Directory = this.Cloud_Directory+t.substring(14,t.length()).replace("/","\\")+"\\";
			Cloud_Directory_Acc = new File(Current_Directory);
			// response.getWriter().append(Current_Directory);
			conts = Cloud_Directory_Acc.listFiles();
			ArrayList<File> fls,dirs;
			Iterator<File> flst,dirst;
			fls = new ArrayList<File>();
			dirs = new ArrayList<File>();
			jsn1 = new JSONObject();
			jsn1.put("CURRENT_DIRECTORY",Current_Directory);
			jsn1.put("DIRECTORIES",new ArrayList<Integer>());
			jsn1.put("FILES",new ArrayList<Integer>());
			// jsn1.put("Name","Shivram");
			for(File fil_dr : conts)
			{
				if(fil_dr.isDirectory())
				{
					((ArrayList<String>)jsn1.get("DIRECTORIES")).add(fil_dr.getAbsolutePath().replace(this.Current_Directory,""));
					// response.getWriter().append("Directory:\t");
				}
				else
				{
					((ArrayList<String>)jsn1.get("FILES")).add(fil_dr.getAbsolutePath().replace(this.Current_Directory,""));
					// response.getWriter().append("File:     \t");
				}
				// response.getWriter().append(fil_dr.getCanonicalPath()+"\n");
			}
			response.getWriter().append(jsn1.toJSONString());
			// response.getWriter().append(jsn1);			-- ERROR
			// System.out.println("Temporary Execution:");
			// JSONObject jsn1 = new JSONObject();
			// jsn1.put("Name","Shivram");
			// //FileWriter flw = new FileWriter("./Json_File.json");
			// //flw.write(jsn1.toJSONString());
			// //flw.close();
			// response.getWriter().append(jsn1.toJSONString());
		}
	}
	public static void main(String args[])	throws IOException
	{
		System.out.println("Temporary Execution:");
		JSONObject jsn1 = new JSONObject();
		jsn1.put("Name","Shivram");
		FileWriter flw = new FileWriter("./Json_File.json");
		flw.write(jsn1.toJSONString());
		flw.close();
	}
}

