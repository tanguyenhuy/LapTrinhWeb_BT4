<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Chủ - Top 10 Sản Phẩm Mới</title>
    <style>
        .grid { display: flex; flex-wrap: wrap; gap: 20px; }
        .card { border: 1px solid #ddd; padding: 15px; width: 200px; text-align: center; border-radius: 8px; }
        .card img { width: 100%; height: 150px; object-fit: cover; border-radius: 4px; }
    </style>
</head>
<body style="font-family: Arial; padding: 20px;">
    <div style="background: #333; color: #fff; padding: 10px 20px; display: flex; justify-content: space-between; align-items: center; border-radius: 4px;">
        <div><b>SHOP ONLINE</b> | <a href="${pageContext.request.contextPath}/product" style="color: yellow; text-decoration: none;">Tất cả sản phẩm</a></div>
        <div>
            <c:choose>
                <c:when test="${sessionScope.account == null}">
                    <a href="${pageContext.request.contextPath}/login" style="color:#fff; text-decoration: none;">Đăng nhập</a> | 
                    <a href="${pageContext.request.contextPath}/register" style="color:#fff; text-decoration: none;">Đăng ký</a>
                </c:when>
                <c:otherwise>
				    <div style="display: flex; align-items: center; gap: 8px;">
				        <a href="${pageContext.request.contextPath}/home/profile" style="display: inline-flex; align-items: center;">
				            <c:choose>
				                <c:when test="${sessionScope.account.images != null && sessionScope.account.images.startsWith('http')}">
				                    <img src="${sessionScope.account.images}" alt="Avatar" 
				                         style="width: 32px; height: 32px; border-radius: 50%; object-fit: cover; border: 1.5px solid #fff;" />
				                </c:when>
				                <c:when test="${sessionScope.account.images != null && !empty sessionScope.account.images}">
				                    <img src="${pageContext.request.contextPath}/image?fname=${sessionScope.account.images}" alt="Avatar" 
				                         style="width: 32px; height: 32px; border-radius: 50%; object-fit: cover; border: 1.5px solid #fff;" />
				                </c:when>
				                <c:otherwise>
				                    <img src="https://ui-avatars.com/api/?name=${sessionScope.account.username}&size=32&background=007bff&color=fff" alt="Avatar" 
				                         style="width: 32px; height: 32px; border-radius: 50%;" />
				                </c:otherwise>
				            </c:choose>
				        </a>
				
				        <span>Xin chào, <a href="${pageContext.request.contextPath}/home/profile" style="color: #4dabf7; font-weight: bold; text-decoration: none;">${sessionScope.account.fullname}</a></span>
				        <span style="color: #666;">|</span>
				        <a href="${pageContext.request.contextPath}/logout" style="color: #ff6b6b; text-decoration: none;">Đăng xuất</a>
				    </div>
				</c:otherwise>
            </c:choose>
        </div>
    </div>

    <h2>10 SẢN PHẨM MỚI NHẤT</h2>
    <div class="grid">
        <c:forEach items="${top10Products}" var="p">
            <div class="card">
                <a href="${pageContext.request.contextPath}/product/detail?id=${p.productId}" style="text-decoration: none; color: black; display: block;">
                    <c:choose>
                        <c:when test="${p.image != null && p.image.startsWith('http')}">
                            <img src="${p.image}" alt="${p.productName}" />
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/image?fname=${p.image}" alt="${p.productName}" />
                        </c:otherwise>
                    </c:choose>
                    
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
</body>
</html>