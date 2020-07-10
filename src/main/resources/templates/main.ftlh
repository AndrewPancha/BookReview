<#import "common.ftlh" as c>
<@c.page; section>

    <#if section="styles">
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



            .container{
                padding-top: 10vh;
                width: 700px;
            }

            .form-container {
                background: #fff;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px #000;
                width: 100%;
            }




        </style>
    </#if>


    <#if section="content">
        <#include "navbar.ftlh">
        <div class="container <#if book??>show</#if>">
            <form action="/add" method="post" class="form-container" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control ${(bookNameError??)?string('is-invalid', '')}"
                           value="<#if book??>${book.bookName}</#if>" name="bookName" placeholder="Book name"/>
                    <#if bookNameError??>
                        <div class="invalid-feedback">
                            ${bookNameError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control ${(authorError??)?string('is-invalid', '')}"
                           value="<#if book??>${book.author}</#if>" name="author" placeholder="Author name"/>
                    <#if authorError??>
                        <div class="invalid-feedback">
                            ${authorError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <textarea type="text" class="form-control ${(reviewError??)?string('is-invalid', '')}"
                              rows="5" name="review"  placeholder="Review"><#if book??>${book.review}</#if></textarea>
                    <#if reviewError??>
                        <div class="invalid-feedback">
                            ${reviewError}
                        </div>
                    </#if>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-dark btn-primary btn-block">Add review</button>
                </div>
            </form>
        </div>

    </#if>

</@c.page>
