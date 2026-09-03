<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Đặt lại mật khẩu</title></head>
<body style="font-family: Arial; padding: 20px;">
    <h2>ĐẶT LẠI MẬT KHẨU MỚI</h2>
    <c:if test="${error != null}"><p style="color: red;">${error}</p></c:if>
    <form action="${pageContext.request.contextPath}/reset-password" method="post" style="width: 300px;">
        <input type="hidden" name="email" value="${sessionScope.reset_email}">
        <p>Mã OTP (trong mail): <input type="text" name="otp" required style="width: 100%;"></p>
        <p>Mật khẩu mới: <input type="password" name="password" required style="width: 100%;"></p>
        <button type="submit">Cập nhật mật khẩu</button>
    </form>
</body>
</html>