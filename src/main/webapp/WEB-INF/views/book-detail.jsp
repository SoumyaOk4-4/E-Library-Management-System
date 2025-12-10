<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${book.name} - E-Library</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book-detail.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
    <header>
        <div class="logo-dash-cluster">
            <div class="logo">
                <div class="logo-start">E</div>
                <div class="logo-end">- Library</div>
            </div>
            <div class="dashboard">Book Details</div>
        </div>
    </header>

    <div class="book-detail-container">
        <!-- Error Message Display -->
        <div class="error-message" id="errorMessage">
            <i class="fa-solid fa-exclamation-circle"></i>
            <strong>Cannot Borrow!</strong> You already have this book borrowed. Please return it first.
        </div>

        <div class="book-header">
            <div class="book-cover">
                <c:choose>
                    <c:when test="${not empty book.coverImage}">
                        <img src="${pageContext.request.contextPath}/images/${book.id}/${book.coverImage}" alt="${book.name}">
                    </c:when>
                    <c:otherwise>
                        <div style="display: flex; align-items: center; justify-content: center; width: 100%; height: 100%; background: #ddd;">
                            <i class="fa-solid fa-book" style="font-size: 60px; color: #999;"></i>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="book-info">
                <h2>${book.name}</h2>
                
                <div class="availability">
                    <c:choose>
                        <c:when test="${book.available}">
                            <span class="available">✓ Available</span>
                        </c:when>
                        <c:otherwise>
                            <span class="unavailable">✗ Not Available</span>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="book-meta">
                    <div class="meta-item">
                        <strong>Author:</strong>
                        <span>${book.author}</span>
                    </div>
                    <div class="meta-item">
                        <strong>Publisher:</strong>
                        <span>${book.publisher}</span>
                    </div>
                    <div class="meta-item">
                        <strong>Quantity:</strong>
                        <span>${book.quantity} copies</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="book-description">
            <h3>Description</h3>
            <p>${not empty book.description ? book.description : 'No description available'}</p>
        </div>

        <div class="action-buttons">
            <%
                String userEmail = (String) session.getAttribute("udata");
                String role = (String) session.getAttribute("role");
                String error = request.getParameter("error");
            %>
            
            <!-- Borrow Button - Only for logged-in non-admin users -->
            <% if (userEmail != null && !"admin".equals(role)) { %>
                <button onclick="borrowBook('${book.id}')" class="btn btn-borrow">
                    <i class="fa-solid fa-download"></i> Borrow Book
                </button>
            <% } %>
            
            <!-- Edit and Delete Buttons - Only for admin users -->
            <% if ("admin".equals(role)) { %>
                <a href="${pageContext.request.contextPath}/books/edit/${book.id}" class="btn btn-edit">
                    <i class="fa-solid fa-edit"></i> Edit
                </a>
                <a href="${pageContext.request.contextPath}/books/delete/${book.id}" class="btn btn-delete" onclick="return confirm('Are you sure you want to delete this book?');">
                    <i class="fa-solid fa-trash"></i> Delete
                </a>
            <% } %>
            
            <!-- Back Button - Always visible -->
            <a href="${pageContext.request.contextPath}/books" class="btn btn-back">
                <i class="fa-solid fa-arrow-left"></i> Back to Books
            </a>
        </div>
    </div>

    <script>
        // Check if there's an error message in URL
        function checkError() {
            const urlParams = new URLSearchParams(window.location.search);
            const error = urlParams.get('error');
            
            if (error) {
                const errorMessage = document.getElementById('errorMessage');
                errorMessage.classList.add('show');
                
                // Auto-hide error message after 5 seconds
                setTimeout(() => {
                    errorMessage.classList.remove('show');
                }, 5000);
            }
        }

        // Borrow book with confirmation
        function borrowBook(bookId) {
            const confirmBorrow = confirm('Are you sure you want to borrow this book?\n\nDue Date: 7 days from today');
            
            if (confirmBorrow) {
                // Redirect to borrow endpoint
                window.location.href = '${pageContext.request.contextPath}/borrowing/borrow/' + bookId;
            }
        }

        // Run error check when page loads
        window.addEventListener('load', checkError);
    </script>
</body>

</html>