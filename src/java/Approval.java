import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ApprovalServlet")
public class Approval extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static HashMap<Integer, String> bookingStatusMap = new HashMap<>();

    private static final String CONNECTION_STRING = "jdbc:derby://localhost:1527/Wedding;create=true;user=wed;password=wed";
    private static final String UPDATE_STATUS_SQL = "UPDATE Approval SET booking_status = ? WHERE id = ?";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int bookingId = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        if (action.equals("adminApprove")) {
            updateBookingStatus(bookingId, "Approved");
        } else if (action.equals("adminDisapprove")) {
            updateBookingStatus(bookingId, "Not Approved");
        }

        // Redirect to the JSP page to display the updated status
        response.sendRedirect("Approve.jsp?bookingId=" + bookingId);
    }

    private void updateBookingStatus(int bookingId, String newStatus) {
        try (
            Connection conn = DriverManager.getConnection(CONNECTION_STRING);
            PreparedStatement pstmt = conn.prepareStatement(UPDATE_STATUS_SQL)
        ) {
            // Update the booking status in the database
            pstmt.setString(1, newStatus);
            pstmt.setInt(2, bookingId);
            pstmt.executeUpdate();

            // Update the booking status in the in-memory map
            bookingStatusMap.put(bookingId, newStatus);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static String getBookingStatus(int bookingId) {
        // Retrieve the booking status from the in-memory map
        return bookingStatusMap.getOrDefault(bookingId, "Pending");
    }
}