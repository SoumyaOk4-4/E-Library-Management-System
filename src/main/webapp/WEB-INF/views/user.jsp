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
    <style>
        .users-container {
            padding: 30px;
        }
        .users-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        .users-header h2 {
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
        .users-table-wrapper {
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
        .role-badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 600;
        }
        .role-customer {
            background-color: #e3f2fd;
            color: #1976d2;
        }
        .role-admin {
            background-color: #fff3e0;
            color: #f57c00;
        }
        .no-users {
            text-align: center;
            padding: 60px 20px;
            color: #999;
        }
        .no-users i {
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
            <div class="dashboard">Users Management</div>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Search users...">
        </div>
        <div class="notif-profile-cluster">
            <div class="notfication-icon">
                <i class="fa-solid fa-bell"></i>
            </div>
            <div class="profile">
                <div class="profile-name">Admin</div>
                <i class="fa-solid fa-circle-user"></i>
            </div>
        </div>
    </header>

    <div class="middle">
        <div class="sidebar">
            <div class="api-call-btn">
                <a href="${pageContext.request.contextPath}/dashboard">
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
                    <a href="${pageContext.request.contextPath}/dashboard" class="back-btn">
                        <i class="fa-solid fa-arrow-left"></i> Back
                    </a>
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