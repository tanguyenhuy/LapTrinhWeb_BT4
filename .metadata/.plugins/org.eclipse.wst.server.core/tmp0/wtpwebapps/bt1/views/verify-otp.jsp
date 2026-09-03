<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Xác thực mã OTP</title></head>
<body style="font-family: Arial; padding: 20px;">
    <h2>KÍCH HOẠT TÀI KHOẢN QUA OTP</h2>
    <p>Hệ thống đã gửi mã OTP gồm 6 chữ số đến email: <b>${sessionScope.verify_email}</b></p>
    <c:if test="${error != null}"><p style="color: red;">${error}</p></c:if>
    <form action="${pageContext.request.contextPath}/verify-otp" method="post" style="width: 300px;">
        <input type="hidden" name="email" value="${sessionScope.verify_email}">
        <p>Nhập mã OTP: <input type="text" name="otp" maxlength="6" required style="width: 100%; font-size: 18px; letter-spacing: 5px;"></p>
        <button type="submit">Kích hoạt ngay</button>
    </form>
</body>
</html>