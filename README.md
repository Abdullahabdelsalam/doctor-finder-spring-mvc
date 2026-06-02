تفضل، الكود كله بالكامل في بلوك واحد جاهز للنسخ المباشر لملف الـ `README.md`:

```markdown
# 🏥 Doctor Finder System (Spring MVC)

A full-featured **Doctor Appointment Management System** inspired by real-world healthcare platforms like *Vezeeta*.  
Built using **Spring MVC, JDBC Template, MySQL, and JSP**, following a clean layered architecture.

---

## 🚀 Project Overview

This system allows users to manage doctors efficiently, including:
* **CRUD Operations:** Adding, viewing, updating, and deleting doctors.
* **Advanced Search:** Filtering doctors dynamically by specialization.
* **Robust Validation:** Form validation and business logic constraints.
* **Global Error Handling:** Clean exception handling across the app.

The project demonstrates a **real enterprise-style Java web application structure**.

---

## 🧠 Architecture

The system follows a clean **Layered Architecture**:
`Controller ➔ Service ➔ Repository ➔ Database`

Each layer has a specific responsibility:

| Layer | Responsibility |
| :--- | :--- |
| **Controller** | Handles HTTP requests and maps them to views |
| **Service** | Manages business logic & data validation |
| **Repository** | Executes database operations (SQL queries) |
| **Database** | Persistent data storage via MySQL |

---

## 🛠️ Technologies Used

* **Backend:** Java, Spring MVC, JDBC Template
* **Database:** MySQL
* **Frontend:** JSP (Java Server Pages), JSTL, HTML5, CSS3
* **Server & Build Tools:** Apache Tomcat, Maven

---

## ✨ Features

### 🧑‍⚕️ Doctor Management
* Add Doctor, View All Doctors, Update Doctor Details, and Delete Doctor.

### 🔍 Search System
* Search doctors by specialization with partial filtering and dynamic results.

### ✅ Validation System
* Bean Validation (`@NotBlank`, `@NotNull`, `@Pattern`).
* Custom Business Validation handled in the Service Layer.

### ⚠️ Exception Handling
* Global Exception Handling using `@ControllerAdvice` and `@ExceptionHandler`.
* Custom error pages (`error.jsp`) displaying clean error messages for users.

---

## 🧩 Project Structure

```text
src/main/java
└── com.hospital
    ├── config
    ├── controller
    ├── exception
    ├── model
    ├── repository
    └── service

src/main/webapp
└── WEB-INF
    └── views
        ├── home.jsp
        ├── doctor-list.jsp
        ├── add-doctor.jsp
        ├── edit-doctor.jsp
        └── error.jsp

```

---

## 🔄 Application Flow

```text
[User Request]
      │
      ▼
[Controller]
      │
      ▼
[Service Layer]  ── (Business Logic & Validation)
      │
      ▼
[Repository Layer] ── (SQL Execution via JDBC Template)
      │
      ▼
[MySQL Database]
      │
      ▼
[Response (JSP View)]

```

---

## 🗄️ Database Schema

```sql
CREATE DATABASE doctor_finder;

USE doctor_finder;

CREATE TABLE doctor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    hospital VARCHAR(100) NOT NULL,
    fees DOUBLE NOT NULL,
    experience INT NOT NULL,
    phone VARCHAR(20) NOT NULL
);

```

---

## 🔐 Validation Rules

* **Name / Specialization / Hospital:** Required fields (Cannot be blank).
* **Fees / Experience:** Must be greater than or equal to 0.
* **Phone:** Must be exactly 11 digits (Validated via Regular Expressions).

---

## 📌 Key Concepts Implemented

* Spring MVC Architecture & `DispatcherServlet` configuration.
* Dependency Injection (DI) & Inversion of Control (IoC).
* Form Handling using Spring Form Tags.
* Path Variables (`@PathVariable`) & Request Parameters (`@RequestParam`).
* Layered Architecture Design Patterns.

---

## 💡 Learning Outcomes

This project demonstrates:

1. Real-world Spring MVC development and configuration.
2. Clean database integration using Spring JDBC Template.
3. Proper exception handling strategy in web applications.
4. Structuring code for maximum maintainability and scalability.

---

## 👨‍💻 Author

**Abdullah Shams**

* Java Developer
* Spring MVC Enthusiast
* Backend Development Learner

---

## 📌 Status

* **Completed**
* **Tested**
* **Ready for CV / Interview Showcase**

⭐ *If you like this project, feel free to star the repository and explore the code!*

```

```
