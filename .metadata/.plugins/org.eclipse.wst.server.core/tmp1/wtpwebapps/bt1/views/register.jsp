<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<head>
    <title>Đăng Ký Tài Khoản</title>
</head>
<body>
    <div class="row justify-content-center my-4">
        <div class="col-12 col-sm-10 col-md-7 col-lg-5">
            <div class="card shadow-sm border-0 rounded-3">
                <div class="card-body p-4 p-md-5">
                    <h4 class="card-title text-center fw-bold text-primary mb-3">
                        <i class="bi bi-person-plus-fill me-2"></i>ĐĂNG KÝ TÀI KHOẢN
                    </h4>
                    <p class="text-muted text-center small mb-4">
                        Tạo tài khoản mới để nhận mã OTP kích hoạt qua Email.
                    </p>

                    <c:if test="${error != null}">
                        <div class="alert alert-danger alert-dismissible fade show py-2 small" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-1"></i> ${error}
                            <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/register" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label fw-semibold">Tên đăng nhập</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-person"></i></span>
                                <input type="text" class="form-control" id="username" name="username" 
                                       placeholder="Nhập username" required autofocus>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label fw-semibold">Email nhận OTP</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-envelope"></i></span>
                                <input type="email" class="form-control" id="email" name="email" 
                                       placeholder="name@example.com" required>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="fullname" class="form-label fw-semibold">Họ và tên</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-card-text"></i></span>
                                <input type="text" class="form-control" id="fullname" name="fullname" 
                                       placeholder="Nguyễn Văn A" required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="password" class="form-label fw-semibold">Mật khẩu</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-lock"></i></span>
                                <input type="password" class="form-control" id="password" name="password" 
                                       placeholder="Nhập mật khẩu an toàn" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">
                            <i class="bi bi-send-check me-1"></i> Đăng ký và Nhận OTP
                        </button>
                    </form>

                    <hr class="my-4 text-muted">

                    <div class="text-center small">
                        Đã có tài khoản? 
                        <a href="${pageContext.request.contextPath}/login" class="fw-semibold text-decoration-none">
                            Đăng nhập ngay
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>