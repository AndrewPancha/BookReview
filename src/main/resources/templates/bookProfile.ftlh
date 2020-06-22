<#import "parts/common.ftlh" as c>

<@c.page>
     <div class="card mb-3" style="max-width: 540px;">
       <div class="row no-gutters">
         <div class="col-md-4">
             <img src="..." class="card-img" alt="...">
             <h5 class="card-title">${book.bookName}</h5>
         </div>
         <div class="col-md-8">
           <div class="card-body">
             <h5 class="card-title">${book.bookName}</h5>
             <p class="card-text">${book.review}</p>
             <p class="card-text"><small class="text-muted">${book.user.username}</small></p>
             <a href="#" class="card-link">Full review</a>
           </div>
         </div>
       </div>
     </div>
</@c.page>