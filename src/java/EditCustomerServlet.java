import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.net.URLEncoder;
import java.sql.*;

@WebServlet("/EditCustomerServlet")
public class EditCustomerServlet extends HttpServlet {
    
    private PreparedStatement pstmt;
    
     public void init() throws ServletException {
            initializeJdbc();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
    
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            out.println("Error: Customer ID is empty");
            out.close();
            return;
        }
        
        int id = Integer.parseInt(idParam);
        int pack = Integer.parseInt(request.getParameter("package")); 
        String venue = request.getParameter("venue");
        String datetime = request.getParameter("datetime");
        String numGuest = request.getParameter("numGuest");

        if (!verifyID(id)) {
            out.println("Error: Wrong Customer ID");
        } else{
            if (updateCustomer(id, pack, venue, datetime, numGuest)) {
               // Display success message in a JavaScript alert
    out.println("<html>");
    out.println("<head>");
    out.println("<script>");
    out.println("    alert('Edit Successfully');");
    out.println("    window.location.href = 'edit.jsp';");  // Redirect to feedback.jsp
    out.println("</script>");
    out.println("</head>");
    out.println("<body>");
    out.println("</body>");
    out.println("</html>");
        } else {
            String errorMessage = "Update failed";
            //response.sendRedirect("admin.jsp?message=" + URLEncoder.encode(errorMessage, "UTF-8"));
            }
        }
        out.close();
    }
   
    private boolean verifyID(int id) {
        try (Connection conn = getConnection()) {
            String query = "SELECT * FROM Info WHERE ID=?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setInt(1, id);
                ResultSet resultSet = pstmt.executeQuery();
                return resultSet.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    private boolean updateCustomer(int id, int pack, String venue, String datetime, String numGuest) {
        try (Connection conn = getConnection()) {
            
            String query = "UPDATE Info SET package=?, venue=?, datetime=?, guest=? WHERE id=?";
            
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setInt(1, pack);
                pstmt.setString(2, venue);

                SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                Date parsedDate = null;

                try {
                    parsedDate = inputFormat.parse(datetime);
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                if (parsedDate != null) {
                    pstmt.setTimestamp(3, new Timestamp(parsedDate.getTime()));
                } else {
                    Date currentDate = new Date();
                    pstmt.setTimestamp(3, new Timestamp(currentDate.getTime()));
                }

                pstmt.setInt(4, Integer.parseInt(numGuest));

                pstmt.setInt(5, id);

                int rowsAffected = pstmt.executeUpdate();

                return rowsAffected > 0;
                
            }
        }
        catch (SQLException e) {
                e.printStackTrace();
                return false;
        } 
        
    }
    
    private void initializeJdbc(){
        try {
            
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/Wedding;create=true;user=wed;password=wed";
            
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(connectionString);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        String driver = "org.apache.derby.jdbc.ClientDriver";
        String connectionString = "jdbc:derby://localhost:1527/Wedding;create=true;user=wed;password=wed";
        return DriverManager.getConnection(connectionString);
    }
}