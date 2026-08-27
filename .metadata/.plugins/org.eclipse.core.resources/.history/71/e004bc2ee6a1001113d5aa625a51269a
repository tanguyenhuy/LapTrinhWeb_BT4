package huytan.vn.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import huytan.vn.models.Category;
import huytan.vn.services.CategoryService;
import huytan.vn.service.impl.CategoryServiceImpl;
import huytan.vn.util.Constant;

@WebServlet(urlPatterns = { "/admin/category/add" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class CategoryAddController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/add-category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        Category category = new Category();
        category.setName(name);

        Part filePart = req.getPart("icon");
        if (filePart != null && filePart.getSize() > 0) {
            String submittedFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String ext = submittedFileName.substring(submittedFileName.lastIndexOf("."));
            String fileName = System.currentTimeMillis() + ext;
            
            File uploadDir = new File(Constant.DIR + "/category");
            if (!uploadDir.exists()) uploadDir.mkdirs();
            
            filePart.write(Constant.DIR + "/category/" + fileName);
            category.setIcon("category/" + fileName);
        } else {
            category.setIcon(null);
        }

        cateService.insert(category);
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}