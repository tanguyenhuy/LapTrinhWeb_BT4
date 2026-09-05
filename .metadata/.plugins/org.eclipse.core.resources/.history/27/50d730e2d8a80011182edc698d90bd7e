package huytan.vn.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import huytan.vn.entities.User;
import huytan.vn.services.IUserService;
import huytan.vn.service.impl.UserServiceImpl;


@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    String username = cookie.getValue();
                    User user = userService.get(username);
                    if (user != null && user.getStatus() == 1) {
                        session = req.getSession(true);
                        session.setAttribute("account", user);
                        resp.sendRedirect(req.getContextPath() + "/home");
                        return;
                    }
                }
            }
        }


        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account = req.getParameter("account");
        String pass = req.getParameter("password");
        String remember = req.getParameter("remember");

        User user = userService.login(account, pass);
        if (user != null) {
     
            HttpSession session = req.getSession(true);
            session.setAttribute("account", user);


            if ("on".equals(remember)) {
                Cookie cookie = new Cookie("username", user.getUsername());
                cookie.setMaxAge(30 * 60); 
                cookie.setPath(req.getContextPath().isEmpty() ? "/" : req.getContextPath());
                resp.addCookie(cookie);
            }

            resp.sendRedirect(req.getContextPath() + "/home");
        } else {
            req.setAttribute("error", "Tài khoản/mật khẩu sai hoặc tài khoản chưa kích hoạt OTP!");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }
}