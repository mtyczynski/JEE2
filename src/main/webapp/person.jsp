<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="parts/head.jsp" />
    <jsp:include page="parts/scripts.jsp" />
</head>

<script>
	$(document).ready(function()
		{
		$( "#btnADD" ).on('click', function(e)
			{
			e.preventDefault();
			$.ajax
			(
				{
				url: '${pageContext.request.contextPath}/rest/test/addPerson',
				type: 'POST',
				data:
					{
					firstName: document.getElementById('firstName').value,
					lastName: document.getElementById('lastName').value
					},
				success: function() { document.location.replace("${pageContext.request.contextPath}/person.jsp"); },
				error: function() { alert("Wrong data!"); }
				}
			);
			}
		);
		}
	);
</script>

<body>

<jsp:include page="parts/navbar.jsp" />

<div class="container">
    <div class="row">
        <h3>Persons</h3>
        <br/>

        <c:choose>
            <c:when test="${persons.size() > 0}">
                <table class="table table-striped">
                    <tr>
                     
                        <th>First Name</th>
                        <th>Last Name</th>
                        
                    </tr>
                    <c:forEach var="person" items="${persons}" varStatus="loopCounter">
                        <tr>
                            
                            <td>${person.firstName}</td>
                            <td>${person.lastName}</td>
                            <td>
                                <a href="view/${person.id}">
                                    View
                                </a>
                                |
                                <a href="edit/${person.id}">
                                    Edit
                                </a>
                                |
                                <a href="remove/${person.id}">
                                    Remove
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </c:when>
            <c:otherwise>
                <div class="well">No messages yet!</div>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h3>Add new person!</h3>
            <br/>

            <form  method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">First Name:</label>

                    <div class="col-sm-10">
                        <input type="text" name="firstName" id="firstName" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="message" class="col-sm-2 control-label">Last Name:</label>

                    <div class="col-sm-10">
                        <input type="text" name="lastName" id="lastName" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="btnADD" type="submit" class="btn btn-default">Add</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <hr>

    <jsp:include page="parts/footer.jsp" />
</div>
</body>
</html>
