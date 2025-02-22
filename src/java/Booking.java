import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Booking extends HttpServlet {

    private Connection conn;
    private PreparedStatement pstmt;

    public void init() throws ServletException {
        initializeJdbc();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String number = request.getParameter("phone");
        String email = request.getParameter("email");
        String pack = request.getParameter("package");
        String venue = request.getParameter("venue");
        String datetime = request.getParameter("datetime");
        String guest = request.getParameter("numGuest");

        try {
            if (name.length() == 0 || number.length() == 0 || email.length() == 0 || venue.length() == 0
                    || datetime.length() == 0 || guest.length() == 0) {
                out.println("Name, number, email, venue, date, and number of guests are required");
                out.println("<br>Click <a href=\"form.jsp\">here</a> to go to the previous page");
                return;
            }
            int generatedId = storeInfo(name, number, email, pack, venue, datetime, guest);
            int generatedBookingId = storeApprove(name,pack, venue, datetime, guest);

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Your Page Title</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/Booking.css\">");
            out.println("Form submitted successfully");
            out.println("</body>");
            out.println("</html>");
            request.getRequestDispatcher("form.jsp").include(request, response);

        } catch (Exception ex) {
            out.println("Error:" + ex.getMessage());
        } finally {
            out.close();
        }
    }

    private void initializeJdbc() {
        try {
            
            String driver = "org.apache.derby.jdbc.ClientDriver";
            Class.forName(driver);  
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private int storeInfo(String name, String number, String email, String pack, String venue, String datetime, String guest)
            throws SQLException {
        
        String connectionString = "jdbc:derby://localhost:1527/Wedding;create=true;user=wed;password=wed;lockTimeout=10000";
        conn = DriverManager.getConnection(connectionString);
            conn.setAutoCommit(false);

            pstmt = conn.prepareStatement(
                    "insert into Info (name, number, email, package, venue, datetime, guest) values (?,?,?,?,?,?,?)",
                    new String[]{"ID"});

        pstmt.setString(1, name);
        pstmt.setString(2, number);
        pstmt.setString(3, email);
        pstmt.setString(4, pack);
        pstmt.setString(5, venue);

        SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        Date parsedDate = null;

        try {
            parsedDate = inputFormat.parse(datetime);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        if (parsedDate != null) {
            pstmt.setTimestamp(6, new Timestamp(parsedDate.getTime()));
        } else {
            Date currentDate = new Date();
            pstmt.setTimestamp(6, new Timestamp(currentDate.getTime()));
        }

        pstmt.setString(7, guest);

        int generatedId = -1;

        int affectedRows = pstmt.executeUpdate();

        if (affectedRows > 0) {
            // Retrieve the generated keys
            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    generatedId = generatedKeys.getInt(1);
                }
            }
            conn.commit(); // Commit the transaction
        } else {
            conn.rollback(); // Rollback if the insertion fails
        }

        return generatedId;
    }
    private int storeApprove(String name, String pack, String venue, String datetime, String guest)
        throws SQLException {
    
    String connectionString = "jdbc:derby://localhost:1527/Wedding;create=true;user=wed;password=wed;lockTimeout=10000";
    conn = DriverManager.getConnection(connectionString);

    pstmt = conn.prepareStatement(
            "insert into Approval (name, package, venue, datetime, guest, booking_status) values (?,?,?,?,?,?)",
            new String[]{"ID"});

    pstmt.setString(1, name);
    pstmt.setString(2, pack);
    pstmt.setString(3, venue);

    SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    Date parsedDate = null;

    try {
        parsedDate = inputFormat.parse(datetime);
    } catch (ParseException e) {
        e.printStackTrace();
    }

    if (parsedDate != null) {
        pstmt.setTimestamp(4, new Timestamp(parsedDate.getTime()));
    } else {
        Date currentDate = new Date();
        pstmt.setTimestamp(4, new Timestamp(currentDate.getTime()));
    }

    pstmt.setString(5, guest);

    // Set status as "pending"
    pstmt.setString(6, "Pending");

    int generatedBookingId = -1;

    int affectedRows = pstmt.executeUpdate();

    if (affectedRows > 0) {
        // Retrieve the generated keys
        try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                generatedBookingId = generatedKeys.getInt(1);
            }
        }
        conn.commit(); // Commit the transaction
    } else {
        conn.rollback(); // Rollback if the insertion fails
    }

    return generatedBookingId;
}

}