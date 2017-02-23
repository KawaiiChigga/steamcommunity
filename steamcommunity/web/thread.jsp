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
            
        %>
        <jsp:include page="header.jsp" flush="true" />
        <div class="content">
        <jsp:include page="headerthread.jsp" flush="true" />
        <hr/>
         <%
                for (int i = 0; i < data.size(); i++) {
                    Thread temp = data.get(i);
                    out.print(temp.getTitle());
                }
         %>
        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
