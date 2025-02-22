import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditDeleteServlet")
public class EditDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("edit")) {
            // Logic for editing user
            // Redirect to the edit page
            response.sendRedirect("EditCus.jsp?id=" + request.getParameter("id"));
        } else if (action.equals("delete")) {
            // Logic for deleting user
            int id = Integer.parseInt(request.getParameter("id"));

            // Call the delete method
            delete(id);

            response.sendRedirect("edit.jsp"); // Redirect to the page where you display users
        }
    }

    public void delete(int id) {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Wedding;create=true;user=wed;password=wed");

            // Delete the customer record
            String deleteQuery = "DELETE FROM Info WHERE id=?";
            try (PreparedStatement pstmt = con.prepareStatement(deleteQuery)) {
                pstmt.setInt(1, id);
                pstmt.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exception appropriately
        }
    }
}
