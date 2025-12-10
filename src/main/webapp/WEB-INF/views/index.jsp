<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
        }
        header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        nav {
            background-color: #333;
            padding: 0;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            gap: 0;
        }
        nav a {
            color: white;
            padding: 15px 25px;
            text-decoration: none;
            transition: background-color 0.3s;
            flex: 1;
            text-align: center;
        }
        nav a:hover {
            background-color: #667eea;
        }
        .auth-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-left: auto;
            padding-right: 20px;
        }
        .auth-buttons a {
            flex: none;
            padding: 10px 20px;
            background-color: #4CAF50;
            border-radius: 4px;
            margin: auto 0;
        }
        .auth-buttons a:last-child {
            background-color: #2196F3;
        }
        .auth-buttons a:hover {
            opacity: 0.9;
        }
        .logout-btn {
            background-color: #f44336 !important;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        .welcome {
            text-align: center;
            padding: 60px 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 8px;
            margin-bottom: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .welcome p:first-child {
            font-size: 2.5em;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .welcome p:last-child {
            font-size: 1.2em;
            opacity: 0.9;
        }
        .quick-links {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }
        .quick-link-card {
            background: white;
            padding: 25px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            text-decoration: none;
            color: #333;
        }
        .quick-link-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
        }
        .quick-link-card i {
            font-size: 40px;
            color: #667eea;
            margin-bottom: 15px;
        }
        .quick-link-card h3 {
            margin-bottom: 10px;
            color: #333;
        }
        .quick-link-card p {
            font-size: 0.9em;
            color: #666;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <header>
        <h1>📚 E-Library Management System</h1>
    </header>
    
    <nav>
        <a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/books">Browse Books</a>
        <div class="auth-buttons">
            <%
                String userEmail = (String) session.getAttribute("udata");
                if (userEmail != null) {
            %>
                <span style="color: white; padding: 15px 15px;">Welcome, <%= userEmail %></span>
                <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
            <%
                } else {
            %>
                <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
                <a href="${pageContext.request.contextPath}/signup.jsp">Sign Up</a>
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

            <a href="${pageContext.request.contextPath}/viewusers" class="quick-link-card">
                <i class="fa-solid fa-users"></i>
                <h3>Users</h3>
                <p>View all registered users</p>
            </a>

            <a href="${pageContext.request.contextPath}/books/add" class="quick-link-card">
                <i class="fa-solid fa-plus"></i>
                <h3>Add New Book</h3>
                <p>Add a new book to the library</p>
            </a>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 E-Library Management System. All rights reserved.</p>
    </footer>
</body>
</html>