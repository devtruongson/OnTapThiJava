<%-- 
    Document   : display.jsp
    Created on : Dec 9, 2024, 3:14:08 PM
    Author     : truongson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            html {
                font-family: "System-UI";
            }

            .flex{
                display: flex;
            }

            .row{
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            .col-6{
                width: 48%;
            }

            input{
                width: 100%;
                height: 40px;
                padding: 0 10px;
                outline: none;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            label{
                display: block;
                font-weight: 600;
            }

            .mt-5{
                margin-top: 3rem;
            }

            button{
                height: 40px;
                outline: none;
                padding: 0 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-top: 10px;
            }

            table{
                border-collapse: collapse;
                width: 100%;
            }

            th,tr,td{
                border: 1px solid #ccc;
                padding: 6px 10px;
            }

            .text-center{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
