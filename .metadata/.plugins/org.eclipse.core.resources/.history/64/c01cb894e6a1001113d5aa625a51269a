<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Danh Mục</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        th { background-color: #f2f2f2; }
        .btn { padding: 8px 15px; text-decoration: none; color: white; border-radius: 4px; display: inline-block; }
        .btn-add { background-color: #28a745; margin-bottom: 15px; }
        .btn-edit { background-color: #ffc107; color: black; padding: 4px 8px; }
        .btn-delete { background-color: #dc3545; padding: 4px 8px; }
    </style>
</head>
<body>

    <h2>Quản lý danh mục</h2>
    <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-add">+ Thêm danh mục mới</a>

    <table>
        <thead>
            <tr>
                <th>STT</th>
                <th>Hình ảnh</th>
                <th>Tên danh mục</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${cateList}" var="cate" varStatus="STT">
                <tr>
                    <td>${STT.index + 1}</td>
                    <td>
                        <c:choose>
                            <c:when test="${cate.icon != null}">
                                <c:url value="/image?fname=${cate.icon}" var="imgUrl"></c:url>
                                <img height="100" width="120" src="${imgUrl}" style="object-fit: cover; border-radius: 4px;" />
                            </c:when>
                            <c:otherwise>
                                <span>Chưa có ảnh</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td><b>${cate.name}</b></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.id}" class="btn btn-edit">Sửa</a>
                        <a href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.id}" class="btn btn-delete" onclick="return confirm('Bạn có chắc muốn xóa không?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>