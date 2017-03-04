/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.CtrlAccount;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Daniel
 */
@WebServlet(name = "EditProfileServlet", urlPatterns = {"/edit"})
@MultipartConfig
public class EditProfileServlet extends HttpServlet {
    private static final String SAVE_DIR = "/image/user";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User u = CtrlAccount.getUser((Integer) request.getSession().getAttribute("currentsession"));
        
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        
        if (isMultipart) {
            System.out.println("multi");
            int maxFileSize = 50 * 1024;
            int maxMemSize = 4 * 1024;
        
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(maxMemSize);
            
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax(maxFileSize);
            try {
                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                    
                    if (!item.isFormField()) {
                        String name = u.getUserId() + "." + FilenameUtils.getExtension(item.getName()); 
                        String root = new File(request.getServletContext().getRealPath("")).getParentFile().getParent();
                        File uploadedFile = new File(root + "/web" + SAVE_DIR + File.separator + name);
                        item.write(uploadedFile);
                        
                        u.setImageUrl(name);
                    } else {
                        switch (item.getFieldName()) {
                            case "txtProfileName" : u.setUsername(item.getString()); break;
                            case "txtSummary" : u.setDescription(item.getString()); break;
                            case "txtRealName" : u.setName(item.getString()); break;
                            case "txtCountry" : u.setCountry(item.getString()); break;
                            case "txtProvince" : u.setProvince(item.getString()); break;
                            case "txtCity" : u.setCity(item.getString()); break;
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        } else {
            u.setUsername(request.getParameter("txtProfileName"));
            u.setDescription(request.getParameter("txtSummary"));
            u.setName(request.getParameter("txtRealName"));
            u.setCountry(request.getParameter("txtCountry"));
            u.setProvince(request.getParameter("txtProvince"));
            u.setCity(request.getParameter("txtCity"));
        }

//        HttpSession session = request.getSession();
//        User ss = (User) session.getAttribute("currentsession");
//        System.out.println(ss.getUserId());
        CtrlAccount.edit(u);
        
        request.getSession().setAttribute("currentsession", u.getUserId());
        response.sendRedirect("profile.jsp?uid="+u.getUserId());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
