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
					url: '${pageContext.request.contextPath}/rest/test/editCure/${CureEdit.getId()}',
					type: 'PUT',
					data:
					{
						cureName: document.getElementById('cureName').value,
						description: document.getElementById('description').value,
						idPerson: document.getElementById('idPerson').value
					
					},
					success: function() { document.location.replace("${pageContext.request.contextPath}/cure.jsp"); },
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
            <h3>Edit Cure:</h3>
            <br/>

            <form method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="cureName" class="col-sm-2 control-label">Name:</label>

                    <div class="col-sm-10">
                        <input type="text" name="cureName" id="cureName" value="${CureEdit.cureName}" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="description" class="col-sm-2 control-label">Description:</label>

                    <div class="col-sm-10">
                        <input type="text" name="description" id="description" value="${CureEdit.description}" class="form-control">
                    </div>
                </div>
    <div class="form-group">
                    <label for="idPerson" class="col-sm-2 control-label">Person:</label>

                    <div class="col-sm-10">
                        <input type="text" name="idPerson" id="idPerson" value="${CureEdit.person.id}" class="form-control">
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
