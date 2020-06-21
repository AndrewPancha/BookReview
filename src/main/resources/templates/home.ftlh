<#import "parts/common.ftlh" as c>

<@c.page>

    <div class="form-row">
        <div class="form-group col-md-6 mt-3">
            <form method="get" action="/globalFind" class="form-inline">
                <input type="text" name="findBookName" class="form-control" value="${globalFind?ifExists}" placeholder="Search by name" />
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

<#if books??>
    <#list books as book>

     <div class="card my-3" style="width: 18rem;">
         <b>${book.bookName}</b>
         <b>${book.author}</b>
         <span>${book.review}</span>
         <b>${book.user.username}</b>

     </div>

    </#list>

<#else>No books added
</#if>

</@c.page>