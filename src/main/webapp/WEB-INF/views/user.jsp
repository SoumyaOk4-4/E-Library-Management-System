<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - Users Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
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
            <div class="dashboard">Users Management</div>
        </div>
    </header>

    <div class="middle">
        <div class="sidebar">
            <div class="api-call-btn">
                <a href="${pageContext.request.contextPath}/">
                    <i class="fa-solid fa-house"></i>
                    Home
                </a>
            </div>
            <div class="api-call-btn">
                <a href="${pageContext.request.contextPath}/books/add">
                    <i class="fa-solid fa-book"></i>
                    Add Book
                </a>
            </div>
            <div class="api-call-btn">
                <a href="${pageContext.request.contextPath}/books">
                    <i class="fa-solid fa-database"></i>
                    View Books
                </a>
            </div>
            <div class="api-call-btn">
                <a href="${pageContext.request.contextPath}/viewusers">
                    <i class="fa-solid fa-user"></i>
                    View Users
                </a>
            </div>
            <div class="api-call-btn">
                <a href="${pageContext.request.contextPath}/logout">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                    Logout
                </a>
            </div>
        </div>

        <div class="view">
            <div class="users-container">
                <div class="users-header">
                    <h2>Users List</h2>
                </div>

                <c:choose>
                    <c:when test="${not empty userdata}">
                        <div class="users-table-wrapper">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone Number</th>
                                        <th>Role</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="u" items="${userdata}">
                                        <tr>
                                                <td>${u.id}</td>
                                                <td>${u.name}</td>
                                                <td>${u.email}</td>
                                                <td>${u.phno}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${u.role == 'admin'}">
                                                            <span class="role-badge role-admin">Admin</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="role-badge role-customer">Customer</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="action-column">
                                                    <a href="${pageContext.request.contextPath}/viewusers/edit/${u.id}" class="btn-edit">
                                                        <i class="fa-solid fa-pen"></i> Edit
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/viewusers/delete/${u.id}" class="btn-delete" onclick="return confirm('Delete this user?');">
                                                        <i class="fa-solid fa-trash"></i> Delete
                                                    </a>
                                                </td>
                                            </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="no-users">
                            <i class="fa-solid fa-users"></i>
                            <h3>No Users Found</h3>
                            <p>There are no registered users yet.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</body>

</html>