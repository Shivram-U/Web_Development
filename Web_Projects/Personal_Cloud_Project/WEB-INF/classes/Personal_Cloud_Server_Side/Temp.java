
public class Temp 
{
    public static void main(String args[])
    {
        String s = "C:\\Applications\\Application_Folders\\Servers\\Xampp\\.\\anonymous";
        String[] st = s.split(".",2);       // Since a separate `.`, which is special Character in Regular Expression, hence `\\.` has to be provided, to escape Regular Expression Provision.
        System.out.println(st[0]);
        System.out.println(st[1]);
        st = s.split("\\.",2);
        System.out.println(st[0]);
        System.out.println(st[1]);
    }    
}
