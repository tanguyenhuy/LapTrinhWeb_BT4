<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tất cả sản phẩm</title>
    <style>
        .grid { display: flex; flex-wrap: wrap; gap: 20px; }
        .card { border: 1px solid #ddd; padding: 15px; width: 220px; text-align: center; border-radius: 8px; }
        .card img { width: 100%; height: 160px; object-fit: cover; }
        .pagination a { padding: 8px 16px; border: 1px solid #ddd; text-decoration: none; margin: 0 4px; }
        .pagination a.active { background: #007bff; color: white; }
    </style>
</head>
<body style="font-family: Arial; padding: 20px;">
    <h2>DANH SÁCH TẤT CẢ SẢN PHẨM</h2>
    <a href="${pageContext.request.contextPath}/home">&larr; Về Trang Chủ</a>
    <hr>

    <div class="grid">
	    <c:forEach items="${listProduct}" var="p">
	        <div class="card">
	            <a href="${pageContext.request.contextPath}/product/detail?id=${p.productId}" style="text-decoration: none; color: black; display: block;">
	                <img src="${pageContext.request.contextPath}/image?fname=${p.image}" alt="${p.productName}" style="width: 100%; height: 160px; object-fit: cover;" />
	                
	                <span style="display: block; font-weight: bold; font-size: 16px; margin: 8px 0;">
	                    ${p.productName}
	                </span>
	                
	                <span style="display: block; color: red; font-weight: bold;">
	                    ${p.price} VNĐ
	                </span>
	            </a>
	        </div>
	    </c:forEach>
	</div>


    <div class="pagination" style="margin-top: 30px; text-align: center;">
        <c:forEach begin="1" end="${totalPages}" var="i">
            <a href="${pageContext.request.contextPath}/product?page=${i}" class="${currentPage == i ? 'active' : ''}">${i}</a>
        </c:forEach>
    </div>
</body>
</html>