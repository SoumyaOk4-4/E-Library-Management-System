<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - Add Book</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/add-book.css">
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
        <div class="dashboard">Add Book</div>
    </div>
</header>

<div class="middle">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="api-call-btn">
            <a href="${pageContext.request.contextPath}/">
                <i class="fa-solid fa-house"></i> Home
            </a>
        </div>

        <div class="api-call-btn active">
            <a href="${pageContext.request.contextPath}/books/add">
                <i class="fa-solid fa-book"></i> Add Book
            </a>
        </div>

        <div class="api-call-btn">
            <a href="${pageContext.request.contextPath}/books">
                <i class="fa-solid fa-database"></i> View Books
            </a>
        </div>

        <div class="api-call-btn">
            <a href="${pageContext.request.contextPath}/viewusers">
                <i class="fa-solid fa-user"></i> View Users
            </a>
        </div>

        <div class="api-call-btn">
            <a href="${pageContext.request.contextPath}/logout">
                <i class="fa-solid fa-arrow-right-from-bracket"></i> Logout
            </a>
        </div>
    </div>

    <!-- MAIN VIEW -->
    <div class="view">
        <div class="form-container">

            <h2>Add New Book</h2>

            <c:if test="${not empty errors}">
                <div style="background:#ffebee;color:#c62828;padding:15px;border-radius:6px;margin-bottom:20px;">
                    <strong>Validation Errors:</strong>
                    <ul>
                        <c:forEach var="error" items="${errors}">
                            <li>${error.defaultMessage}</li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/books/add"
                  method="POST"
                  enctype="multipart/form-data">

                <div class="form-group">
                    <label>Book Name *</label>
                    <input type="text" name="name" required placeholder="Enter book name">
                </div>

                <div class="form-group">
                    <label>Author *</label>
                    <input type="text" name="author" required placeholder="Enter author name">
                </div>

                <div class="form-group">
                    <label>Publisher *</label>
                    <input type="text" name="publisher" required placeholder="Enter publisher name">
                </div>

                <div class="form-group">
                    <label>Quantity *</label>
                    <input type="number" name="quantity" min="0" required placeholder="Enter quantity">
                </div>

                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" placeholder="Enter book description"></textarea>
                </div>

                <div class="form-group">
                    <label>Cover Image</label>
                    <input type="file" name="image" accept="image/*">
                </div>

                <div class="form-buttons">
                    <button type="submit" class="btn-submit">Add Book</button>
                    <button type="button" class="btn-cancel" onclick="history.back()">Cancel</button>
                </div>

            </form>

        </div>
    </div>

</div>

</body>
</html>
