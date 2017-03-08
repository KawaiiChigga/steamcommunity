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
                    <div class="contentthreadleft">
                        
                        <div class="firstpost">
                            <div class="headpost">
                                <div class="profile_post" style="
                                    background-image: url('image/user/<%= poster.getImageUrl() %>'); 
                                    background-repeat: no-repeat; 
                                    background-size:contain; ">
                                </div> 
                                <div class="profile_namepost">
                                    <a href="profile.jsp?uid=<%=poster.getUserId()%>"><%= poster.getUsername() %> </a>
                                </div>
                            </div>
                            <div class="firstcontent">
                                <h2><%= currentThread.getTitle() %></h2>
                                <text><%= posts.get(0).getMessage().replace("\n", "<br />") %></text>
                            </div>
                        </div>
                    <%
                        for (int i = 1; i<posts.size() ; i++) {
                            User usercom = CtrlAccount.getUser(posts.get(i).getUser().getUserId());
                        %>
                            <div class="contentpost">
                                <div class="headpost">
                                    <div class="profile_post" style="
                                         background-image: url('image/user/<%=usercom.getImageUrl()%>'); 
                                         background-repeat: no-repeat; 
                                         background-size:contain; ">
                                    </div> 
                                    <div class="profile_namepost">
                                        <a href="profile.jsp?uid=<%=usercom.getUserId()%>"><%= usercom.getUsername() %></a>
                                    </div>
                                </div>
                                <div class="allpostcontent">
                                    <text><%= posts.get(i).getMessage().replace("\n", "<br />") %></text>
                                </div>
                            </div>
                        <%
                        }
                    %>
                        <div class="form-group">
                            <form action="newPost" method="post"> <br/>
                                <textarea style="resize:none;background-color:rgb(15,25,40); color:white;" class="form-control" rows="5" id="comment" name="postcontent" placeholder="say something"></textarea><br/>
                                <input type="submit" class="btn btn-default" style="background-color:rgb(0,100,0);width:25%; color:white; float:right; font-family: lato; font-size: 16px;" value="Post Reply">
                                <input type="hidden" name="threadid" value="<%= currentThread.getThreadId() %>">
                            </form>
                        </div>
                    </div>
                    <div class="contentthreadright">
                        <jsp:include page="rightcontent.jsp" flush="true" />
                    </div>
                    <div style="clear:both"></div>
                </div>
            </div>
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </body>
</html>
