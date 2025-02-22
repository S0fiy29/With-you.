<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Page</title>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="app.js"></script>
    <script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete this customer?");
    });
</script>
    <style>
        body {
  font-family: 'Work Sans', sans-serif;
  margin: 0;
  background-color: #eee;
}

/* Layout */

#container {
  padding: 0;
  margin: 0;
  background-color: #fff;
}

#main {
  padding: 4% 1.5em;
  max-width: 55em;
  margin: 0 auto;
}

#header {
  padding: 1.5em;
  margin: 0 0 1em 0;
  background-color: #eee;
}

#footer {
  padding: 1.5em;
  margin: 2em 0 0 0;
  background-color: #eee;

}


/* Menu Styles */

.primary-nav {
	position: fixed;
	z-index: 999;
}

.menu {
	position: relative;
}

.menu ul {
  margin: 0;
  padding: 0;
  list-style: none;
	
}

.open-panel {
  border: none;
  background-color:#fff;
  padding: 0;
}

.hamburger {
	background: #fff;
	position: relative;
	display: block;
	text-align: center;
	padding: 13px 0;
	width: 50px;
  height: 73px;
	left: 0;
  top: 0;
	z-index: 1000;
  cursor: pointer;
}

.hamburger:before {
	content:"\2630"; /* hamburger icon */
	display: block;
  color: #000;
  line-height: 32px;
  font-size: 16px;
}

.openNav .hamburger:before {
	content:"\2715"; /* close icon */
	display: block;
  color: #000;
  line-height: 32px;
  font-size: 16px;
}

.hamburger:hover:before {
  color: #777;
}

.primary-nav .menu li {
	position: relative;
}

.menu .icon {
	position: absolute;
	top: 12px;
	right: 10px;
	pointer-events: none;
  width: 24px;
  height: 24px;
  color: #fff;
}

.menu,
.menu a,
.menu a:visited {
  color: #aaa;
  text-decoration: none!important;
	position: relative;
}

.menu a {
  display: block;
  white-space: nowrap;
  padding: 1em;
  font-size: 14px;
}

.menu a:hover {
	color: #fff;
}

.menu {
	margin-bottom: 3em;
}

.menu-dropdown li .icon {
	color: #777;
}

.menu-dropdown li:hover .icon {
	color: #fff;
}



.menu label {
  margin-bottom: 0;
  display: block;
}

.menu label:hover {
  cursor: pointer;
}

.menu input[type="checkbox"] {
  display: none;
}

input#menu[type="checkbox"] {
  display: none;
}






.sub-menu-dropdown {
	display: none;
}

.new-wrapper {
	position: absolute;
	left: 50px;
  width: calc(100% - 50px);
  transition: transform .45s cubic-bezier(0.77, 0, 0.175, 1);
}

#menu:checked + ul.menu-dropdown {
    
		left: 0;
    -webkit-animation: all .45s cubic-bezier(0.77, 0, 0.175, 1);
            animation: all .45s cubic-bezier(0.77, 0, 0.175, 1);
}

.sub-menu-checkbox:checked + ul.sub-menu-dropdown {
    display: block!important;
    -webkit-animation: grow .45s cubic-bezier(0.77, 0, 0.175, 1);
            animation: grow .45s cubic-bezier(0.77, 0, 0.175, 1);
}


.openNav .new-wrapper {
  position: absolute;
  transform: translate3d(200px, 0, 0);
  width: calc(100% - 250px);
  transition: transform .45s cubic-bezier(0.77, 0, 0.175, 1);
}


.downarrow {
  background: transparent;
	position: absolute;
	right: 50px;
	top: 12px;
  color: #777;
  width: 24px;
  height: 24px;
  text-align: center;
  display: block;
}

.downarrow:hover {
  color: #fff;
}

.menu {
	position: absolute;
	display: block;
	left: -200px;
  top: 0;
	width: 250px;
  transition: all 0.45s cubic-bezier(0.77, 0, 0.175, 1);
  background-color: #000;
	z-index: 999;
}

.menu-dropdown {
  top: 0;
  overflow-y: auto;
}

.overflow-container {
  position: relative;
  height: calc(300vh - 73px)!important;
  overflow-y: auto;
  border-top: 73px solid #fff;
  z-index: -1;
  display:block;
}

.menu a.logotype {
  position: absolute!important;
  top: 11px;
  left: 55px;
  display: block;
  font-family: 'Work Sans', sans-serif;
  text-transform: uppercase;
  font-weight: 800;
  color: #000;
  font-size: 21px;
  padding: 10px;
}

.menu a.logotype span {
  font-weight: 400;
}

.menu a.logotype:hover {
  color: #777;
}

.sub-menu-dropdown {
	background-color: #333;
}

.menu:hover {
	position: absolute;
	left: 0;
	top: 0;
}

.openNav .menu:hover {
	position: absolute;
	left: -200px;
	top 73px;
}

.openNav .menu {
  top 73px;
		transform: translate3d(200px, 0, 0);
    transition: transform .45s cubic-bezier(0.77, 0, 0.175, 1);
}
	
	/* label.hamburger {
		display: none;
	} */













/* look and feel only, not needed for core menu*/

@-webkit-keyframes grow {
	
  0% {
    display: none;
    opacity: 0;
  }
  50% {
    display: block;
    opacity: 0.5;
  }
  100% {
    opacity: 1;
  }
	
}

@keyframes grow {
	
  0% {
    display: none;
    opacity: 0;
  }
  50% {
    display: block;
    opacity: 0.5;
  }
  100% {
    opacity: 1
  }
	
}










/* Text meant only for screen readers. */

.screen-reader-text {
  clip: rect(1px, 1px, 1px, 1px);
  position: absolute !important;
  height: 1px;
  width: 1px;
  overflow: hidden;
}

.screen-reader-text:focus {
  background-color: #f1f1f1;
  border-radius: 3px;
  -webkit-box-shadow: 0 0 2px 2px rgba(0, 0, 0, 0.6);
          box-shadow: 0 0 2px 2px rgba(0, 0, 0, 0.6);
  clip: auto !important;
  color: #21759b;
  display: block;
  font-size: 14px;
  font-size: 0.875rem;
  font-weight: bold;
  height: auto;
  left: 5px;
  line-height: normal;
  padding: 15px 23px 14px;
  text-decoration: none;
  top: 5px;
  width: auto;
  z-index: 100000;
  /* Above WP toolbar. */
}











/* Resposive Typography */


body,
button,
input,
select,
optgroup,
textarea {
	color: #000;
	font-size: 1em;
	line-height: 1.5;
	font-weight: 300;
}

h1, h2, h3, h4, h5, h6 {
	clear: both;
  font-weight: 800;
}

dfn, cite, em, i {
	font-style: italic;
}

blockquote {
	margin: 0 1.5em;
}

address {
	margin: 0 0 1.5em;
}

pre {
	background: #eee;
	font-family: "Courier 10 Pitch", Courier, monospace;
	font-size: 15px;
	font-size: 0.9375rem;
	line-height: 1.6;
	margin-bottom: 1.6em;
	max-width: 100%;
	overflow: auto;
	padding: 1.6em;
}

code, kbd, tt, var {
	font-family: Monaco, Consolas, "Andale Mono", "DejaVu Sans Mono", monospace;
	font-size: 15px;
	font-size: 0.9375rem;
}

abbr, acronym {
	border-bottom: 1px dotted #666;
	cursor: help;
}

mark, ins {
	background: #fff9c0;
	text-decoration: none;
}

big {
	font-size: 125%;
}

.light {
    color:#ddd;
}

strong {
	font-weight: 600;
}

cite,
em,
i {
	font-style: italic;
}

p.big {
	font-size: 140%;
	line-height: 1.3em;
}

p.small {
	font-size: 80%;
	}

blockquote {
	display:block;
    margin: 1em 20px;
    padding: 0 1em;
    position:relative;
}

blockquote:before {

}

blockquote cite,
blockquote em,
blockquote i {
	font-style: italic;
}

abbr,
acronym {
	border-bottom: 1px dotted #666;
	cursor: help;
}

sup,
sub {
	height: 0;
	line-height: 1;
	vertical-align: baseline;
	position: relative;
}

sup {
	bottom: 1ex;
}

sub {
	top: .5ex;
}


p {
    font-size: 1em;
    margin: 0 0 2em 0;
}

article:last-of-type, p:last-of-type {
	margin-bottom: 0;
}

p.intro {
    font-size:1.25em;
    line-height: 1.5;
    font-weight:300;
     margin: 0 0 1.5em 0;
}

h1, h2 {
    letter-spacing: -1px;
}

h1, .h1, h2, .h2, h3, .h3, h4, .h4 {
  margin: 0 0 0.5em 0;
  line-height: 1.1;
}

h1, .h1 {font-size: 2.074em;}

h2, .h2 {font-size: 1.728em;}

h3, .h3 {font-size: 1.44em;}

h4, .h4 {font-size: 1.2em;}



/* Medium Screen Typography - Scale: 1.333 Perfect Fourth (thanks http://type-scale.com/)  */

@media screen and (min-width: 42em) {

	h1, .h1 { letter-spacing: -2px; }

	h1, .h1 {font-size: 3.157em;}

	h2, .h2 {font-size: 2.369em;}

	h3, .h3 {font-size: 1.777em;}

	h4, .h4 {font-size: 1.333em;}

	p { font-size:1.0625em; }

	p.intro { font-size:1.3em; }

}


/* Large Screen Typography  - Scale: 1.414 Augmented Fourth (thanks http://type-scale.com/)  */

@media screen and (min-width: 72em) {

	h1 { letter-spacing: -3px; }

	h1, .h1 { margin-bottom: 0.35em; font-size: 3.998em; }

	h2, .h2  { font-size: 2.827em; }

	h3, .h3 { font-size: 1.999em; }

	h4, .h4 { font-size: 1.414em; }

	p { font-size:1.125em; }

	p.intro { font-size:1.4em; }

}

.container {
    margin-top: 10px;
    font-size: 20px;
}

table {
  border-spacing: 1;
  border-collapse: collapse;
  background: white;
  border-radius: 6px;
  overflow: hidden;
  max-width: 800px;
  width:100%;
  margin: 0 auto;
  position: relative;
  text-decoration: none;
}
table * {
  position: relative;
}
table td, table th {
  padding-left: 8px;
}
table thead tr {
  height: 60px;
  background: #FFED86;
  font-size: 16px;
}
table tbody tr {
  height: 48px;
  border-bottom: 1px solid #E3F1D5;
}
table tbody tr:last-child {
  border: 0;
}
table td, table th {
  text-align: left;
}
table td.l, table th.l {
  text-align: right;
}
table td.c, table th.c {
  text-align: center;
}
table td.r, table th.r {
  text-align: center;
}

@media screen and (max-width: 35.5em) {
  table {
    display: block;
  }
  table > *, table tr, table td, table th {
    display: block;
  }
  table thead {
    display: none;
  }
  table tbody tr {
    height: auto;
    padding: 8px 0;
  }
  table tbody tr td {
    padding-left: 45%;
    margin-bottom: 12px;
  }
  table tbody tr td:last-child {
    margin-bottom: 0;
  }
  table tbody tr td:before {
    position: absolute;
    font-weight: 700;
    width: 40%;
    left: 10px;
    top: 0;
  }
  table tbody tr td:nth-child(1):before {
    content: "Code";
  }
  table tbody tr td:nth-child(2):before {
    content: "Stock";
  }
  table tbody tr td:nth-child(3):before {
    content: "Cap";
  }
  table tbody tr td:nth-child(4):before {
    content: "Inch";
  }
  table tbody tr td:nth-child(5):before {
    content: "Box Type";
  }
}

 table a {
            color: #3498db;
            text-decoration: none;
            margin-right: 10px;
            transition: color 0.3s;
        }

        table a:hover {
            color: #2980b9;
        }

        table a.delete-link {
            color: #e74c3c;
        }

        table a.delete-link:hover {
            color: #c0392b;
        }
    </style>
    
        <script>
$('.nav-toggle').click(function(e) {
  
  e.preventDefault();
  $("html").toggleClass("openNav");
  $(".nav-toggle").toggleClass("active");

});
    </script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
</head>
<body>
<%
        // Retrieve the message from the request
        String message = request.getParameter("message");
    %>

        
    <!-- Display the message if it exists -->
    <% if (message != null && !message.isEmpty()) { %>
        <div class="alert alert-success">
            <%= message %>
        </div>
    <% } %>
    <!-- Navigation -->
<!--    <nav role='navigation'>
        <ul class="main">
            <li class="edit"><a href="admin.jsp">Main Page</a></li>
            <li class="edit"><a href="edit.jsp">Manage Customer</a></li>
            <li class="users"><a href="DisplayCus.jsp">Display Customer Feedback</a></li>
            <li class="users"><a href="Approve.jsp">Booking Customer Approval</a></li>
        </ul>
    </nav>-->

<div class="primary-nav">

	<button href="#" class="hamburger open-panel nav-toggle">
<span class="screen-reader-text">Menu</span>
</button>

	<nav role="navigation" class="menu">

		<a href="admin.html" class="logotype">With<span>You</span></a>

		<div class="overflow-container">

			<ul class="menu-dropdown">

				<li><a href="edit.jsp">Manage Customer</a><span class="icon"><i class="fa fa-dashboard"></i></span></li>


				<li><a href="DisplayCus.jsp">Display Customer Feedback</a><span class="icon"><i class="fa fa-envelope"></i></span></li>

				<li><a href="Approve.jsp">Booking Customer Approval</a><span class="icon"><i class="fa fa-users"></i></span></li>

				<li><a href="Logout">Logout</a><span class="icon"><i class="fa fa-sign-out"></i></span></li>

			</ul>

		</div>

	</nav>

</div>
    <!-- Edit Website Page -->
    <div class="new-wrapper">

	<div id="main">

		<div id="main-contents">

			<h1>Manage Customer</h1>

		</div>

	</div>
    <section id="editPage">
<!--        <center><h2>Manage <b>Customer</b></h2></center>-->
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Number</th>
                            <th>Email</th>
                            <th>Package</th>
                            <th>Venue</th>
                            <th>Time & Date</th>
                            <th>Guest</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                Class.forName("org.apache.derby.jdbc.ClientDriver");
                                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Wedding;create=true;user=wed;password=wed");
                                Statement st = con.createStatement();
                                String query = "SELECT * FROM Info";
                                ResultSet rs = st.executeQuery(query);

                                while (rs.next()) {
                        %>
                                    <tr>
                                        <td><%= rs.getString("name") %></td>
                                        <td><%= rs.getString("number") %></td>
                                        <td><%= rs.getString("email") %></td>
                                        <td><%= rs.getString("package") %></td>
                                        <td><%= rs.getString("venue") %></td>
                                        <td><%= rs.getString("datetime") %></td>
                                        <td><%= rs.getInt("guest") %></td>
                                        <td>
                                            <a href="EditDeleteServlet?action=edit&id=<%= rs.getString("id") %>" class="edit-link">Edit</a>
                                            |
                                            <a href="EditDeleteServlet?action=delete&id=<%= rs.getString("id") %>" onclick="return confirmDelete();" class="delete-link">Delete</a>
                                        </td>
                                    </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                                // Handle exception appropriately
                            }
                        %>         
                    </tbody>
                </table>
                
            </div>
        </div>
    </section>
    </div>
</body>
</html>
