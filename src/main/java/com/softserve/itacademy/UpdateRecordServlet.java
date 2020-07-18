package com.softserve.itacademy;

import com.softserve.itacademy.AddressBook;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/records/update")
public class UpdateRecordServlet extends HttpServlet {

    private AddressBook addressBook;
    String firstName;
    String lastName;

    @Override
    public void init() throws ServletException {
        addressBook = AddressBook.getInstance();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        addressBook.update(firstName, lastName, request.getParameter("address"));
        response.sendRedirect("/records/list");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = addressBook.read(request.getParameter("first-name"),request.getParameter("last-name"));
        if (address == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
            return;
        }
        request.setAttribute("address",address);
        request.setAttribute("first-name",request.getParameter("first-name"));
        request.setAttribute("last-name",request.getParameter("last-name"));
        firstName = request.getParameter("first-name");
        lastName = request.getParameter("last-name");
        request.getRequestDispatcher("/WEB-INF/update-record.jsp").forward(request,response);
    }
}
