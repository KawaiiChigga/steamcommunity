/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.CtrlAccount;
import controller.CtrlDiscussion;
import controller.CtrlPost;
import controller.CtrlThread;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Discussion;
import model.Post;
import model.User;
import model.Thread;
/**
 *
 * @author Daniel
 */
@WebServlet(name = "NewThreadServlet", urlPatterns = {"/newthread"})
public class NewThreadServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User cur = CtrlAccount.getUser((Integer) request.getSession().getAttribute("currentsession"));
        Thread u = new Thread(
                CtrlDiscussion.getDisc(Integer.parseInt(request.getParameter("idDiscussion"))), 
                cur, 
                request.getParameter("txtTitle"), 
                new Date(), 
                (byte) 0, 
                (byte) Integer.parseInt(request.getParameter("rbPost"))
        );
        
        u = CtrlThread.insertThread(u);
        
        Post p = new Post(
                u, 
                cur, 
                request.getParameter("txtContent"), 
                new Date(), 
                new Date()
        );
        
        CtrlPost.insertPost(p);
        response.sendRedirect("post.jsp?tid=" + u.getThreadId() + "&id="+ u.getDiscussion().getDiscussionId());
//        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//        rd.forward(request, response);
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
