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
               }

          </style>
     </#if>


     <#if section="content">
          <#include "navbar.ftlh">
          <div class="container-fluid">
               <div class="form-row justify-content-center">
                    <div class="form-group col-md-6 mt-3">
                         <form method="get" action="/globalFind" class="form-inline">
                              <input type="text" name="findBookName" class="form-control" value="${globalFind?ifExists}"
                                     placeholder="Search by name"/>
                              <button type="submit" class="btn btn-dark btn-primary ml-2">Search</button>
                         </form>
                    </div>
               </div>
          </div>

          <div class="container">
               <#if books??>
               <div class="card-columns">
                    <#list books as book>

                         <div class="card mb-3" style="max-width: 540px;">
                              <div class="row no-gutters">
                                   <div class="col-md-8">
                                        <div class="card-body">
                                             <h5 class="card-title">${book.bookName}</h5>
                                             <p class="card-text"><small class="text-muted">${book.author}</small></p>
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
               </#if>
               </div>
          </div>
     </#if>


</@c.page>