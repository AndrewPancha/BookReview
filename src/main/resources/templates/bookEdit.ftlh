<#import "parts/common.ftlh" as c>

<@c.page>
    Book editor

    <form action="/edit" method="post">
        <div class="form-group">
            <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                   value="<#if book??>${book.bookName}</#if>" name="bookName"/>
            <#if bookNameError??>
                <div class="invalid-feedback">
                    ${bookNameError}
                </div>
            </#if>
        </div>
        <div class="form-group">
            <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                   value="<#if book??>${book.author}</#if>" name="author"/>
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
        <input type="hidden" value="${book.id}" name="bookId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Confirm</button>
        </div>
    </form>
</@c.page>