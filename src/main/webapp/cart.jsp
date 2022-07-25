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
<html>
<head>
    <title>Clik-cart</title>
    <%@include file="template-parts/header.jsp"%>
   <style type="text/css">
        .table tbody td{
            vertical-align: middle;
        }

        .btn{
            box-shadow: none ;
            font-size:25px ;
        }
    </style>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
<div class="container">
    <h3> Prezzo totale: &euro; ${(total>0)?dcf.format(total):0}</h3>
    <button> <a href="check-out"> Check Out</a></button>
    <table>
        <thead>
        <tr>
            <th scope="col"> Nome </th>
            <th scope="col"> Categoria </th>
            <th scope="col"> Prezzo </th>
            <th scope="col"> Compra ora </th>
            <th scope="col"> Cancella </th>
        </tr>
        </thead>
        <tbody>
        <%
            if(cart_list!=null){
            for(Cart c:cartProduct){%>
                 <tr>
            <td> <%=c.getName()%></td>
            <td> <%=c.getCategory()%> </td>
            <td> <%=dcf.format(c.getPrice())%>&euro;</td>
            <td>
                <form action="order-now" method="post" class="form-inline">
                <input type="hidden" name="id" value="<%=c.getId()%>" class="form-input">
                <div class="form-group">
                    <a class="btn" href="quantity-inc-dec?action=inc&id<%=c.getId()%>"><i class="fas"></i></a>
                    <input type="text" name="quantity" class="form-control" value="1" readonly>
                    <a class="btn" href="quantity-inc-dec?action=dec&id<%=c.getId()%>"><i class="fas"></i></a>

                </div>
                    <button type="submit" class="btn"> Buy</button>
            </form>
            </td>
            <td><a class="btn" href="remove-from-cart?id=<%=c.getId()%>">Rimuovi</a></td>
        </tr>
            <%}
        }%>

        </tbody>
    </table>
</div>
<%@include file="template-parts/footer.jsp"%>

</body>
</html>
