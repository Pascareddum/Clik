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
    <title>Clik</title>
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
                        <h3><%=p.getName()%></h3> <br>
                    </div>

                    <h5> <%=p.getCategory()%> <%=p.getBrand()%> </h5>

                    <div class="mt-2 pr-3 content">
                        <p><%=p.getDescr()%></p>
                    </div>
                    <h3><%=p.getPrice()%>&euro;</h3>
                    <div class="buttons">
                        <a href="add-to-cart?id=<%=p.getId()%>&image=<%=p.getImage()%>" >Aggiungi al carrello</a> <br>
                        <a href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
      <%
          int flag=0;
          for(Product check: products) {
              if (check.getCategory().equals(p.getCategory()) && !check.getName().equals(p.getName())) {
                  flag++;
              }
              if(flag==0){
                  break;
              }
          }
      %>
        <div class="container d-inline-block p-10 m-10">
            <h4>Dato che stai guardando la categoria <%=p.getCategory()%> potrebbe interessarti anche: </h4>
            <div class="card-header d-inline-block" style="width: 100%;height: 60%">
                <div style="overflow-x:scroll;display: flex;float: left;width: 100%;height: 100%">
                    <%
                        Collections.shuffle(products);
                        String name;
                        if(!products.isEmpty()){
                            for(Product product:products){
                                if(product.getCategory().equals(p.getCategory()) && !product.getName().equals(p.getName())){
                                if(product.getName().length()>39)
                                    name=product.getName().substring(0,40)+"...";
                                else
                                    name=product.getName();
                    %>
                    <div style="width: 100%;;text-align:center">
                        <div class="card-body p-2 m-2" style="min-width: 300px;height: 400px">
                            <div class="card p-2 my-1" style="max-width: 300px">
                                <div style="max-width: 300px;height: 100%; text-align: center">
                                    <a href="view-product?id=<%=product.getId()%>&image=<%=product.getImage()%>&price=<%=product.getPrice()%>&name=<%=product.getName()%>&category=<%=product.getCategory()%>&brand=<%=product.getBrand()%>&descr=<%=product.getDescr()%>"> <img class="text-center" style="height: 200px;max-width: 200px"src="images/<%=product.getImage()%>" alt="Card image cap"> </a>
                                </div>
                                <div class="card-body text-left">
                                    <h6 class="card-title" title="<%=product.getName()%>" style="height: 100%; display: block;overflow: hidden;"><a href="view-product?id=<%=product.getId()%>&image=<%=product.getImage()%>&price=<%=product.getPrice()%>&name=<%=product.getName()%>&category=<%=product.getCategory()%>&brand=<%=product.getBrand()%>&descr=<%=product.getDescr()%>" style="color: black "><%=name%></a></h6>
                                    <h7 class="price"><%=product.getPrice()%>&euro;</h7> <br>
                                    <h8 class="card-category"><%=product.getCategory()%></h8> <br>
                                    <a href="add-to-cart?id=<%=product.getId()%>&image=<%=product.getImage()%>" >Aggiungi al carrello</a> <br>
                                    <a href="order-now?quantity=1&id=<%=product.getId()%>">Compra ora</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                                }
                            }
                        }
                    %>
                </div>
            </div>
        </div>

<div class="container d-inline-block p-10 m-10">
    <h4>Dato che stai guardando il brand <%=p.getBrand()%> potrebbe interessarti anche: </h4>
    <div class="card-header d-inline-block" style="width: 100%;height: 60%">
        <div style="overflow-x:scroll;display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                if(!products.isEmpty()){
                    for(Product product:products){
                        if(product.getBrand().equals(p.getBrand()) && !product.getName().equals(p.getName())){
                            if(product.getName().length()>39)
                                name=product.getName().substring(0,40)+"...";
                            else
                                name=product.getName();
            %>
            <div style="width: 100%;;text-align:center">
                <div class="card-body p-2 m-2" style="min-width: 300px;height: 400px">
                    <div class="card p-2 my-1" style="max-width: 300px">
                        <div style="max-width: 300px;height: 100%; text-align: center">
                            <a href="view-product?id=<%=product.getId()%>&image=<%=product.getImage()%>&price=<%=product.getPrice()%>&name=<%=product.getName()%>&category=<%=product.getCategory()%>&brand=<%=product.getBrand()%>&descr=<%=product.getDescr()%>"> <img class="text-center" style="height: 200px;max-width: 200px"src="images/<%=product.getImage()%>" alt="Card image cap"> </a>
                        </div>
                        <div class="card-body text-left">
                            <h6 class="card-title" title="<%=product.getName()%>" style="height: 100%; display: block;overflow: hidden;"><a href="view-product?id=<%=product.getId()%>&image=<%=product.getImage()%>&price=<%=product.getPrice()%>&name=<%=product.getName()%>&category=<%=product.getCategory()%>&brand=<%=product.getBrand()%>&descr=<%=product.getDescr()%>" style="color: black "><%=name%></a></h6>
                            <h7 class="price"><%=product.getPrice()%>&euro;</h7> <br>
                            <h8 class="card-category"><%=product.getCategory()%></h8> <br>
                            <a href="add-to-cart?id=<%=product.getId()%>&image=<%=product.getImage()%>" >Aggiungi al carrello</a> <br>
                            <a href="order-now?quantity=1&id=<%=product.getId()%>">Compra ora</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                        }
                    }
                }
            %>
        </div>
    </div>
</div>
<%@include file="template-parts/footer.jsp"%>

</body>
</html>
