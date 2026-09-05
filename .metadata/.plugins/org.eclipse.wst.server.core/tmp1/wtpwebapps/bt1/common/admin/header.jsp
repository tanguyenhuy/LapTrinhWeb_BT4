<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top shadow">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/admin/products">
            <i class="bi bi-speedometer2 me-1"></i> ADMIN DASHBOARD
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/admin/categories">
                        <i class="bi bi-folder me-1"></i> Quản lý Danh mục
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/admin/products">
                        <i class="bi bi-box-seam me-1"></i> Quản lý Sản phẩm
                    </a>
                </li>
            </ul>

            <div class="d-flex align-items-center gap-3">
                <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-light btn-sm" target="_blank">
                    <i class="bi bi-box-arrow-up-right me-1"></i> Xem trang Client
                </a>

                <div class="dropdown">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown">
                        <span class="fw-semibold">Admin: ${sessionScope.account.fullname}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/home/profile"><i class="bi bi-person me-2"></i>Hồ sơ</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-2"></i>Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>