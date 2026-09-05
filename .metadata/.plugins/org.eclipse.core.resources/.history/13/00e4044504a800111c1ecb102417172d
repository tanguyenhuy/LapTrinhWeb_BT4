<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Đăng nhập</title></head>
<body style="font-family: Arial; padding: 20px;">
    <h2>ĐĂNG NHẬP HỆ THỐNG</h2>
    <c:if test="${message != null}"><p style="color: green;">${message}</p></c:if>
    <c:if test="${error != null}"><p style="color: red;">${error}</p></c:if>
    <form action="${pageContext.request.contextPath}/login" method="post" style="width: 300px;">
    <p>Username / Email: <input type="text" name="account" required style="width: 100%;"></p>
    <p>Password: <input type="password" name="password" required style="width: 100%;"></p>
    
    <p>
        <label>
            <input type="checkbox" name="remember" value="on"> Nhớ tôi (Ghi nhớ đăng nhập)
        </label>
    </p>

    <button type="submit">Đăng nhập</button>
    <div style="margin-top: 15px;">
        <a href="${pageContext.request.contextPath}/register">Đăng ký mới</a> | 
        <a href="${pageContext.request.contextPath}/forgot-password">Quên mật khẩu?</a>
    </div>
</form>
</body>
</html>