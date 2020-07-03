<#import "parts/common.ftlh" as c>

<@c.page; section>
    <#if section = "styles">
        <style type="text/css">
            .navbar {
                padding: 1% 0;
                font-size: 1.2em;
            }

            .bg{
                background: url(https://www.google.com/url?sa=i&url=https%3A%2F%2Fblogs.edweek.org%2Fedweek%2Ffinding_common_ground%2F2019%2F03%2F12_books_you_need_on_your_leadership_bookshelf.html&psig=AOvVaw08lz4PiqE4vUtonO5ElaXk&ust=1593885720724000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNjQtpfVseoCFQAAAAAdAAAAABAD) no-repeat;
                height: 100%;
                width: 100vh;
                background-size: 100%;
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
                        <button class="btn btn-primary btn-block" type="submit">Sign in</button>
                        <a href="/registration" class="btn btn-primary btn-block">Register</a>
                    </form>
                </div>
            </div>
        </div>
    </#if>
</@c.page>
