<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập Nhật Danh Mục</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .box { width: 450px; padding: 20px; border: 1px solid #ccc; border-radius: 6px; }
        .form-group { margin-bottom: 15px; }
        label { font-weight: bold; }
        input[type="text"] { width: 100%; padding: 8px; box-sizing: border-box; margin-top: 5px; }
    </style>
</head>
<body>

<div class="box">
    <h3>Cập Nhật Danh Mục</h3>
    <form action="<c:url value='/admin/category/update'/>" method="post" enctype="multipart/form-data">
        <input type="hidden" name="categoryid" value="${cate.categoryid}">

        <div class="form-group">
            <label>Category name:</label>
            <input type="text" id="categoryname" name="categoryname" value="${cate.categoryname}" required>
        </div>

        <div class="form-group">
            <label>Link images:</label>
            <input type="text" id="images" name="images" value="${cate.images}">
        </div>

        <div class="form-group">
            <label>Ảnh hiện tại:</label><br>
            <c:choose>
                <c:when test="${cate.images != null && cate.images.startsWith('http')}">
                    <img height="100" width="120" src="${cate.images}" style="object-fit: cover;" />
                </c:when>
                <c:when test="${cate.images != null}">
                    <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                    <img height="100" width="120" src="${imgUrl}" style="object-fit: cover;" />
                </c:when>
            </c:choose>
        </div>

        <div class="form-group">
            <label>Upload ảnh mới:</label><br>
            <input type="file" id="images1" name="images1" accept="image/*">
        </div>

        <div class="form-group">
            <label>Status:</label><br>
            <input type="radio" id="ston" name="status" value="1" ${cate.status == 1 ? 'checked' : ''}> <label for="ston">Hoạt động</label>
            <input type="radio" id="stoff" name="status" value="0" ${cate.status != 1 ? 'checked' : ''}> <label for="stoff">Khóa</label>
        </div>

        <input type="submit" value="Update" style="background:#007bff; color:white; padding:8px 16px; border:none; border-radius:4px; cursor:pointer;">
        <a href="<c:url value='/admin/categories'/>" style="margin-left: 10px;">Hủy</a>
    </form>
</div>

</body>
</html>