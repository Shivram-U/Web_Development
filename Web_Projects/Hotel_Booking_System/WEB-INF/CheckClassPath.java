public class CheckClassPath {
    public static void main(String[] args) {
        String classpath = System.getProperty("java.class.path");
        System.out.println("Classpath: " + classpath);
    }
}