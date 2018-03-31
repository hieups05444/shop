<%-- 
    Document   : index
    Created on : Oct 9, 2017, 6:15:00 PM
    Author     : Shun
--%>
<%@page import="model.Cart"%>
<%@page import="model.Product"%>
<%@page import="getDB.ProductGET"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        ProductGET productGET = new ProductGET();
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

        <section id="slider"><!--slider-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#slider-carousel" data-slide-to="1"></li>
                                <li data-target="#slider-carousel" data-slide-to="2"></li>
                            </ol>

                            <div class="carousel-inner">
                                <div class="item active">
                                    <div class="col-sm-6">
                                        <h1><span>Asus</span>-K45LA</h1>
                                        <h2 style="font-size: 17px;">Electronics Industry chuyên cung cấp Laptop chất lượng cao.</h2>
                                        <p>Kiểu dáng nhỏ gọn, tiện lợi. thích hợp cho việc xem phim và đọc tin tức. Dễ dàng đem theo khi đi du lịch hoặc nghỉ mát... </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/girl1.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>Macbook</span>-Pro</h1>
                                        <h2 style="font-size: 17px;">Electronics Industry chuyên cung cấp Laptop chất lượng cao.</h2>
                                        <p>Macbook đã quá phổ biến đối với người hiểu biết công nghệ. Chiếc Laptop này thích hợp cho các dân văn phòng hoặc các lập trình viên... </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/girl2.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>

                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>Asus</span>-Transformer Book</h1>
                                        <h2 style="font-size: 17px;">Electronics Industry chuyên cung cấp Laptop chất lượng cao.</h2>
                                        <p>Kiểu dáng đẹp đẽ và cũng là dòng sản phẩm mới nhất từ Asus, cùng với đó là CPU i7 cực kỳ mạnh mẽ có thể đáp ứng đầy đủ nhu cầu khách hàng. </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/girl3.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>

                            </div>

                            <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </section><!--/slider-->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                    <jsp:include page="menu.jsp"></jsp:include>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Features Items</h2>

                        <%                            for (Product p : productGET.getListProductByCategory(Long.parseLong(category_id2))) {
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
                                    <img src="images/home/new.png" class="new" alt="" />
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                        <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>

                        <%
                            for (Product p : productGET.getListProductByCategory(Long.parseLong(category_id3))) {
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
                                    <img src="images/home/sale.png" class="new" alt="" />
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                        <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>

                        <%
                            for (Product p : productGET.getListProductByCategory(Long.parseLong(category_id4))) {
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
                                    <img src="images/home/new.png" class="new" alt="" />
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                        <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>

                        <%
                            for (Product p : productGET.getListProductByCategory(Long.parseLong(category_id5))) {
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
                                    <img src="images/home/sale.png" class="new" alt="" />
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                        <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div><!--features_items-->

                    <div class="category-tab"><!--category-tab-->      
                        <div class="col-sm-12">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tshirt" data-toggle="tab">New</a></li>
                                <li><a href="#blazers" data-toggle="tab">Hot</a></li>
                                <li><a href="#sunglass" data-toggle="tab">Gaming</a></li>
                                <li><a href="#kids" data-toggle="tab">Office</a></li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="tshirt" >
                                <%
                                    for (Product p : productGET.getListProductByCategory(Long.parseLong(category_id2))) {
                                %>
                                <div class="col-sm-3">
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

                            <div class="tab-pane fade" id="sunglass" >
                                <%
                                    for (Product p : productGET.getListProductByCategory(Long.parseLong(category_id1))) {
                                %>
                                <div class="col-sm-3">
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

                            <div class="tab-pane fade" id="kids" >
                                <%
                                    for (Product p : productGET.getListProductByCategory(Long.parseLong(category_id4))) {
                                %>
                                <div class="col-sm-3">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="product-details.jsp?productID=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt="" /></a>
                                                <p><a href="product-details.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></p>
                                                <h2>$<%=p.getProductPrice()%></h2>
                                                <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                %>   
                            </div>

                            <div class="tab-pane fade" id="blazers" >                               
                                <%
                                    for (Product p : productGET.getListProductByCategory(Long.parseLong(category_id5))) {
                                %>
                                <div class="col-sm-3">
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

                    </div><!--/category-tab-->

                    <div class="recommended_items"><!--recommended_items-->
                        <h2 class="title text-center">recommended items</h2>

                        <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="item active">	                                 

                                    <%
                                        for (Product p : productGET.getListProductByCategory(Long.parseLong(category_id3))) {
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
                                        for (Product p : productGET.getListProductByCategory(Long.parseLong(category_id5))) {
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
                                        for (Product p : productGET.getListProductByCategory(Long.parseLong(category_id2))) {
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
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>