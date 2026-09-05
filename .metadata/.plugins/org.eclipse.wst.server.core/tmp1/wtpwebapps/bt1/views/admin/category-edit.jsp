<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<head>
    <title>Cập Nhật Danh Mục</title>
</head>
<body>
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/categories" class="text-decoration-none">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/categories" class="text-decoration-none">Quản lý danh mục</a></li>
            <li class="breadcrumb-item active" aria-current="page">Cập nhật</li>
        </ol>
    </nav>

    <div class="row justify-content-center my-3">
        <div class="col-12 col-md-8 col-lg-6">
            <div class="card shadow-sm border-0 rounded-3">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="card-title fw-bold text-primary mb-0">
                        <i class="bi bi-pencil-square me-2"></i>CẬP NHẬT DANH MỤC
                    </h5>
                </div>
                <div class="card-body p-4">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show py-2 small" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                            <button type="button" class="btn-close py-2" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/admin/category/update" method="post" enctype="multipart/form-data" novalidate>
                        <input type="hidden" name="categoryId" value="${category.categoryid}">

                        <div class="mb-3">
                            <label for="categoryname" class="form-label fw-semibold">Tên danh mục <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-tag"></i></span>
                                <input type="text" class="form-control" id="categoryname" name="categoryname" 
                                       value="${category.categoryname}" minlength="2" maxlength="100" required autofocus>
                            </div>
                            <div class="form-text text-muted small">Độ dài từ 2 đến 100 ký tự.</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold d-block">Ảnh hiện tại</label>
                            <div class="mb-2">
                                <c:choose>
                                    <c:when test="${category.images != null && category.images.startsWith('http')}">
                                        <img src="${category.images}" alt="${category.categoryname}" class="rounded border shadow-sm" style="width: 120px; height: 100px; object-fit: cover;">
                                    </c:when>
                                    <c:when test="${category.images != null && not empty category.images}">
                                        <img src="${pageContext.request.contextPath}/image?fname=${category.images}" alt="${category.categoryname}" class="rounded border shadow-sm" style="width: 120px; height: 100px; object-fit: cover;">
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-light text-muted border">Chưa có ảnh</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <label for="imageFile" class="form-label fw-semibold">Tải file ảnh mới (nếu muốn thay đổi)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-upload"></i></span>
                                <input class="form-control" type="file" id="imageFile" name="imageFile" accept="image/*">
                            </div>
                            <div class="form-text text-muted small">Chấp nhận JPG, PNG, WEBP, GIF (Tối đa 5MB).</div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-semibold d-block">Trạng thái danh mục</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="ston" name="status" value="1" ${category.status == 1 ? 'checked' : ''}>
                                <label class="form-check-label" for="ston">
                                    <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1">Hoạt động</span>
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="stoff" name="status" value="0" ${category.status != 1 ? 'checked' : ''}>
                                <label class="form-check-label" for="stoff">
                                    <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-2 py-1">Khóa</span>
                                </label>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between align-items-center pt-3 border-top">
                            <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-outline-secondary">
                                <i class="bi bi-arrow-left me-1"></i> Hủy bỏ
                            </a>
                            <button type="submit" class="btn btn-primary px-4 fw-semibold">
                                <i class="bi bi-check2-circle me-1"></i> Cập nhật danh mục
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>