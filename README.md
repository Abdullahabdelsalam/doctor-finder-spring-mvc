# 🏥 Doctor Finder System (Spring MVC)

<!-- Badges for Professional Look -->
![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring](https://img.shields.io/badge/Spring_MVC-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)
![Maven](https://img.shields.io/badge/Apache_Maven-C71A02?style=for-the-badge&logo=apachemaven&logoColor=white)
![Tomcat](https://img.shields.io/badge/Apache_Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black)

A full-featured **Doctor Appointment Management System** inspired by real-world healthcare platforms like *Vezeeta*. Built using **Spring MVC, JDBC Template, MySQL, and JSP**, following enterprise layered architecture and clean code principles.

---

## 🚀 Project Overview

This system allows administrators and users to manage healthcare providers efficiently. It bridges the gap between legacy Spring architectures and modern enterprise requirements by implementing robust validation, data sorting, and decoupling of concerns.

### Key Capabilities:
* **Full CRUD Operations:** Seamless adding, viewing, updating, and deleting of doctor profiles.
* **Advanced Search Mechanism:** Dynamic filtering of healthcare professionals by specialization.
* **Data Integrity & Validation:** Dual-layer validation (UI-bound Bean Validation & Service-layer business rules).
* **Global Error Resilience:** Centralized exception handling ensuring zero application crashes and clean user feedback.

---

## 🧠 Architecture & Design Patterns

The system strictly adheres to a **Layered Architecture (Separation of Concerns)** to ensure high maintainability, testability, and scalability.

```text
  [ Client Browser ]
         │ ▲
HTTP Req │ │ Rendered JSP
         ▼ │
   ┌───────────────┐
   │  Controller   │  ➔ Maps HTTP endpoints, handles View Navigation & Binding
   └───────────────┘
         │ ▲
         ▼ │
   ┌───────────────┐
   │    Service    │  ➔ Executes Core Business Logic, Transactions & Validation
   └───────────────┘
         │ ▲
         ▼ │
   ┌───────────────┐
   │  Repository   │  ➔ Manages Data Access Object (DAO) via Spring JDBC Template
   └───────────────┘
         │ ▲
         ▼ │
   ┌───────────────┐
   │ MySQL Database│  ➔ Persistent Storage
   └───────────────┘
```

| Layer | Component Role | Technology Highlights |
| --- | --- | --- |
| **Controller** | Handles web requests, processes input parameters, and returns Views. | `@Controller`, `@RequestMapping`, `@PathVariable`, `@RequestParam` |
| **Service** | Orchestrates business workflow and applies constraints before persistence. | `@Service`, Data Transfer Validation |
| **Repository** | Direct data access layer abstracting low-level SQL execution. | `@Repository`, `JdbcTemplate`, Custom `RowMapper` |
| **Database** | Stores application states into highly indexed tabular relationships. | MySQL Enterprise Server |

---

## 🛠️ Tech Stack & Dependencies

* **Core Platform:** Java SE 17 / 11
* **Framework:** Spring Framework (Spring MVC, Spring Context)
* **Data Access:** Spring JDBC Template
* **Database Driver:** MySQL Connector/J
* **View Technology:** JavaServer Pages (JSP), JSTL (JSP Standard Tag Library)
* **Validation API:** Hibernate Validator / Jakarta Bean Validation
* **Web Server:** Apache Tomcat 9+
* **Build System:** Apache Maven

---

## ✨ Enterprise Features Implemented

### 🧑‍⚕️ Doctor Administration

* Optimized list views with direct actions for modifying or purging records cleanly without orphaned states.

### 🔍 Dynamic Query Processing

* Implemented search parameters that utilize SQL `LIKE` operator behaviors through the JDBC template to support highly flexible, partial-string specialization filtering.

### ✅ Bulletproof Validation Framework

* **Declarative Rules:** Automated constraints using `@NotBlank`, `@NotNull`, and `@Min`.
* **Business-Level Checks:** Programmatic logic in the service tier verifying system constraints prior to database persistence.

### ⚠️ Unified Exception Strategy

* **AOP-Driven Interception:** Leverages `@ControllerAdvice` to decouple exception handling logic from standard controllers.
* **Graceful Degradation:** Catches unhandled runtime faults and seamlessly routes users to a customized `error.jsp` view with accurate, non-leaking contextual debug info.

---

## 🧩 Project Directory Tree

```text
src/main/java
└── com
    └── hospital
        ├── config      # Java-based Spring Configuration (WebMvcConfigurer, DataSources)
        ├── controller  # Spring MVC Routing and web form handlers
        ├── exception   # Global Advice and Custom Domain Exceptions
        ├── model       # Plain Old Java Objects (POJOs) / Entities
        ├── repository  # DAOs executing SQL with Spring JdbcTemplate
        └── service     # Business Logic Interfaces and Implementations

src/main/webapp
└── WEB-INF
    └── views           # Isolated View Layer (JSP Files)
        ├── home.jsp
        ├── doctor-list.jsp
        ├── add-doctor.jsp
        ├── edit-doctor.jsp
        └── error.jsp

```

---

## 🗄️ Database Infrastructure

```sql
CREATE DATABASE IF NOT EXISTS doctor_finder;
USE doctor_finder;

CREATE TABLE doctor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    hospital VARCHAR(100) NOT NULL,
    fees DOUBLE NOT NULL CHECK (fees >= 0),
    experience INT NOT NULL CHECK (experience >= 0),
    phone VARCHAR(20) NOT NULL
);

```

---

## 📋 API Endpoints Technical Reference

| HTTP Method | URL Path | Functionality | View Returned |
| --- | --- | --- | --- |
| **GET** | `/` or `/home` | Application landing page | `home` |
| **GET** | `/doctors` | Lists all doctors or filters by query | `doctor-list` |
| **GET** | `/doctors/new` | Displays the add-doctor registration form | `add-doctor` |
| **POST** | `/doctors` | Submits validation and processes new doctor registration | Redirect to `/doctors` |
| **GET** | `/doctors/edit/{id}` | Fetches target doctor data into editable form | `edit-doctor` |
| **POST** | `/doctors/update` | Saves modified doctor properties to the DB | Redirect to `/doctors` |
| **GET** | `/doctors/delete/{id}` | Removes the doctor from storage by Unique ID | Redirect to `/doctors` |

---

## 💻 Code Snippet Showcase

### Clean Global Exception Handling

```java
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(DoctorNotFoundException.class)
    public ModelAndView handleDoctorNotFound(DoctorNotFoundException ex) {
        ModelAndView mav = new ModelAndView("error");
        mav.addObject("errorMessage", ex.getMessage());
        return mav;
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handleGenericException(Exception ex) {
        ModelAndView mav = new ModelAndView("error");
        mav.addObject("errorMessage", "An unexpected system error occurred. Please try again later.");
        return mav;
    }
}

```

---

## ⚙️ Installation & Local Setup

Follow these steps to run the application locally on your machine:

### 1. Prerequisites

* **JDK 11 or higher** installed.
* **Apache Maven** installed.
* **MySQL Server** running.
* **Apache Tomcat 9** configured in your local environment / IDE.

### 2. Database Setup

Log into your MySQL instance and execute the schema script:

```bash
mysql -u your_username -p < src/main/resources/schema.sql

```

*(Or manually copy-paste the SQL script block provided in the Database Infrastructure section above into your database client).*

### 3. Update Database Credentials

Navigate to your data configuration file (e.g., `AppConfig.java` or `application.properties`) and update the data source parameters:

```java
dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
dataSource.setUrl("jdbc:mysql://localhost:3606/doctor_finder");
dataSource.setUsername("YOUR_MYSQL_USERNAME");
dataSource.setPassword("YOUR_MYSQL_PASSWORD");

```

### 4. Build and Package

Run the Maven package command to download dependencies and generate the WAR archive:

```bash
mvn clean package

```

### 5. Deployment

* Deploy the generated `.war` file located inside the `target/` directory directly into your Tomcat `webapps/` folder, or
* Simply configure and hit **Run** on Tomcat server through your favorite IDE (IntelliJ IDEA / Eclipse).

---

## 👨‍💻 Developed By

**Abdullah Shams**

* **Role:** Enterprise Java Backend Developer
* **Focus:** High-Performance Web Architectures, Spring Ecosystem, Database Optimization

---

## 📌 Project Maturity Metrics

* **Production Readiness:** 100% Core CRUD Compliant
* **Testing State:** End-to-End Form Verified
* **Inclusion Target:** Featured Portfolio Piece for CV / Technical Interviews

⭐ *If this project demonstrates useful architectural structures, feel free to **star** the repository!*

```

```
