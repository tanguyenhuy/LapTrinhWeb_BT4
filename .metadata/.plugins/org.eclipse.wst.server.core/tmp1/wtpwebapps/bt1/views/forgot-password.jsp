<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<head>
    <title>Quên Mật Khẩu</title>
</head>
<body>
    <div class="row justify-content-center my-4">
        <div class="col-12 col-sm-9 col-md-6 col-lg-4">
            <div class="card shadow-sm border-0 rounded-3">
                <div class="card-body p-4">
                    <h4 class="card-title text-center fw-bold text-primary mb-3">
                        <i class="bi bi-shield-lock me-1"></i> QUÊN MẬT KHẨU
                    </h4>
                    <p class="text-muted text-center small mb-4">
                        Nhập địa chỉ email đăng ký để nhận mã xác thực OTP khôi phục mật khẩu.
                    </p>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show py-2 small" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-1"></i> ${error}
                            <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/forgot-password" method="post" novalidate>
                        <div class="mb-3">
                            <label for="email" class="form-label fw-semibold">Email tài khoản <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-envelope"></i></span>
                                <input type="email" class="form-control" id="email" name="email" 
                                       value="${email}" placeholder="name@example.com" required autofocus>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">
                            <i class="bi bi-send me-1"></i> Gửi mã OTP qua Mail
                        </button>
                    </form>

                    <hr class="my-4 text-muted">

                    <div class="text-center small">
                        <a href="${pageContext.request.contextPath}/login" class="fw-semibold text-decoration-none">
                            <i class="bi bi-arrow-left me-1"></i> Quay lại Đăng nhập
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>