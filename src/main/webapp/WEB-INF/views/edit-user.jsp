<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Edit User</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/edit-user.css">
</head>
<body>
	<div class="users-container">
		<div class="users-header">
			<h2>Edit User</h2>
			<a href="${pageContext.request.contextPath}/viewusers" class="back-btn">
				<i class="fa-solid fa-arrow-left"></i> Back
			</a>
		</div>

		<c:if test="${not empty user}">
			<form action="${pageContext.request.contextPath}/viewusers/edit/${user.id}" method="post" style="max-width:600px; background:white; padding:20px; border-radius:8px; box-shadow:0 2px 10px rgba(0,0,0,0.1);">
				<div class="form-group">
					<label for="name">Full Name</label>
					<input type="text" id="name" name="name" value="${user.name}" required />
				</div>

				<div class="form-group">
					<label for="email">Email</label>
					<input type="email" id="email" name="email" value="${user.email}" required />
				</div>

				<div class="form-group">
					<label for="phone">Phone</label>
					<input type="text" id="phone" name="phone" value="${user.phno}" required />
				</div>

				<div class="form-group">
					<label for="role">Role</label>
					<select id="role" name="role" class="form-control">
						<option value="customer" ${user.role == 'customer' ? 'selected' : ''}>Customer</option>
						<option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
					</select>
				</div>

				<div style="margin-top:20px; display:flex; gap:12px;">
					<button type="submit" class="btn-edit">Save Changes</button>
					<a href="${pageContext.request.contextPath}/viewusers" class="btn-delete" style="background:#757575;">Cancel</a>
				</div>
			</form>
		</c:if>

		<c:if test="${empty user}">
			<div class="no-users" style="margin-top:20px;">
				<i class="fa-solid fa-user"></i>
				<h3>User not found</h3>
				<p>The requested user does not exist.</p>
			</div>
		</c:if>
	</div>
</body>
</html>

