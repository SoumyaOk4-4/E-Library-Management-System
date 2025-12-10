<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-library - dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
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
        </div>
    </div>
</body>

</html>