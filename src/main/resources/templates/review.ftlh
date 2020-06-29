<#import "parts/common.ftlh" as c>

<@c.page>

     <div class="card my-3" style="width: 18rem;">
          <b>${book.bookName}</b>
          <b>${book.author}</b>
          <span>${book.review}</span>
          <b>${book.user.username}</b>
     </div>

</@c.page>