<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../fragments/head.jsp"/>

<script src="/resources/js/jquery.validate.js" type="text/javascript"></script>
<script src="/resources/js/site.js" type="text/javascript"></script>


<body>
<jsp:include page="../fragments/menu.jsp"/>
<div class="container">
    <form:form commandName="client" class="productForm">
        <legend>Add Client</legend>


        <div class="row-group row">
            <label for="id" class="col-sm-2 col-form-label">Id</label>
            <div class="col-sm-6">
                <input id="id" class="form-control" type="text" name="id"/></div>
        </div>
        <br>


        <div class="row-group row">
            <label for="name" class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-6">
                <input id="name" class="form-control" type="text" name="name"/></div>
        </div>
        <br>


        <div class="row-group row">
            <label for="secondName" class="col-sm-2 col-form-label">Second name</label>
            <div class="col-sm-6">
                <input id="secondName" class="form-control" type="text" name="secondName"/></div>
        </div>
        <br>


        <div class="row-group row">
            <label for="phonenumber" class="col-sm-2 col-form-label">Phone number</label>
            <div class="col-sm-6">
                <input id="phonenumber" class="form-control" type="text" name="phonenumber"/></div>
        </div>
        <br>


        <div class="row-group row">
            <label for="country" class="col-sm-2 col-form-label">Country</label>
            <div class="col-sm-6">
                <input id="country" class="form-control" type="text" name="country"/></div>
        </div>

        <br>

        <div class="row-group row">
            <label for="address" class="col-sm-2 col-form-label">Address</label>
            <div class="col-sm-6">
                <input id="address" class="form-control" type="text" name="address"/></div>
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
