package huytan.vn.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import huytan.vn.services.IUserService;
import huytan.vn.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/forgot-password", "/reset-password" })
public class ForgotPasswordController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    private static final String EMAIL_REGEX = "^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,6}$";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();

        if (url.contains("/forgot-password")) {
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
        } else {
            HttpSession session = req.getSession(false);
            if (session != null && session.getAttribute("reset_email") != null) {
                req.setAttribute("email", session.getAttribute("reset_email"));
            }
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String url = req.getRequestURI();

        if (url.contains("/forgot-password")) {
            handleForgotPassword(req, resp);
        } else if (url.contains("/reset-password")) {
            handleResetPassword(req, resp);
        }
    }

    private void handleForgotPassword(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String email = req.getParameter("email") != null ? req.getParameter("email").trim() : "";
        req.setAttribute("email", email);

        if (email.isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập địa chỉ email của bạn!");
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
            return;
        }

        if (!email.matches(EMAIL_REGEX)) {
            req.setAttribute("error", "Địa chỉ email không đúng định dạng (VD: example@gmail.com)!");
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
            return;
        }

        if (userService.sendForgotPasswordOtp(email)) {
            req.getSession().setAttribute("reset_email", email);
            resp.sendRedirect(req.getContextPath() + "/reset-password");
        } else {
            req.setAttribute("error", "Email này không tồn tại trong hệ thống!");
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
        }
    }

    private void handleResetPassword(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String email = req.getParameter("email") != null ? req.getParameter("email").trim() : "";
        
        if (email.isEmpty()) {
            HttpSession session = req.getSession(false);
            if (session != null && session.getAttribute("reset_email") != null) {
                email = (String) session.getAttribute("reset_email");
            }
        }

        String otp = req.getParameter("otp") != null ? req.getParameter("otp").trim() : "";
        String newPassword = req.getParameter("password") != null ? req.getParameter("password") : "";
        String confirmPassword = req.getParameter("confirmPassword") != null ? req.getParameter("confirmPassword") : "";

        req.setAttribute("email", email);
        req.setAttribute("otp", otp);

        if (email.isEmpty() || !email.matches(EMAIL_REGEX)) {
            req.setAttribute("error", "Địa chỉ email không hợp lệ hoặc phiên làm việc đã hết hạn!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }

        if (otp.isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập mã OTP!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }
        if (!otp.matches("^[0-9]{6}$")) {
            req.setAttribute("error", "Mã xác thực OTP phải gồm đúng 6 chữ số!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }

        if (newPassword.isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập mật khẩu mới!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }
        if (newPassword.length() < 6) {
            req.setAttribute("error", "Mật khẩu mới phải có độ dài từ 6 ký tự trở lên!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }

        if (!confirmPassword.isEmpty() && !newPassword.equals(confirmPassword)) {
            req.setAttribute("error", "Mật khẩu xác nhận không khớp với mật khẩu mới!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }

        if (userService.resetPassword(email, otp, newPassword)) {
            req.getSession().removeAttribute("reset_email");
            req.setAttribute("message", "Đổi mật khẩu thành công! Vui lòng đăng nhập bằng mật khẩu mới.");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Mã OTP không chính xác hoặc đã hết hiệu lực!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
        }
    }
}