<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="EventManagementSystem.AdminDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Arial', sans-serif;
        }
        .navbar { border-bottom: 2px solid #ddd; }
        .navbar-nav .nav-link { color: #fff !important; font-weight: 600; }
        .navbar-nav .nav-link:hover { color: #4A90E2 !important; }
        .container { max-width: 1200px; margin: 0 auto; }
        .dashboard-title { font-size: 36px; font-weight: 700; color: #4A90E2; margin-bottom: 40px; text-align: center; }
        .card { border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); margin-bottom: 30px; }
        .card-header { background-color: #4A90E2; color: white; font-size: 20px; padding: 15px; font-weight: bold; }
        .card-body { padding: 30px; background-color: #fff; }
        .btn-primary { background-color: #4A90E2; border-color: #4A90E2; padding: 12px 25px; font-weight: bold; border-radius: 8px; }
        .btn-primary:hover { background-color: #357ABD; border-color: #357ABD; }
        .footer { background-color: #4A90E2; color: #fff; text-align: center; padding: 15px 0; font-size: 16px; }
        .form-label { font-weight: bold; }
        .form-control { border-radius: 8px; padding: 10px; font-size: 16px; }
        .form-control:focus { border-color: #4A90E2; box-shadow: 0 0 0 0.2rem rgba(74, 144, 226, 0.25); }
        .grid-view-container { margin-top: 30px; }
        /* Responsive Design */
        @media (max-width: 768px) { .container { padding-left: 15px; padding-right: 15px; } .card { margin-bottom: 20px; } .dashboard-title { font-size: 28px; } }
    </style>
</head>
<body>
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


    <form id="form1" runat="server">
        <div class="container">
            <div class="dashboard-title">Admin Dashboard</div>

            <!-- Add New Event Form -->
            <div class="card">
                <div class="card-header">Add New Event</div>
                <div class="card-body">
                    <div class="mb-3">
                        <label for="txtEventName" class="form-label">Event Name</label>
                        <asp:TextBox ID="txtEventName" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtEventDate" class="form-label">Event Date</label>
                        <asp:TextBox ID="txtEventDate" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                    <div class="mb-3">
                        <label for="txtLocation" class="form-label">Location</label>
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtCapacity" class="form-label">Capacity</label>
                        <asp:TextBox ID="txtCapacity" runat="server" CssClass="form-control" TextMode="Number" />
                    </div>
                    <div class="mb-3">
                        <label for="txtOrganizer" class="form-label">Organizer</label>
                        <asp:TextBox ID="txtOrganizer" runat="server" CssClass="form-control" />
                    </div>
                    <asp:Button ID="btnAddEvent" runat="server" Text="Add Event" CssClass="btn btn-primary" OnClick="btnAddEvent_Click" />
                </div>
            </div>

            <!-- Existing Events -->
            <div class="grid-view-container">
                <h4>Manage Events</h4>
                <asp:GridView ID="gvAdminEvents" runat="server" CssClass="table table-striped mt-3" AutoGenerateColumns="False" OnRowDeleting="gvAdminEvents_RowDeleting" DataKeyNames="EventID">
                    <Columns>
                        <asp:BoundField DataField="EventName" HeaderText="Event Name" />
                        <asp:BoundField DataField="EventDate" HeaderText="Event Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Location" HeaderText="Location" />
                        <asp:BoundField DataField="Capacity" HeaderText="Capacity" />
                        <asp:BoundField DataField="Organizer" HeaderText="Organizer" />
                        <asp:CommandField ShowDeleteButton="True" DeleteText="Delete" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <footer class="footer">
        <p>&copy; 2024 Event Management System. All rights reserved.</p>
    </footer>
</body>
</html>
