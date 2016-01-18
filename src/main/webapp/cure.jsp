<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="parts/head.jsp" />
</head>

<body>

<jsp:include page="parts/navbar.jsp" />

<div class="container">
    <div class="row">
        <h3>Cures</h3>
        <br/>

        <c:choose>
            <c:when test="${cures.size() > 0}">
                <table class="table table-striped">
                    <tr>
                       
                        <th>Name</th>
                        <th>Description</th>
                        <th>Person</th>
                    </tr>
                    <c:forEach var="cure" items="${cures}" varStatus="loopCounter">
                        <tr>
                            <td>${message.id}</td>
                            <td>${message.title}</td>
                            <td>${message.author}</td>
                            <td>
                                <a href="view/${cure.id}">
                                    View
                                </a>
                                |
                                <a href="edit/${cure.id}">
                                    Edit
                                </a>
                                |
                                <a href="remove/${cure.id}">
                                    Remove
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </c:when>
            <c:otherwise>
                <div class="well">No cures yet!</div>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h3>Add new cure!</h3>
            <br/>

            <form action="add" method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">name:</label>

                    <div class="col-sm-10">
                        <input type="text" name="name" id="name" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="message" class="col-sm-2 control-label">description:</label>

                    <div class="col-sm-10">
                        <input type="text" name="description" id="description" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="author" class="col-sm-2 control-label">Person:</label>

                    <div class="col-sm-10">
                        <input type="text" name="person" id="person" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Add</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <hr>

    <jsp:include page="parts/footer.jsp" />
</div>

<jsp:include page="parts/scripts.jsp" />
</body>
</html>
