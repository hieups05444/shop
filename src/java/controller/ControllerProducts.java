/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import getDB.ProductGET;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Shun
 */
@WebServlet(name = "ControllerProducts", urlPatterns = {"/ControllerProducts"})
public class ControllerProducts extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
        try {
            String action = request.getParameter("action");
            if (action.equals("Delete")) {
                String productID = request.getParameter("txtID");
                long a = Long.parseLong(productID);
                ProductGET sp = new ProductGET();
                sp.deleteProduct(a);
                String url = "ControllerProducts?action=Search Product&txtTenSP=";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("Edit")) {
                String code = request.getParameter("txtID");
                String name = request.getParameter("txtName");
                String pri = request.getParameter("txtPrice");
                float fpri = Float.parseFloat(pri);
                ProductGET sp = new ProductGET(code, name, fpri);
                request.setAttribute("SP", sp);
                String url = "editProduct.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("Update")) {
                String code = request.getParameter("txtCode");
                String name = request.getParameter("txtName1");
                String price = request.getParameter("txtPrice1");
                float fpri = Float.parseFloat(price);
                String img = request.getParameter("txtImg1");
                String brand = request.getParameter("txtBrand1");
                String availability = request.getParameter("txtAvailability1");
                int iAvailability = Integer.parseInt(availability);
                ProductGET sp = new ProductGET();
                String url = "ControllerProducts?action=Search Product&txtTenSP=";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("insert")) {
                String productID = request.getParameter("maid");
                long maid = Long.parseLong(productID);
                String madm = request.getParameter("madm");
                long lmadm = Long.parseLong(madm);
                String TenSanPham = request.getParameter("TenSanPham");
                String Giatien = request.getParameter("Giatien");
                float fpri = Float.parseFloat(Giatien);
                String chitiet = request.getParameter("Chitiet");
                String img = request.getParameter("hinh");
                ProductGET sp = new ProductGET();
                sp.insert(maid, lmadm, TenSanPham, img, fpri, chitiet);
                RequestDispatcher rd = request.getRequestDispatcher("manager.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
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
