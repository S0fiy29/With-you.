<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*, java.sql.*" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Booking Status</title>

  <style>
    body {
      font-family: 'Raleway', sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(to right, rgba(255, 165, 0, 0.8), rgba(255, 165, 0, 0.2)); /* Orange gradient background */
    }

    div {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      background-color: #f8f8f8;
    }

    h2 {
      color: #333;
    }

    table {
      border-collapse: collapse;
      width: 80%;
      margin-top: 20px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      margin: auto; /* Center the table horizontally */
    }

    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #333;
      color: #fff;
    }

    a {
      margin-top: 20px;
      color: #333;
      text-decoration: none;
      padding: 8px 16px;
      border: 1px solid #333;
      border-radius: 4px;
      background-color: #fff;
      color: #333;
      transition: background-color 0.3s, color 0.3s;
    }

    a:hover {
      background-color: #e74c3c;
      color: #fff;
    }
  </style>
</head>
<body>
    <div>
        <h2>Booking Status</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Package</th>
                    <th>Venue</th>
                    <th>Date and Time</th>
                    <th>Number of Guests</th>
                    <th>Booking Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        Connection con = DriverManager.getConnection(
                                "jdbc:derby://localhost:1527/Wedding;create=true;user=wed;password=wed");
                        Statement st = con.createStatement();
                        String query = "SELECT * FROM Approval";
                        ResultSet rs = st.executeQuery(query);

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("package") %></td>
                    <td><%= rs.getString("venue") %></td>
                    <td><%= rs.getString("datetime") %></td>
                    <td><%= rs.getString("Guest") %></td>
                    <td><%= rs.getString("booking_status") %></td>
                </tr>
                <%
                    }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        <a href="mainPage.jsp">Back</a>
    </div>
</body>
</html>
