<%@ page import="model.User" %>
<%@ page import="model.dao.ProductDAO" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Cart" %>
<%@ page import="model.dao.ConPool" %>
<%@ page import="java.util.ArrayList" %><%
    User auth=(User) request.getSession().getAttribute("auth");
    if(auth!=null){
        request.setAttribute("auth",auth);
    }

    ProductDAO pd=new ProductDAO();
    List<Product> products= pd.getAllProducts();
    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list!=null){
        request.setAttribute("cart_list",cart_list);
    }
%>
<html>
<head>
    <title>Clik</title>
    <%@include file="/template-parts/header.jsp"%>
</head>
<body>
<%@include file="/template-parts/navbar.jsp"%>

<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center" style="background-color:#eed9c4">Inserisci la password temporanea</div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="text-center">
                    <h5>
                        <i class="fa fa-lock fa-2x"></i>
                    </h5>
                    <h2 class="text-center">Inserisci password</h2>
                    <%
                        if(request.getAttribute("message")!=null)
                        {
                            out.print("<p ml-1'>"+request.getAttribute("message")+"</p>");
                        }

                    %>
                </div>
                            <form action="ValidaOTP" role="form" autocomplete="off"
                                  class="form" method="post">
                                <div class="form-group">
                                    <div class="input-group">
                                  <input name="otp" placeholder="Inserisci password" class="form-control" type="text" required="required">
                                    </div>
                                </div>
                                <div class="box text-center">
                                <button type="submit" class="btn" style="background-color:#eed9c4">Reset Password</button>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
</div>
<%@include file="/template-parts/footer.jsp"%>

</body>
</html>
