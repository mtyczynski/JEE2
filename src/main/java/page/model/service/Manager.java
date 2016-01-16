package page.model.service;

import page.model.domain.Cure;
import page.model.domain.Person;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import java.util.ArrayList;
import java.util.List;

@Stateless
public class Manager{

    @PersistenceContext
    private EntityManager em;

    @SuppressWarnings("unchecked")
    public List<Cure> getAllCures() {
        return em.createNamedQuery("cure.all").getResultList();
    }

    @SuppressWarnings("unchecked")
    public List<Person> getAllPersons() {
        return em.createNamedQuery("person.all").getResultList();
    }


    public Cure getCureFromID(Long id) {
        return (Cure) em.find(Cure.class, id);
    }

    public Person getPersonFromID(Long id) {
        return (Person) em.find(Person.class, id);
    }

    public void add(Cure cure) {
        cure.setId(null);
	em.persist(cure);
	
    }

    public void add(Person person) {
        person.setId(null);
	em.persist(person);
    }

    public void edit(Person p, String name, String lastname) {
        p = (Person) em.find(Person.class, p.getId());
        p.setFirstName(name);
        p.setLastName(lastname);
        em.merge(p);
    }

    public void edit(Cure cure, Person person, String name, String desc) {
        cure = (Cure) em.find(Cure.class, cure.getId());
        cure.setPerson(person);
        cure.setCureName(name);
        cure.setDescription(desc);
        em.merge(cure);
    }

    public void delete(Cure c) {
        c = (Cure) em.find(Cure.class, c.getId());
        Person p = em.find(Person.class, c.getPerson().getId());
        p.getCures().remove(c);
        em.remove(c);
    }

    public void delete(Person p) {
        p = (Person) em.find(Person.class, p.getId());
        em.remove(p);
    }

}
