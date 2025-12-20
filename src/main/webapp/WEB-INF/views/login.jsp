<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="back-btn">
        <a href="${pageContext.request.contextPath}/">
            <i class="fa-solid fa-arrow-left"></i> 
            <p>Back</p>
        </a>
    </div>
    
    <div class="login-container">
        <div class="login-header">
            <h1>📚 E-Library</h1>
            <p>Admin Login</p>
        </div>

        <% if (request.getAttribute("msg") != null) { %>
            <div class="message"><%= request.getAttribute("msg") %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/logproc" method="POST">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>

            <button type="submit" class="login-btn">Login</button>
        </form>

        <div class="signup-link">
            Don't have an account? <a href="${pageContext.request.contextPath}/signup">Sign Up</a>
        </div>
    </div>
</body>
</html>