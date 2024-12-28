<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EventManagementSystem.Register" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom styles for the registration page */
        body {
            background-color: #f4f6f9;
            font-family: 'Arial', sans-serif;
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
            width: 100%;
            height: 100%;
        }

        .register-container {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 450px;
            flex: 1;
            margin-right: 30px;
        }

        .register-container h2 {
            color: #4A90E2;
            font-weight: 600;
            margin-bottom: 30px;
            text-align: center;
        }

        .register-container .form-control {
            border-radius: 8px;
            box-shadow: none;
        }

        .register-container .form-control:focus {
            border-color: #4A90E2;
            box-shadow: 0 0 0 0.2rem rgba(74, 144, 226, 0.25);
        }

        .register-container .btn-primary {
            background-color: #4A90E2;
            border-color: #4A90E2;
            border-radius: 8px;
            padding: 12px;
            font-weight: bold;
        }

        .register-container .btn-primary:hover {
            background-color: #357ABD;
            border-color: #357ABD;
        }

        .register-footer {
            text-align: center;
            margin-top: 20px;
            color: #6c757d;
        }

        .register-footer a {
            color: #4A90E2;
            text-decoration: none;
        }

        .register-footer a:hover {
            text-decoration: underline;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            font-size: 16px;
            padding: 12px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 18px;
        }

        .register-section {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: row;
            width: 100%;
        }

        /* Mobile view adjustments */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .register-container {
                margin-right: 0;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <!-- Register Form Section -->
            <div class="register-container">
                <h2>Register</h2>
                <div class="mb-3">
                    <label for="txtUsername" class="form-label">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username" />
                </div>
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" />
                </div>
                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password" />
                </div>
                <div class="mb-3">
                    <label for="txtConfirmPassword" class="form-label">Confirm Password</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm your password" />
                </div>

                <div class="mb-3">
                    <label for="ddlRole" class="form-label">Role</label>
                    <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select Role" Value="" />
                        <asp:ListItem Text="Admin" Value="Admin" />
                        <asp:ListItem Text="Organizer" Value="Organizer" />
                        <asp:ListItem Text="User" Value="User" />
                    </asp:DropDownList>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
                <div class="register-footer mt-3">
                    <p>Already have an account? <a href="Login.aspx">Login</a></p>
                </div>
            </div>
        </div>
    </form>

</body>
</html>

