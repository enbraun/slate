# Introduction

## API Reference

<!-- Welcome to the eRS Cloud API! You can use our API to access eRS Cloud API endpoints, which can get information on various
resources, projects and bookings in our database.

We have language bindings in Shell! You can view code examples in the dark area to the right, and you can switch the 
programming language of the examples with the tabs in the top right. -->

>Base URL


```shell
    https://app.eresourcescheduler.cloud/rest
    
```
>Note: If you are using self-hosted version, the base URL will be

```shell
     https://yourowndomain/rest
     
```

eRS Cloud API is organized around Rest. Our API has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. 
We support cross-origin resource sharing, allowing you to interact securely with our API from a web application (though you should never expose your secret API key). JSON will be returned by all API responses including errors. Use our API to access eRS Cloud API end-points, which can get you information of resources, projects, bookings and timesheets in our database.