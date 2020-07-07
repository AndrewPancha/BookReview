<#import "common.ftlh" as c>
<@c.page; section>
    <#if section = "styles">
        <style type="text/css">
            html,
            body {
                height: 100%;
                width: 100%;
                background: url(img/1483382.jpg) no-repeat center center fixed;
                background-size: cover;
            }

            .navbar {
                padding: 1% 2%;
                font-size: 1.2em;
            }

            .navbar-nav{
                color: white;
            }

            .container{
                height: 80%;
                width: 100%;
                display: table;
                position: relative;
            }

            .landing-text{
                display: table-cell;
                text-align: center;
                vertical-align: middle;
                color: white;
            }

            .landing-text h1 {
                font-size: 500%;
                font-weight: 700;
                color: white;
            }

            .btn{
                color: white;
            }
        </style>

    </#if>
    <#if section="content">
        <#include "navbar.ftlh">
        <div class="container col-md-6">
        <div class="landing-text">
            <h1>BookReview</h1>
            <h4>Add your review</h4>
            <a href="/login" class="btn btn-default btn-lg">Get Started</a>
        </div>
        </div>
    </#if>
</@c.page>







