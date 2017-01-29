<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../fragments/head.jsp"/>

<link href="/resources/css/jquery-ui.css" rel="stylesheet">

<script src="/resources/js/jquery.validate.js" type="text/javascript"></script>
<script src="/resources/js/site.js" type="text/javascript"></script>
<script src="/resources/js/jquery-ui.js" type="text/javascript"></script>

<script>
    $(function () {
        $("#releaseDate").datepicker();

    });
</script>

<body>
<jsp:include page="../fragments/menu.jsp"/>
<div class="container">
    <form:form commandName="product" class="productForm">
        <legend>Add Product</legend>


        <div class="row-group row">
            <label for="barcode" class="col-sm-2 col-form-label">Barcode</label>
            <div class="col-sm-6">
                <input id="barcode" class="form-control" type="text" name="barcode"/></div>
        </div>
        <br>


        <div class="row-group row">
            <label for="name" class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-6">
                <input id="name" class="form-control" type="text" name="name"/></div>
        </div>
        <br>


        <div class="row-group row">
            <label for="releaseDate" class="col-sm-2 col-form-label">Date of release</label>
            <div class="col-sm-6">
                <input id="releaseDate" class="form-control" type="text" name="releaseDate"/></div>
        </div>
        <br>


        <div class="row-group row">
            <label for="description" class="col-sm-2 col-form-label">Description</label>
            <div class="col-sm-6">
                <input id="description" class="form-control" type="text" name="description"/></div>
        </div>
        <br>


        <div class="row-group row">
            <label for="price" class="col-sm-2 col-form-label">Price</label>
            <div class="col-sm-6">
                <input id="price" class="form-control" type="text" name="price"/></div>
        </div>
        <br>

        <div class="row-group row">
            <div class="col-sm-1 col-sm-push-2">
                <input type="submit" class="btn btn-primary" value="Add">
            </div>
            <div class="col-sm-1 col-sm-push-2">
                <input type="button" class="btn btn-primary" value="Back" onclick="history.go(-1)">
            </div>
        </div>
    </form:form>
</div>


<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>
