<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - Books</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .books-container {
            padding: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .books-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            gap: 20px;
            flex-wrap: wrap;
        }
        .books-header h2 {
            color: #333;
            margin: 0;
        }
        .search-box {
            display: flex;
            gap: 10px;
            flex: 1;
            min-width: 250px;
        }
        .search-box input {
            flex: 1;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        .search-box button {
            padding: 10px 20px;
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
        }
        .search-box button:hover {
            background-color: #0b7dda;
        }
        .add-btn {
            padding: 12px 25px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
        }
        .add-btn:hover {
            background-color: #45a049;
        }
        .books-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }
        .book-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }
        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
        }
        .book-card-image {
            width: 100%;
            height: 250px;
            background: #e0e0e0;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        .book-card-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .book-card-body {
            padding: 15px;
        }
        .book-card-title {
            font-size: 16px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
            min-height: 40px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        .book-card-author {
            font-size: 13px;
            color: #666;
            margin-bottom: 10px;
        }
        .book-card-meta {
            font-size: 12px;
            color: #999;
            margin-bottom: 12px;
        }
        .book-card-status {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 3px;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 12px;
        }
        .status-available {
            background-color: #e8f5e9;
            color: #2e7d32;
        }
        .status-unavailable {
            background-color: #ffebee;
            color: #c62828;
        }
        .book-card-actions {
            display: flex;
            gap: 8px;
        }
        .book-card-actions a,
        .book-card-actions button {
            flex: 1;
            padding: 8px;
            border: none;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .btn-view {
            background-color: #2196F3;
            color: white;
        }
        .btn-view:hover {
            background-color: #0b7dda;
        }
        .btn-edit {
            background-color: #ff9800;
            color: white;
        }
        .btn-edit:hover {
            background-color: #e68900;
        }
        .btn-delete {
            background-color: #f44336;
            color: white;
        }
        .btn-delete:hover {
            background-color: #da190b;
        }
        .no-books {
            text-align: center;
            padding: 60px 20px;
            color: #999;
        }
        .no-books i {
            font-size: 60px;
            margin-bottom: 20px;
            opacity: 0.5;
        }
    </style>
</head>

<body>
    <header>
       <div class="logo-dash-cluster">
    <div class="logo">
        <div class="logo-start">E</div>
        <div class="logo-end">- Library</div>
    </div>

    <div class="dashboard"><a href="/" style="text-decoration: none;
            color:white;
            text-decoration:none;
            display:inline-block;
            transition:0.25s;
       ">Go Back</a></div>

</div>

        <div class="search-bar">
            <form action="${pageContext.request.contextPath}/books/search" method="GET" style="display: flex; gap: 10px; width: 100%;">
                <input type="text" name="query" placeholder="Search books...">
                <button type="submit" style="padding: 10px 20px; background: #667eea; color: white; border: none; border-radius: 4px; cursor: pointer;">Search</button>
            </form>
        </div>
    </header>

    <div class="books-container">
        <div class="books-header">
            <h2>Books Management</h2>
            <div class="search-box">
                <form action="${pageContext.request.contextPath}/books/search" method="GET" style="display: flex; gap: 10px; width: 100%;">
                    <input type="text" name="query" placeholder="Search by name or author..." value="${searchQuery}">
                    <button type="submit">Search</button>
                </form>
            </div>
            <%
                String role = (String) session.getAttribute("role");
                if ("admin".equals(role)) {
            %>
                <a href="${pageContext.request.contextPath}/books/add" class="add-btn">+ Add Book</a>
            <%
                }
            %>
        </div>

        <c:choose>
            <c:when test="${not empty books}">
                <div class="books-grid">
                    <c:forEach var="book" items="${books}">
                        <div class="book-card">
                            <div class="book-card-image">
                                <c:choose>
                                    <c:when test="${not empty book.coverImage}">
                                        <img src="${pageContext.request.contextPath}/images/${book.id}/${book.coverImage}" alt="${book.name}">
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa-solid fa-book" style="font-size: 60px; color: #ddd;"></i>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="book-card-body">
                                <div class="book-card-title">${book.name}</div>
                                <div class="book-card-author">by ${book.author}</div>
                                <div class="book-card-meta">
                                    ${book.publisher} | Qty: ${book.quantity}
                                </div>
                                <div>
                                    <c:choose>
                                        <c:when test="${book.available}">
                                            <span class="book-card-status status-available">Available</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="book-card-status status-unavailable">Not Available</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="book-card-actions">
                                    <a href="${pageContext.request.contextPath}/books/${book.id}" class="btn-view">View</a>
                                    <%
                                        String userRole = (String) session.getAttribute("role");
                                        if ("admin".equals(userRole)) {
                                    %>
                                        <a href="${pageContext.request.contextPath}/books/edit/${book.id}" class="btn-edit">Edit</a>
                                        <a href="${pageContext.request.contextPath}/books/delete/${book.id}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this book?');">Delete</a>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="no-books">
                    <i class="fa-solid fa-book"></i>
                    <h3>No Books Found</h3>
                    <p>Start by adding your first book!</p>
                    <%
                        String adminRole = (String) session.getAttribute("role");
                        if ("admin".equals(adminRole)) {
                    %>
                        <a href="${pageContext.request.contextPath}/books/add" class="add-btn" style="display: inline-block; margin-top: 20px;">+ Add Book</a>
                    <%
                        }
                    %>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>

</html>