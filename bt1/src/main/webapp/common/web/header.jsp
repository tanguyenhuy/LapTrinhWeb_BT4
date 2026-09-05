<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-warning" href="${pageContext.request.contextPath}/home">
            <i class="bi bi-shop"></i> SHOP ONLINE
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/home">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/product">Sản phẩm</a>
                </li>
            </ul>

            <div class="d-flex align-items-center">
                <c:choose>
                    <c:when test="${sessionScope.account == null}">
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light btn-sm me-2">Đăng nhập</a>
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-warning btn-sm">Đăng ký</a>
                    </c:when>
                    <c:otherwise>
                        <div class="dropdown">
                            <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown">
                                <c:choose>
                                    <c:when test="${sessionScope.account.images != null && sessionScope.account.images.startsWith('http')}">
                                        <img src="${sessionScope.account.images}" width="32" height="32" class="rounded-circle me-2 border border-light" style="object-fit: cover;">
                                    </c:when>
                                    <c:when test="${sessionScope.account.images != null && !empty sessionScope.account.images}">
                                        <img src="${pageContext.request.contextPath}/image?fname=${sessionScope.account.images}" width="32" height="32" class="rounded-circle me-2 border border-light" style="object-fit: cover;">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://ui-avatars.com/api/?name=${sessionScope.account.username}&size=32&background=0d6efd&color=fff" width="32" height="32" class="rounded-circle me-2">
                                    </c:otherwise>
                                </c:choose>
                                <span>${sessionScope.account.fullname}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end shadow">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/home/profile"><i class="bi bi-person me-2"></i>Hồ sơ cá nhân</a></li>
                                <c:if test="${sessionScope.account.roleid == 1}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/products"><i class="bi bi-gear me-2"></i>Trang quản trị</a></li>
                                </c:if>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-2"></i>Đăng xuất</a></li>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>