<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>

<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new Book
</a>
    <div class="collapse <#if book??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form action="/add" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if book??>${book.bookName}</#if>" name="bookName" placeholder="Book name" />
                    <#if bookNameError??>
                        <div class="invalid-feedback">
                            ${bookNameError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="review" placeholder="Review"/>
                    <#if reviewError??>
                        <div class="invalid-feedback">
                            ${reviewError}
                        </div>
                    </#if>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </div>
            </form>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group col-md-6 mt-3">
            <form method="get" action="/find" class="form-inline">
                <input type="text" name="findBookName" class="form-control" value="${find?ifExists}" placeholder="Search by name" />
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
     </div>

    </#list>

<#else>No books added
</#if>

</@c.page>
