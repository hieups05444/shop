<%-- 
    Document   : product-details
    Created on : Oct 11, 2017, 1:43:19 PM
    Author     : Shun
--%>

<%@page import="model.Cart"%>
<%@page import="getDB.CategoryGET"%>
<%@page import="model.Category"%>
<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@page import="getDB.ProductGET"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        CategoryGET categoryGET = new CategoryGET();
        Product product = new Product();
        ProductGET productGET = new ProductGET();
        String category_id = "";
        if (request.getParameter("category") != null) {
            category_id = request.getParameter("category");
        }
        String productID = "";
        if (request.getParameter("productID") != null) {
            productID = request.getParameter("productID");
            product = productGET.getProduct(Long.parseLong(productID));
        }
        String category_id1 = "1";
        String category_id2 = "2";
        String category_id3 = "3";
        String category_id4 = "4";
        String category_id5 = "5";

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
    %>

    <jsp:include page="header.jsp"></jsp:include>

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                    <jsp:include page="menu.jsp"></jsp:include>
                    </div>
                    <div class="col-sm-9 padding-right">

                        <div class="product-details"><!--product-details-->
                            <div class="col-sm-5">
                                <div class="view-product">
                                    <a href="product-details.jsp?productID=<%=product.getProductID()%>"><img src="<%=product.getProductImage()%> " style="height:280px;width: 330px" alt=""></a>
                                <h3>HOT</h3>
                            </div>

                        </div>   
                        <div class="col-sm-7">
                            <div class="product-information"><!--/product-information-->
                                <img src="images/product-details/new.jpg" class="newarrival" alt="" />
                                <h2><%=product.getProductName()%></h2>
                                <img src="images/product-details/rating.png" alt="" />
                                <span>
                                    <span>$<%=product.getProductPrice()%></span>
                                    <label>Quantity:</label>
                                    <input type="text" value="1" />
                                    <button type="button" class="btn btn-fefault cart">
                                        <a href="CartServlet?command=plus&productID=<%=product.getProductID()%>" class="btn btn-fefault cart" style="width:100px;height:20px;margin-left:0px;margin-right: 10px"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </button>
                                </span>
                                <p>

                                </p>
                                <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
                            </div><!--/product-information-->
                        </div>

                    </div><!--/product-details-->

                    <div class="category-tab shop-details-tab"><!--category-tab-->
                        <div class="col-sm-12">
                            <ul class="nav nav-tabs">
                                <li  class="active"><a href="#details" data-toggle="tab">Details</a></li>                  
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="details" >
                                <div class="single-products" style="margin-left: 20px;text-align: left">                                       
                                    <p><%=product.getDescription()%></p>                                 
                                </div>                                  
                            </div>                               
                        </div>
                    </div><!--/category-tab-->

                    <div class="recommended_items"><!--recommended_items-->
                        <h2 class="title text-center">recommended items</h2>

                        <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="item active">	                                 

                                    <%
                                        for (Product p
                                                : productGET.getListProductByCategory(Long.parseLong(category_id3))) {
                                    %>
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <a href="product-details.jsp?productID=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt="" /></a>
                                                    <h2>$<%=p.getProductPrice()%></h2>
                                                    <p><a href="product-details.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></p>
                                                    <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>

                                    <%
                                        for (Product p
                                                : productGET.getListProductByCategory(Long.parseLong(category_id5))) {
                                    %>
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <a href="product-details.jsp?productID=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt="" /></a>
                                                    <h2>$<%=p.getProductPrice()%></h2>
                                                    <p><a href="product-details.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></p>
                                                    <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="item">	                                   
                                    <%
                                        for (Product p
                                                : productGET.getListProductByCategory(Long.parseLong(category_id2))) {
                                    %>
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <a href="product-details.jsp?productID=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt="" /></a>
                                                    <h2>$<%=p.getProductPrice()%></h2>
                                                    <p><a href="product-details.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></p>
                                                    <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>			
                        </div>
                    </div><!--/recommended_items-->

                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp"></jsp:include>

    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
