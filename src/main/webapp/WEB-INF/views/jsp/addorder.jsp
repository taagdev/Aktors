<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../fragments/head.jsp"/>

<link href="/resources/css/tablesorter.css" rel="stylesheet">
<link href="/resources/css/bootstrap.spinner.css" rel="stylesheet">

<script type="text/javascript" src="/resources/js/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="/resources/js/site.js"></script>
<script type="text/javascript" src="/resources/js/jquery.spinner.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>




<script>
    $(document).ready(function() {
        $("#myTable").tablesorter({
            headers: {
                5: {
                    sorter: false
                },
                6: {
                    sorter: false
                }
            }
        });
    });

    var totalPrice = 0;
    var allBarcodes = [];
    var allPrices = [];

    function addBarcode(barcode) {
        allBarcodes.push(barcode);
        console.log(barcode);
    }
    function addPrices(price) {
        allPrices.push(price);
    }

    $("#spinner").spinner('changing', function(e, newVal, oldVal) {

    });
</script>

<body>
<jsp:include page="../fragments/menu.jsp"/>

<form:form>

<div class="container">
<div class="col-md-8">
    <div class="form-group">
        <label for="userId">Select user</label>
        <select class="form-control" id="userId" name="userId">
            <c:forEach items="${users}" var="user">
                <option value="${user.id}">${user}</option>
            </c:forEach>
        </select>
    </div>
</div>
<br>
<div class="col-md-8">
    <h4>List of products</h4>
    <table id="myTable" border="0" cellpadding="0" cellspacing="1">
        <thead>
        <tr>
            <th>Barcode</th>
            <th>Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Release Date</th>
            <th>Choose quantity</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="prod">
            <tr>
                <td>${prod.barcode}</td>
                <td>${prod.name}</td>
                <td>${prod.price}</td>
                <td>${prod.description}</td>
                <td>${prod.releaseDate}</td>

                <script type="text/javascript">
                    addBarcode(${prod.barcode});
                    addPrices(${prod.price});
                </script>
                <td>    <div class="input-group spinner" data-trigger="spinner">
                    <div class="input-group-addon">
                        <a href="javascript:;" class="spin-down" data-spin="down"><i class="glyphicon glyphicon-minus" onclick="setTimeout(setPrice,500)"></i></a>
                    </div>
                    <input type="text" id="${prod.barcode}" name="${prod.barcode}" class="form-control text-center" data-rule="quantity"/>
                    <div class="input-group-addon">
                        <a href="javascript:;" class="spin-up" data-spin="up"><i class="glyphicon glyphicon-plus" onclick="setTimeout(setPrice,500)"></i></a>
                    </div>
                </div></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>

    <script language="JavaScript">

        function setPrice() {

            var price = 0;
            for (i = 0; i < allBarcodes.length; i++) {
                var quantity = document.getElementById(allBarcodes[i]).value;
                price = price + allPrices[i]*quantity;
                console.log(price + ":" + quantity);
            }
            price = Math.round(price*100)/100;
            document.getElementById("totalPrice").innerHTML = price;
            document.getElementById("pricevalue").innerHTML = price;
        }


    </script>

    <h4>Total price is : <span id="pricevalue">0</span> </h4>


    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
        Purchase
    </button>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Are you sure to order?</h4>
                </div>
                <div class="modal-body">
                    <p>Total price :  <span class="glyphicon glyphicon-euro" style="font-size: 25px"></span> <span id="totalPrice" style="font-size: large;font-weight: bold">0</span></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" >Purchase</button>
                </div>
            </div>
        </div>
    </div>

</div> <div class="col-md-4"></div></div>
</form:form>
<br>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>
