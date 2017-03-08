<%-- 
    Document   : thread
    Created on : Feb 23, 2017, 6:21:14 PM
    Author     : Sujana
--%>

<%@page import="model.Discussion"%>
<%@page import="controller.CtrlDiscussion"%>
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
            Discussion d = CtrlDiscussion.getDisc(Integer.parseInt(request.getParameter("id")));
        %>
        <div class="container">
            <jsp:include page="header.jsp" flush="true" />
            <div class="content">
                <jsp:include page="headerthread.jsp" flush="true" />
                <div class="contentthread">
                <%
                    String showThread = "";
                    if (request.getParameter("desc") != null) {
                        showThread = request.getParameter("desc");
                    }
                    if (showThread.equals("true")) {
                %>
                        <div class="contentthreadleft">
                            <p><%=(d.getDescription()).replace("\n", "<br/>")%></p>
                        </div>
                <%
                    } else {
                %>
                        <div class="contentthreadleft">
                        <%
                            int category;
                            if (request.getParameter("categoryID") != null) {
                                category = Integer.parseInt(request.getParameter("categoryID"));
                            } else {
                                category = 1;
                            }
                            ArrayList<Thread> data;
                            if (category == 2) {
                                data = CtrlThread.getAllThread(d.getDiscussionId(), 2);
                            } else {
                                data = CtrlThread.getAllThread(d.getDiscussionId(), 1);
                            }
                            for (int i = 0; i < data.size(); i++) {
                                Thread temp = data.get(i);
                                out.println("<a href='post.jsp?tid=" + temp.getThreadId() + "&id=" + d.getDiscussionId() + "'><div class=contentth>");
                                out.println(temp.getTitle() + "<p class='viewall' style='margin-top:0px;'>" + temp.getPublishDateTime() + "</p>");
                                out.println("</div></a>");
                            }
                        %>
                        </div>
                    <%
                        }
                    %>
                    <div class="contentthreadright">
                        <form action="#" method="GET">
                            <input type="text" name="search" placeholder="Search topics" />
                            <input type="submit" value="Search" />
                        </form>
                        <br/>
                        <div class="contentbox">
                            <a href="addThread.jsp?id=<%=d.getDiscussionId()%>"><input type="button" value="Start a new Topic"></a>
                        </div>
                        <br/>
                        <div class="contentbox">
                            <a>SUB FORUMS</a> <br/>
                            <div class="line" ></div>
                            <a href="thread.jsp?id=<%=d.getDiscussionId()%>&categoryID=1"><h4>General Discussion</h4></a> 
                            <a href="thread.jsp?id=<%=d.getDiscussionId()%>&categoryID=2"><h4>Trading</h4></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
