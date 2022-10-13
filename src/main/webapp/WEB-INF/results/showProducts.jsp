<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="model.dao.ConPool" %>
<%@ page import="model.*"%>
<%@ page import="model.dao.ProductDAO" %>
<%@ page import="java.util.*" %>

<%
    User auth=(User) request.getSession().getAttribute("auth");
    if(auth!=null && auth.isAdmin()==true){
        request.setAttribute("auth",auth);
    }
    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list!=null){
        request.setAttribute("cart_list",cart_list);
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Clik</title>
    <%@include file="/template-parts/header.jsp"%>

</head>
<body>
<%@include file="/template-parts/navbar.jsp"%>
<div class="container">
        <h1 class="text-center">Gestione prodotti:</h1>
    <%
        List<Product> products=(List<Product>) request.getAttribute("products");
    %>
    <ul>
        <% for(Product product: products){ %>
        <li> <%=product.getId()%> <%=product.getName()%> <%=product.getCategory()%> <%=product.getBrand()%> <%=product.getPrice()%>
            <img class="text-align-center" style="height:250px; max-width: 200px;" src="./images/<%=product.getImage()%>">
            <form action="ProductList">
                <input type="hidden" name="id" value="<%=product.getId()%>">
                <input type="submit" style="background-color:#eed9c4" value="Modifica">
            </form>
            <form action="deleteProduct">
                <input type="hidden" name="id" value="<%=product.getId()%>">
                <input type="submit" style="background-color:#eed9c4" value="Elimina">
            </form>
        </li>
        <% }%>
    </ul>
    <a class="btn rounded-left" style="background-color:#eed9c4" href="index.jsp">Home-page</a>
    <a class="btn rounded-left" style="background-color:#eed9c4" href="admin" >Admin</a>
</div>
<%@include file="/template-parts/footer.jsp"%>

</body>
</html>