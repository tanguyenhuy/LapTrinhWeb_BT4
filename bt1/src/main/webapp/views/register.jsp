<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Đăng ký tài khoản</title></head>
<body style="font-family: Arial; padding: 20px;">
    <h2>ĐĂNG KÝ TÀI KHOẢN</h2>
    <c:if test="${error != null}"><p style="color: red;">${error}</p></c:if>
    <form action="${pageContext.request.contextPath}/register" method="post" style="width: 350px;">
        <p>Username: <input type="text" name="username" required style="width: 100%;"></p>
        <p>Email: <input type="email" name="email" required style="width: 100%;"></p>
        <p>Fullname: <input type="text" name="fullname" required style="width: 100%;"></p>
        <p>Password: <input type="password" name="password" required style="width: 100%;"></p>
        <button type="submit">Đăng ký và Nhận OTP</button>
        <a href="${pageContext.request.contextPath}/login" style="margin-left: 10px;">Đăng nhập</a>
    </form>
</body>
</html>