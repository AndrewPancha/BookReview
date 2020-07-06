<#import "common.ftlh" as c>

<@c.page; section>
    <#if section="styles">
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
    </#if>

    <#if section="content">
        <#include "navbar.ftlh">
        <h5>${username}</h5>
        ${message!}
        <form method="post">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Password: </label>
                <div class="col-sm-6">
                    <input type="password" name="password" class="form-control" placeholder="Password"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Email: </label>
                <div class="col-sm-6">
                    <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}"/>
                </div>
            </div>

            <button class="btn btn-primary" type="submit">Save</button>
        </form>
    </#if>
</@c.page>