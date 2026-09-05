<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<head>
    <title>Trang Chủ - Top 10 Sản Phẩm Mới</title>
</head>
<body>
    <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
        <h3 class="fw-bold text-primary m-0"><i class="bi bi-fire text-danger"></i> 10 SẢN PHẨM MỚI NHẤT</h3>
        <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-primary btn-sm">Xem tất cả &rarr;</a>
    </div>

    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-5 g-3">
        <c:forEach items="${top10Products}" var="p">
            <div class="col">
                <div class="card h-100 shadow-sm border-0">
                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.productId}" class="text-decoration-none text-dark">
                        <c:choose>
                            <c:when test="${p.image != null && p.image.startsWith('http')}">
                                <img src="${p.image}" class="card-img-top" style="height: 180px; object-fit: cover;" alt="${p.productName}">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/image?fname=${p.image}" class="card-img-top" style="height: 180px; object-fit: cover;" alt="${p.productName}">
                            </c:otherwise>
                        </c:choose>

                        <span class="d-block card-body p-3">
						    <span class="d-block card-title text-truncate fw-bold mb-1 fs-6">${p.productName}</span>
						    <span class="d-block card-text text-danger fw-bold fs-6 mb-0">${p.price} VNĐ</span>
						</span>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</body>