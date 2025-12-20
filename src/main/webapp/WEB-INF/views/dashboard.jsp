<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
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
            <div class="dashboard">Admin Dashboard</div>
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
            <div class="dashboard-content">
                <h2>Dashboard Overview</h2>
                
                <div class="stats-grid">
                    <div class="stat-card">
                        <i class="fa-solid fa-book"></i>
                        <h3>Total Books</h3>
                        <p>Manage your book collection</p>
                    </div>
                    <div class="stat-card">
                        <i class="fa-solid fa-users"></i>
                        <h3>Total Users</h3>
                        <p>View registered users</p>
                    </div>
                    <div class="stat-card">
                        <i class="fa-solid fa-check-circle"></i>
                        <h3>Available Books</h3>
                        <p>In stock books</p>
                    </div>
                    <div class="stat-card">
                        <i class="fa-solid fa-times-circle"></i>
                        <h3>Unavailable</h3>
                        <p>Out of stock</p>
                    </div>
                </div>

                <div class="dashboard-actions">
                    <h3>Quick Actions</h3>
                    <div class="action-buttons">
                        <a href="${pageContext.request.contextPath}/books/add" class="action-btn btn-primary">
                            <i class="fa-solid fa-plus"></i> Add New Book
                        </a>
                        <a href="${pageContext.request.contextPath}/books" class="action-btn btn-info">
                            <i class="fa-solid fa-list"></i> View All Books
                        </a>
                        <a href="${pageContext.request.contextPath}/books/available" class="action-btn btn-warning">
                            <i class="fa-solid fa-filter"></i> Available Books Only
                        </a>
                        <a href="${pageContext.request.contextPath}/viewusers" class="action-btn btn-danger">
                            <i class="fa-solid fa-users"></i> Manage Users
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>