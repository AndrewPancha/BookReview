<#import "common.ftlh" as c>

<@c.page; section>
<#--    <div class="mb-1">Register</div>-->
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

            .nav-item{
                color: white;
            }

            .bg{
                background: url(https://www.google.com/url?sa=i&url=https%3A%2F%2Fblogs.edweek.org%2Fedweek%2Ffinding_common_ground%2F2019%2F03%2F12_books_you_need_on_your_leadership_bookshelf.html&psig=AOvVaw08lz4PiqE4vUtonO5ElaXk&ust=1593885720724000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjQtpfVseoCFQAAAAAdAAAAABAD) no-repeat;
                height: 100%;
                width: 100%;
                background-size: cover;
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
<#--                        <div class="form-group">-->
<#--                            <label for="email">Email: </label>-->
<#--                            <input type="email" name="email" id="email" value="<#if user??>${user.email}</#if>"-->
<#--                                   class="form-control ${(emailError??)?string('is-invalid', '')}"-->
<#--                                   placeholder="some@some.com"/>-->
<#--                            <#if emailError??>-->
<#--                                <div class="invalid-feedback">-->
<#--                                    ${emailError}-->
<#--                                </div>-->
<#--                            </#if>-->
<#--                        </div>-->
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button class="btn btn-dark btn-primary btn-block" type="submit">Sign up</button>
                    </form>
                </div>
            </div>
        </div>
    </#if>
</@c.page>
