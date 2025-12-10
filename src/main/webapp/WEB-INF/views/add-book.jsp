<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Library - Add Book</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .form-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 30px;
            background: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            color: #333;
            margin-bottom: 25px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
        }
        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            font-family: Arial, sans-serif;
            box-sizing: border-box;
        }
        .form-group textarea {
            resize: vertical;
            min-height: 100px;
        }
        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            outline: none;
            border-color: #4CAF50;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.3);
        }
        .form-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 30px;
        }
        .form-buttons button {
            padding: 12px 30px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        .btn-submit {
            background-color: #4CAF50;
            color: white;
        }
        .btn-submit:hover {
            background-color: #45a049;
        }
        .btn-cancel {
            background-color: #f44336;
            color: white;
        }
        .btn-cancel:hover {
            background-color: #da190b;
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
            <div class="dashboard">Add Book</div>
        </div>
    </header>

    <div class="form-container">
        <h2>Add New Book</h2>
        <form action="${pageContext.request.contextPath}/books/add" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Book Name *</label>
                <input type="text" id="name" name="name" required placeholder="Enter book name">
            </div>

            <div class="form-group">
                <label for="author">Author *</label>
                <input type="text" id="author" name="author" required placeholder="Enter author name">
            </div>

            <div class="form-group">
                <label for="publisher">Publisher *</label>
                <input type="text" id="publisher" name="publisher" required placeholder="Enter publisher name">
            </div>

            <div class="form-group">
                <label for="quantity">Quantity *</label>
                <input type="number" id="quantity" name="quantity" required min="0" placeholder="Enter quantity">
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" placeholder="Enter book description"></textarea>
            </div>

            <div class="form-group">
                <label for="coverImage">Cover Image</label>
                <input type="file" id="coverImage" name="coverImage" accept="image/*">
            </div>

            <div class="form-buttons">
                <button type="submit" class="btn-submit">Add Book</button>
                <button type="button" class="btn-cancel" onclick="history.back()">Cancel</button>
            </div>
        </form>
    </div>
</body>

</html>