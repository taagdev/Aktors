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
    <form:form commandName="user" class="userForm">
        <legend>Edit Client</legend>

        <input type="number" value="${user.id}" hidden>

        <div class="row-group row">
            <label for="name" class="col-sm-2 col-form-label">First name</label>
            <div class="col-sm-6">
                <input id="name" class="form-control" type="text" name="name" value="${user.name}"/></div>
        </div>
        <br>


        <div class="row-group row">
            <label for="secondName" class="col-sm-2 col-form-label">Secodn name</label>
            <div class="col-sm-6">
                <input id="secondName" class="form-control" type="text" name="secondName" value="${user.secondName}"/></div>
        </div>
        <br>


        <div class="row-group row">
            <label for="phonenumber" class="col-sm-2 col-form-label">Phonenumber</label>
            <div class="col-sm-6">
                <input id="phonenumber" class="form-control" type="text" name="phonenumber" value="${user.phonenumber}"/></div>
        </div>
        <br>


        <div class="row-group row">
            <label for="country" class="col-sm-2 col-form-label">Country</label>
            <div class="col-sm-6">
                <input id="country" class="form-control" type="text" name="country" value="${user.country}"/></div>
        </div>
        <br>


        <div class="row-group row">
            <label for="address" class="col-sm-2 col-form-label">Address</label>
            <div class="col-sm-6">
                <input id="address" class="form-control" type="text" name="address" value="${user.address}"/></div>
        </div>
        <br>

        <div class="row-group row">
            <div class="col-sm-1 col-sm-push-2">
                <input type="submit" class="btn btn-primary" value="Edit">
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
