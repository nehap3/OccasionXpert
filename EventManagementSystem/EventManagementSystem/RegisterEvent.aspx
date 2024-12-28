<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterEvent.aspx.cs" Inherits="EventManagementSystem.RegisterEvent" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register for Event</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="Default.aspx">Event Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="AdminDashboard.aspx">Admin Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="OrganizerDashboard.aspx">Organizer Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="Logout.aspx">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
</head>
<body>
    <form id="form1" runat="server">
        <!-- ScriptManager should be placed inside the form tag -->
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="container mt-5">
            <h2 class="text-center">Register for Event</h2>
            <div class="mb-3">
                <label>Event Name</label>
                <asp:Label ID="lblEventName" runat="server" CssClass="form-control" />
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
        </div>
    </form>
</body>

<footer class="footer bg-dark text-white text-center py-3">
    <p>&copy; 2024 Event Management System. All rights reserved.</p>
</footer>
</html>
