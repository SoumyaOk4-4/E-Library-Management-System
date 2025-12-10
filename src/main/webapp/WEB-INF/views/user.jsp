<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>E-library - users</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>

    <body>
        <header>
            <div class="logo-dash-cluster">
                <div class="logo">
                    <div class="logo-start">E</div>
                    <div class="logo-end">- Library</div>
                </div>
                <div class="dashboard">Dashboard</div>
            </div>
            <div class="search-bar">
                <input type="text" placeholder="Search...">
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
                    <a href="dashboard">
                        <i class="fa-solid fa-house"></i>
                        Home
                    </a>
                </div>
                <div class="api-call-btn">
                    <a href="#">
                        <i class="fa-solid fa-book"></i>
                        Add Book
                    </a>
                </div>
                <div class="api-call-btn">
                    <a href="#">
                        <i class="fa-solid fa-database"></i>
                        View Books
                    </a>
                </div>
                <div class="api-call-btn">
                    <a href="viewusers">
                        <i class="fa-solid fa-user"></i>
                        View Users
                    </a>
                </div>
                <div class="api-call-btn">
                    <a href="#">
                        <i class="fa-solid fa-arrow-right-from-bracket"></i>
                        Logout
                    </a>
                </div>
            </div>

            <div class="view">
                <div class="user-area">
                    <h1>Users List</h1>
                    <div class="add-user">Add New User</div>
                </div>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Role</th>
                    </tr>

                    <tr class="separator">
                        <td colspan="5">
                            <hr>
                        </td>
                    </tr>

                    <c:forEach var="u" items="${userdata}">
                        <tr>
                            <td>${u.id}</td>
                            <td>${u.name}</td>
                            <td>${u.email}</td>
                            <td>${u.phno}</td>
                            <td>${u.role}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>

    </html>