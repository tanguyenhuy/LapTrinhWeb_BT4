<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<head>
    <title>Hồ Sơ Cá Nhân - ${user.fullname}</title>
</head>
<body>
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home" class="text-decoration-none">Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Hồ sơ cá nhân</li>
        </ol>
    </nav>

    <div class="row justify-content-center my-3">
        <div class="col-12 col-md-8 col-lg-6">
            <div class="card shadow-sm border-0 rounded-3">
                <div class="card-body p-4 p-md-5">
                    <h4 class="card-title text-center fw-bold text-primary mb-4">
                        <i class="bi bi-person-gear me-2"></i>THÔNG TIN TÀI KHOẢN
                    </h4>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show py-2 small" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-1"></i> ${error}
                            <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <c:if test="${not empty message}">
                        <div class="alert alert-success alert-dismissible fade show py-2 small" role="alert">
                            <i class="bi bi-check-circle-fill me-1"></i> ${message}
                            <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/home/profile" method="post" enctype="multipart/form-data" novalidate>
                        
                        <div class="text-center mb-4">
                            <div class="d-inline-block position-relative">
                                <c:choose>
                                    <c:when test="${user.images != null && user.images.startsWith('http')}">
                                        <img src="${user.images}" alt="Avatar" class="rounded-circle shadow-sm border border-3 border-primary-subtle" style="width: 125px; height: 125px; object-fit: cover;">
                                    </c:when>
                                    <c:when test="${user.images != null && not empty user.images}">
                                        <img src="${pageContext.request.contextPath}/image?fname=${user.images}" alt="Avatar" class="rounded-circle shadow-sm border border-3 border-primary-subtle" style="width: 125px; height: 125px; object-fit: cover;">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://ui-avatars.com/api/?name=${user.username}&size=125&background=0d6efd&color=fff" alt="Avatar" class="rounded-circle shadow-sm border border-3 border-primary-subtle" style="width: 125px; height: 125px; object-fit: cover;">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="imageFile" class="form-label fw-semibold">Đổi ảnh đại diện</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-camera"></i></span>
                                <input class="form-control" type="file" id="imageFile" name="imageFile" accept="image/*">
                            </div>
                            <div class="form-text text-muted small">Chấp nhận JPG, PNG, WEBP (Tối đa 5MB).</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Tên đăng nhập (Username)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-person"></i></span>
                                <input type="text" class="form-control bg-light text-muted" value="${user.username}" readonly>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Địa chỉ Email</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-envelope"></i></span>
                                <input type="email" class="form-control bg-light text-muted" value="${user.email}" readonly>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="fullname" class="form-label fw-semibold">Họ và tên <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-card-text"></i></span>
                                <input type="text" class="form-control" id="fullname" name="fullname" 
                                       value="${user.fullname}" minlength="2" maxlength="100" required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="phone" class="form-label fw-semibold">Số điện thoại</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-telephone"></i></span>
                                <input type="tel" class="form-control" id="phone" name="phone" 
                                       value="${user.phone}" placeholder="VD: 0912345678" 
                                       pattern="(03|05|07|08|09)[0-9]{8}" maxlength="10">
                            </div>
                            <div class="form-text text-muted small">Gồm 10 chữ số, bắt đầu bằng 03, 05, 07, 08 hoặc 09.</div>
                        </div>

                        <div class="d-flex justify-content-between align-items-center pt-2">
                            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">
                                <i class="bi bi-arrow-left me-1"></i> Trang chủ
                            </a>
                            <button type="submit" class="btn btn-primary px-4 fw-semibold">
                                <i class="bi bi-check2-circle me-1"></i> Lưu thay đổi
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>