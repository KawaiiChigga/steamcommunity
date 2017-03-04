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
            User u = (User) session.getAttribute("currentsession");
            if (u == null) {
                out.println("<a href='login.jsp'>login</a>");
            } else {
                out.println("<a href='profile.jsp?username=" + u.getUsername() + "'>" +  u.getUsername() + "</a>");
            }
        %>
        
    </div>
</header>