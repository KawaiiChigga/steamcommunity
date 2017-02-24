<%-- 
    Document   : thread
    Created on : Feb 23, 2017, 6:21:14 PM
    Author     : Sujana
--%>

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
            CtrlThread ct = new CtrlThread();
            ArrayList<Thread> data = new ArrayList<Thread>();
            data = ct.getAllThread();
        %>
        <div class="container">
            <jsp:include page="header.jsp" flush="true" />
            <div class="content">
                <jsp:include page="headerthread.jsp" flush="true" />
                <div class="contentthread">
                    <div class="contentthreadleft">
                        
                <%
                        for (int i = 0; i < 10; i++) {
//                           Thread temp = data.get(i);
//                           out.print("<div class=contentth>");
//                           out.print(temp.getTitle()+"<br/>");
//                           out.print("</div>");
                            out.println("<div class='contentth'>");
                            out.println("<h4>help me</h4>");
                            out.println("</div>");
                        }
                %>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </body>
</html>
