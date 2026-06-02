<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctors Management | Classare</title>

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --primary-color: #6366f1;
            --dark-navy: #0f172a;
            --bg-light: #f8fafc;
            --danger-color: #ef4444;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg-light);
            color: var(--dark-navy);
        }

        .main-container {
            padding: 3rem 1.5rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .page-title {
            font-weight: 800;
            font-size: 2.2rem;
            letter-spacing: -1px;
        }

        .stat-card {
            background: white;
            border-radius: 20px;
            padding: 1.5rem;
            border: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            gap: 1rem;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.01);
        }
        .stat-icon {
            width: 48px;
            height: 48px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
        }

        .search-card {
            background: white;
            border-radius: 16px;
            border: 1px solid #e2e8f0;
            padding: 1.25rem;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.01);
        }
        .search-input-group {
            position: relative;
            display: flex;
            align-items: center;
            width: 100%;
        }
        .search-icon-inside {
            position: absolute;
            left: 16px;
            color: #94a3b8;
            font-size: 1.1rem;
            pointer-events: none;
        }
        .search-control {
            border-radius: 12px;
            padding: 0.75rem 1rem 0.75rem 2.75rem;
            border: 1.5px solid #e2e8f0;
            background-color: #f8fafc;
            font-size: 0.95rem;
            transition: all 0.2s ease;
            width: 100%;
        }
        .search-control:focus {
            background-color: #fff;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
            outline: none;
        }
        .btn-search-submit {
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 0.75rem 1.75rem;
            font-weight: 700;
            transition: all 0.2s;
        }
        .btn-search-submit:hover {
            background-color: #4f46e5;
        }

        .table-card {
            background: white;
            border-radius: 24px;
            border: 1px solid #e2e8f0;
            overflow: hidden;
            box-shadow: 0 10px 15px -3px rgba(0,0,0,0.03);
        }

        .table-doctors thead th {
            background: #f8fafc;
            color: #64748b;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 1.2rem 1.5rem;
            border-bottom: 1px solid #e2e8f0;
        }

        .table-doctors tbody td {
            padding: 1.2rem 1.5rem;
            vertical-align: middle;
            border-bottom: 1px solid #f1f5f9;
        }

        .doctor-avatar {
            width: 40px;
            height: 40px;
            background: #eef2ff;
            color: var(--primary-color);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.1rem;
            font-weight: 700;
        }

        .badge-spec {
            background: #eef2ff;
            color: var(--primary-color);
            padding: 6px 12px;
            border-radius: 10px;
            font-weight: 700;
            font-size: 0.8rem;
        }

        .fees-highlight {
            font-weight: 800;
            color: #10b981;
        }

        .btn-action {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 0.9rem;
            transition: 0.2s;
            border: none;
            text-decoration: none;
        }
        .btn-edit { background: #f1f5f9; color: #475569; }
        .btn-edit:hover { background: #e2e8f0; color: var(--dark-navy); }
        .btn-delete { background: #fef2f2; color: var(--danger-color); }
        .btn-delete:hover { background: var(--danger-color); color: white; }

        .modal-content { border: none; border-radius: 24px; }
        .modal-confirm-icon {
            width: 60px; height: 60px; background: #fef2f2; color: var(--danger-color);
            border-radius: 50%; display: flex; align-items: center; justify-content: center;
            font-size: 1.75rem; margin: 0 auto 1rem;
        }
    </style>
</head>
<body>

<div class="main-container">

    <header class="mb-5 d-flex justify-content-between align-items-center flex-wrap gap-3">
        <div>
            <h1 class="page-title text-navy">Doctors Directory 🩺</h1>
            <p class="text-muted mb-0">Manage clinical profiles, specializations, and consulting fees.</p>
        </div>
        <div>
            <a href="addDoctor" class="btn btn-primary rounded-pill px-4 fw-bold shadow-sm" style="background-color: var(--primary-color); border: none;">
                <i class="fa-solid fa-plus me-2"></i> Add New Doctor
            </a>
        </div>
    </header>

    <div class="row g-4 mb-4">
        <div class="col-md-4">
            <div class="stat-card">
                <div class="stat-icon bg-primary bg-opacity-10 text-primary">
                    <i class="fa-solid fa-user-md"></i>
                </div>
                <div>
                    <div class="small text-muted fw-bold">Total Personnel</div>
                    <div class="fs-4 fw-800">Active Registry</div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stat-card">
                <div class="stat-icon bg-success bg-opacity-10 text-success">
                    <i class="fa-solid fa-hospital"></i>
                </div>
                <div>
                    <div class="small text-muted fw-bold">Affiliated Facilities</div>
                    <div class="fs-4 fw-800">Multi-Hospital</div>
                </div>
            </div>
        </div>
    </div>

    <div class="search-card mb-4">
        <form action="searchDoctor" method="get">
            <div class="row g-3 align-items-center">
                <div class="col-md-9 col-sm-8">
                    <div class="search-input-group">
                        <i class="fa-solid fa-magnifying-glass search-icon-inside"></i>
                        <input type="text"
                               name="specialization"
                               class="search-control"
                               placeholder="Search doctors by specialization (e.g. Cardiology)..."
                               value="${param.specialization}"> </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <button type="submit" class="btn btn-search-submit w-100">
                        <i class="fa-solid fa-filter me-2"></i> Search
                    </button>
                </div>
            </div>
        </form>
    </div>

    <c:choose>
        <c:when test="${empty doctors}">
            <div class="text-center p-5 bg-white rounded-5 border border-dashed">
                <i class="fa-solid fa-user-slash text-muted fs-1 mb-3"></i>
                <h5 class="fw-bold">No records found</h5>
                <p class="text-muted mb-0">No doctors match your search or none are registered yet.</p>
                <c:if test="${not empty param.specialization}">
                    <a href="doctor-list" class="btn btn-sm btn-outline-secondary mt-3 rounded-pill">Clear Search</a>
                </c:if>
            </div>
        </c:when>
        <c:otherwise>

            <div class="table-card">
                <div class="table-responsive">
                    <table class="table table-doctors align-middle mb-0">
                        <thead>
                            <tr>
                                <th>Doctor Info</th>
                                <th>Specialization</th>
                                <th>Hospital</th>
                                <th>Experience</th>
                                <th>Fees</th>
                                <th class="text-end">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="doc" items="${doctors}">
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="doctor-avatar">
                                                <i class="fa-solid fa-user-md"></i>
                                            </div>
                                            <div>
                                                <div class="fw-bold text-navy">${doc.name}</div>
                                                <div class="text-muted small"><i class="fa-solid fa-phone me-1"></i> ${doc.phone}</div>
                                            </div>
                                        </div>
                                    </td>

                                    <td>
                                        <span class="badge-spec">${doc.specialization}</span>
                                    </td>

                                    <td class="text-secondary fw-semibold">
                                        <i class="fa-solid fa-building-hospital me-1 opacity-50"></i> ${doc.hospital}
                                    </td>

                                    <td class="fw-bold text-slate">
                                        ${doc.experience} Years
                                    </td>

                                    <td>
                                        <span class="fees-highlight">$${doc.fees}</span>
                                    </td>

                                    <td class="text-end">
                                        <div class="d-inline-flex gap-2">
                                            <a href="editDoctor/${doc.id}" class="btn-action btn-edit" title="Edit Profile">
                                                <i class="fa-solid fa-pen"></i>
                                            </a>
                                            <button type="button" class="btn-action btn-delete" title="Delete Profile"
                                                    onclick="confirmDelete('${doc.id}', '${doc.name}')">
                                                <i class="fa-solid fa-trash-can"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </c:otherwise>
    </c:choose>

</div>

<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" style="max-width: 400px;">
        <div class="modal-content p-3">
            <div class="modal-body text-center">
                <div class="modal-confirm-icon">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                </div>
                <h5 class="fw-800 mb-2">Are you sure?</h5>
                <p class="text-muted small mb-4">You are about to delete <b id="doctorNameTarget" class="text-dark"></b>. This action cannot be undone.</p>

                <div class="d-flex gap-2">
                    <button type="button" class="btn btn-light w-100 rounded-3 fw-bold py-2" data-bs-dismiss="modal">Cancel</button>
                    <a id="finalDeleteBtn" href="#" class="btn btn-danger w-100 rounded-3 fw-bold py-2">Delete</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function confirmDelete(doctorId, doctorName) {
        document.getElementById('doctorNameTarget').innerText = doctorName;
        document.getElementById('finalDeleteBtn').href = 'deleteDoctor/' + doctorId;
        const myModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        myModal.show();
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>