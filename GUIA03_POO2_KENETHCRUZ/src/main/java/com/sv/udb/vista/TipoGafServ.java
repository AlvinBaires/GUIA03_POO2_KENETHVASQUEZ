/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.vista;

import com.sv.udb.controlador.TipoGafeCtrl;
import com.sv.udb.modelo.TipoGafe;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Orlando Vasquez
 */
@WebServlet(name = "TipoGafServ", urlPatterns = {"/TipoGafServ"})
public class TipoGafServ extends HttpServlet {

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
        boolean esValido = request.getMethod().equals("POST");
        if(esValido)
        {
            String mens = "";
            String CRUD = request.getParameter("cursBton");
            if(CRUD.equals("Guardar"))
            {
                TipoGafe obje = new TipoGafe();
                obje.setNombTipoGafe(request.getParameter("nombTipoGafe"));
                obje.setFechAlta(new Date());
                obje.setEsta(1);
                mens = new  TipoGafeCtrl().guar(obje) ? "Datos guardados" : "Datos no guardados";
                
            }
            else if(CRUD.equals("Consultar"))
            {
                long CodiTipoG = Long.parseLong(request.getParameter("codiTipoGafe") == null ? 
                        "0" : request.getParameter("codiTipoGafe"));
                TipoGafe objeEqui = new TipoGafeCtrl().get(CodiTipoG);
                if(objeEqui != null)
                {
                    request.setAttribute("codiTipoGafe", objeEqui.getCodiTipoGafe());
                    request.setAttribute("nombTipoGafe", objeEqui.getNombTipoGafe());
                    
                }
            }
//            else if(CRUD.equals("Degradar")){
//                LugaAcce obje = new LugaAcce();
//                obje.setNombLugaAcce(request.getParameter("nombLugaAcce"));
//                obje.setFechAlta(new Date());
//                obje.setFechBaja(new Date());
//                obje.setEsta(1);
//                obje.setCodiLugaAcce(Long.parseLong(request.getParameter("codiLugaAcce")));
//                mens = new LugaAcceCtrl().modificar(obje) ? "Lugar degradado" : "Hubo un problema";
//            }
            
            else if(CRUD.equals("Modificar")){
                 TipoGafe obje = new TipoGafe();
                obje.setNombTipoGafe(request.getParameter("nombTipoGafe"));
                obje.setFechAlta(new Date());
                //obje.setFechBaja(new Date());
                obje.setEsta(1);
                obje.setCodiTipoGafe(Long.parseLong(request.getParameter("codiTipoGafe")));
                mens = new TipoGafeCtrl().modificar(obje) ? "Datos modificados" : "Datos no modificados";
            }
            
            else if(CRUD.equals("Eliminar")){
                long CodiTipoG = Long.parseLong(request.getParameter("codiTipoGafe"));
                mens = new TipoGafeCtrl().eliminar(CodiTipoG) ? "Datos Eliminados" : "Datos no eliminados"; 
            }
            
            request.setAttribute("mensAler", mens);
            request.getRequestDispatcher("/TipoGaf.jsp").forward(request, response);
        }
        else {
            response.sendRedirect(request.getContextPath() + "/TipoGaf.jsp");
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
