
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class Feedback extends HttpServlet {

    private PreparedStatement pstmt;
    
    public void init() throws ServletException {
        initializeJdbc();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html");
       PrintWriter out = response.getWriter();
       
       String name = request.getParameter("Name");
       String number = request.getParameter("Phone");
       String email = request.getParameter("Email");
       String msg = request.getParameter("Message");
       
       try{
           if(isEmpty(name) || isEmpty(number) || isEmpty(email) || isEmpty(msg)){
               out.println("Name, phone number, email and message are required");
               out.println("<br>Click <a href=\"mainPage.jsp\">here</a> to go to main page");
               return;
           }
           storeInfo(name, number, email, msg);
           response.sendRedirect("mainPage.jsp");
       } catch(Exception ex){
            out.println("Error:" + ex.getMessage());
       } finally{
           out.close();
       }    
    }
    
    private void initializeJdbc(){
        try {
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/Wedding;create=true;user=wed;password=wed";

            Class.forName(driver);

            Connection conn = DriverManager.getConnection(connectionString);

            pstmt = conn.prepareStatement("insert into Feedback " + "(name, phone, email, message) values (?,?,?,?)");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void storeInfo(String name, String number, String email, String msg) throws SQLException{
        
        pstmt.setString(1, name);
        pstmt.setString(2, number);
        pstmt.setString(3, email);
        pstmt.setString(4, msg);
        pstmt.executeUpdate();
    }
    
    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

}