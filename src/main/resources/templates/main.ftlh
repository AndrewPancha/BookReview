<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Add new review
    </a>

    <div class="collapse <#if book??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form action="/add" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if book??>${book.bookName}</#if>" name="bookName" placeholder="Book name"/>
                    <#if bookNameError??>
                        <div class="invalid-feedback">
                            ${bookNameError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if book??>${book.author}</#if>" name="author" placeholder="Author name"/>
                    <#if authorError??>
                        <div class="invalid-feedback">
                            ${authorError}
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
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
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
                <input type="text" name="findBookName" class="form-control" value="${find?ifExists}"
                       placeholder="Search by name"/>
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
                                <a href="/bookProfile/${book.id}" class="card-link">Full review</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <a href="/bookEdit/${book.id}" class="card-link">Edit</a>
                        <a href="/delete/${book.id}" class="card-link">Delete</a>
                    </div>
                </div>

            </#list>
        </div>
    <#else>No books added
    </#if>

</@c.page>
