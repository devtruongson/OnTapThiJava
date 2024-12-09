<%-- 
    Document   : login.jsp
    Created on : Dec 9, 2024, 9:51:32 PM
    Author     : truongson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <div>
            <form action="LoginServlet" method="POST">
                <input value="<%=(session.getAttribute("username") != null) ? session.getAttribute("username") : ""%>" name="username" placeholder="Nhap username...."  required/>
                <input value="<%=(session.getAttribute("password") != null) ? session.getAttribute("password") : ""%>" name="password" placeholder="Nhap password...."  required/>
                <button>Login</button>
                <button type="reset">Reset</button>
            </form>
            <h1><%=(session.getAttribute("msg") != null) ? session.getAttribute("msg") : ""%></h1>
        </div>
    </body>
</html>
