package edu.unbosque.JPATutorial.servlets;

import edu.unbosque.JPATutorial.services.BookService;
import edu.unbosque.JPATutorial.services.EditionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "deleteEditionServlet", value = "/delete-edition")
public class DeleteEditionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Integer editionId = Integer.parseInt(request.getParameter("edition_id"));
        System.out.println("aca el edition wero ----> " + request.getParameter("edition_id"));
        System.out.println("aca el edition wero ----> " + editionId);
        EditionService editionService= new EditionService();
         editionService.deleteEdition(editionId);
        response.sendRedirect("./index.jsp");
    }
}
