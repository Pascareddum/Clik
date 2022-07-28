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
    <title>Clik</title>
    <%@include file="template-parts/header.jsp"%>
</head>
<body>
<%@include file="template-parts/navbar.jsp"%>
<br>
<br>
<div class="container">
    <h2 style="text-align: right"> <img src="images/welcome.jpg" alt="welcome image" style="width: 70%;height: 70%;text-align: left">Benevenuto su click!</h2>

</div>
<div class="card-header d-inline-block" style="width: 100%; background-color: #eed9c4;">
    <h2 style="text-align: center"> I nostri prodotti:</h2>
    <h6  style="text-align: right"> <a href="#">continua a guardare>></a></h6>
        <div style="overflow-x:scroll;display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                String name;
                int j=0;
                if(!products.isEmpty()){
                    for(Product p:products){
                        if(j==5)
                            break;
                    if(p.getName().length()>39)
                        name=p.getName().substring(0,40)+"...";
                    else
                        name=p.getName();
            %>
             <div style="width: 100%;;text-align:center">
                 <div class="card-body p-2 m-2" style="min-width: 300px;height: 400px">
                    <div class="card p-2 my-1">
                        <div style="max-width: 300px;height: 100%; text-align: center">
                            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>&descr=<%=p.getDescr()%>"> <img class="text-center" style="height: 200px;max-width: 200px"src="images/<%=p.getImage()%>" alt="Card image cap"> </a>
                        </div>
                            <div class="card-body text-left">
                                <h6 class="card-title" title="<%=p.getName()%>" style="height: 100%; display: block;overflow: hidden;"><a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>&descr=<%=p.getDescr()%>" style="color: black "><%=name%></a></h6>
                                <h7 class="price"><%=p.getPrice()%>&euro;</h7> <br>
                                <h8 class="card-category"><%=p.getCategory()%></h8> <br>
                                <a href="add-to-cart?id=<%=p.getId()%>&image=<%=p.getImage()%>" >Aggiungi al carrello</a> <br>
                                <a href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a>
                            </div>
                    </div>
                </div>
            </div>
            <%
                        j++;
                    }
                }
             %>
        </div>
    </div>

<br>
<br>
    <div class="card-header d-inline-block" style="width: 100%; background-color:#faf0e6">
        <h2 style="text-align: center"> Le nostre lenti:</h2>
        <h6  style="text-align: right"> <a href="#">continua a guardare>></a></h6>
        <div style="overflow-x:scroll;display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                j=0;
                {
                    for(Product p:products){
                        if(j==5)
                            break;
                        if(p.getCategory().equals("Lenti")){
                            if(p.getName().length()>39)
                                name=p.getName().substring(0,40)+"...";
                            else
                                name=p.getName();
            %>
             <div style="width: 100%;;text-align:center">
                 <div class="card-body p-2 m-2" style="min-width: 300px;height: 400px">
                     <div class="card p-2 my-1" style="max-width: 300px">
                        <div style="max-width: 300px;height: 100%; text-align: center">
                            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>&descr=<%=p.getDescr()%>"> <img class="text-center" style="height: 200px;max-width: 200px"src="images/<%=p.getImage()%>" alt="Card image cap"> </a>
                        </div>
                            <div class="card-body text-left">
                                <h6 class="card-title" title="<%=p.getName()%>" style="height: 100%; display: block;overflow: hidden;"><a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>&descr=<%=p.getDescr()%>" style="color: black "><%=name%></a></h6>
                                <h7 class="price"><%=p.getPrice()%>&euro;</h7> <br>
                                <h8 class="card-category"><%=p.getCategory()%></h8> <br>
                                <a href="add-to-cart?id=<%=p.getId()%>&image=<%=p.getImage()%>" >Aggiungi al carrello</a> <br>
                                <a href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a>
                            </div>
                    </div>
                </div>
            </div>
            <%
                            j++; }
                    }
            }
            %>
        </div>
    </div>
<br>
<br>
    <div class="card-header d-inline-block" style="width: 100%; background-color:#e4d5b7">
        <h2 style="text-align: center"> Le nostre fotocamere:</h2>
        <h6  style="text-align: right"> <a href="#">continua a guardare>></a></h6>
        <div style="overflow-x:scroll;display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                j=0;
                {
                    for(Product p:products){
                        if(j==5)
                            break;
                        if(p.getCategory().equals("Fotocamere")){
                            if(p.getName().length()>39)
                                name=p.getName().substring(0,40)+"...";
                            else
                                name=p.getName();
            %>
               <div style="width: 100%;;text-align:center">
                 <div class="card-body p-2 m-2" style="min-width: 300px;height: 400px">
                     <div class="card p-2 my-1" style="max-width: 300px">
                        <div style="max-width: 300px;height: 100%; text-align: center">
                            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>&descr=<%=p.getDescr()%>"> <img class="text-center" style="height: 200px;max-width: 200px"src="images/<%=p.getImage()%>" alt="Card image cap"> </a>
                        </div>
                            <div class="card-body text-left">
                                <h6 class="card-title" title="<%=p.getName()%>" style="height: 100%; display: block;overflow: hidden;"><a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>&descr=<%=p.getDescr()%>" style="color: black "><%=name%></a></h6>
                                <h7 class="price"><%=p.getPrice()%>&euro;</h7> <br>
                                <h8 class="card-category"><%=p.getCategory()%></h8> <br>
                                <a href="add-to-cart?id=<%=p.getId()%>&image=<%=p.getImage()%>" >Aggiungi al carrello</a> <br>
                                <a href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a>
                            </div>
                    </div>
                </div>
            </div>
            <%
                            j++;}
                    }
                }
            %>
        </div>
    </div>

<br>
<br>
    <div class="card-header d-inline-block" style="width: 100%;background-color:#d9b99b">
        <h2 style="text-align: center"> I nostri accessori:</h2>
        <h6  style="text-align: right"> <a href="#">continua a guardare>></a></h6>
        <div style="overflow-x:scroll;display: flex;float: left;width: 100%;height: 100%">
            <%
                Collections.shuffle(products);
                j=0;
                {
                    for(Product p:products){
                        if(j==5)
                            break;
                        if(p.getCategory().equals("Accessori")){
                            if(p.getName().length()>39)
                                name=p.getName().substring(0,40)+"...";
                            else
                                name=p.getName();
            %>
            <div style="width: 100%;;text-align:center">
                 <div class="card-body p-2 m-2" style="min-width: 300px;height: 400px">
                     <div class="card p-2 my-1" style="max-width: 300px">
                        <div style="max-width: 300px;height: 100%; text-align: center">
                            <a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>&descr=<%=p.getDescr()%>"> <img class="text-center" style="height: 200px;max-width: 200px"src="images/<%=p.getImage()%>" alt="Card image cap"> </a>
                        </div>
                            <div class="card-body text-left">
                                <h6 class="card-title" title="<%=p.getName()%>" style="height: 100%; display: block;overflow: hidden;"><a href="view-product?id=<%=p.getId()%>&image=<%=p.getImage()%>&price=<%=p.getPrice()%>&name=<%=p.getName()%>&category=<%=p.getCategory()%>&brand=<%=p.getBrand()%>&descr=<%=p.getDescr()%>" style="color: black "><%=name%></a></h6>
                                <h7 class="price"><%=p.getPrice()%>&euro;</h7> <br>
                                <h8 class="card-category"><%=p.getCategory()%></h8> <br>
                                <a href="add-to-cart?id=<%=p.getId()%>&image=<%=p.getImage()%>" >Aggiungi al carrello</a> <br>
                                <a href="order-now?quantity=1&id=<%=p.getId()%>">Compra ora</a>
                            </div>
                    </div>
                </div>
            </div>
            <%
                            j++;}
                    }
                }
            %>
        </div>
    </div>
</div> -->
<%@include file="template-parts/footer.jsp"%>

</body>
</html>