<%@page import="controller.CtrlAccount"%>
<%@page import="model.User"%>
<%@page import="model.Post"%>
<%@page import="controller.CtrlPost"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <%
            Post cur = null;
            Integer disc;
            User now = CtrlAccount.getUser((Integer) session.getAttribute("currentsession"));
            boolean moderator = false;
            if (request.getParameter("postid") != null && request.getParameter("id") != null) {
                cur = CtrlPost.getPost(Integer.parseInt(request.getParameter("postid")));
                disc = Integer.parseInt(request.getParameter("id"));
                if (now.getDiscussion() != null) {
                    if (now.getDiscussion().getDiscussionId() == disc) {
                        moderator = true;
                    }
                }
                if (cur.getUser().getUserId() != now.getUserId() && !moderator) {
                    return;
                }
            } else {
                return;
            }
            
        %>
        <div class="container">
            <jsp:include page="header.jsp" flush="true" />
            <div class="content">
                <div class="contentthreadleft" style="background: #223245;text-align: justify; line-height: 23px; margin-top: 20px ; padding-top: 5px;padding-left: 30px; padding-right: 30px">
                <p style="color:white">Edit Post</p><hr/> 
                <form action="editpost" method="POST">
                    Content:<br/>
                    <textarea style="resize:none;background-color:rgb(15,25,40); color:white;" class="form-control" rows="10" id="comment" name="txtContent"><%=cur.getMessage().replace("\n", "<br />") %></textarea>
                    <br/>
                    <input type="hidden" name="postid" value="<%=cur.getPostId()%>" />
                    
                    <button type="submit" name="btn" class="btn btn-default" style="background-color:rgb(100,0,0);width:25%; color:white; float:left; font-family: lato; font-size: 16px;" value="delete">Delete Post</button>
                    <button type="submit" name="btn" class="btn btn-default" style="background-color:rgb(0,100,0);width:25%; color:white; float:right; font-family: lato; font-size: 16px;" value="edit">Edit Post</button>
                </form>
                    
                </div>
                <div style="clear:both;"></div>
            </div>
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </body>
</html>
