<#include "parts/security.ftlh">
<#import "parts/login.ftlh" as l>

<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
    <div class="container-fluid">
    <a class="navbar-brand" href="/greeting">BookReview</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/main">Reviews</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">MyReviews</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">About</a>
            </li>
            <#if isAdmin??>
                <li class="nav-item">
                    <a class="nav-link" href="/user">User list</a>
                </li>
            </#if>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile">Profile</a>
                </li>
            </#if>
        </ul>

        <#if user??>
        <form action="/logout" method="post">
            <div class="navbar-text">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button class="btn btn-primary" type="submit">Sign Out</button>
            </div>
        </form>
        </#if>

    </div>
    </div>
</nav>
