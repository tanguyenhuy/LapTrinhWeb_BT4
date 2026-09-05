package huytan.vn.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import huytan.vn.services.IUserService;
import huytan.vn.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/verify-otp")
public class VerifyOtpController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    private static final String EMAIL_REGEX = "^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,6}$";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            String email = (String) session.getAttribute("verify_email");
            if (email == null) {
                email = (String) session.getAttribute("verifyEmail");
            }
            if (email != null) {
                req.setAttribute("email", email);
            }
        }
        req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email") != null ? req.getParameter("email").trim() : "";
        String otp = req.getParameter("otp") != null ? req.getParameter("otp").trim() : "";

        HttpSession session = req.getSession(false);
        if (email.isEmpty() && session != null) {
            String sessionEmail = (String) session.getAttribute("verify_email");
            if (sessionEmail == null) {
                sessionEmail = (String) session.getAttribute("verifyEmail");
            }
            if (sessionEmail != null) {
                email = sessionEmail.trim();
            }
        }

        req.setAttribute("email", email);
        req.setAttribute("otp", otp);

        if (email.isEmpty() || !email.matches(EMAIL_REGEX)) {
            req.setAttribute("error", "Địa chỉ email không hợp lệ hoặc phiên làm việc đã hết hạn!");
            req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
            return;
        }

        if (otp.isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập mã OTP kích hoạt!");
            req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
            return;
        }

        if (!otp.matches("^[0-9]{6}$")) {
            req.setAttribute("error", "Mã xác thực OTP phải gồm đúng 6 chữ số!");
            req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
            return;
        }

        boolean isVerified = userService.verifyOtp(email, otp);
        if (isVerified) {
            if (session != null) {
                session.removeAttribute("verify_email");
                session.removeAttribute("verifyEmail");
            }
            req.setAttribute("message", "Kích hoạt tài khoản thành công! Vui lòng đăng nhập.");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Mã OTP không chính xác hoặc đã hết hiệu lực!");
            req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
        }
    }
}