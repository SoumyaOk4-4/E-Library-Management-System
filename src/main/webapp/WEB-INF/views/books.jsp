<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - Books</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/books.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
    <header>
       <div class="logo-dash-cluster">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/">
                    <div class="logo-start">📚 E -</div>
                    <div class="logo-end"> Library</div>
                </a>
            </div>
            <div class="dashboard">
                <a href="/">
                    <i class="fa-solid fa-arrow-left"></i> 
                    Go Back
                </a>
            </div>
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