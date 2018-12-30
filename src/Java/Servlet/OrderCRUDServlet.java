/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.OrderDAO;
import Model.Order;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Khanh
 */
public class OrderCRUDServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            if (action.equals("view")) {
                Order tmpOrder = OrderDAO.selectOrderById(Integer.parseInt(request.getParameter("id")));
                RequestDispatcher dispatcher = request.getRequestDispatcher("/view-order.jsp");
                request.setAttribute("order", tmpOrder);
                dispatcher.forward(request, response);
            }
            else if (action.equals("change-status")) {
                String newStatus = request.getParameter("to");
                Order tmpOrder = OrderDAO.selectOrderById(Integer.parseInt(request.getParameter("id")));
                OrderDAO.changeStatus(tmpOrder, newStatus);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("/manage-order.jsp");
                request.setAttribute("action", "change-status");
                request.setAttribute("status", "success");
                dispatcher.forward(request, response);
            }
            else if (action.equals("edit")) {
                Order tmpOrder = OrderDAO.selectOrderById(Integer.parseInt(request.getParameter("id")));
                RequestDispatcher dispatcher = request.getRequestDispatcher("/edit-order.jsp");
                request.setAttribute("currentOrder", tmpOrder);
                dispatcher.forward(request, response);
            }
            else if (action.equals("delete")) {
                OrderDAO.deleteOrderById(Integer.parseInt(request.getParameter("id")));
                RequestDispatcher dispatcher = request.getRequestDispatcher("/manage-order.jsp");
                request.setAttribute("action", "delete-order");
                request.setAttribute("status", "success");
                dispatcher.forward(request, response);
            }
        }
        catch (IOException ex) {}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
