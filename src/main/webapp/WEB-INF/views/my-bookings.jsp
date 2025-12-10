<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - My Books</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .my-bookings-container {
            padding: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .bookings-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        .bookings-header h2 {
            color: #333;
            margin: 0;
        }
        .back-btn {
            padding: 10px 20px;
            background-color: #757575;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 600;
        }
        .back-btn:hover {
            background-color: #616161;
        }
        .user-info {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .user-info p {
            margin: 10px 0;
            color: #333;
        }
        .tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            border-bottom: 2px solid #eee;
        }
        .tab-btn {
            padding: 12px 20px;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            color: #666;
            border-bottom: 3px solid transparent;
        }
        .tab-btn.active {
            color: #667eea;
            border-bottom-color: #667eea;
        }
        .bookings-table {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table thead {
            background-color: #667eea;
            color: white;
        }
        table th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }
        table td {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }
        table tbody tr:hover {
            background-color: #f5f5f5;
        }
        .status-badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 600;
        }
        .status-borrowed {
            background-color: #fff3e0;
            color: #f57c00;
        }
        .status-returned {
            background-color: #e8f5e9;
            color: #2e7d32;
        }
        .overdue {
            background-color: #ffebee;
            color: #c62828;
        }
        .return-btn {
            padding: 8px 16px;
            background-color: #ff9800;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            text-decoration: none;
        }
        .return-btn:hover {
            background-color: #e68900;
        }
        .no-bookings {
            text-align: center;
            padding: 60px 20px;
            color: #999;
        }
        .no-bookings i {
            font-size: 60px;
            margin-bottom: 20px;
            opacity: 0.5;
        }
        .fine-amount {
            color: #f44336;
            font-weight: 600;
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
            <div class="dashboard">My Bookings</div>
        </div>
    </header>

    <div class="my-bookings-container">
        <div class="bookings-header">
            <h2>My Borrowed Books</h2>
            <a href="${pageContext.request.contextPath}/" class="back-btn">
                <i class="fa-solid fa-arrow-left"></i> Back to Home
            </a>
        </div>

        <div class="user-info">
            <p><strong>Email:</strong> ${userEmail}</p>
            <p><strong>Total Books Borrowed:</strong> ${borrowings.size()}</p>
        </div>

        <c:choose>
            <c:when test="${not empty borrowings}">
                <div class="bookings-table">
                    <table>
                        <thead>
                            <tr>
                                <th>Book Name</th>
                                <th>Author</th>
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
                                    <td>${borrowing.book.name}</td>
                                    <td>${borrowing.book.author}</td>
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
                                            <c:when test="${borrowing.fine > 0}">
                                                <span class="fine-amount">Rs. ${borrowing.calculateFine()}</span>
                                            </c:when>
                                            <c:otherwise>
                                                Rs. 0
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:if test="${borrowing.status == 'BORROWED'}">
                                            <a href="${pageContext.request.contextPath}/borrowing/return/${borrowing.id}" class="return-btn" onclick="return confirm('Return this book?');">
                                                Return
                                            </a>
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
                    <h3>No Books Borrowed</h3>
                    <p>You haven't borrowed any books yet!</p>
                    <a href="${pageContext.request.contextPath}/books" style="display: inline-block; margin-top: 20px; padding: 12px 25px; background-color: #4CAF50; color: white; border-radius: 4px; text-decoration: none; font-weight: 600;">
                        <i class="fa-solid fa-book"></i> Browse Books
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>

</html>