<#import "parts/common.ftlh" as c>

<@c.page; section>
<#--    <div class="mb-1">Register</div>-->
    <#if section = "styles">
        <style type="text/css">
            .navbar {
                padding: 1% 0;
                font-size: 1.2em;
            }



            .form-container {
                background: #fff;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px #000;
                position: absolute;
                top: 15vh;
            }

            @media only screen and (max-width: 678px) {
                .bg {
                    background-size: 300%;
                }
            }

        </style>
    </#if>
    <#if section="content">
        <#include "navbar.ftlh">
        <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
<#--            <div class="alert alert-danger" role="alert">-->
<#--                ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}-->
<#--            </div>-->
        </#if>
        <#if message??>
            <div class="alert alert-${messageType}" role="alert">
                ${message}
            </div>
        </#if>
        <div class="container-fluid bg">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-6 col-md-3">
                    <form action="/registration" method="post" class="form-container">
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
                        <div class="form-group">
                            <label for="password2">Password: </label>
                            <input type="password" name="password2" id="password2"
                                   class="form-control ${(password2Error??)?string('is-invalid', '')}"
                                   placeholder="Retype password"/>
                            <#if password2Error??>
                                <div class="invalid-feedback">
                                    ${password2Error}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label for="email">Email: </label>
                            <input type="email" name="email" id="email" value="<#if user??>${user.email}</#if>"
                                   class="form-control ${(emailError??)?string('is-invalid', '')}"
                                   placeholder="some@some.com"/>
                            <#if emailError??>
                                <div class="invalid-feedback">
                                    ${emailError}
                                </div>
                            </#if>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button class="btn btn-primary btn-block" type="submit">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </#if>
</@c.page>
