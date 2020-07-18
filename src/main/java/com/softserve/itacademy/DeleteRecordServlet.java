package com.softserve.itacademy;

import com.softserve.itacademy.AddressBook;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/records/delete")
public class DeleteRecordServlet extends HttpServlet {
    private AddressBook addressBook;

    @Override
    public void init() throws ServletException {
        addressBook = AddressBook.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = addressBook.read(request.getParameter("first-name"),request.getParameter("last-name"));
        if (address == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
            return;
        }
        addressBook.delete(request.getParameter("first-name"),request.getParameter("last-name"));
        response.sendRedirect("/records/list");
    }
}
