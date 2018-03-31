<%-- 
    Document   : menu
    Created on : Oct 11, 2017, 3:44:32 PM
    Author     : Shun
--%>

<%@page import="model.Category"%>
<%@page import="getDB.CategoryGET"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    CategoryGET categoryGET = new CategoryGET();
%>

<div class="left-sidebar">
    <h2>Category</h2>
    <div class="panel-group category-products" id="accordian"><!--category-productsr-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordian" href="#ram">
                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                        Ram
                    </a>
                </h4>
            </div>
            <div id="ram" class="panel-collapse collapse">
                <div class="panel-body">
                    <ul>
                        <li><a href="#">1 Gb</a></li>
                        <li><a href="#">2 Gb</a></li>
                        <li><a href="#">3 Gb</a></li>
                        <li><a href="#">4 Gb</a></li>
                        <li><a href="#">8 Gb</a></li>
                        <li><a href="#">16 Gb</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordian" href="#cpu">
                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                        CPU
                    </a>
                </h4>
            </div>
            <div id="cpu" class="panel-collapse collapse">
                <div class="panel-body">
                    <ul>
                        <li><a href="#">Dual Core</a></li>
                        <li><a href="#">Quad Core</a></li>
                        <li><a href="#">i3</a></li>
                        <li><a href="#">i5</a></li>
                        <li><a href="#">i7</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordian" href="#hdd">
                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                        HDD</a></h4>
            </div>
        </div>
        <div id="hdd" class="panel-collapse collapse">
            <div class="panel-body">
                <ul>
                    <li><a href="#">120 Gb</a></li>
                    <li><a href="#">200 Gb</a></li>
                    <li><a href="#">500 Gb</a></li>
                    <li><a href="#">1 Tb</a></li>
                    <li><a href="#">2 Tb</a></li>
                </ul>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordian" href="#ssd">
                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                        SSD</a></h4>
            </div>
        </div>
        <div id="ssd" class="panel-collapse collapse">
            <div class="panel-body">
                <ul>
                    <li><a href="#">120 Gb</a></li>
                    <li><a href="#">200 Gb</a></li>
                    <li><a href="#">500 Gb</a></li>
                    <li><a href="#">1 Tb</a></li>
                </ul>
            </div>
        </div>
    </div><!--/category-products-->

    <div class="brands_products"><!--brands_products-->
        <h2>Brands</h2>

        <div class="brands-name">
            <ul class="nav nav-pills nav-stacked">   
                <%
                    for (Category c : categoryGET.getListCategory()) {
                %>
                <li><a href="products.jsp?category=<%=c.getCategoryID()%>"><%=c.getCategoryName()%> <span class="pull-right"></span></a></li>
                        <%
                            }
                        %>
            </ul>
        </div>

    </div><!--/brands_products-->

    <div class="price-range"><!--price-range-->
        <h2>Price Range</h2>
        <div class="well text-center">
            <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
            <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
        </div>
    </div><!--/price-range-->

    <div class="shipping text-center"><!--shipping-->
        <img src="images/home/shipping.jpg" alt="" />
    </div><!--/shipping-->

</div>
