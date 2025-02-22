import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:derby://localhost:1527/Wedding";
    private static final String DB_EMAIL = "wed";
    private static final String DB_PASSWORD = "wed";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;

        try {
            // Check if the result set has any rows
            if(email.equals("admin@gmail.com") && password.equals("admin123"))
            {
                request.getRequestDispatcher("admin.html").include(request, response);
            }
            else {
                // Establish the database connection
                conn = DriverManager.getConnection(DB_URL, DB_EMAIL, DB_PASSWORD);

                // Prepare the SQL query to check if the user and password exist in the database
                String query = "SELECT * FROM USERS WHERE USEREMAIL=? AND USERPASSWORD=?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, email);
                pstmt.setString(2, password);

                // Execute the query
                resultSet = pstmt.executeQuery();

                // Check if the result set has any rows
                if (resultSet.next()) {
                    // User and password exist in the database
                    HttpSession session = request.getSession();
                    session.setAttribute("user", email);
                    request.getRequestDispatcher("mainPage.jsp").include(request, response);
                } else {
                    // User and/or password do not exist in the database
                    response.setContentType("text/html;charset=UTF-8");
                    out.println("<html>");
                    out.println("<body style=\"font-weight: bold;\">");
                    out.println("    <div style=\"background-color: #ff0000; padding: 10px; text-align: center; width: 100%;\">");
                    out.println("        <p style=\"color: white; margin: 0;\"> Invalid Data</p>");
                    out.println("    </div>");
                    out.println("<br>");
                    out.println("</body>");
                    out.println("</html>");
                    request.getRequestDispatcher("index.jsp").include(request, response);
                }
            }
        } catch (SQLException ex) {
            // Handle database-related exceptions
            ex.printStackTrace();
        } finally {
            // Close resources in a finally block to ensure they are always closed
            try {
                if (resultSet != null) resultSet.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        out.close();
        }
}
