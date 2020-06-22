<#import "parts/common.ftlh" as c>

<@c.page>
    Book editor

    <form action="/edit" method="post">
        <input type="text" name="bookName" value="${book.bookName}">
        <input type="text" name="author" value="${book.author}">
        <input type="text" name="review" value="${book.review}">
        <button type="submit"></button>
    </form>
</@c.page>