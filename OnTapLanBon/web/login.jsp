<%-- 
    Document   : login.jsp
    Created on : Dec 10, 2024, 12:31:09 PM
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

            .text-center{
                text-align: center;
            }

            .mt-5{
                margin-top: 3rem;
            }

            .row{
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            .col-6{
                width: 48%;
            }

            label{
                display: block;
                font-weight: 700;
            }

            input{
                border: 1px solid #ccc;
                height: 40px;
                border-radius: 6px;
                padding: 0 10px;
                width: 100%;
            }

            button{
                border: 1px solid #ccc;
                height: 40px;
                padding: 0 10px;
                border-radius: 6px;
                margin-top: 10px;
            }

            h2{
                font-size: 24px;
                background: #ee4d2d;
                text-align: center;
                padding: 10px 0;
                margin-top: 10px;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Nguyen Truong Son - DHTI15A10HN - 21103100538</h1> 
            <form class="mt-5 row" method="POST" action="LoginServlet">
                <div class="col-6">
                    <label>Nhap UserName</label>
                    <input value="<%=username%>" placeholder="Nhap username...." name="username" required />
                </div>
                <div class="col-6">
                    <label>Nhap Password</label>
                    <input value="<%=password%>" placeholder="Nhap password...." name="password" required />
                </div>
                <button>Dang Nhap</button>
                <button type="reset">Reset</button>
            </form>
            <%
                if (!msg.isEmpty()) {
            %>
            <h2><%=msg%></h2>
            <%
                }
            %>
        </div>
    </body>
</html>
