<%@page import="network.Factory"%>
<%@page import="controller.CtrlAccount"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header">
    <div class="headerlogo">
        <a href="index.jsp"><img src="image/globalheader_logo.png" alt=""/></a>
    </div>
    <div class="linkbar">
        <a href="index.jsp" class="linktext">DISCUSSIONS</a>
        <a href="about.jsp" class="linktext">ABOUT</a>
        <a href="support.jsp" class="linktext">SUPPORT</a>
    </div>
    <div class="loginbutton">
        <%
            Integer uid = (Integer) session.getAttribute("currentsession");
            if (uid == null) {
                out.println("<a href='login.jsp'>login</a>");
            } else {
                User u = CtrlAccount.getUser(uid);
                out.println("<a href='profile.jsp?uid=" + u.getUserId()+ "'>" +  u.getUsername() + "</a>");
            }
        %>
        
    </div>
</header>