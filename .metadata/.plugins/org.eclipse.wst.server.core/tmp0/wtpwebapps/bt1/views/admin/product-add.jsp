<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Thêm Sản Phẩm</title></head>
<body style="font-family: Arial; padding: 20px;">
    <h2>Thêm Sản Phẩm Mới</h2>
    <form action="${pageContext.request.contextPath}/admin/product/insert" method="post" enctype="multipart/form-data" style="width: 400px;">
        <p>Tên sản phẩm: <input type="text" name="productName" required style="width: 100%;"></p>
        <p>Danh mục:
            <select name="categoryId" style="width: 100%;">
                <c:forEach items="${categories}" var="c">
                    <option value="${c.categoryid}">${c.categoryname}</option>
                </c:forEach>
            </select>
        </p>
        <p>Giá: <input type="number" name="price" required style="width: 100%;"></p>
        <p>Số lượng: <input type="number" name="quantity" required style="width: 100%;"></p>
        <p>Mô tả: <textarea name="description" style="width: 100%;"></textarea></p>
        <p>Hình ảnh: <input type="file" name="imageFile" required></p>
        <p>Trạng thái: 
            <input type="radio" name="status" value="1" checked> Hoạt động
            <input type="radio" name="status" value="0"> Khóa
        </p>
        <button type="submit">Thêm sản phẩm</button>
    </form>
</body>
</html>