<%-- 
    Document   : search
    Created on : Mar 7, 2017, 7:59:00 PM
    Author     : Sujana
--%>

<%@page import="controller.CtrlAccount"%>
<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Discussion"%>
<%@page import="model.Thread"%>
<%@page import="controller.CtrlDiscussion"%>
<%@page import="controller.CtrlThread"%>
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
                        String cari = request.getParameter("Searching");
                        String carithread = request.getParameter("search");
                        String carif = request.getParameter("searchfriend");
                        if (cari != null) {
                            ArrayList<Discussion> dat = CtrlDiscussion.getAllSearch(cari);
                            out.print("<h3 style=color:#66C0F4>Keyword: " + cari + "</h3>");
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
                    } else if (carithread != null) {
                        int index = Integer.parseInt(request.getParameter("discID"));
                        ArrayList<Thread> da = CtrlThread.getAllSearch(carithread, index);
                        out.print("<h3 style=color:#66C0F4>Keyword: " + carithread + "</h3>");
                        out.print("<div class=line></div><br>");
                        for (int i = 0; i < da.size(); i++) {
                            Thread temp = da.get(i);
                    %>
                    <a href="post.jsp?tid=<%=temp.getThreadId()%>&id=<%=index%>">
                        <div class="contentth"><%=temp.getTitle()%></div>
                    </a>
                    <%
                        }
                    } else if (carif != null) {
                        ArrayList<User> dat = CtrlAccount.getAllSearch(carif);
                        out.print("<h3 style=color:#66C0F4>Keyword: " + carif + "</h3>");
                        out.print("<div class=line></div><br>");
                        for (int i = 0; i < dat.size(); i++) {
                            User temp = dat.get(i);
                     %>
                       <div class="discussionbar">
                        <div class="discussionbarlogo" style="
                             background-image: url('image/games/<%=temp.getImageUrl()%>');
                             background-repeat: no-repeat;
                             background-size: contain;">
                        </div>
                        <a href="profile.jsp?uid=<%=temp.getUserId()%>" class="discussiontitle"><%=temp.getUsername()%></a>
                        </div>
                        <%
                            }
                        }
%>

                </div>
            </div>

        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
