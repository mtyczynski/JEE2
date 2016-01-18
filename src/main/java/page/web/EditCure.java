package com.zakladPogrzebowy.web;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import page.model.service.*;
import page.model.domain.*;
@WebServlet(urlPatterns = "/EditCure/*")
public class EditCure extends HttpServlet{
@EJB
private Manager m;
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String link = request.getPathInfo();
request.setAttribute("CureEdit", m.getPersonFromID(Long.parseLong(link.substring(link.lastIndexOf("/") + 1, link.length()))));
request.getRequestDispatcher("/EditCure.jsp").forward(request, response);
}
}
