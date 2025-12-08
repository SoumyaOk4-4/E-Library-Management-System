<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
</head>
<body>
    <header>
        <h1>📚 E-Library System</h1>
    </header>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="books.jsp">Browse Books</a>
        <a href="about.jsp">About</a>
        <a href="contact.jsp">Contact</a>
    </nav>
    <div class="container">
        <div class="welcome">
            <p>Welcome to E-Library!</p>
            <p>Explore thousands of books online.</p>
        </div>
    </div>
    <footer>
        <p>&copy; 2024 E-Library System. All rights reserved.</p>
    </footer>
</body>
</html>