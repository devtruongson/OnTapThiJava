<%-- 
    Document   : login.jsp
    Created on : Dec 9, 2024, 2:17:18 PM
    Author     : truongson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>


<%
    Boolean isLoginFailure = null;
    
    String LoginCode =(String) request.getParameter("code");
    if (LoginCode != null) {
        isLoginFailure = true;
    }
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

            html {
                font-family: "System-UI";
            }

            .mt-5{
                margin-top: 3rem !important;
            }

            .row{
                display: flex;
                justify-content: space-between;
                align-items: center;
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
                width: 100%;
                border: 1px solid #ccc;
                border-radius: 6px;
                height: 40px;
                padding: 0 10px;
            }

            button{
                border: 1px solid #ccc;
                border-radius: 6px;
                height: 40px;
                padding: 0 10px;
            }

            .container{
                max-width: 1320px;
                margin: 0 auto;
            }

            .text-center{
                text-align: center;
            }

            .mt-3{
                margin-top: 1rem;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center">Nguyen Truong Son - DHTI15A10HN - 21103100538</h1>
            <div>
                <form class="row" action="LoginServlet" method="POST">
                    <div class="col-6">
                        <label>Username</label>
                        <input name="username" placeholder="Nhap Username Cua Ban...."/>
                    </div>
                    <div class="col-6">
                        <label>Password</label>
                        <input name="password" placeholder="Nhap password Cua Ban...." type="password" />
                    </div>
                    <div class="mt-3">
                        <button>Dang Nhap</button>
                    </div>
                </form>
            </div>
            <div class="mt-5">
                <%
                    if (isLoginFailure != null && isLoginFailure) {
                        %>
                        <h2>Ban Da Dang Nhap That Bai  <%= session.getAttribute("msg") %></h2>
                        <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
