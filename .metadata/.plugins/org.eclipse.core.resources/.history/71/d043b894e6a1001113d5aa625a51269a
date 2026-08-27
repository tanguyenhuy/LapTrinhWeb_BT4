<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Danh Mục</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; }
        .form-box { width: 400px; padding: 20px; border: 1px solid #ccc; border-radius: 6px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn { padding: 8px 15px; cursor: pointer; border: none; border-radius: 4px; }
        .btn-submit { background-color: #28a745; color: white; }
        .btn-back { background-color: #6c757d; color: white; text-decoration: none; display: inline-block; }
    </style>
</head>
<body>

<div class="form-box">
    <h3>Thêm Danh Mục Mới</h3>
    <form action="${pageContext.request.contextPath}/admin/category/add" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label>Tên danh mục:</label>
            <input type="text" name="name" placeholder="Nhập tên danh mục..." required />
        </div>
        <div class="form-group">
            <label>Ảnh đại diện:</label>
            <input type="file" name="icon" accept="image/*" />
        </div>
        <button type="submit" class="btn btn-submit">Thêm mới</button>
        <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-back">Quay lại</a>
    </form>
</div>

</body>
</html>