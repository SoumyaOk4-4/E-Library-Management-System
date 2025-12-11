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
                <div class="logo-start">E</div>
                <div class="logo-end">- Library</div>
            </div>
            <div class="dashboard">Add Book</div>
        </div>
    </header>

    <div class="form-container">
        <h2>Add New Book</h2>
        
        <c:if test="${not empty errors}">
            <div style="background-color:#ffebee; color:#c62828; padding:15px; border-radius:4px; margin-bottom:20px;">
                <strong>Validation Errors:</strong>
                <ul>
                    <c:forEach var="error" items="${errors}">
                        <li>${error.defaultMessage}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/books/add" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Book Name *</label>
                <input type="text" id="name" name="name" required placeholder="Enter book name">
            </div>

            <div class="form-group">
                <label for="author">Author *</label>
                <input type="text" id="author" name="author" required placeholder="Enter author name">
            </div>

            <div class="form-group">
                <label for="publisher">Publisher *</label>
                <input type="text" id="publisher" name="publisher" required placeholder="Enter publisher name">
            </div>

            <div class="form-group">
                <label for="quantity">Quantity *</label>
                <input type="number" id="quantity" name="quantity" required min="0" placeholder="Enter quantity">
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" placeholder="Enter book description"></textarea>
            </div>

            <div class="form-group">
                <label for="coverImage">Cover Image</label>
                <input type="file" id="image" name="image" accept="image/*">
            </div>

            <div class="form-buttons">
                <button type="submit" class="btn-submit">Add Book</button>
                <button type="button" class="btn-cancel" onclick="history.back()">Cancel</button>
            </div>
        </form>
    </div>
</body>

</html>