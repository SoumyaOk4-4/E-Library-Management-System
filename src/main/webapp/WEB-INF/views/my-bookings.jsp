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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/my-bookings.css">
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
                                            <c:when test="${borrowing.status == 'BORROWED'}">
                                                <span id="fine-${borrowing.id}" class="fine-display">
                                                    Rs. <span id="fine-amount-${borrowing.id}">0</span>
                                                </span>
                                                <script>
                                                    function calculateFine(borrowDateStr, dueDateStr) {
                                                        const today = new Date();
                                                        const dueDate = new Date(dueDateStr);
                                                        if (today <= dueDate) {
                                                            return 0;
                                                        }
                                                        const timeDiff = today - dueDate;
                                                        const daysOverdue = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
                                                        return daysOverdue * 10; // Rs. 10 per day
                                                    }

                                                    const borrowDateStr = '${borrowing.borrowDate}';
                                                    const dueDateStr = '${borrowing.dueDate}';
                                                    const fineAmount = calculateFine(borrowDateStr, dueDateStr);
                                                    document.getElementById('fine-amount-${borrowing.id}').innerText = fineAmount;
                                                </script>
                                            </c:when>
                                            <c:otherwise>
                                                <!-- Already returned, show stored fine -->
                                                <c:choose>
                                                    <c:when test="${borrowing.fine > 0}">
                                                        <span class="fine-amount">Rs. ${borrowing.fine}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="no-fine">Rs. 0</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
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