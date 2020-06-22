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
<div class="card-columns">
    <#list books as book>

   <div class="card mb-3" style="max-width: 540px;">
       <div class="row no-gutters">
         <div class="col-md-4">
             <img src="/img/${book.filename}" class="card-img">
         </div>
         <div class="col-md-8">
           <div class="card-body">
             <h5 class="card-title">${book.bookName}</h5>
             <p class="card-text"><small class="text-muted">${book.user.username}</small></p>
             <a href="/bookProfile" class="card-link">Full review</a>
           </div>
         </div>
     </div>
  </div>

    </#list>
</div>
<#else>No books added
</#if>

</@c.page>