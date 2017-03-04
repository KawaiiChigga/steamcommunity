<%@page import="controller.CtrlAccount"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <%
            User ses = (User) session.getAttribute("currentsession");
            User req = CtrlAccount.getUser(request.getParameter("username"));
        %>
        <div class="container">
            <jsp:include page="header.jsp" flush="true" />
            <div class="profile_header">
                <div class="profile_avatar" 
                     style="background-image: url('image/user/<%=req.getImageUrl()%>'); 
                     background-repeat: no-repeat;
                     background-size: contain">
                </div>
                <div class="profile_summary">
                    <div class="profile_persona">
                        <h3><%=req.getUsername()%></h3>
                        <p><b><%=req.getName()%></b> 
                            <%
                                if (!req.getCity().equals("") || !req.getProvince().equals("") || !req.getCountry().equals("")) {
                                    out.println("at");
                                    out.println(req.getCity() + " " + req.getProvince() + " " + req.getCountry());
                                }
                            %> 
                        </p>
                    </div>
                    <div class="profile_desc">
                        <%=req.getDescription()%>
                    </div>
                    <div style="clear: both;"></div>
                </div>
                <div class="profile_edit_btn">
                    <%
                        if (ses.getUsername().equals(req.getUsername())) {
                    %>
                            <a href="editprofile.jsp"><input type="button" value="Edit Profile"></a><br/><br/>
                            <a href="logout?logout=yes"><input type="button" value="Log Out"></a><br/><br/>
                            <a href="discussion.jsp"><input type="button" value="New Thread"></a>
                    <%  
                        } else {
                    %>
                            <a href="editprofile.jsp"><input type="button" value="Add Friend"></a><br/><br/>
                    <%  
                        }
                    %>
                </div>
                <div style="clear: both;"></div>
            </div>
            <div class="profile_content">
                <div class="profile_content_left">
                    <h2>Recent Activity</h2>
                    <hr />
                </div>
                <div class="profile_content_right">
                    <h4>Friends</h4>
                </div>
                <div style="clear: both;"></div>
            </div>
            
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </body>
</html>
