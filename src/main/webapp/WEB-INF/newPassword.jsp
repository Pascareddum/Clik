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
<!doctype html>
<html>
<head>
  <title>Clik</title>
  <%@include file="/template-parts/header.jsp"%>
</head>
<body oncontextmenu='return false'>
<%@include file="/template-parts/navbar.jsp"%>

  <!-- Container containing all contents -->
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
        <!-- White Container -->
        <div class="container bg-white rounded mt-2 mb-2 px-0">
          <!-- Main Heading -->
          <div class="card-header text-center" style="background-color:#eed9c4">Reset Password</div>
          <div class="pt-3 pb-3">
            <form class="form-horizontal" action="newPassword" method="POST">
              <!-- User Name Input -->
              <div class="form-group row justify-content-center px-3">
                <div class="col-9 px-0">
                  <input type="text" name="password" placeholder="Nuova Password"
                         class="form-control border-info placeicon">
                </div>
              </div>
              <!-- Password Input -->
              <div class="form-group row justify-content-center px-3">
                <div class="col-9 px-0">
                  <input type="password" name="confPassword"
                         placeholder="Conferma nuova password"
                         class="form-control border-info placeicon">
                </div>
              </div>

              <!-- Log in Button -->
              <div class="box text-center">
                <button type="submit" class="btn" style="background-color:#eed9c4">Reset Password</button>
              </div>
            </form>
          </div>
            <!-- Register Now -->
            <div class="pt-2">
              <div class="row justify-content-center">
            <p> Non hai un account?<a href="../register.jsp"> Registrati!</a></p>
              </div>
                </div>
              </div>
            </div>
          </div>
        </div>
<%@include file="/template-parts/footer.jsp"%>

</body>
</html>