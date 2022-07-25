<%@ page import="model.dao.ConPool" %>
<%@ page import="model.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.dao.ProductDAO" %>
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
%>
<!DOCTYPE html>
<html>
<head>
    <title>Clik</title>
    <%@include file="template-parts/header.jsp"%>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
 <div style="background: #033551;" class="card-header"><h1> Prodotti</h1></div>
<%
    if(!products.isEmpty()){
        for(Product p:products){ %>
            <div class="card">
            <p><img style="width: 50%;height: 50%" class="card-img" src="images/<%=p.getImage()%>" alt="Card image cap"> </p>
                <div class="card-body">
                    <h5 class="card-title"><%=p.getName()%></h5>
                    <h6 class="price"><%=p.getPrice()%>&euro;</h6>
                    <h6 class="category"><%=p.getCategory()%></h6>
                    <p class="card-text"></p>
                    <button style="max-width: 150px; font-size: small"  class="card-button"><a href="add-to-cart?id=<%=p.getId()%>" style="color: white;text-decoration: none">aggiungi al carrello</a></button>
                    <button style="max-width: 150px; font-size: small" class="card-button"><a  href="order-now?quantity=1&id=<%=p.getId()%>" style="color: white; text-decoration: none">compra ora</a></button>
            </div>
        <%}
    }
%>

    </div>
<%@include file="template-parts/footer.jsp"%>

</body>
</html>