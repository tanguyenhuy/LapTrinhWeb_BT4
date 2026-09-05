<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<head>
    <title>Quản Lý Danh Mục</title>
</head>
<body>
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<c:url value='/admin/products'/>" class="text-decoration-none">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">Quản lý danh mục</li>
        </ol>
    </nav>

    <div class="card shadow-sm border-0 rounded-3">
        <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
            <h5 class="card-title fw-bold text-primary mb-0">
                <i class="bi bi-folder me-2"></i>DANH SÁCH DANH MỤC
            </h5>
            <a href="<c:url value='/admin/category/add'/>" class="btn btn-success btn-sm fw-semibold">
                <i class="bi bi-plus-circle me-1"></i> Thêm mới danh mục
            </a>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover table-bordered align-middle text-center mb-0">
                    <thead class="table-primary text-nowrap">
                        <tr>
                            <th scope="col" style="width: 5%;">STT</th>
                            <th scope="col" style="width: 15%;">Hình ảnh</th>
                            <th scope="col">Tên danh mục</th>
                            <th scope="col" style="width: 15%;">Trạng thái</th>
                            <th scope="col" style="width: 20%;">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listcate}" var="cate" varStatus="STT">
                            <tr>
                                <td class="fw-semibold">${STT.index + 1}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${cate.images != null && cate.images.startsWith('http')}">
                                            <img src="${cate.images}" alt="${cate.categoryname}" class="rounded border shadow-sm" style="width: 90px; height: 70px; object-fit: cover;">
                                        </c:when>
                                        <c:when test="${cate.images != null && !empty cate.images}">
                                            <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                                            <img src="${imgUrl}" alt="${cate.categoryname}" class="rounded border shadow-sm" style="width: 90px; height: 70px; object-fit: cover;">
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-light text-muted border">Không có ảnh</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-start fw-bold text-dark px-3">${cate.categoryname}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${cate.status == 1}">
                                            <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1">Hoạt động</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-2 py-1">Khóa</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div class="d-inline-flex gap-2">
                                        <a href="<c:url value='/admin/category/edit?id=${cate.categoryid}'/>" class="btn btn-sm btn-outline-warning text-dark fw-semibold">
                                            <i class="bi bi-pencil-square me-1"></i>Sửa
                                        </a>
                                        <a href="<c:url value='/admin/category/delete?id=${cate.categoryid}'/>" class="btn btn-sm btn-outline-danger fw-semibold" onclick="return confirm('Bạn có chắc muốn xóa không?');">
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