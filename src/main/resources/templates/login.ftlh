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



            .form-container{
                background: #fff;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px #000;
                position: absolute;
                top: 15vh;
            }

            @media only screen and (max-width: 678px) {
                .bg{
                    background-size: 300%;
                }
            }

            </style>
    </#if>
    <#if section="content">
        <#include "navbar.ftlh">

        <#if message??>
            <div class="alert alert-${messageType}" role="alert">
                ${message}
            </div>
        </#if>
        <div class="container-fluid bg">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-6 col-md-3">
                    <form action="/login" method="post" class="form-container">
                        <div class="form-group">
                            <label for="username"> User Name : </label>
                                <input type="text" name="username" id="username"
                                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                                       placeholder="User name"
                                       value="<#if user??>${user.username}</#if>"/>
                                <#if usernameError??>
                                    <div class="invalid-feedback">
                                        ${usernameError}
                                    </div>
                                </#if>
                        </div>
                        <div class="form-group">
                            <label for="password">Password: </label>
                                <input type="password" name="password" id="password"
                                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                                       placeholder="Password"/>
                                <#if passwordError??>
                                    <div class="invalid-feedback">
                                        ${passwordError}
                                    </div>
                                </#if>
                        </div>

                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button class="btn btn-primary btn-dark btn-block" type="submit">Sign in</button>
                        <a href="/registration" class="btn btn-dark btn-primary btn-block">Register</a>
                    </form>
                </div>
            </div>
        </div>
    </#if>
</@c.page>
