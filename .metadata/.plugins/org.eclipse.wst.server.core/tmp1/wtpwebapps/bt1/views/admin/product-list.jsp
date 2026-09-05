<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<head>
    <title>Quản Lý Sản Phẩm</title>
</head>
<body>
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/products" class="text-decoration-none">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">Quản lý sản phẩm</li>
        </ol>
    </nav>

    <div class="card shadow-sm border-0 rounded-3">
        <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
            <h5 class="card-title fw-bold text-primary mb-0">
                <i class="bi bi-box-seam me-2"></i>DANH SÁCH SẢN PHẨM
            </h5>
            <a href="${pageContext.request.contextPath}/admin/product/add" class="btn btn-success btn-sm fw-semibold">
                <i class="bi bi-plus-circle me-1"></i> Thêm mới sản phẩm
            </a>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover table-bordered align-middle text-center mb-0">
                    <thead class="table-primary text-nowrap">
                        <tr>
                            <th scope="col" style="width: 5%;">ID</th>
                            <th scope="col" style="width: 12%;">Hình ảnh</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col" style="width: 15%;">Giá bán</th>
                            <th scope="col" style="width: 15%;">Danh mục</th>
                            <th scope="col" style="width: 12%;">Trạng thái</th>
                            <th scope="col" style="width: 15%;">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listproduct}" var="p">
                            <tr>
                                <td class="fw-semibold">${p.productId}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${p.image != null && p.image.startsWith('http')}">
                                            <img src="${p.image}" alt="${p.productName}" class="rounded border shadow-sm" style="width: 70px; height: 70px; object-fit: cover;">
                                        </c:when>
                                        <c:when test="${p.image != null && !empty p.image}">
                                            <img src="${pageContext.request.contextPath}/image?fname=${p.image}" alt="${p.productName}" class="rounded border shadow-sm" style="width: 70px; height: 70px; object-fit: cover;">
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-light text-muted border">Không có ảnh</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-start fw-bold text-dark px-3">${p.productName}</td>
                                <td class="text-danger fw-bold">${p.price} VNĐ</td>
                                <td>
                                    <span class="badge bg-primary-subtle text-primary border border-primary-subtle px-2 py-1">
                                        ${p.category.categoryname}
                                    </span>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${p.status == 1}">
                                            <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1">Hoạt động</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-2 py-1">Khóa</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div class="d-inline-flex gap-2">
                                        <a href="${pageContext.request.contextPath}/admin/product/edit?id=${p.productId}" class="btn btn-sm btn-outline-warning text-dark fw-semibold">
                                            <i class="bi bi-pencil-square me-1"></i>Sửa
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/product/delete?id=${p.productId}" class="btn btn-sm btn-outline-danger fw-semibold" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?');">
                                            <i class="bi bi-trash me-1"></i>Xóa
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>