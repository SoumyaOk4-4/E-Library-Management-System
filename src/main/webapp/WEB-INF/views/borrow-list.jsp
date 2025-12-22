<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - Borrow List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/my-bookings.css">
</head>

<body>
    <header>
        <div class="logo-dash-cluster">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/dashboard">
                    <div class="logo-start">📚 E -</div>
                    <div class="logo-end"> Library</div>
                </a>
            </div>
            <div class="dashboard">Borrow List (Admin)</div>
        </div>
    </header>

    <div class="my-bookings-container">
        <div class="bookings-header">
            <h2>All Borrowing Records</h2>
            <a href="${pageContext.request.contextPath}/" class="back-btn">
                <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>

        <c:choose>
            <c:when test="${not empty borrowings}">
                <div class="bookings-table">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>User Email</th>
                                <th>Book Name</th>
                                <th>Borrow Date</th>
                                <th>Due Date</th>
                                <th>Status</th>
                                <th>Fine</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="borrowing" items="${borrowings}">
                                <tr>
                                    <td>${borrowing.id}</td>
                                    <td>${borrowing.user.email}</td>
                                    <td>${borrowing.book.name}</td>
                                    <td>${borrowing.borrowDate}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${borrowing.isOverdue()}">
                                                <span class="overdue">${borrowing.dueDate} (OVERDUE)</span>
                                            </c:when>
                                            <c:otherwise>
                                                ${borrowing.dueDate}
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${borrowing.status == 'BORROWED'}">
                                                <span class="status-badge status-borrowed">Borrowed</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge status-returned">Returned</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${borrowing.status == 'BORROWED'}">
                                                <c:out value="Rs. ${borrowing.calculateFine()}" />
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="Rs. ${borrowing.fine}" />
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:if test="${borrowing.status == 'BORROWED'}">
                                            <a href="${pageContext.request.contextPath}/borrowing/return/${borrowing.id}" class="return-btn" onclick="return confirm('Return this book?');">Return</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <div class="no-bookings">
                    <i class="fa-solid fa-book"></i>
                    <h3>No Borrowing Records</h3>
                    <p>There are no borrowing records at the moment.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>

</html>