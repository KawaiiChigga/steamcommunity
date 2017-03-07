<%@page import="java.util.ArrayList"%>
<%@page import="model.Discussion"%>
<%@page import="controller.CtrlDiscussion"%>
<%@page import="model.User"%>
<%@page import="controller.CtrlAccount"%>
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
                <h3 style="color: #66C0F4">Welcome to the Steam Discussions</h3>
                <p><b>Everyone is invited!</b> The Steam discussions are for everyone, new and 
                    advanced user alike! </p>
                <p><b>Searching is key!</b> Before you post a question, use the forum search feature 
                    to determine whether your topic has already been covered. <br/> </p>
                <p><b>Do not start flame wars!</b> If someone has engaged in behavior that is a detriment 
                    to the message board -- spamming, flaming people, etc -- contact one of the forum moderators 
                    or report the post. Flaming the offensive user will only increase the problem. 
                    Harassment is not tolerated. </p>

                <form action="search.jsp" method="get">
                    <input type="text" name="Searching" placeholder="Search discussions" />
                    <input type="submit" value="Search" />
                </form>

                <br/>
                <h3 style="color: #66C0F4">Game Forums</h3>
                <div class="line"></div><br>
                <div class="contenthomeleft">
                    <%
                        CtrlDiscussion da = new CtrlDiscussion();
                        ArrayList<Discussion> data = new ArrayList<Discussion>();
                        data = da.getAllDiscussion();
                    
                        for (int i = 0; i < data.size(); i++) {
                            Discussion temp = data.get(i);
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
                    <%
                        User u = CtrlAccount.getUser((Integer) session.getAttribute("currentsession"));
                        if (u != null) {
                            if (u.getUserId() == 1) {
                    %>
                            <div class="contenthomeright">
                                <a href="addDiscussion.jsp"><input type="button" value="Create New Discussion"></a>
                            </div>
                    <%
                            }
                        }
                    %>
                
            </div>
            
        </div>
            <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
