<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<head>
    <title>Cập Nhật Sản Phẩm</title>
</head>
<body>
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/products" class="text-decoration-none">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/products" class="text-decoration-none">Quản lý sản phẩm</a></li>
            <li class="breadcrumb-item active" aria-current="page">Cập nhật</li>
        </ol>
    </nav>

    <div class="row justify-content-center my-3">
        <div class="col-12 col-md-8 col-lg-7">
            <div class="card shadow-sm border-0 rounded-3">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="card-title fw-bold text-primary mb-0">
                        <i class="bi bi-pencil-square me-2"></i>CẬP NHẬT SẢN PHẨM
                    </h5>
                </div>
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/admin/product/update" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="productId" value="${product.productId}">

                        <div class="mb-3">
                            <label for="productName" class="form-label fw-semibold">Tên sản phẩm <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-box-seam"></i></span>
                                <input type="text" class="form-control" id="productName" name="productName" 
                                       value="${product.productName}" required autofocus>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="categoryId" class="form-label fw-semibold">Danh mục <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-folder2-open"></i></span>
                                <select class="form-select" id="categoryId" name="categoryId" required>
                                    <c:forEach items="${categories}" var="c">
                                        <option value="${c.categoryid}" ${c.categoryid == product.category.categoryid ? 'selected' : ''}>
                                            ${c.categoryname}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label for="price" class="form-label fw-semibold">Giá bán (VNĐ) <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="bi bi-cash"></i></span>
                                    <input type="number" step="any" class="form-control" id="price" name="price" 
                                           value="${product.price}" min="0" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="quantity" class="form-label fw-semibold">Số lượng kho <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="bi bi-hash"></i></span>
                                    <input type="number" class="form-control" id="quantity" name="quantity" 
                                           value="${product.quantity}" min="0" required>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label fw-semibold">Mô tả sản phẩm</label>
                            <textarea class="form-control" id="description" name="description" rows="4">${product.description}</textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold d-block">Ảnh hiện tại</label>
                            <div class="mb-2">
                                <c:choose>
                                    <c:when test="${product.image != null && product.image.startsWith('http')}">
                                        <img src="${product.image}" alt="${product.productName}" class="rounded border shadow-sm" style="width: 120px; height: 100px; object-fit: cover;">
                                    </c:when>
                                    <c:when test="${product.image != null && !empty product.image}">
                                        <img src="${pageContext.request.contextPath}/image?fname=${product.image}" alt="${product.productName}" class="rounded border shadow-sm" style="width: 120px; height: 100px; object-fit: cover;">
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
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-semibold d-block">Trạng thái kinh doanh</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="ston" name="status" value="1" ${product.status == 1 ? 'checked' : ''}>
                                <label class="form-check-label" for="ston">
                                    <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1">Hoạt động</span>
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="stoff" name="status" value="0" ${product.status != 1 ? 'checked' : ''}>
                                <label class="form-check-label" for="stoff">
                                    <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-2 py-1">Khóa</span>
                                </label>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between align-items-center pt-3 border-top">
                            <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-outline-secondary">
                                <i class="bi bi-arrow-left me-1"></i> Hủy bỏ
                            </a>
                            <button type="submit" class="btn btn-primary px-4 fw-semibold">
                                <i class="bi bi-check2-circle me-1"></i> Cập nhật sản phẩm
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>