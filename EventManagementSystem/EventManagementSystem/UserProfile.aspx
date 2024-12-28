<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="EventManagementSystem.UserProfile" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="Default.aspx">Event Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="EditProfile.aspx">Edit Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="Logout.aspx">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center">User Profile</h2>

            <!-- Display user details -->
            <div class="mb-3">
                <label for="lblUsername" class="form-label">Username</label>
                <asp:Label ID="lblUsername" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="lblEmail" class="form-label">Email</label>
                <asp:Label ID="lblEmail" runat="server" CssClass="form-control" />
            </div>

            <!-- Display registered events -->
            <h4 class="mt-5">Your Registered Events</h4>
            <asp:GridView ID="gvRegisteredEvents" runat="server" CssClass="table table-striped mt-3" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="EventName" HeaderText="Event Name" />
                    <asp:BoundField DataField="EventDate" HeaderText="Event Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <footer class="footer bg-dark text-white text-center py-3">
        <p>&copy; 2024 Event Management System. All rights reserved.</p>
    </footer>
</body>
</html>
