package DB;
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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.io.File;
import java.io.FileWriter;

//@WebServlet(name = "FormServlet", urlPatterns = "/calculateServlet")
public class DataBase_Access extends HttpServlet 
{
    private String jdbcUrl,username,password,dbname,sql,name,msg,ph,pswrd;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException 
    {
        try 
        {
            name = request.getParameter("UserName");
            pswrd = request.getParameter("Password");
            System.out.println(name+","+pswrd);
            ///msg = this.Check_UP(name, pswrd);
            //request.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(request, response);
        } catch (Exception e) 
        {
           request.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(request, response);
        }
    }
}
