<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success | Classare</title>

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --success-color: #10b981;
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

        .success-card {
            background: #ffffff;
            border: none;
            border-radius: 32px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.04);
            border: 1px solid #e2e8f0;
            padding: 3.5rem;
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        .success-icon-box {
            width: 80px;
            height: 80px;
            background: #ecfdf5;
            color: var(--success-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            margin: 0 auto 2rem;
            animation: scaleIn 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
        }

        .btn-action {
            border-radius: 12px;
            padding: 0.75rem 1.5rem;
            font-weight: 700;
            font-size: 0.95rem;
            transition: all 0.2s ease;
        }

        .btn-add-more {
            background-color: var(--dark-navy);
            color: white;
            border: none;
        }
        .btn-add-more:hover {
            background-color: #1e293b;
            transform: translateY(-2px);
        }

        .btn-view-all {
            background-color: transparent;
            color: #64748b;
            border: 1.5px solid #e2e8f0;
        }
        .btn-view-all:hover {
            background-color: #f1f5f9;
            color: var(--dark-navy);
            border-color: #cbd5e1;
        }

        @keyframes scaleIn {
            0% { transform: scale(0); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center">
    <div class="success-card">

        <div class="success-icon-box">
            <i class="fa-solid fa-circle-check"></i>
        </div>

        <h2 class="fw-800 mb-2" style="color: var(--dark-navy);">Doctor Saved Successfully</h2>
        <p class="text-muted small mb-4">The medical profile has been encrypted and synchronized into Classare database.</p>

        <hr class="my-4 opacity-25">

        <div class="d-grid gap-2 d-md-flex justify-content-md-center">
            <a href="addDoctor" class="btn btn-action btn-add-more shadow-sm">
                <i class="fa-solid fa-plus me-2"></i> Add Another Doctor
            </a>
            <a href="doctors" class="btn  btn-view-all">
                <i class="fa-solid fa-list me-2"></i> View Doctors List
            </a>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>