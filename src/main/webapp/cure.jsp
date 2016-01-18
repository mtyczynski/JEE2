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
				url: '${pageContext.request.contextPath}/rest/test/addCure',
				type: 'POST',
				data:
					{
					cureName: document.getElementById('cureName').value,
					description: document.getElementById('description').value,
					idPerson: document.getElementById('idPerson').value
					},
				success: function() { document.location.replace("${pageContext.request.contextPath}/Cure"); },
				error: function() { alert("Wrong data!"); }
				}
			);
			}
		);
		}
	);
</script>
<script>
$(document).ready(function()
{
	$.ajax
		(
		{
		url: '${pageContext.request.contextPath}/rest/test/getAllCures',
		type: 'GET',
		success: function(data)
			{
			var d = data.length;
			var table = document.getElementById("table");
			for (var i = 0; i < d; i++)
				{
				tr = $('<tr/>');
				tr.append("<td>"+data[i].cureName+"</td>");
				tr.append("<td>"+data[i].description+"</td>");
				tr.append("<td>"+data[i].person.firstName+" "+data[i].person.lastName+"</td>");
				td = $('<td/>');
				td.append("<a href='${pageContext.request.contextPath}/EditCure/"+data[i].id+"' class='btn btn-default'>Edit </a><buttom onClick='del("+data[i].id+")' class='btn btn-default'> Remove</buttom>");
				tr.append(td);
				$(table).append(tr);
				}
			}
		}
		);
}
);
</script>
<script>
	function del(id)
	{
		$.ajax
		(
		{
			url: '${pageContext.request.contextPath}/rest/test/deleteCure/'+id,
			type: 'DELETE',
			success: function() { document.location.reload(true);}
		}
	);
}
</script>
<body>

<jsp:include page="parts/navbar.jsp" />

<div class="container">
    <div class="row">
        <h3>Cures</h3>
        <br/>

                <table id="table" class="table table-striped">
                    <tr>
                     
                        <th>Name</th>
                        <th>Description</th>
			<th>Person</th>
                        <th></th>
                        
		</table>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h3>Add new cure!</h3>
            <br/>

            <form  method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="cureName" class="col-sm-2 control-label">Name:</label>

                    <div class="col-sm-10">
                        <input type="text" name="cureName" id="cureName" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="description" class="col-sm-2 control-label">Description:</label>

                    <div class="col-sm-10">
                        <input type="text" name="description" id="description" class="form-control">
                    </div>
                </div>
  		 <div class="form-group">
                    <label for="idPerson" class="col-sm-2 control-label">Person:</label>

                    <div class="col-sm-10">
			<select type="text" name="idPerson" id="idPerson" class="form-control" required>
				<c:forEach var="pFK" items="${PersonFK}" varStatus="loopCounter">
						<option value="${pFK.id}">${pFK.firstName} ${pFK.lastName}</option>
				</c:forEach>
			</select>
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
