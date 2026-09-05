<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<head>
    <title>Đặt Lại Mật Khẩu</title>
</head>
<body>
    <div class="row justify-content-center my-4">
        <div class="col-12 col-sm-9 col-md-6 col-lg-4">
            <div class="card shadow-sm border-0 rounded-3">
                <div class="card-body p-4">
                    <h4 class="card-title text-center fw-bold text-primary mb-3">
                        <i class="bi bi-key-fill me-1"></i> ĐẶT LẠI MẬT KHẨU
                    </h4>
                    <p class="text-muted text-center small mb-4">
                        Nhập mã OTP nhận qua email và thiết lập mật khẩu mới cho tài khoản.
                    </p>


                    <c:if test="${error != null}">
                        <div class="alert alert-danger alert-dismissible fade show py-2 small" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-1"></i> ${error}
                            <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/reset-password" method="post" novalidate>
                        <input type="hidden" name="email" value="${sessionScope.reset_email}">

                        <div class="mb-3">
                            <label for="otp" class="form-label fw-semibold">Mã OTP (trong email)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-shield-check"></i></span>
                                <input type="text" class="form-control text-center fw-bold" id="otp" name="otp" 
                                       placeholder="Nhập mã OTP" maxlength="10" required autofocus>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="password" class="form-label fw-semibold">Mật khẩu mới</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-lock"></i></span>
                                <input type="password" class="form-control" id="password" name="password" 
                                       placeholder="Nhập mật khẩu mới" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">
                            <i class="bi bi-check-circle me-1"></i> Cập nhật mật khẩu
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