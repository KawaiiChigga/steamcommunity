<%@page import="controller.CtrlDiscussion"%>
<%@page import="model.Discussion"%>
<%
    Discussion d = CtrlDiscussion.getDisc(Integer.parseInt(request.getParameter("id")));
%>
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