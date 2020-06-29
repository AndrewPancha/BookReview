<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="col-md-8">
        <img src="/img/${book.filename!"null or missing"}" class="card-img">
    </div>
    <div class="col-md">
        <div class="card-body">
            <h5 class="card-title">${book.bookName!"null or missing"}</h5>
            <p class="card-text">${book.review!"null or missing"}</p>
            <p class="card-text"><small class="text-muted">${book.user.username!"null or missing"}</small></p>
        </div>
    </div>

</@c.page>