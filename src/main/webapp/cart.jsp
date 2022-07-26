<%@ page import="model.dao.ConPool" %>
<%@ page import="model.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.dao.ProductDAO" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth=(User) request.getSession().getAttribute("auth");
    if(auth!=null){
        request.setAttribute("auth",auth);
    }

    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct=null;
    if(cart_list!=null){
        ProductDAO pDAO= new ProductDAO(ConPool.getConnection());
        cartProduct=pDAO.getCartProducts(cart_list);
     double total=pDAO.getTotalCartPrice(cart_list);
        request.setAttribute("cart_list",cart_list);
        request.setAttribute("total",total);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="template-parts/header.jsp"%>

    <title>Clik-Login</title>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
<div class="container-fluid">
    <div class="row">
        <aside class="col-lg-9">
            <div class="card">
                <div class="table-responsive">
                    <table class="table table-borderless table-shopping-cart">
                        <thead class="text-muted">
                        <tr class="small text-uppercase">
                            <th scope="col"></th>
                            <th scope="col">Prodotti</th>
                            <th scope="col" width="120">Quantit&agrave;</th>
                            <th scope="col" width="120">Prezzo</th>
                            <th scope="col" class="text-right d-none d-md-block" width="200"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if(cart_list!=null){
                                for(Cart c:cartProduct){%>
                        <tr>
                            <td>
                                <div style="width: 100%;height: 200px; text-align: center">
                                    <a href="view-product?id=<%=c.getId()%>&image=<%=c.getImage()%>&price=<%=c.getPrice()%>&name=<%=c.getName()%>"><img class="text-center" style="height: 200px;width: 200px" src="images/<%=c.getImage()%>" alt="Card image cap"></a>
                                </div>
                            </td>
                            <td>
                                <figure class="itemside align-items-center">
                                    <figcaption class="info"> <a href="view-product?id=<%=c.getId()%>&image=<%=c.getImage()%>&price=<%=c.getPrice()%>&name=<%=c.getName()%>" class="title text-dark" data-abc="true" style="color: black;text-decoration: none"> <%=c.getName()%></a>
                                        <p class="text-muted small"><%=c.getCategory()%></p>
                                    </figcaption>
                                </figure>
                            </td>
                            <td>
                                <a class="title text-dark"><%=c.getQuantity()%></a>
                            </td>
                            <td>
                                <div class="price-wrap"> <var class="price"><%=dcf.format(c.getPrice())%>&euro;</var></div>
                            </td>
                            <td class="text-right d-none d-md-block">  <a href="remove-from-cart?id=<%=c.getId()%>"> Rimuovi</a> </td>
                        </tr>
                        <%}
                        }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </aside>
        <aside class="col-lg-3">
            <div class="card">
                <div class="card-body">
                    <dl class="dlist-align">
                        <dt>Prezzo totale:</dt>
                        <dd class="text-right ml-3">${(total>0)?dcf.format(total):0}&euro;</dd>
                    </dl>
                    <hr>
                    <div class="box text-center">
                        <button type="submit" class="btn btn-primary" style="background-color: forestgreen">Acquista</button>
                    </div>
                    <br>oppure
                    <a href="index.jsp"data-abc="true" style="text-decoration: none">continua a comprare</a>
                </div>
            </div>
        </aside>
    </div>
</div>
<%@include file="template-parts/footer.jsp"%>

</body>
</html>
