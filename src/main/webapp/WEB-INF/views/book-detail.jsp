<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${book.name} - E-Library</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .book-detail-container {
            max-width: 800px;
            margin: 30px auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }
        .book-header {
            display: flex;
            gap: 30px;
            margin-bottom: 30px;
            align-items: flex-start;
        }
        .book-cover {
            flex-shrink: 0;
            width: 200px;
            height: 280px;
            background: #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .book-cover img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .book-info h2 {
            color: #333;
            margin-bottom: 10px;
            font-size: 28px;
        }
        .book-meta {
            margin-bottom: 20px;
        }
        .meta-item {
            margin-bottom: 12px;
            font-size: 16px;
        }
        .meta-item strong {
            color: #555;
            min-width: 100px;
            display: inline-block;
        }
        .meta-item span {
            color: #333;
        }
        .availability {
            padding: 10px 15px;
            border-radius: 4px;
            font-weight: 600;
            display: inline-block;
            margin-bottom: 20px;
        }
        .available {
            background-color: #4CAF50;
            color: white;
        }
        .unavailable {
            background-color: #f44336;
            color: white;
        }
        .book-description {
            margin-top: 25px;
        }
        .book-description h3 {
            color: #333;
            margin-bottom: 15px;
        }
        .book-description p {
            color: #666;
            line-height: 1.6;
        }
        .action-buttons {
            display: flex;
            gap: 15px;
            margin-top: 30px;
            border-top: 1px solid #eee;
            padding-top: 20px;
        }
        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-edit {
            background-color: #2196F3;
            color: white;
        }
        .btn-edit:hover {
            background-color: #0b7dda;
        }
        .btn-delete {
            background-color: #f44336;
            color: white;
        }
        .btn-delete:hover {
            background-color: #da190b;
        }
        .btn-back {
            background-color: #757575;
            color: white;
        }
        .btn-back:hover {
            background-color: #616161;
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
            <div class="dashboard">Book Details</div>
        </div>
    </header>

    <div class="book-detail-container">
        <div class="book-header">
            <div class="book-cover">
                <c:choose>
                    <c:when test="${not empty book.coverImageUrl}">
                        <img src="${book.coverImageUrl}" alt="${book.name}">
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
            <a href="${pageContext.request.contextPath}/books/edit/${book.id}" class="btn btn-edit">
                <i class="fa-solid fa-edit"></i> Edit
            </a>
            <a href="${pageContext.request.contextPath}/books/delete/${book.id}" class="btn btn-delete" onclick="return confirm('Are you sure you want to delete this book?');">
                <i class="fa-solid fa-trash"></i> Delete
            </a>
            <a href="${pageContext.request.contextPath}/books" class="btn btn-back">
                <i class="fa-solid fa-arrow-left"></i> Back to Books
            </a>
        </div>
    </div>
</body>

</html>