<%@page import="model.Discussion"%>
<%@page import="controller.CtrlThread"%>
<%@page import="model.Post"%>
<%@page import="controller.CtrlPost"%>
<%@page import="model.Friends"%>
<%@page import="controller.CtrlFriends"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.CtrlAccount"%>
<%@page import="model.User"%>
<%@page import="model.Thread"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <%
            User ses = CtrlAccount.getUser((Integer) session.getAttribute("currentsession"));
            User req = CtrlAccount.getUser(Integer.parseInt(request.getParameter("uid")));
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
                        if (ses == null) {
                            
                        } else if (ses.getUsername().equals(req.getUsername())) {
                    %>
                            <a href="editprofile.jsp"><input type="button" class="btn btn-default" style="background-color:rgb(27,40,56); width:75%;color:white; float:right; font-family: lato; font-size: 16px;" value="Edit Profile"></a><br/><br/>
                            <a href="logout?logout=yes"><input type="button" class="btn btn-default" style="background-color:rgb(27,40,56); width:75%; margin-top:5px;color:white; float:right; font-family: lato; font-size: 16px;" value="Log Out"></a><br/><br/>
                            
                    <%  
                        } else{
                            if (!CtrlFriends.checkFriend(ses.getUserId(), req.getUserId())) {
                    %>
                                <a href="friend?friendid=<%=req.getUserId()%>&status=save"><input type="button" value="Add Friend"></a><br/><br/>
                    <%  
                            } 
                        }
                    %>
                </div>
                <div style="clear: both;"></div>
            </div>
            <div class="profile_content">
                <div class="profile_content_left">
                    <h2>Recent Activity</h2>
                    <hr />
                    
                    <%
                        ArrayList<Post> activity = CtrlPost.getPostByUserID(req.getUserId());
                        for (int i = 0; i < activity.size(); i++) {
                            Thread th = CtrlThread.getThread(activity.get(i).getThread().getThreadId());
                    %>
                            <div class="activity">
                                <div class="activitytitle">
                                    <a href="post.jsp?tid=<%=th.getThreadId()%>&id=<%=th.getDiscussion().getDiscussionId()%>"><%= th.getTitle() %></a>
                                    <p class="viewall" style="margin-top: 2px;"><%=th.getPublishDateTime()%></p>
                                </div>
                                <div class="activitycontent">
                                    <%=activity.get(i).getMessage()%>
                                </div>
                            </div>
                    <%
                        }
                    %>
                </div>
                <div class="profile_content_right">
                    <form action="search.jsp" method="GET">
                        <input type="text" name="searchfriend" placeholder="Search Friends" />
                        
                        <input type="submit" value="Search" />
                    </form>
                    <%
                        if (ses != null) {
                            if (ses.getUsername().equals(req.getUsername())) {
                                ArrayList<Friends> listReq = CtrlFriends.getFriends(ses.getUserId(), "friendID", 1);
                                ArrayList<Friends> list = CtrlFriends.getFriends(req.getUserId(), "userID", 1);
                                out.println("<h4>Friends " + list.size() + "</h4>");
                                for (int i = 0; i < listReq.size(); i++) {
                                    User a = CtrlAccount.getUser(listReq.get(i).getId().getUserId());
                                    if (listReq.get(i).getStatus() == new Byte((byte) 0)) {
                        %>
                                        <a href="profile.jsp?uid=<%=a.getUserId()%>">
                                            <div class="friendlist">
                                                <div class="friendlistdisplay" style="
                                                    background-image: url('image/user/<%=a.getImageUrl()%>'); 
                                                    background-repeat: no-repeat;
                                                    background-size: contain"></div>
                                                <div class="friendlistusername">
                                                    <%=a.getUsername()%><br>
                                                        <a href='friend?friendid=<%=a.getUserId()%>&status=update' style='font-size:10px;'>Accept Friend Request</a>
                                                </div>
                                            </div>
                                        </a>
                        <%
                                    }
                                }
                                for (int i = 0; i < list.size(); i++) {
                                    User a = CtrlAccount.getUser(list.get(i).getId().getFriendId());
                        %>
                                    <a href="profile.jsp?uid=<%=a.getUserId()%>">
                                        <div class="friendlist">
                                            <div class="friendlistdisplay" style="
                                                background-image: url('image/user/<%=a.getImageUrl()%>'); 
                                                background-repeat: no-repeat;
                                                background-size: contain"></div>
                                            <div class="friendlistusername">
                                                <%=a.getUsername()%> <br>
                                                <%
                                                    if (list.get(i).getStatus() == new Byte((byte) 0)) {
                                                        out.println("<a href='#' style='font-size:10px;'>Pending</a>");
                                                    }
                                                %>
                                            </div>
                                        </div>
                                    </a>
                        <%
                                }
                            } else {
                                ArrayList<Friends> list = CtrlFriends.getFriends(req.getUserId(), "userID", 0);
                                out.println("<h4>Friends " + list.size() + "</h4>");
                                for (int i = 0; i < list.size(); i++) {
                                    if (list.get(i).getStatus() != new Byte((byte) 0)) {
                                        User a = CtrlAccount.getUser(list.get(i).getId().getFriendId());
                        %>
                                        <a href="profile.jsp?uid=<%=a.getUserId()%>">
                                            <div class="friendlist">
                                                <div class="friendlistdisplay" style="
                                                    background-image: url('image/user/<%=a.getImageUrl()%>'); 
                                                    background-repeat: no-repeat;
                                                    background-size: contain"></div>
                                                <div class="friendlistusername">
                                                    <%=a.getUsername()%><br>
                                                </div>
                                            </div>
                                        </a>
                        <%
                                    }
                                }
                            }
                        } else {
                            ArrayList<Friends> list = CtrlFriends.getFriends(req.getUserId(), "userID", 0);
                            out.println("<h4>Friends " + list.size() + "</h4>");
                            for (int i = 0; i < list.size(); i++) {
                                if (list.get(i).getStatus() != new Byte((byte) 0)) {
                                    User a = CtrlAccount.getUser(list.get(i).getId().getFriendId());
                    %>
                                    <a href="profile.jsp?uid=<%=a.getUserId()%>">
                                        <div class="friendlist">
                                            <div class="friendlistdisplay" style="
                                                background-image: url('image/user/<%=a.getImageUrl()%>'); 
                                                background-repeat: no-repeat;
                                                background-size: contain"></div>
                                            <div class="friendlistusername">
                                                <%=a.getUsername()%><br>
                                            </div>
                                        </div>
                                    </a>
                    <%
                                }
                            }
                        }
                    %>
                </div>
                <div style="clear: both;"></div>
            </div>
            
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </body>
</html>
