<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<head>
    <title>${p.productName} - Chi Tiết Sản Phẩm</title>
</head>
<body>
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home" class="text-decoration-none">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/product" class="text-decoration-none">Sản phẩm</a></li>
            <li class="breadcrumb-item active" aria-current="page">${p.productName}</li>
        </ol>
    </nav>

    <div class="card shadow-sm border-0 rounded-3">
        <div class="card-body p-4 p-md-5">
            <div class="row g-4 align-items-center">
                
                <div class="col-12 col-md-5 text-center">
                    <c:choose>
                        <c:when test="${p.image != null && p.image.startsWith('http')}">
                            <img src="${p.image}" alt="${p.productName}" class="img-fluid rounded-3 shadow-sm border" style="max-height: 380px; width: 100%; object-fit: cover;">
                        </c:when>
                        <c:when test="${p.image != null && not empty p.image}">
                            <img src="${pageContext.request.contextPath}/image?fname=${p.image}" alt="${p.productName}" class="img-fluid rounded-3 shadow-sm border" style="max-height: 380px; width: 100%; object-fit: cover;">
                        </c:when>
                        <c:otherwise>
                            <img src="https://placehold.co/400x350?text=No+Image" alt="${p.productName}" class="img-fluid rounded-3 shadow-sm border" style="max-height: 380px; width: 100%; object-fit: cover;">
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="col-12 col-md-7">
                    <div class="d-flex align-items-center gap-2 mb-2">
                        <span class="badge bg-primary-subtle text-primary border border-primary-subtle px-2 py-1">
                            <i class="bi bi-folder2-open me-1"></i>${not empty p.category ? p.category.categoryname : 'Chưa phân loại'}
                        </span>
                        <c:choose>
                            <c:when test="${p.quantity > 0}">
                                <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1">
                                    <i class="bi bi-check-circle me-1"></i>Còn hàng (${p.quantity})
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-2 py-1">
                                    <i class="bi bi-x-circle me-1"></i>Tạm hết hàng
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <h2 class="fw-bold text-dark mb-3">${p.productName}</h2>

                    <div class="p-3 bg-light rounded-3 mb-3">
                        <span class="text-muted small d-block">Giá bán chính thức:</span>
                        <span class="text-danger fw-bold fs-3">
                            <fmt:formatNumber value="${p.price}" pattern="#,###" /> VNĐ
                        </span>
                    </div>

                    <div class="mb-4">
                        <h6 class="fw-bold text-secondary mb-2">Mô tả sản phẩm:</h6>
                        <p class="text-muted mb-0" style="line-height: 1.6;">
                            ${not empty p.description ? p.description : 'Đang cập nhật nội dung mô tả cho sản phẩm này.'}
                        </p>
                    </div>

                    <div class="d-flex flex-wrap gap-2 pt-3 border-top">
                        <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left me-1"></i> Quay lại danh sách
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>