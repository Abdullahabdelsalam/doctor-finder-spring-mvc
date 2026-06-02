<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Error | Classare</title>

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --danger-color: #ef4444; /* اللون الأحمر العصري */
            --dark-navy: #0f172a;
            --bg-light: #f8fafc;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg-light);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .error-card {
            background: #ffffff;
            border: none;
            border-radius: 32px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.04);
            border: 1px solid #e2e8f0;
            padding: 3.5rem 2.5rem;
            max-width: 550px;
            width: 100%;
            text-align: center;
        }

        .error-icon-box {
            width: 80px;
            height: 80px;
            background: #fef2f2;
            color: var(--danger-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            margin: 0 auto 1.5rem;
            animation: pulseAlert 2s infinite;
        }

        .error-details-box {
            background-color: #f8fafc;
            border: 1.5px dashed #fluid #e2e8f0;
            border-radius: 14px;
            padding: 1rem;
            font-family: monospace;
            font-size: 0.9rem;
            color: #64748b;
            text-align: left;
            word-break: break-word;
        }

        .btn-action {
            border-radius: 12px;
            padding: 0.75rem 1.5rem;
            font-weight: 700;
            font-size: 0.95rem;
            transition: all 0.2s ease;
            text-decoration: none;
        }

        .btn-back {
            background-color: var(--dark-navy);
            color: white;
            border: none;
        }
        .btn-back:hover {
            background-color: #1e293b;
            transform: translateY(-2px);
            color: white;
        }

        @keyframes pulseAlert {
            0% { transform: scale(1); box-shadow: 0 0 0 0 rgba(239, 68, 68, 0.2); }
            70% { transform: scale(1.05); box-shadow: 0 0 0 15px rgba(239, 68, 68, 0); }
            100% { transform: scale(1); box-shadow: 0 0 0 0 rgba(239, 68, 68, 0); }
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center">
    <div class="error-card">

        <div class="error-icon-box">
            <i class="fa-solid fa-triangle-exclamation"></i>
        </div>

        <h2 class="fw-800 mb-2" style="color: var(--dark-navy);">Something went wrong</h2>
        <p class="text-muted small mb-4">Classare encountered an unexpected issue while processing this request.</p>

        <div class="mb-4">
            <div class="small fw-bold text-start text-secondary mb-2 uppercase tracking-wider" style="font-size: 0.75rem;">Error Diagnostics:</div>
            <div class="error-details-box">
                <i class="fa-solid fa-bug me-2 text-danger"></i>
                <c:choose>
                    <c:when test="${not empty errorMessage}">
                        ${errorMessage}
                    </c:when>
                    <c:otherwise>
                        An unknown execution exception has occurred.
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <hr class="my-4 opacity-25">

        <div class="d-grid">
            <a href="${pageContext.request.contextPath}/doctors" class="btn btn-action btn-back shadow-sm">
                <i class="fa-solid fa-arrow-left-long me-2"></i> Return to Doctors Directory
            </a>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>