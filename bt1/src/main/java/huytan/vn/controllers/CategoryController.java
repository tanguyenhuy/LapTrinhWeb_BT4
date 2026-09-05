package huytan.vn.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import huytan.vn.entities.Category;
import huytan.vn.services.ICategoryService;
import huytan.vn.service.impl.CategoryServiceImpl;
import huytan.vn.util.Constant;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
@WebServlet(urlPatterns = { "/admin/categories", "/admin/category/add", "/admin/category/insert",
        "/admin/category/edit", "/admin/category/update", "/admin/category/delete" })
public class CategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ICategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        if (url.contains("/admin/categories")) {
            List<Category> list = cateService.findAll();
            req.setAttribute("listcate", list);
            req.getRequestDispatcher("/views/admin/category-list.jsp").forward(req, resp);
        } else if (url.contains("/admin/category/add")) {
            req.getRequestDispatcher("/views/admin/category-add.jsp").forward(req, resp);
        } else if (url.contains("/admin/category/edit")) {
            try {
                String idStr = req.getParameter("id");
                if (idStr == null || idStr.trim().isEmpty()) {
                    resp.sendRedirect(req.getContextPath() + "/admin/categories");
                    return;
                }
                int id = Integer.parseInt(idStr.trim());
                Category category = cateService.findById(id);
                if (category == null) {
                    resp.sendRedirect(req.getContextPath() + "/admin/categories");
                    return;
                }
                req.setAttribute("cate", category);
                req.getRequestDispatcher("/views/admin/category-edit.jsp").forward(req, resp);
            } catch (NumberFormatException e) {
                resp.sendRedirect(req.getContextPath() + "/admin/categories");
            }
        } else if (url.contains("/admin/category/delete")) {
            try {
                String idStr = req.getParameter("id");
                if (idStr != null && !idStr.trim().isEmpty()) {
                    int id = Integer.parseInt(idStr.trim());
                    Category category = cateService.findById(id);
                    if (category != null && category.getImages() != null 
                            && !category.getImages().startsWith("http") 
                            && !category.getImages().equals("avatar.png")) {
                        deleteFile(Constant.DIR + File.separator + category.getImages());
                    }
                    cateService.delete(id);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            resp.sendRedirect(req.getContextPath() + "/admin/categories");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        boolean isUpdate = url.contains("/admin/category/update");

        String categoryname = req.getParameter("categoryname") != null ? req.getParameter("categoryname").trim() : "";
        String statusStr = req.getParameter("status") != null ? req.getParameter("status").trim() : "";
        String imagesLink = req.getParameter("images") != null ? req.getParameter("images").trim() : "";
        
        Integer categoryId = null;
        Category oldCategory = null;

        if (isUpdate) {
            String idStr = req.getParameter("categoryid");
            if (idStr == null || idStr.trim().isEmpty()) {
                resp.sendRedirect(req.getContextPath() + "/admin/categories");
                return;
            }
            try {
                categoryId = Integer.parseInt(idStr.trim());
                oldCategory = cateService.findById(categoryId);
                if (oldCategory == null) {
                    resp.sendRedirect(req.getContextPath() + "/admin/categories");
                    return;
                }
            } catch (NumberFormatException e) {
                resp.sendRedirect(req.getContextPath() + "/admin/categories");
                return;
            }
        }

        if (categoryname.isEmpty()) {
            returnWithError(req, resp, "Tên danh mục không được để trống!", isUpdate, categoryId, categoryname, statusStr, imagesLink, oldCategory);
            return;
        }

        if (categoryname.length() < 2 || categoryname.length() > 100) {
            returnWithError(req, resp, "Tên danh mục phải có độ dài từ 2 đến 100 ký tự!", isUpdate, categoryId, categoryname, statusStr, imagesLink, oldCategory);
            return;
        }

        int status = 1;
        try {
            status = Integer.parseInt(statusStr);
            if (status != 0 && status != 1) {
                status = 1;
            }
        } catch (NumberFormatException e) {
            returnWithError(req, resp, "Trạng thái danh mục không hợp lệ!", isUpdate, categoryId, categoryname, statusStr, imagesLink, oldCategory);
            return;
        }

        Part part = req.getPart("images1");
        String uploadedFileName = null;

        if (part != null && part.getSize() > 0) {
            if (part.getSize() > 5 * 1024 * 1024) {
                returnWithError(req, resp, "Dung lượng ảnh tải lên không được vượt quá 5MB!", isUpdate, categoryId, categoryname, statusStr, imagesLink, oldCategory);
                return;
            }

            String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            int dotIdx = originalFileName.lastIndexOf(".");
            if (dotIdx == -1) {
                returnWithError(req, resp, "File tải lên không có phần mở rộng hợp lệ!", isUpdate, categoryId, categoryname, statusStr, imagesLink, oldCategory);
                return;
            }

            String ext = originalFileName.substring(dotIdx).toLowerCase();
            if (!ext.equals(".jpg") && !ext.equals(".jpeg") && !ext.equals(".png") && !ext.equals(".webp") && !ext.equals(".gif")) {
                returnWithError(req, resp, "Chỉ chấp nhận file hình ảnh (.jpg, .jpeg, .png, .webp, .gif)!", isUpdate, categoryId, categoryname, statusStr, imagesLink, oldCategory);
                return;
            }

            File uploadDir = new File(Constant.DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            if (isUpdate && oldCategory.getImages() != null 
                    && !oldCategory.getImages().startsWith("http") 
                    && !oldCategory.getImages().equals("avatar.png")) {
                deleteFile(Constant.DIR + File.separator + oldCategory.getImages());
            }

            uploadedFileName = System.currentTimeMillis() + ext;
            part.write(Constant.DIR + File.separator + uploadedFileName);
        }

        String finalImage;
        if (uploadedFileName != null) {
            finalImage = uploadedFileName;
        } else if (!imagesLink.isEmpty()) {
            finalImage = imagesLink;
        } else if (isUpdate && oldCategory != null) {
            finalImage = oldCategory.getImages();
        } else {
            finalImage = "avatar.png";
        }

        if (isUpdate) {
            oldCategory.setCategoryname(categoryname);
            oldCategory.setStatus(status);
            oldCategory.setImages(finalImage);
            cateService.update(oldCategory);
        } else {
            Category newCategory = new Category();
            newCategory.setCategoryname(categoryname);
            newCategory.setStatus(status);
            newCategory.setImages(finalImage);
            cateService.insert(newCategory);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/categories");
    }

    private void returnWithError(HttpServletRequest req, HttpServletResponse resp, String errorMsg,
                                 boolean isUpdate, Integer categoryId, String categoryName, 
                                 String statusStr, String imagesLink, Category oldCategory) 
            throws ServletException, IOException {
        
        req.setAttribute("error", errorMsg);
        
        Category cate = new Category();
        cate.setCategoryname(categoryName);
        
        try {
            cate.setStatus(Integer.parseInt(statusStr));
        } catch (Exception e) {
            cate.setStatus(1);
        }

        if (!imagesLink.isEmpty()) {
            cate.setImages(imagesLink);
        } else if (oldCategory != null) {
            cate.setImages(oldCategory.getImages());
        }

        if (isUpdate && categoryId != null) {
            cate.setCategoryid(categoryId);
            req.setAttribute("cate", cate);
            req.getRequestDispatcher("/views/admin/category-edit.jsp").forward(req, resp);
        } else {
            req.setAttribute("cate", cate);
            req.getRequestDispatcher("/views/admin/category-add.jsp").forward(req, resp);
        }
    }

    public static void deleteFile(String filePath) {
        try {
            Path path = Paths.get(filePath);
            Files.deleteIfExists(path);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}