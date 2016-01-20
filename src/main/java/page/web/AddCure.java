package page.web;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import page.model.service.*;
import page.model.domain.*;
@WebServlet(urlPatterns = "/Cure/*")
public class AddCure extends HttpServlet{
@EJB
private Manager m;
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setAttribute("PersonFK", m.getAllPersons());
request.getRequestDispatcher("/cure.jsp").forward(request, response);
}
}
