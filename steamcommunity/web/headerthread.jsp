<%-- 
    Document   : headerthread
    Created on : Feb 23, 2017, 6:34:59 PM
    Author     : Sujana
--%>

<%@page import="model.Discussion"%>
<%@page import="controller.CtrlDiscussion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="headerthread">
    <%
        Discussion d = CtrlDiscussion.getDisc(Integer.parseInt(request.getParameter("id")));
    %>
    <div class="linkbarthread">
        <h3><%=d.getGamename()%></h3> 
        <a href="thread.jsp?id=<%=d.getDiscussionId()%>" class="linktext">Discussions</a>
        <a href="thread.jsp?id=<%=d.getDiscussionId()%>&desc=true" class="linktext">Description</a>
        <hr/>
    </div>
</header>