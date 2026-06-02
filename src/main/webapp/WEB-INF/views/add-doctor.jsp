<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Doctor | Classare</title>

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --primary-color: #6366f1;
            --dark-navy: #0f172a;
            --bg-light: #f8fafc;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg-light);
            color: var(--dark-navy);
        }

        .form-container {
            max-width: 750px;
            margin: 4rem auto;
        }

        .doctor-card {
            background: #ffffff;
            border: none;
            border-radius: 24px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.03);
            border: 1px solid #e2e8f0;
            overflow: hidden;
        }

        .card-header-custom {
            background: var(--dark-navy);
            color: white;
            padding: 2.5rem;
            text-align: center;
            border-bottom: 4px solid var(--primary-color);
        }

        .form-label {
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #64748b;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .form-control {
            border-radius: 12px;
            padding: 0.75rem 1rem;
            border: 1.5px solid #e2e8f0;
            background-color: #f8fafc;
            font-size: 0.95rem;
            transition: all 0.2s ease;
        }

         .form-control:focus {
             background-color: #fff;
             border-color: var(--primary-color);
             box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
         }



        .btn-save {
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 14px;
            font-weight: 800;
            padding: 1rem;
            font-size: 1rem;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.2);
        }

        .btn-save:hover {
            background: #4f46e5;
            transform: translateY(-2px);
            box-shadow: 0 15px 20px -5px rgba(99, 102, 241, 0.3);
        }

        .section-title {
            font-size: 0.85rem;
            font-weight: 800;
            color: var(--primary-color);
            letter-spacing: 0.5px;
            border-bottom: 2px solid #f1f5f9;
            padding-bottom: 8px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container form-container">
    <div class="doctor-card">

        <div class="card-header-custom">
            <i class="fa-solid fa-user-doctor fa-3x mb-3 text-white-50"></i>
            <h3 class="fw-bold mb-1">Doctor Profile Registration</h3>
            <p class="text-white-50 small mb-0">Enter professional profile data to sync with Classare</p>
        </div>

        <div class="p-4 p-md-5">
            <form action="saveDoctor" method="post">
                <div class="row g-4">

                    <div class="col-12">
                        <div class="section-title">PRIMARY DETAILS</div>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fa-solid fa-user"></i> Full Name</label>
                        <input type="text" name="name" class="form-control"  required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fa-solid fa-phone" ></i> Phone Number</label>
                        <input type="tel" name="phone" class="form-control"  required>
                    </div>

                    <div class="col-12">
                        <div class="section-title">PROFESSIONAL & FINANCIALS</div>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fa-solid fa-stethoscope"></i> Specialization</label>
                        <input type="text" name="specialization" class="form-control"  required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fa-solid fa-hospital"></i> Hospital / Clinic</label>
                        <input type="text" name="hospital" class="form-control" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fa-solid fa-money-bill-wave"></i> Consultation Fees ($)</label>
                        <input type="number" step="0.01" name="fees" class="form-control"  required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fa-solid fa-briefcase"></i> Years of Experience</label>
                        <input type="number" name="experience" class="form-control"  min="0" required>
                    </div>

                    <div class="col-12 mt-5">
                        <button type="submit" class="btn btn-save">
                            <i class="fa-solid fa-floppy-disk me-2"></i> Save Doctor Record
                        </button>
                    </div>

                </div>
            </form>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>