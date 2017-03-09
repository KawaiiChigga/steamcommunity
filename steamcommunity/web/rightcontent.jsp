<%@page import="controller.CtrlDiscussion"%>
<%@page import="model.Discussion"%>
<%
    Discussion d = CtrlDiscussion.getDisc(Integer.parseInt(request.getParameter("id")));
    Integer cat;
    if (request.getParameter("categoryID") != null) {
        cat = Integer.parseInt(request.getParameter("categoryID"));
    } else {
        cat = 0;
    }
%>
<form action="search.jsp" method="GET">
    <input type="text" name="search" placeholder="Search topics" />
    <input type="hidden" name="discID" value="<%=request.getParameter("id")%>"/>
    <input type="submit" value="Search" />
</form>
<br/>
<div class="contentbox">
    <a href="addThread.jsp?id=<%=d.getDiscussionId()%>"><input type="submit" class="btn btn-default" style="background-color:rgb(27,40,56); margin-left:45px; margin-top:5px;color:white; font-family: lato; font-size: 16px;" value="Start a new topic"></a>
</div>
<br/>
<div class="contentbox">
    <a>SUB FORUMS</a> <br/>
    <div class="line" ></div>
    <%
        if (cat == 2) {
    %>
            <a href="thread.jsp?id=<%=d.getDiscussionId()%>&categoryID=1"><h4>General Discussion</h4></a> 
            <a href="thread.jsp?id=<%=d.getDiscussionId()%>&categoryID=2"><h4 style="color: #66C0F4">Trading</h4></a>
    <%
        } else if (cat == 1) {
    %>
            <a href="thread.jsp?id=<%=d.getDiscussionId()%>&categoryID=1"><h4 style="color: #66C0F4">General Discussion</h4></a> 
            <a href="thread.jsp?id=<%=d.getDiscussionId()%>&categoryID=2"><h4>Trading</h4></a>
    <%
        } else {
    %>
            <a href="thread.jsp?id=<%=d.getDiscussionId()%>&categoryID=1"><h4>General Discussion</h4></a> 
            <a href="thread.jsp?id=<%=d.getDiscussionId()%>&categoryID=2"><h4>Trading</h4></a>
    <%
        }
    %>
</div>