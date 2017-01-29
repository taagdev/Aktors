<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../fragments/head.jsp"/>

<link href="/resources/css/tablesorter.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery.tablesorter.min.js"></script>

<script>
    $(document).ready(function() {
        $("#myTable").tablesorter({
            headers: {
                0: {sorter: false},
                1: {sorter: false},
                2: {sorter: false},
                3: {sorter: false},
                4: {sorter:false}
            }
        });
    });
</script>


<body>
<div id="body">
    <jsp:include page="../fragments/menu.jsp"/>


        <h2>Are you sure to delete this product?</h2>
        <div class="col-md-6">
            <table id="myTable" border="0" cellpadding="0" cellspacing="1">
                <thead>
                <tr>
                    <th>Barcode</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Release Date</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${product.barcode}</td>
                        <td>${product.name}</td>
                        <td>${product.price}</td>
                        <td>${product.description}</td>
                        <td>${product.releaseDate}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-6"></div>
        <div class="col-md-12">
            <form:form method="post">
                <p>
                    <input type="submit" class="btn btn-primary" value="Delete">
                    <input type="submit" value="Back" class="btn btn-primary" onclick="history.go(-1)">
                </p>
            </form:form>
        </div>

</div>

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>
