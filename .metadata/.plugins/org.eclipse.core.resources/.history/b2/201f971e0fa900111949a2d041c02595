package huytan.vn.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import huytan.vn.entities.User;
import huytan.vn.services.IUserService;
import huytan.vn.service.impl.UserServiceImpl;
import huytan.vn.util.Constant;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
@WebServlet(urlPatterns = "/home/profile")
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User userSession = (User) session.getAttribute("account");
        User user = userService.findById(userSession.getId());

        req.setAttribute("user", user);
        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User userSession = (User) session.getAttribute("account");
        User user = userService.findById(userSession.getId());

        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");

        user.setFullname(fullname);
        user.setPhone(phone);

        Part part = req.getPart("imageFile");
        if (part != null && part.getSize() > 0) {
            String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
            String fileName = "user_" + System.currentTimeMillis() + ext;

            File uploadDir = new File(Constant.DIR + File.separator + "avatar");
            if (!uploadDir.exists()) uploadDir.mkdirs();

            if (user.getImages() != null && !user.getImages().startsWith("http")) {
                try {
                    Path oldPath = Paths.get(Constant.DIR + File.separator + user.getImages());
                    Files.deleteIfExists(oldPath);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            part.write(uploadDir.getAbsolutePath() + File.separator + fileName);
            user.setImages("avatar/" + fileName);
        }

        userService.update(user);

        session.setAttribute("account", user);

        req.setAttribute("user", user);
        req.setAttribute("message", "Cập nhật thông tin tài khoản thành công!");
        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }
}