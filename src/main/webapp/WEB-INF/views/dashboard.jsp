<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .dashboard-content {
            padding: 30px;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .stat-card i {
            font-size: 40px;
            color: #667eea;
            margin-bottom: 10px;
        }
        .stat-card h3 {
            color: #333;
            margin: 10px 0 5px;
        }
        .stat-card p {
            color: #666;
            font-size: 0.9em;
        }
        .dashboard-actions {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .dashboard-actions h3 {
            margin-bottom: 20px;
            color: #333;
        }
        .action-buttons {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
        }
        .action-btn {
            padding: 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            transition: opacity 0.3s;
        }
        .action-btn:hover {
            opacity: 0.9;
        }
        .btn-primary {
            background-color: #4CAF50;
            color: white;
        }
        .btn-info {
            background-color: #2196F3;
            color: white;
        }
        .btn-warning {
            background-color: #ff9800;
            color: white;
        }
        .btn-danger {
            background-color: #f44336;
            color: white;
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
            <div class="dashboard">Admin Dashboard</div>
        </div>
        <div class="search-bar">
            <form action="${pageContext.request.contextPath}/books/search" method="GET" style="display: flex; width: 100%; gap: 10px;">
                <input type="text" name="query" placeholder="Search books...">
                <button type="submit" style="padding: 10px 20px; background: #667eea; color: white; border: none; border-radius: 4px; cursor: pointer;">Search</button>
            </form>
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