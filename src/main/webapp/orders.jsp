<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page import="com.oracle.wls.shaded.org.apache.xpath.operations.Or" %>
<%@ page import="model.dao.OrderDAO" %>
<%@ page import="model.dao.ConPool" %>
<%
    DecimalFormat dcf=new DecimalFormat("#.##");
    request.setAttribute("dcf",dcf);
    User auth=(User) request.getSession().getAttribute("auth");
    List<Order> orders=null;
    if(auth!=null){
        request.setAttribute("auth",auth);
        orders =new OrderDAO(ConPool.getConnection()).userOrders(auth.getId());
    }else{
        response.sendRedirect("login.jsp");
    }

    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list!=null){
        request.setAttribute("cart_list",cart_list);
    }
%>
<html>
<head>
    <title>Click-Orders</title>
   <%@include file="template-parts/header.jsp"%>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
<br>
<div class="container">
    <div class="card-header"><h1>I tuoi ordini:</h1></div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Data</th>
            <th scope="col">Nome</th>
            <th scope="col">Categoria</th>
            <th scope="col">Quantit&agrave;</th>
            <th scope="col">Prezzo</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <%
            if(orders !=null){
                for(Order o:orders){%>
        <tr>
            <td> <%= o.getDate()%> </td>
            <td> <%= o.getName()%> </td>
            <td> <%= o.getCategory()%> </td>
            <td> <%= o.getQuantity()%> </td>
            <td> <%=dcf.format(o.getPrice())%>&euro;</td>
            <td><a style="color:red" href="cancel-order?id=<%=o.getOrderId()%>">Cancella ordine</a></td>
        </tr>
        <%}
        }
        %>
        </tbody>
    </table>
</div>

<%@include file="template-parts/footer.jsp"%>
</body>
</html>
