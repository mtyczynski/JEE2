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
<script>
$(document).ready(function()
{
	$.ajax
		(
		{
		url: '${pageContext.request.contextPath}/rest/test/getAllPersons',
		type: 'GET',
		success: function(data)
			{
			var d = data.length;
			var table = document.getElementById("table");
			for (var i = 0; i < d; i++)
				{
				tr = $('<tr/>');
				tr.append("<td>"+data[i].firstName+"</td>");
				tr.append("<td>"+data[i].lastName+"</td>");
				td = $('<td/>');
				td.append("<buttom href='edit/"+data[i].id+"'>Edit </buttom><buttom onClick='del("+data[i].id+")' class='btn btn-default'> Remove</buttom>");
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
			url: '${pageContext.request.contextPath}/rest/test/deletePerson/'+id,
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
        <h3>Persons</h3>
        <br/>

                <table id="table" class="table table-striped">
                    <tr>
                     
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th></th>
                        
		</table>
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
