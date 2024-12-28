<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EventManagementSystem.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
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
        .login-image-container {
            flex: 1;
            display: block;
            max-width: 100%;
            margin-right: 30px;
        }
        .login-image-container img {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .login-container {
            flex: 1;
            max-width: 450px;
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .login-container h2 {
            color: #4A90E2;
            font-weight: 600;
            margin-bottom: 30px;
            text-align: center;
        }
        .login-container .form-control {
            border-radius: 8px;
            box-shadow: none;
        }
        .login-container .form-control:focus {
            border-color: #4A90E2;
            box-shadow: 0 0 0 0.2rem rgba(74, 144, 226, 0.25);
        }
        .login-container .btn-primary {
            background-color: #4A90E2;
            border-color: #4A90E2;
            border-radius: 8px;
            padding: 12px;
            font-weight: bold;
        }
        .login-container .btn-primary:hover {
            background-color: #357ABD;
            border-color: #357ABD;
        }
        .login-footer {
            text-align: center;
            margin-top: 20px;
            color: #6c757d;
        }
        .login-footer a {
            color: #4A90E2;
            text-decoration: none;
        }
        .login-footer a:hover {
            text-decoration: underline;
        }
        @media (min-width: 768px) {
            .login-image-container {
                display: block;
            }
            .login-container {
                margin-left: 30px;
            }
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <!-- Image Section -->
            <div class="login-image-container">
                <img src="https://media.istockphoto.com/id/1357747202/vector/event-manager-discusses-details-of-event-or-party-with-client-girl-provides-services-for.jpg?s=612x612&w=0&k=20&c=xEY7v_hhL_ykibvxUECy2L1C8h13_k3kYJuSkLR6MP8=" alt="Event Management Image" />
            </div>

            <!-- Login Form Section -->
            <div class="login-container">
                <h2>Login</h2>
                <div class="mb-3">
                    <label for="txtUsername" class="form-label">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username" />
                </div>
                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password" />
                </div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                <div class="login-footer mt-3">
                    <p>Don't have an account? <a href="Register.aspx">Register</a></p>
                </div>
            </div>
        </div>
    </form>

</body>
</html>
