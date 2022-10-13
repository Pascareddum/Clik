<%@ page import="model.dao.ConPool" %>
<%@ page import="model.*"%>
<%@ page import="model.dao.ProductDAO" %>
<%@ page import="java.util.*" %>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth",auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
    Product p=(Product)session.getAttribute("product");

%>
<html>
<head>

    <title>Clik</title>
    <%@include file="template-parts/header.jsp"%>
    <link rel="stylesheet" href="css/product.css" type="text/css">

</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
<script>
    function addToCart(id){
        $.ajax({
            url:"add-to-cart",
            type:"get",
            data:{"id": id},
            success:function (){
                alert("Articolo aggiunto al carrello!");
            },
            error:function (){
                alert("Necessario effettuare il login");
                window.location.assign("login.jsp")
            }
        });
    }
</script>
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
                        <h3><%=p.getName()%></h3> <br>
                    </div>

                    <h5> <%=p.getCategory()%> <%=p.getBrand()%> </h5>
                    <h3><%=p.getPrice()%>&euro;</h3>
                    <div class="col text-right align-self-center">
                        <a class="btn rounded-left" style="background-color:#eed9c4" onclick="addToCart(<%=p.getId()%>)">Aggiungi al carrello</a> <br><br>
                        <a class="btn rounded-left"  style="background-color:#d9b99b" href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template-parts/footer.jsp"%>

</body>
</html>
