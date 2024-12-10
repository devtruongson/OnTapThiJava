<%-- 
    Document   : login.jsp
    Created on : Dec 10, 2024, 10:23:05 PM
    Author     : truongson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String username = request.getAttribute("username") != null ? request.getAttribute("username").toString() : "";
    String password = request.getAttribute("password") != null ? request.getAttribute("password").toString() : "";
    String msg = request.getAttribute("msg") != null ? request.getAttribute("msg").toString() : "";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                box-sizing: border-box;
                padding: 0;
                margin: 0;
            }

            .container{
                max-width: 1320px;
                margin: 0 auto;
            }

            .row{
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            input{
                border: 1px solid #ccc;
                border-radius: 10px;
                height: 38px;
                width: 100%;
                padding: 0 20px;
            }

            .col-6{
                width: 48%;
            }

            label{
                display: block;
                font-weight: 7000;
            }

            .text-center{
                text-align: center;
            }

            .mt-5{
                margin-top: 3rem;
            }

            button{
                border: 1px solid #ccc;
                border-radius: 10px;
                padding: 10px 20px;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Nguyen Truong Son - DHTI15A10HN - 21103100538</h1>
            <form class="mt-5 row" method="POST" action="LoginServlet">
                <div class="col-6">
                    <label>Nhap username</label>
                    <input value="<%=username%>" placeholder="Nhap username...." name="username" required />
                </div>
                <div class="col-6">
                    <label>Nhap password</label>
                    <input value="<%=password%>" placeholder="Nhap password...." name="password" required />
                </div>
                <button>Dang Nhap</button>                
                <button type="reset">Reset</button>
            </form>
            <h1><%=msg%></h1>
        </div>
    </body>
</html>
