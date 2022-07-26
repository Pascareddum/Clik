<%@ page import="model.dao.ConPool" %>
<%@ page import="model.*"%>
<%@ page import="model.dao.ProductDAO" %>
<%@ page import="java.util.*" %>

<%
    User auth=(User) request.getSession().getAttribute("auth");
    if(auth!=null){
        request.setAttribute("auth",auth);
    }

    ProductDAO pd=new ProductDAO(ConPool.getConnection());
    List<Product> products= pd.getAllProducts();
    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list!=null){
        request.setAttribute("cart_list",cart_list);
    }
    Product p=(Product)session.getAttribute("product");

%>
<html>
<head>
    <title>Clik-Product</title>
    <%@include file="template-parts/header.jsp"%>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>

<div class="container mt-5 mb-5">
    <div class="card">
        <div class="row g-0">
            <div class="col-md-6 border-end">
                <div class="d-flex flex-column justify-content-center">
                    <div class="main_image">
                        <img src="images/<%=p.getImage()%>" alt="product_image" width="350">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="p-3 right-side">
                    <div class="d-flex justify-content-between align-items-center">
                        <h3><%=p.getName()%></h3>
                        <span class="heart"><i class='bx bx-heart'></i></span>
                    </div>
                    <div class="mt-2 pr-3 content">
                        <p>Descrizione</p>
                    </div>
                    <h3><%=p.getPrice()%>&euro;</h3>
                    <div class="ratings d-flex flex-row align-items-center">
                        <div class="d-flex flex-row">
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bx-star' ></i>
                    <div class="buttons">
                        <a href="add-to-cart?id=<%=p.getId()%>&image=<%=p.getImage()%>" >Aggiungi al carrello</a> <br>
                        <a href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template-parts/footer.jsp"%>

</body>
</html>
