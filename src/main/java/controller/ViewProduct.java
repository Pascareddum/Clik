package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/view-product")
public class ViewProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            Product product = new Product();
            int id = Integer.parseInt(request.getParameter("id"));
            double price=Double.parseDouble(request.getParameter("price"));
            String image=request.getParameter("image");
            String name=request.getParameter("name");
            product.setId(id);
            product.setName(name);
            product.setPrice(price);
            product.setImage(image);
            HttpSession session = request.getSession();
            session.setAttribute("product",product);
            response.sendRedirect("product.jsp");

        }
    }
}
