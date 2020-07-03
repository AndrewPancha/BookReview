<#import "parts/common.ftlh" as c>
<@c.page; section>
    <#if section = "styles">
        <style type="text/css">
            .navbar {
                padding: 1% 0;
                font-size: 1.2em;
            }

            .bg{
                background: url(img/index.jpeg) no-repeat;
                height: 100%;
                width: 100vh;
                background-size: 100%;
            }

            .container{
                position: absolute;
                top: 28vh;
            }



            .landing-text{
                text-align: center;
                vertical-align: middle;
            }

            /*.landing-text h2 {*/
            /*    font-size: 300%;*/
            /*    font-weight: 700;*/
            /*}*/
        </style>
    </#if>
    <#if section="content">
        <#include "navbar.ftlh">
        <div class="container-fluid bg">
        <div class="row justify-content-center">
            <div class="container">
                <div class="landing-text">
                    <h1>BookReview</h1>
                    <h4>Add your review</h4>
                    <a href="/login" class="btn btn-default btn-lg">Get Started</a>
                </div>
            </div>
            </div>
        </div>
    </#if>
</@c.page>