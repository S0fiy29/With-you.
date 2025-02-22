/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author arifa
 */
@WebServlet(urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    private PreparedStatement pstmt;
    
    public void init() throws ServletException {
        initializeJdbc();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html");
       PrintWriter out = response.getWriter();
       
       String user = request.getParameter("user");
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       
       
       try{
           
        storeUser(user, email, password);

        response.setContentType("text/html;charset=UTF-8");

        out.println("<html>");
        out.println("<body style=\"font-weight: bold;\">");
        out.println("    <div style=\"background-color: #4CAF50; padding: 10px; text-align: center; width: 100%;\">");
        out.println("        <p style=\"color: white; margin: 0;\">" + user + " is now registered in the database</p>");
        out.println("    </div>");
        out.println("<br>");
        out.println("</body>");
        out.println("</html>");

        request.getRequestDispatcher("index.jsp").include(request, response);






           
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

            pstmt = conn.prepareStatement("insert into USERS " 
                    + "(USERNAME,USEREMAIL,USERPASSWORD) values (?,?,?)");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void storeUser(String user,String email,String password) throws SQLException{
        
        pstmt.setString(1, user);
        pstmt.setString(2, email);
        pstmt.setString(3, password);
       
        pstmt.executeUpdate();
    }
}
