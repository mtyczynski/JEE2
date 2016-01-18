<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="parts/head.jsp" />
    <jsp:include page="parts/scripts.jsp" />
</head>

	<script>
$(document).ready(function()
	{
	$( "#edit" ).on('click', function(e)
		{
			e.preventDefault();
			$.ajax
				(
				{
					url: '${pageContext.request.contextPath}/rest/test/editPerson/${PersonEdit.getId()}',
					type: 'PUT',
					data:
					{
						firstName: document.getElementById('firstName').value,
						lastName: document.getElementById('lastName').value,
					
					},
					success: function() { document.location.replace("${pageContext.request.contextPath}/person.jsp"); },
					error: function() { alert("Wrong Data!"); }
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
        <div class="col-md-12">
            <h3>Edit Person:</h3>
            <br/>

            <form method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="firstName" class="col-sm-2 control-label">First Name:</label>

                    <div class="col-sm-10">
                        <input type="text" name="firstName" id="firstName" value="${PersonEdit.firstName}" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastName" class="col-sm-2 control-label">Last Name:</label>

                    <div class="col-sm-10">
                        <input type="text" name="lastName" id="lastName" value="${PersonEdit.lastName}" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="edit" type="submit" class="btn btn-default">Save</button>
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
