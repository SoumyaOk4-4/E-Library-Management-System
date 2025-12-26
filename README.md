# E-Library Management System 📚

**E-Library Management System** is a Spring Boot (JSP) web application that provides a minimal library management experience: users can browse and borrow books, and administrators can manage books and users.

---

## 🚀 Key Features

- Browse all books, view details, search, and filter available books ✅
- Secure admin-only pages for managing books and users (add / edit / delete) 🔐
- Borrow and return books with automatic quantity tracking and overdue fine calculation (10/day) ⏰
- User registration and login with session-based roles (admin / customer) 🧑‍🤝‍🧑
- File upload for book cover images (stored under `uploads/images`) 🖼️
- Demo data SQL script to seed the database with sample users, books and borrowings ✔️

---

## 🧰 Tech Stack

- Java 17
- Spring Boot 3.x (MVC, Data JPA, Validation)
- MySQL (database)
- JSP + JSTL (views)
- Maven (build & run)

---

## 🔧 Requirements

- JDK 17
- Maven (or use the included Maven Wrapper `mvnw` / `mvnw.cmd`)
- MySQL server

---

## ⚙️ Quick Setup

1. Clone the repository

```bash
git clone https://github.com/SoumyaOk4-4/E-Library-Management-System.git
cd E-Library-Management-System
```

2. Create and seed the database (defaults in `src/main/java/com/devs/elib/demo_data.sql`):

```bash
# from a terminal with mysql client access
mysql -u root -p < src/main/java/com/devs/elib/demo_data.sql
```

3. Update DB credentials if needed in `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/elibdb
spring.datasource.username=root
spring.datasource.password=root
server.port=5001
```

4. Build the project

```bash
# Linux / macOS
./mvnw clean package

# Windows
mvnw.cmd clean package
```

5. Run the application

```bash
# using Maven
./mvnw spring-boot:run

# or run the packaged WAR
java -jar target/elib-0.0.1-SNAPSHOT.war
```

6. Open the app in your browser:

http://localhost:5001/

---

## 👤 Demo Credentials

- **Admin:**
  - Email: `admin@elib.com`
  - Password: `admin123`

- Several demo customer accounts also exist (see `demo_data.sql`).

---

## 🔗 Important Routes / Pages

- Public:
  - `/` — Home / Index
  - `/books` — List all books
  - `/books/{id}` — Book detail page
  - `/books/search?query=...` — Search books
  - `/books/available` — Available books
  - `/login`, `/signup` — Auth pages

- Authenticated (customer):
  - `/borrowing/borrow/{bookId}` — Borrow a book
  - `/borrowing/mybookings` — My bookings / borrowed books

- Admin-only:
  - `/books/add` — Add book
  - `/books/edit/{id}`, `/books/delete/{id}` — Manage books
  - `/viewusers` — Manage users
  - `/borrowlist` — View all borrowings
  - `/borrowing/return/{borrowingId}` — Return book

---

## 🗂️ File Uploads

- Default upload directory: `uploads/images` (project root). This can be changed via `file.upload-dir` in `application.properties`.
- Uploaded covers are stored under `uploads/images/<bookId>/`.

---

## ✅ Tests

Run unit tests with:

```bash
./mvnw test
```

---

## ⚠️ Known Limitations & Suggested Improvements

- Passwords are stored in plain text in the DB — **use password hashing** (BCrypt) and integrate Spring Security.
- No rate limiting, brute-force protection, or CSRF protection — move to Spring Security for production-grade protection.
- Consider moving file uploads to cloud storage (S3) and add pagination for book lists.
- Add proper input validation and better error pages for a smoother UX.

---

## 🤝 Contributing

Contributions are welcome! Please open issues or PRs. Small things that help: adding tests, improving security, or polishing the UI.

