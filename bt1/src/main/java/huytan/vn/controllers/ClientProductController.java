package huytan.vn.controllers;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import huytan.vn.entities.Product;
import huytan.vn.services.IProductService;
import huytan.vn.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = { "/home", "/product", "/product/detail" })
public class ClientProductController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();

        if (url.endsWith("/home") || url.endsWith("/bt1/")) {

            List<Product> top10 = productService.findTop10Newest();
            req.setAttribute("top10Products", top10);
            req.getRequestDispatcher("/views/home.jsp").forward(req, resp);

        } else if (url.endsWith("/product")) {

            int page = 1;
            int pageSize = 6;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }

            List<Product> listProduct = productService.findAll(page, pageSize);
            int totalProducts = productService.count();
            int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

            req.setAttribute("listProduct", listProduct);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPages", totalPages);
            req.getRequestDispatcher("/views/products.jsp").forward(req, resp);

        } else if (url.endsWith("/product/detail")) {

            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productService.findById(id);
            req.setAttribute("p", product);
            req.getRequestDispatcher("/views/product-detail.jsp").forward(req, resp);
        }
    }
}