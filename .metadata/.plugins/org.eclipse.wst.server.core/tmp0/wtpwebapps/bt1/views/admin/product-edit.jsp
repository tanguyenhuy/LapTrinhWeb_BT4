<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Sản Phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .box { width: 450px; padding: 25px; border: 1px solid #ccc; border-radius: 8px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { font-weight: bold; display: block; margin-bottom: 5px; }
        .form-group input[type="text"], 
        .form-group input[type="number"], 
        .form-group select, 
        .form-group textarea { 
            width: 100%; 
            padding: 8px; 
            box-sizing: border-box; 
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group textarea { height: 80px; resize: vertical; }
        .btn-submit { 
            background: #007bff; 
            color: white; 
            padding: 9px 18px; 
            border: none; 
            border-radius: 4px; 
            cursor: pointer; 
        }
        .btn-back { 
            margin-left: 10px; 
            text-decoration: none; 
            color: #555; 
        }
    </style>
</head>
<body>

<div class="box">
    <h2>Chỉnh Sửa Sản Phẩm</h2>
    <form action="${pageContext.request.contextPath}/admin/product/update" method="post" enctype="multipart/form-data">
        
        <!-- Lưu lại ID sản phẩm -->
        <input type="hidden" name="productId" value="${product.productId}">

        <div class="form-group">
            <label>Tên sản phẩm:</label>
            <input type="text" name="productName" value="${product.productName}" required>
        </div>

        <div class="form-group">
            <label>Danh mục:</label>
            <select name="categoryId">
                <c:forEach items="${categories}" var="c">
                    <option value="${c.categoryid}" ${c.categoryid == product.category.categoryid ? 'selected' : ''}>
                        ${c.categoryname}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Giá bán (VNĐ):</label>
            <input type="number" step="any" name="price" value="${product.price}" required>
        </div>

        <div class="form-group">
            <label>Số lượng kho:</label>
            <input type="number" name="quantity" value="${product.quantity}" required>
        </div>

        <div class="form-group">
            <label>Mô tả:</label>
            <textarea name="description">${product.description}</textarea>
        </div>

        <div class="form-group">
            <label>Ảnh hiện tại:</label>
            <c:choose>
                <c:when test="${product.image != null && product.image.startsWith('http')}">
                    <img src="${product.image}" width="100" height="100" style="object-fit: cover; border-radius: 4px; display: block; margin-bottom: 8px;" />
                </c:when>
                <c:when test="${product.image != null}">
                    <img src="${pageContext.request.contextPath}/image?fname=${product.image}" width="100" height="100" style="object-fit: cover; border-radius: 4px; display: block; margin-bottom: 8px;" />
                </c:when>
                <c:otherwise>
                    <span style="color: gray; display: block; margin-bottom: 8px;">(Chưa có ảnh)</span>
                </c:otherwise>
            </c:choose>

            <label>Chọn ảnh mới :</label>
            <input type="file" name="imageFile" accept="image/*">
        </div>

        <div class="form-group">
            <label>Trạng thái:</label>
            <label style="font-weight: normal; margin-right: 15px;">
                <input type="radio" name="status" value="1" ${product.status == 1 ? 'checked' : ''}> Hoạt động
            </label>
            <label style="font-weight: normal;">
                <input type="radio" name="status" value="0" ${product.status != 1 ? 'checked' : ''}> Khóa
            </label>
        </div>

        <button type="submit" class="btn-submit">Cập nhật sản phẩm</button>
        <a href="${pageContext.request.contextPath}/admin/products" class="btn-back">Hủy bỏ</a>
    </form>
</div>

</body>
</html>