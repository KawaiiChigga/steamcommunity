<%-- 
    Document   : thread
    Created on : Feb 23, 2017, 6:21:14 PM
    Author     : Sujana
--%>

<%@page import="model.User"%>
<%@page import="model.Post"%>
<%@page import="controller.CtrlAccount"%>
<%@page import="controller.CtrlPost"%>
<%@page import="controller.CtrlThread"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Thread"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Start Your Thread</title>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <%
            Thread currentThread = CtrlThread.getThread((Integer.parseInt(request.getParameter("tid"))));
            ArrayList<Post> posts = CtrlPost.getAllPost((Integer.parseInt(request.getParameter("tid"))));
            User poster = CtrlAccount.getUser(currentThread.getUser().getUserId());
        %>
        <div class="container">
            <jsp:include page="header.jsp" flush="true" />
            <div class="content">
                <jsp:include page="headerthread.jsp" flush="true" />
                <div class="contentthread">
                    <div class="edit_profile_avatar" style="background-image: url('image/user/<%= poster.getImageUrl() %>'); background-repeat: no-repeat; background-size:contain; ">
                    </div> 
                    <div class="firstpost">
                        <h4><%= poster.getUsername() %></h4>
                        <h2><%= currentThread.getTitle() %></h2>
                        <text><%= posts.get(0).getMessage().replace("\n", "<br />") %></text>
                    </div>
                    <div class="contentthreadleft">
                    
                <%
                        for (int i = 1; i<posts.size() ; i++) {
//                           Thread temp = data.get(i);
//                           out.print("<div class=contentth>");
//                           out.print(temp.getTitle()+"<br/>");
//                           out.print("</div>");
                            User usercom = CtrlAccount.getUser(posts.get(i).getUser().getUserId());
                            out.println("<div class='contentpost'>");
                            out.println("<h5>" + usercom.getUsername() + "</h5>");
                            out.println("<h4>" + posts.get(i).getMessage().replace("\n", "<br />")  + "</h4>");
                            out.println("</div>");
                        }
                %>
                <div class="form-group">
                    <form action="newPost" method="post">
                
     
                
                        <br>
                <textarea style="resize:none;background-color:rgb(15,25,40); color:white;" class="form-control" rows="5" id="comment" name="postcontent" placeholder="say something"></textarea>
                <br>
                <input type="submit" class="btn btn-default" style="background-color:rgb(0,100,0);width:25%; color:white; float:right; font-family: lato; font-size: 16px;" value="Post Reply">
                <input type="hidden" name="threadid" value="<%= currentThread.getThreadId() %>">
                    </form>
                </div>
                    </div>
                    
                </div>
                <div style="clear:both"></div>
            </div>
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </body>
</html>
