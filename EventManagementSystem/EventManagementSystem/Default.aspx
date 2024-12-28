<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EventManagementSystem.Default" %>

<!DOCTYPE html>
<html>
<head>
    <title>Upcoming Events</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
                <li class="nav-item"><a class="nav-link" href="Logout.aspx">Logout</a></li>
                <!-- Added Contact Us link -->
                <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact Us</a></li>
            </ul>
        </div>
    </div>
</nav>
    

</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center">Upcoming Events</h2>
            <asp:GridView ID="gvEvents" runat="server" CssClass="table table-striped mt-3" AutoGenerateColumns="False" OnRowCommand="gvEvents_RowCommand" DataKeyNames="EventID">
            <Columns>
                <asp:BoundField DataField="EventName" HeaderText="Event Name" />
                <asp:BoundField DataField="EventDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Location" HeaderText="Location" />
                <asp:ButtonField Text="Register" CommandName="Register" />
            </Columns>
        </asp:GridView>

        </div>
    </form>
</body>
        <footer class="footer bg-dark text-white text-center py-3">
    <p>&copy; 2024 Event Management System. All rights reserved.</p>
</footer>
</html>
