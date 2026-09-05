<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<head>
    <title>Đăng Nhập Hệ Thống</title>
</head>
<body>
    <div class="row justify-content-center my-4">
        <div class="col-12 col-sm-9 col-md-6 col-lg-4">
            <div class="card shadow-sm border-0 rounded-3">
                <div class="card-body p-4">
                    <h4 class="card-title text-center fw-bold text-primary mb-4">
                        <i class="bi bi-box-arrow-in-right me-1"></i> ĐĂNG NHẬP
                    </h4>

                    <c:if test="${not empty message}">
                        <div class="alert alert-success alert-dismissible fade show py-2 small" role="alert">
                            <i class="bi bi-check-circle-fill me-1"></i> ${message}
                            <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show py-2 small" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-1"></i> ${error}
                            <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/login" method="post" novalidate>
                        <div class="mb-3">
                            <label for="account" class="form-label fw-semibold">Tài khoản / Email <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-person"></i></span>
                                <input type="text" class="form-control" id="account" name="account" 
                                       value="${account}" placeholder="Username hoặc email" required autofocus>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label fw-semibold">Mật khẩu <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-lock"></i></span>
                                <input type="password" class="form-control" id="password" name="password" 
                                       placeholder="Nhập mật khẩu" required>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="remember" value="on" id="remember">
                                <label class="form-check-label text-muted small" for="remember">
                                    Ghi nhớ đăng nhập
                                </label>
                            </div>
                            <a href="${pageContext.request.contextPath}/forgot-password" class="text-decoration-none small">Quên mật khẩu?</a>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">
                            <i class="bi bi-box-arrow-in-right me-1"></i> Đăng Nhập
                        </button>
                    </form>

                    <hr class="my-4 text-muted">

                    <div class="text-center small">
                        Chưa có tài khoản? 
                        <a href="${pageContext.request.contextPath}/register" class="fw-semibold text-decoration-none">Đăng ký ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>