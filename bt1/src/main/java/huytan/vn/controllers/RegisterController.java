package huytan.vn.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import huytan.vn.entities.User;
import huytan.vn.services.IUserService;
import huytan.vn.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username") != null ? req.getParameter("username").trim() : "";
        String email = req.getParameter("email") != null ? req.getParameter("email").trim() : "";
        String fullname = req.getParameter("fullname") != null ? req.getParameter("fullname").trim() : "";
        String password = req.getParameter("password") != null ? req.getParameter("password") : "";
        String confirmPassword = req.getParameter("confirmPassword") != null ? req.getParameter("confirmPassword") : "";

        req.setAttribute("username", username);
        req.setAttribute("email", email);
        req.setAttribute("fullname", fullname);

        if (username.isEmpty() || email.isEmpty() || fullname.isEmpty() || password.isEmpty()) {
            req.setAttribute("error", "Vui lòng điền đầy đủ tất cả các thông tin!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        if (!username.matches("^[a-zA-Z0-9_]{4,20}$")) {
            req.setAttribute("error", "Tên đăng nhập từ 4-20 ký tự, chỉ gồm chữ, số và dấu gạch dưới!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,6}$")) {
            req.setAttribute("error", "Địa chỉ email không hợp lệ!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        if (password.length() < 6) {
            req.setAttribute("error", "Mật khẩu phải có độ dài từ 6 ký tự trở lên!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }
        if (!password.equals(confirmPassword)) {
            req.setAttribute("error", "Mật khẩu xác nhận không trùng khớp!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setFullname(fullname);
        user.setPassword(password);

        boolean isRegistered = userService.register(user);
        if (!isRegistered) {
            req.setAttribute("error", "Tên đăng nhập hoặc email đã tồn tại!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        req.getSession().setAttribute("verifyEmail", email);
        resp.sendRedirect(req.getContextPath() + "/verify-otp");
    }
}