<%-- 
    Document   : insert_product
    Created on : Oct 14, 2017, 2:31:16 PM
    Author     : Shun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý sản phẩm</title>
    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">
                <div id="rightContent">
                    <h3>Thông Tin Sản Phẩm</h3>
                    <form action="ControllerProducts" method="POST">

                        ID sản phẩm: <input type="text" name="maid"><br/>

                        ID danh mục: <input type="text" class="sedang" name="madm"><br/>

                        Tên sản phẩm:<input style="width: 400px" type="text" class="sedang" name="TenSanPham"><br/>

                        Giá tiền:<input type="text" class="sedang" name="Giatien"><br/>

                        Image:<input style="width: 400px" type="file" class="sedang" name="hinh"><br/>

                        Chi tiết:<input style="width: 400px"  type="text" class="sedang" name="Chitiet"><br/>

                        <input type="hidden" name="command" value="insert" >
                        <input  type="submit" class="button" value="Lữu dữ liệu">

                    </form>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>

    </body>
</html>
