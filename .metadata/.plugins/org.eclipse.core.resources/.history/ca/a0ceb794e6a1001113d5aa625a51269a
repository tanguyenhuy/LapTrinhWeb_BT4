<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Danh Mục</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; }
        .form-box { width: 400px; padding: 20px; border: 1px solid #ccc; border-radius: 6px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input[type="text"] { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn { padding: 8px 15px; cursor: pointer; border: none; border-radius: 4px; }
        .btn-submit { background-color: #007bff; color: white; }
        .btn-back { background-color: #6c757d; color: white; text-decoration: none; display: inline-block; }
    </style>
</head>
<body>

<div class="form-box">
    <h3>Chỉnh Sửa Danh Mục</h3>
    <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${category.id}" />

        <div class="form-group">
            <label>Tên danh mục:</label>
            <input type="text" name="name" value="${category.name}" required />
        </div>

        <div class="form-group">
            <label>Ảnh hiện tại:</label>
            <c:if test="${category.icon != null}">
                <c:url value="/image?fname=${category.icon}" var="imgUrl"></c:url>
                <img width="100" height="100" src="${imgUrl}" style="object-fit: cover; display: block; margin-bottom: 8px;" />
            </c:if>
            <label>Chọn ảnh mới (nếu muốn thay đổi):</label>
            <input type="file" name="icon" accept="image/*" />
        </div>

        <button type="submit" class="btn btn-submit">Cập nhật</button>
        <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-back">Hủy</a>
    </form>
</div>

</body>
</html>