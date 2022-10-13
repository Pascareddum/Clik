<%@ page import="model.User" %>
<%@ page import="model.*"%>
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
<div class="text-center">
    <img style="height:350px; max-width: 300px;" src="./images/${product.image}">
</div>
<form action="updateProduct">
    <input type="hidden" id="id" name="id" value="${product.id}">
    <label for="name">Nome:</label>
    <input type="text" id="name" name="name" value="${product.name}"><br>
    <label for="category">Categoria:</label>
    <input type="text" id="category" name="category" value="${product.category}"><br>
    <label for="brand">Brand:</label>
    <input type="text" id="brand" name="brand" value="${product.brand}">
    <label for="price">Prezzo:</label>
    <input type="text" id="price" name="price" value="${product.price}">
    <input type="hidden" id="image" name="image" value="${product.image}">
    <input type="submit" value="Modifica">
</form>
<a class="btn rounded-left" style="background-color:#eed9c4" href="index.jsp">Home-page</a>
<a class="btn rounded-left" style="background-color:#eed9c4" href="admin" >Admin</a>
<%@include file="/template-parts/footer.jsp"%>
</body>
</html>
