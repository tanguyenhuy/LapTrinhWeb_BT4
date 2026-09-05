<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<head>
    <title>Xác Thực Mã OTP</title>
</head>
<body>
    <div class="row justify-content-center my-4">
        <div class="col-12 col-sm-9 col-md-6 col-lg-4">
            <div class="card shadow-sm border-0 rounded-3">
                <div class="card-body p-4">
                    <h4 class="card-title text-center fw-bold text-primary mb-3">
                        <i class="bi bi-shield-check me-1"></i> XÁC THỰC MÃ OTP
                    </h4>
                    <p class="text-muted text-center small mb-3">
                        Hệ thống đã gửi mã xác thực gồm 6 chữ số đến email: <br>
                        <span class="fw-bold text-dark">
                            ${not empty email ? email : (not empty sessionScope.verify_email ? sessionScope.verify_email : sessionScope.verifyEmail)}
                        </span>
                    </p>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show py-2 small" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-1"></i> ${error}
                            <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/verify-otp" method="post" novalidate>
                        <input type="hidden" name="email" 
                               value="${not empty email ? email : (not empty sessionScope.verify_email ? sessionScope.verify_email : sessionScope.verifyEmail)}">

                        <div class="mb-4">
                            <label for="otp" class="form-label fw-semibold">Nhập mã OTP <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-key"></i></span>
                                <input type="text" class="form-control text-center fw-bold fs-4" id="otp" name="otp" 
                                       value="${otp}" maxlength="6" pattern="[0-9]{6}" inputmode="numeric" 
                                       autocomplete="one-time-code" placeholder="000000" style="letter-spacing: 6px;" required autofocus>
                            </div>
                            <div class="form-text text-muted small text-center mt-1">Mã xác thực gồm 6 chữ số.</div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">
                            <i class="bi bi-patch-check me-1"></i> Kích hoạt ngay
                        </button>
                    </form>

                    <hr class="my-4 text-muted">

                    <div class="text-center small">
                        Chưa nhận được mã hoặc cần đổi tài khoản? 
                        <a href="${pageContext.request.contextPath}/register" class="fw-semibold text-decoration-none">
                            Đăng ký lại
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>