package nongsan.webmvc.controller.admin;

import java.io.IOException;
import java.util.List;
import java.nio.file.Paths;
import java.io.File;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import nongsan.webmvc.model.Catalog;
import nongsan.webmvc.model.Product;
import nongsan.webmvc.service.CategoryService;
import nongsan.webmvc.service.ProductService;
import nongsan.webmvc.service.impl.CategoryServicesImpl;
import nongsan.webmvc.service.impl.ProductServiceImpl;

/**
 * Servlet implementation class ProductEditController
 */

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
    maxFileSize = 1024 * 1024 * 10,      // 10 MB
    maxRequestSize = 1024 * 1024 * 15    // 15 MB
)
@WebServlet("/admin/product/edit")
public class ProductEditController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ProductService productService = new ProductServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CategoryService cateService = new CategoryServicesImpl();
		List<Catalog> cateList = cateService.getAll();
		req.setAttribute("catelist", cateList);
		
		String id = req.getParameter("id");
		Product product = productService.get(Integer.parseInt(id));
		req.setAttribute("product", product);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/editproduct.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		String productId = req.getParameter("product-sku");
		if (productId == null || productId.trim().isEmpty()) {
			resp.sendRedirect(req.getContextPath()+"/admin/product/list");
			return;
		}
		
		Product product = new Product();
		product.setId(productId);
		product.setCatalog_id(req.getParameter("product-cate"));
		product.setName(req.getParameter("product-name"));
		product.setPrice(req.getParameter("product-price"));
		product.setStatus(req.getParameter("product-status"));
		product.setDescription(req.getParameter("product-desc"));
		product.setContent(req.getParameter("product-content"));
		product.setDiscount(req.getParameter("product-discount"));
		product.setCreated(req.getParameter("product-day"));

		// Xử lý upload file ảnh
		Part filePart = req.getPart("product-image");
		if (filePart != null && filePart.getSize() > 0 && filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
			// Nếu có upload ảnh mới
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			String uploadPath = req.getServletContext().getRealPath("/view/client/assets/images/products/img-test/");
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) uploadDir.mkdirs();
			filePart.write(uploadPath + File.separator + fileName);
			product.setImage_link(fileName);
		} else {
			// Nếu không upload ảnh mới, giữ nguyên ảnh cũ
			String oldImage = req.getParameter("product-image-old");
			if (oldImage != null && !oldImage.trim().isEmpty()) {
				product.setImage_link(oldImage);
			} else {
				product.setImage_link("default.jpg");
			}
		}

		productService.edit(product);
		resp.sendRedirect(req.getContextPath()+"/admin/product/list");
	}
}