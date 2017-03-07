<%-- 
    Document   : search
    Created on : Mar 7, 2017, 7:59:00 PM
    Author     : Sujana
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Discussion"%>
<%@page import="controller.CtrlDiscussion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" flush="true" />
            <div class="content">
                 <div class="contenthomeleft">
             <%
                        String cari= request.getParameter("Searching");
                        CtrlDiscussion dt = new CtrlDiscussion();
                        ArrayList<Discussion> dat = new ArrayList<Discussion>();
                        dat = dt.getAllSearch(cari);
                        out.print("<h3 style=color:#66C0F4>Keyword: "+cari+"</h3>");
                        out.print("<div class=line></div><br>");
                        for (int i = 0; i < dat.size(); i++) {
                            Discussion temp = dat.get(i);
            %> 
               <div class="discussionbar">
                                <div class="discussionbarlogo" style="
                                    background-image: url('image/games/<%=temp.getImgurl()%>');
                                    background-repeat: no-repeat;
                                    background-size: contain;">
                                </div>
                                <a href="thread.jsp?id=<%=temp.getDiscussionId()%>" class="discussiontitle"><%=temp.getGamename()%></a>
                                <a href="thread.jsp?id=<%=temp.getDiscussionId()%>" class="viewall">VIEW ALL</a>
                            </div>
                    <%
                        }
                    %>
                 </div>
                </div>
                   
            </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
