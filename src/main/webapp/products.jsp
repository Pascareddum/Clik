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
%>
<!DOCTYPE html>
<html>
<head>
  <title>Clik-Products</title>
  <%@include file="template-parts/header.jsp"%>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
<div class="container d-inline block">
  <div class="row ml-auto">
    <div class="col-md-10">
      <%
        Collections.shuffle(products);
        String name;
        if(!products.isEmpty()){
          for(Product p:products){
            if(p.getName().length()>59)
              name=p.getName().substring(0,60)+"...";
            else
              name=p.getName();
      %>
      <div class="card card-body mt-3">
        <div class="media align-items-center align-items-lg-start text-center text-lg-left flex-column flex-lg-row">
          <div class="mr-2 mb-3 mb-lg-0">

            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>&descr=<%=p.getDescr()%>"> <img class="text-center"  style="height: 200px;max-width: 100%" src="images/<%=p.getImage()%>" alt="Card image cap"> </a>


          </div>

          <div class="media-body">
            <h6 class="media-title font-weight-semibold">
              <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>&descr=<%=p.getDescr()%>" title="<%=p.getName()%>" data-abc="true" style="color: black"><%=name%></a>
            </h6>

            <ul class="list-inline list-inline-dotted mb-3 mb-lg-2">
              <li class="list-inline-item"><a  class="text-muted" data-abc="true"><%=p.getCategory()%></a></li>
              <li class="list-inline-item"><a  class="text-muted" data-abc="true"><%=p.getBrand()%></a></li>
            </ul>

            <p class="mb-3"> <%=p.getDescr()%></p>
          </div>

          <div class="mt-3 mt-lg-0 ml-lg-3 text-center">
            <h3 class="mb-0 font-weight-semibold"><%=p.getPrice()%>&euro;</h3>

            <br>
            <h10> <a href="add-to-cart?id=<%=p.getId()%>&image=<%=p.getImage()%>">Aggiungi al carrello</a></h10> <br> <br>
            <h10> <a href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a></h10>
          </div>
        </div>
      </div>
      <%
          }
        }
      %>
    </div>
  </div>
</div>

<%@include file="template-parts/footer.jsp"%>

</body>
</html>