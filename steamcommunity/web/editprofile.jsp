<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" flush="true" />
            <div class="edit_profile">
                <div class="edit_profile_avatar">
                    gambar
                </div>
                <div class="edit_profile_name">
                    <h3>Gaunled</h3>
                </div>
            </div>
            <div class="profile_content">
                <div class="profile_content_left">
                    <h2>Edit Profile</h2> <br/>
                    <form action="#" method="POST">
                        <table>
                            <tr><td>Profile Name</td>
                                <td><input type="text" name="txtProfileName" value="Gaunled"/></td></tr>
                            <tr><td>Real Name (?)</td>
                                <td><input type="text" name="txtRealName" value="Daniel"/></td></tr>
                            <tr><td>Country (?)</td>
                                <td><input type="text" name="txtCountry" value="Indonesia"></td></tr>
                            <tr><td>State/Province</td>
                                <td><input type="text" name="txtProvince" value="Jawa Barat"></td></tr>
                            <tr><td>City</td>
                                <td><input type="text" name="txtCity" value="Bandung"></td></tr>
                            <tr><td>Avatar</td>
                                <td><input type="file" name="txtAvatar"></td></tr>
                            <tr><td>Summary (?)</td>
                                <td><textarea name="txtSummary" rows="8" cols="60">Halo</textarea></td></tr>
                        </table>
                        <br/>
                        <input type="submit" value="Save Changes">
                    </form>
                </div>
            </div>
            
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </body>
</html>
