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
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.simple.*;
import org.json.simple.parser.*;



// This Servlet is used to implement and show the Lifecycle of a Servlet.
/**
 * Servlet implementation class Life_Cycle_Servlet
 */
public class Cloud_Directories extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println(request);
		System.out.println(request.getClass());
		File Current_Directory= new File("."),fl;
		File[] conts = Current_Directory.listFiles();
        ArrayList<File> fls,dirs;
        Iterator<File> flst,dirst;
        fls = new ArrayList<File>();
        dirs = new ArrayList<File>();
		JSONObject jsn1 = new JSONObject();
		jsn1.put("Name","Shivram");
		for(File fil_dr : conts)
		{
			if(fil_dr.isDirectory())
			{
                dirs.add(fil_dr);
				//response.getWriter().append("Directory:\t");
			}
			else
			{
                fls.add(fil_dr);
				//response.getWriter().append("File:     \t");
			}
			//response.getWriter().append(fil_dr.getCanonicalPath()+"\n");
		}
		jsn1.put("DIRECTORIES",new ArrayList<String>());
		jsn1.put("FILES",new ArrayList<String>());
        dirst = dirs.iterator();
        flst = fls.iterator();
        response.getWriter().append("DIRECTORIES:\n\n");
		while(dirst.hasNext())
		{
            fl = dirst.next();
			((ArrayList<String>)jsn1.get("DIRECTORIES")).add(fl.getAbsolutePath());
			response.getWriter().append("\t"+fl.getCanonicalPath()+"\n\n");
			response.getWriter().append("\t"+fl.getAbsolutePath()+"\n");
			response.getWriter().append("\t"+fl.getAbsolutePath().split("\\.",2)[1]+"\n");
		}
        response.getWriter().append("\nFILES:\n\n");
		while(flst.hasNext())
		{
			fl = flst.next();
			((ArrayList<String>)jsn1.get("FILES")).add(fl.getAbsolutePath());
			response.getWriter().append("\t"+fl.getCanonicalPath()+"\n\n");
			response.getWriter().append("\t"+fl.getAbsolutePath()+"\n");
            response.getWriter().append("\t"+fl.getAbsolutePath().split("\\.",2)[1]+"\n");
		}
		
		//FileWriter flw = new FileWriter("./Json_File.json");
		//flw.write(jsn1.toJSONString());
		//flw.close();
		response.getWriter().append(jsn1.toJSONString());
	}
}

