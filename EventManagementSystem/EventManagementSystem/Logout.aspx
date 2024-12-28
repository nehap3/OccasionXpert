<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="EventManagementSystem.Logout" %>

<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- Include SweetAlert2 for a styled popup -->
    <script>
        // Function to show success message after logout
        function showLogoutMessage() {
            Swal.fire({
                icon: 'success',
                title: 'Logout Successful',
                text: 'You have been logged out.',
                confirmButtonText: 'OK'
            }).then(() => {
                window.location.href = "Login.aspx"; // Redirect to Login page after the user clicks 'OK'
            });
        }
    </script>
</head>
<body onload="showLogoutMessage()"> <!-- Trigger the popup when the page loads -->
</body>
</html>