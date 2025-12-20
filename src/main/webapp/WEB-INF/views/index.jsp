<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <header>
        <h1><a href="${pageContext.request.contextPath}/" style="
                font-family:Poppins, sans-serif;
                font-size:34px;
                font-weight:700;
                color:#f3f4f6;
                text-decoration:none;
                letter-spacing:1px;
                transition:0.3s ease;
            ">📚 E-Library Management System</a></h1>
    </header>
    
    <nav>
        <%
            String userEmail = (String) session.getAttribute("udata");
            if (userEmail != null) {
        %>
        <%
            }
        %>
        <div class="auth-buttons">
            <%
                String role = (String) session.getAttribute("role");
                if (userEmail != null) {
            %>
                <span style="color: white; padding: 15px 15px;">Welcome, <%= userEmail %> <% if ("admin".equals(role)) { %><span style="font-size: 12px; background: #ff9800; padding: 2px 8px; border-radius: 3px;">ADMIN</span><% } %></span>
                <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
            <%
                } else {
            %>
                <a href="${pageContext.request.contextPath}/login">Login</a>
                <a href="${pageContext.request.contextPath}/signup">Sign Up</a>
            <%
                }
            %>
        </div>
    </nav>

    <div class="container">
        <div class="welcome">
            <p>Welcome to E-Library!</p>
            <p>Explore thousands of books online and manage your library.</p>
        </div>

        <div class="quick-links">
            <a href="${pageContext.request.contextPath}/books" class="quick-link-card">
                <i class="fa-solid fa-book"></i>
                <h3>Browse Books</h3>
                <p>Explore our extensive collection of books</p>
            </a>

            <a href="${pageContext.request.contextPath}/books/available" class="quick-link-card">
                <i class="fa-solid fa-check-circle"></i>
                <h3>Available Books</h3>
                <p>View all currently available books</p>
            </a>

            <%
                if ("admin".equals(role)) {
            %>
                <a href="${pageContext.request.contextPath}/books/add" class="quick-link-card">
                    <i class="fa-solid fa-plus"></i>
                    <h3>Add New Book</h3>
                    <p>Add a new book to the library</p>
                </a>

                <a href="${pageContext.request.contextPath}/viewusers" class="quick-link-card">
                    <i class="fa-solid fa-users"></i>
                    <h3>View Users</h3>
                    <p>View all registered users</p>
                </a>
            <%
                } else if (userEmail != null) {
            %>
                <a href="${pageContext.request.contextPath}/borrowing/mybookings" class="quick-link-card">
                    <i class="fa-solid fa-bookmark"></i>
                    <h3>My Books</h3>
                    <p>View your borrowed books</p>
                </a>
            <%
                }
            %>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 E-Library Management System. All rights reserved.</p>
    </footer>
</body>
</html>