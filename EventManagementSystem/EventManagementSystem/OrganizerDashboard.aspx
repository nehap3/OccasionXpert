<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizerDashboard.aspx.cs" Inherits="EventManagementSystem.OrganizerDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Organizer Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Arial', sans-serif;
            height: 100vh;
            margin: 0;
        }
        .navbar {
            background-color: #4A90E2;
        }
        .navbar-nav .nav-link {
            font-weight: bold;
        }
        .container {
            padding-top: 50px;
        }
        .container h2 {
            color: #4A90E2;
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
        }
        .grid-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .grid-container h4 {
            color: #333;
            font-weight: 600;
            margin-bottom: 20px;
        }
        .table {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            padding: 15px;
            text-align: center;
        }
        .footer {
            background-color: #4A90E2;
            color: #fff;
            text-align: center;
            padding: 10px;
        }
        .footer p {
            margin: 0;
        }
        .nav-item {
            padding-left: 20px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <!-- Navigation Bar -->
       <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
       <a class="navbar-brand" href="Default.aspx">
            <img src="Images/logo.png" alt="OccasionXpert Logo" style="width: 50px; height: auto;" />
            OccasionXpert
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <% if (Session["Role"] != null && Session["Role"].ToString() == "Admin") { %>
                    <li class="nav-item"><a class="nav-link" href="AdminDashboard.aspx">Admin Dashboard</a></li>
                <% } %>
                <% if (Session["Role"] != null && Session["Role"].ToString() == "Organizer") { %>
                    <li class="nav-item"><a class="nav-link" href="OrganizerDashboard.aspx">Organizer Dashboard</a></li>
                <% } %>
                <!-- Add the Forgot Password and Contact pages links -->
                <li class="nav-item"><a class="nav-link" href="ForgotPassword.aspx">Forgot Password</a></li>
                <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="Logout.aspx">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>


        <!-- Main Content -->
        <div class="container">
            <h2>Organizer Dashboard</h2>

            <!-- Events Managed by Organizer -->
            <div class="grid-container">
                <h4>Your Events</h4>
                <asp:GridView ID="gvOrganizerEvents" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="EventID">
                    <Columns>
                        <asp:BoundField DataField="EventName" HeaderText="Event Name" />
                        <asp:BoundField DataField="EventDate" HeaderText="Event Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Location" HeaderText="Location" />
                        <asp:BoundField DataField="Capacity" HeaderText="Capacity" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </form>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 Event Management System. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
