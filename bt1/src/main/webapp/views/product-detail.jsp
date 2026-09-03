<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Chi Tiết Sản Phẩm</title></head>
<body style="font-family: Arial; padding: 30px;">
    <a href="${pageContext.request.contextPath}/product">&larr; Quay lại danh sách</a>
    <h2>CHI TIẾT SẢN PHẨM</h2>
    <div style="display: flex; gap: 30px; border: 1px solid #ccc; padding: 20px; border-radius: 8px; width: 600px;">
        <img src="${pageContext.request.contextPath}/image?fname=${p.image}" width="250" height="250" style="object-fit: cover; border-radius: 8px;" />
        <div>
            <h2>${p.productName}</h2>
            <p><b>Danh mục:</b> ${p.category.categoryname}</p>
            <p><b>Giá bán:</b> <span style="color: red; font-size: 20px; font-weight: bold;">${p.price} VNĐ</span></p>
            <p><b>Số lượng còn:</b> ${p.quantity}</p>
            <p><b>Mô tả:</b> ${p.description}</p>
        </div>
    </div>
</body>
</html>