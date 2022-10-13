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

    ProductDAO pd=new ProductDAO();
    List<Product> products= pd.getAllProducts();
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

<div class="container" style="background-color:#d9b99b">
    <h1 class="text-center">Gestione clienti</h1>
    <%List<User> users=(List<User>) request.getAttribute("users");%>
<ul>
    <% for(User user: users){ %>
    <li> <%=user.getId()%> <%=user.getName()%> <%=user.getSurname()%> <%=user.getEmail()%>
        <form action="UserList">
            <input type="hidden" name="id" value="<%=user.getId()%>">
            <input type="submit" style="background-color:#eed9c4" value="Modifica">
        </form>
        <form action="deleteUser">
            <input type="hidden" name="id" value="<%=user.getId()%>">
            <input type="submit" style="background-color:#eed9c4" value="Elimina">
        </form>
    </li>
    <% }%>
</ul>
    <form action="insertUser">
        <div class="text-center">
            <br><input type="submit" style="background-color:#eed9c4" value="Inserisci">
        </div>
    </form>
    <div class="text-center">
        <a class="btn rounded-left" style="background-color:#eed9c4;" href="index.jsp">Home-page</a>
        <a class="btn rounded-left" style="background-color:#eed9c4;" href="admin" >Admin</a>
    </div>
</div>
<%@include file="/template-parts/footer.jsp"%>

</body>
</html>