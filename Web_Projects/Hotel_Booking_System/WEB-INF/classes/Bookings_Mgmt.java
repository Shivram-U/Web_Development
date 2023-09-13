package DB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
// Java Beans Concept
public class Bookings_Mgmt 
{
    private String jdbcUrl,username,password,dbname,sql,name,em,ph,pswrd;
    private Connection connection;
    private PreparedStatement pst;
    private ResultSet rs,rs1;
    public boolean con = false,tsk=false,auth=false;
    public Bookings_Mgmt(String Username,String password,String jdbcurl,String databasename)
    {
        this.jdbcUrl = jdbcurl; // Update with your MySQL database URL
        this.username = Username;
        this.password = password;
        this.dbname = databasename;
        this.jdbcUrl+=databasename;

        // Drivers Import
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = null;
            this.pst = null;
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
    public Bookings_Mgmt()
    {
        this.jdbcUrl = "jdbc:mysql://localhost:3306/hail hotel management"; // Update with your MySQL database URL
        this.username = "root";
        this.password = "";
        this.DataBaseConnectionEstablishment();
    }
    public void DataBaseConnectionEstablishment()
    {
        try
        {
            this.connection = null;
            this.pst = null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, username, password);
            this.con = true;
            // Drivers Import
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
    public String Book(String name,int rmt,int amt,ArrayList<Integer> amts,ArrayList<Integer> rmfa,ArrayList<Integer> ach,ArrayList<String> ft,ArrayList<String> tt)
    {
        this.tsk = false;
        int cnt=0;
        if(this.con)
        {
            try 
            {
                int rn=0;
                String clid="";
                sql = "SELECT COUNT(*) from bookings";
                pst = connection.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs.next())
                    rn = rs.getInt(1);
                sql = "SELECT ClientID from clients where UserName = '"+name+"';";
                pst = connection.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs.next())
                    clid = rs.getString(1);
                String bk = "BK-$"+rn+1;
                sql = "Insert INTO bookings VALUES(?,?,?)";
                pst = connection.prepareStatement(sql);
                int k=1;
                pst.setString(k++,clid);
                pst.setString(k++,bk);
                pst.setString(k++,String.valueOf(amt));
                pst.executeUpdate();

                String fas = "",achs="",fds="",tds="",r="",amtss="";
                for(int i=0;i<rmt-1;i++)
                {
                    amtss+=String.valueOf(amts.get(i))+",";
                    fas+=String.valueOf(rmfa.get(i))+",";
                    achs+=String.valueOf(ach.get(i))+",";
                    fds+=ft.get(i)+",";
                    tds+=tt.get(i)+",";
                }
                amtss+=String.valueOf(amts.get(rmt-1));
                fas+=String.valueOf(rmfa.get(rmt-1));
                achs+=String.valueOf(ach.get(rmt-1));
                fds+=ft.get(rmt-1);
                tds+=tt.get(rmt-1);
                sql = "Insert into bookingdata VALUES(?,?,?,?,?,?,?)";
                pst = connection.prepareStatement(sql);
                k=1;
                pst.setString(k++,bk);
                pst.setString(k++,fas);
                pst.setInt(k++,rmt);
                pst.setString(k++,achs);
                pst.setString(k++,fds);
                pst.setString(k++,tds);
                pst.setString(k++,amtss);
                pst.executeUpdate();
                this.tsk = true; 
                return "Success";
            } 
            catch (Exception e) 
            {
                return e.getMessage();
            }
        }
        return "Server Error, please try again later";
    }
    public ArrayList<ArrayList<String>> Get_Bookings(String name)
    {
        ArrayList<ArrayList<String>> al = new ArrayList<ArrayList<String>>();
        ArrayList<String> tal = null;
        if(this.con)
        {
            try 
            {
                String clid="",bk="",t="";
                int amt=0;
                sql = "SELECT ClientID from clients where UserName = '"+name+"';";
                pst = connection.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs.next())
                    clid = rs.getString(1);
                sql = "SELECT BookingsID,Amount from bookings where ClientID = '"+clid+"';";
                pst = connection.prepareStatement(sql);
                rs = pst.executeQuery();
                while(rs.next())
                {
                    bk = rs.getString("BookingsID");
                    amt = rs.getInt("Amount");
                    tal = new ArrayList<String>();
                    if(bk!="" && bk!=null)
                    {
                        tal.add(bk);
                        tal.add(String.valueOf(amt));
                        sql = "SELECT food_allotment,AC_H,From_Date,To_Date,Amounts from bookingdata where BookingsID =?";
                        pst = connection.prepareStatement(sql);
                        pst.setString(1, bk);
                        rs1 = pst.executeQuery();
                        if(rs1.next())
                        {
                            tal.add(rs1.getString("Food_Allotment"));
                            tal.add(rs1.getString("AC_H"));
                            tal.add(rs1.getString("From_Date"));
                            tal.add(rs1.getString("To_Date"));
                            tal.add(rs1.getString("Amounts"));
                        }
                    }
                    al.add(tal);
                }
                return al;     
            } 
            catch (Exception e) 
            {
                tal.add(e.getMessage());
                al.add(tal);
                return al;
                // TODO: handle exception
            }
        }
        return null;
    }
    public static void main(String[] args)
    {
        DataBase_Mgmt db = new DataBase_Mgmt();
        System.out.println(db.Check_UP("i","i"));
    }
}