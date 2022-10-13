package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;
import model.User;
import model.dao.ProductDAO;
import model.dao.UserDAO;

import java.io.IOException;

@WebServlet("/ProductList")
public class ProductList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adress="/WEB-INF/results/updateProduct.jsp";
        int productId=Integer.parseInt(request.getParameter("id"));
        ProductDAO productdao=new ProductDAO();
        Product product=productdao.doRetrieveById(productId);
        request.setAttribute("product",product);
        RequestDispatcher dispatcher=request.getRequestDispatcher(adress);
        dispatcher.forward(request,response);
    }
}
