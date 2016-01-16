package page.model.rest;

import page.model.domain.Person;
import page.model.domain.Cure;
import page.model.service.Manager;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import javax.ws.rs.core.*;
import javax.ws.rs.*;

@Stateless
@Path("/test")
public class ManagerResource{

	@EJB
	private Manager m;

	@GET
	@Path("/getAllPersons")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Person> getAllPersons() {
		return m.getAllPersons();
	}

	@GET
	@Path("/getAllCures")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Cure> getAllCures() {
		return m.getAllCures();
	}

	@POST
	@Path("/addPerson")
	@Produces(MediaType.APPLICATION_JSON)
	public Person addPerson(
		@FormParam("firstName") String firstName,
		@FormParam("lastName") String lastName)		
	{
	Person p = new Person();
	p.setFirstName(firstName);
	p.setLastName(lastName);
	m.add(p);
	return p;
	}

	@POST
	@Path("/addCure")
	@Produces(MediaType.APPLICATION_JSON)
	public Cure addCure(
		@FormParam("cureName") String cureName,
		@FormParam("description") String desc,
		@FormParam("idPerson") Long PersonID)
	{
	Cure c = new Cure();
	c.setCureName(cureName);
	c.setDescription(desc);
	c.setPerson(m.getPersonFromID(PersonID));
	m.add(c);
	return c;
	}

	@PUT
	@Path("/editPerson/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Person edytuj(
		@PathParam("id") Long id,
		@FormParam("firstName") String firstName,
		@FormParam("lastName") String lastName)
	{
	Person p = new Person();
	p = m.getPersonFromID(id);
	m.edit(p, firstName, lastName);
	return p;
	}

	@PUT
	@Path("/editCure/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Cure edytuj(
		@PathParam("id") Long id,
		@FormParam("cureName") String cureName,
		@FormParam("description") String desc,
		@FormParam("idPerson") Long PersonID)
	{
	Cure c = new Cure();
	c = m.getCureFromID(id);
	m.edit(c, m.getPersonFromID(PersonID), cureName, desc);
	return c;
	}

	@DELETE
	@Path("/deletePerson/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public void deletePerson(@PathParam("id") long id)
	{
		m.delete(m.getPersonFromID(id));
	}

	@DELETE
	@Path("/deleteCure/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public void deleteCure(@PathParam("id") long id)
	{
		m.delete(m.getCureFromID(id));
	}

}
