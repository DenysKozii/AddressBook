package com.softserve.itacademy;

import com.softserve.itacademy.AddressBook;
import com.softserve.itacademy.SortOrder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet("/records/list")
public class RecordListServlet extends HttpServlet {

    private AddressBook addressBook;

    @Override
    public void init() throws ServletException {
        addressBook = AddressBook.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/record-list.jsp");
        if(request.getParameter("sort")!=null)
            addressBook.sortedBy(SortOrder.valueOf(request.getParameter("sort").toUpperCase()));

        Iterator<String> iterator = addressBook.iterator();
        List<String> records = new ArrayList<>();
        iterator.forEachRemaining(records::add);

        request.setAttribute("records", records);
        requestDispatcher.forward(request,response);
    }
}
