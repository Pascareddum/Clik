<%@ page import="model.dao.ConPool" %>
<%@ page import="model.*"%>
<%@ page import="model.dao.ProductDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>

<%
  ProductDAO pd=new ProductDAO();
  List<Product> products= pd.getAllProducts();
  DecimalFormat dcf = new DecimalFormat("#.##");
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth",auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Clik</title>
  <link rel="stylesheet" href="css/products.css" type="text/css">

  <%@include file="template-parts/header.jsp"%>
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
<div class="container">
  </div>
    <div id="products">
      <div class="row mx-0">
        <%
          Collections.shuffle(products);
          String name;
          String description;

          if(!products.isEmpty()){
            for(Product p:products){
              if(p.getName().length()>59)
                name=p.getName().substring(0,60)+"...";
              else
                name=p.getName();
              /*if(p.getDescr().length()>109)
                description=p.getDescr().substring(0,110)+"...";
              else
                description=p.getDescr();*/

        %>
       <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>" style="text-decoration: none;"> <div class="col-lg-4 col-md-6">
          <div class="card d-flex flex-column align-items-center">
            <div class="product-name" style="color:black;"><%=name%></div>
            <div class="card-img">
              <img src="images/<%=p.getImage()%>" alt="">
            </div>
            <div class="card-body pt-5">
              <div class="text-muted text-center mt-auto"><%=p.getCategory()%></div>
              <div class="text-muted text-center mt-auto"><%=p.getBrand()%></div>
              <!-- <div class="text-muted mt-auto"> description</div> -->
            </div>
            <div class="card-body pt-5">
              <div class="text-center price">
                <div class="font-weight-bold" style="color: black"><%=dcf.format(p.getPrice())%>&euro;</div> <br>
              </div>
              <div class="text-center">
                <a class="btn rounded-left" style="background-color:#eed9c4" onclick="addToCart(<%=p.getId()%>)">Aggiungi al carrello</a> <br><br>
                <a class="btn rounded-left"  style="background-color:#d9b99b" href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a> <br> <br>
              </div>
            </div>
          </div>
        </div>
       </a>

        <%
            }
          }
        %>
      </div>
    </div>
  </div>


<%@include file="template-parts/footer.jsp"%>
<script scr="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.7.2/css/all.css"></script>
</body>
</html>