<#import "common.ftlh" as c>

<@c.page; section>

    <#if section="styles">
        <style type="text/css">

            html,
            body {
                height: 100%;
                width: 100%;
                background: url(/img/1483382.jpg) no-repeat center center fixed;
                background-size: cover;
            }

            .navbar {
                padding: 1% 2%;
                font-size: 1.2em;
            }


            .landing-text{
                text-align: center;
                vertical-align: middle;
                color: white;
            }


        </style>
    </#if>

    <#if section="content">
        <#include "navbar.ftlh">
        <div class="container">
        <div class="landing-text">
            <h1>${book.bookName!"null or missing"}</h1>
            <p>${book.review!"null or missing"}</p>
            <h5>By: ${book.author!"null or missing"}</h5>
        </div>
        </div>
    </#if>

</@c.page>