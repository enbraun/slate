# Rates
<br>
This API is accessible only <span class="warning">when financial module is active</span>. If the keys connected to this API are used without having access to <b>Financial Module</b> then request will return client error status codes.

## Resource Rates

A rate is an entity that allows you to assign billing or cost rates to a resource object. Each resource has it's own set of billing and cost rate assigned on different effective dates.

This API allows you to list, create, delete, update billing or cost rates of any resource.

<span class="optional"><b>ATTRIBUTES</b></span>


Name         |  Description
 ---:        |    :----   
**id** <br>`integer` | Unique ID of resource object to which this rate belongs.
**name** <br> `string` | Name of resource object.
**rates** <br>`array of objects`| Represents collection of rates that are assigned on the resource object.
**rates.id** <br>`integer`| Auto generated unique identifier for rate object.
**rates.rate** <br>`float`| Represents applied rate.
**rates.effective_date** <br>`string`| Represents effective date for the rate.
**rates.rate_type** <br>`integer`| Represents rate type. Value of rate type is **1** for cost rate and **2** for billing rate. Both types of rate can be defined on the same `effective_date`.

### Create Resource Rate
 
Creates a new rate object for specified resource.

>**`POST /v1/resources/{ID}/rates`**

>Example Request

```shell

curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/resources/2/rates" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "cost_rate": 150,
      "billing_rate": 300,
      "effective_date": "2018-09-16"
    }'

```

> Example Request For Replace Existing Rate
 
```shell

curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/resources/2/rates" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "cost_rate": 200,
      "billing_rate": 350,
      "effective_date": "2018-09-16",
      "replace_existing_rate": true
    }'

```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name     |    Description
---:     |    :----   
**cost_rate** <br> `*optional` | Represents cost rate. Rate value is a floating point number which could not be less than 0 and greater than 99999999.99.
**billing_rate** <br> `*optional` | Represents billing rate. Rate value is a floating point number which could not be less than 0 and greater than 99999999.99.<br><br>_**\*Note** : Either of the two rate types, i.e. `cost_rate` or `billing_rate` is necessary for creating rate._
**effective_date** <br><span class ="required">`required`</span> | String representing date value for effective date of rate. This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd.

### Returns
 
| Code      |Description |
 :---        |    :----   |
**201** <br><span class = "success">`Created`</span> | Indicates that the operation was successful and rate created successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that resource does not exist.
**409** <br> <span class = "error">`Conflict`</span> | Conflict indicates that the rate can not be created as the same type of rate is already associated with passed effective date. If you wish to create rate of the same type any way you must use replace existing rate option by passing <span class = "required"> `true` </span> for parameter <span class = "required"> `replace_existing_rate` </span> or you can create rate of another type on given `effective_date`. This operation replaces existing rate with passed rate. Example request is shown to right.

### List Resource Rates

Retrieves list of all the rates on all resources.

>**`GET /v1/resources/rates`**

> Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/resources/rates?\
offset=1&limit=10" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
> Example Response
 
 ```json
{
  "total_count": 18,
  "limit": 10,
  "offset": 1,
  "data": [{
        "id": 9,
        "name": "Albert Murphy",
        "rates":[
            {
                "id": 8,
                "rate": 150,
                "rate_type": 1,
                "effective_date": "2019-01-01",
                "created_on": "2018-08-20T09:20:34.925474Z",
                "created_by": 
                {
                    "name": "John doe",
                    "id": 118
                },
                "modified_on": "2018-09-28T12:23:44.896426Z",
                "modified_by": 
                {
                    "name": "John doe",
                    "id": 118
                },
            },
            {
                "id": 9,
                "rate": 300,
                "rate_type": 2,
                "effective_date": "2019-01-01",
                "created_on": "2018-08-20T09:30:34.925474Z",
                "created_by": 
                {
                    "name": "John doe",
                    "id": 118
                },
                "modified_on": "2018-09-28T12:32:44.896426Z",
                "modified_by": 
                {
                    "name": "John doe",
                    "id": 118
                },
            }
            ]
        },
        { ... },
        { ... }
    ]
}
```
<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`25`**</span><br>_Maximum value of `limit` can be_ <span class="required">**`500`**</span>
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>

### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | This status code indicates that the operation was successful and list of rates retrieved successfully.
**400** <br> <span class = "error">`Bad Request` </span> | Bad Request may occur when offset or limit value is negative.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested url is not correct or the data type of query parameters is not integer.

<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br>



### Search Resource Rates

> **`POST /v1/resources/rates/search`**

> Example Request For Filter In JSON Format

```shell
curl -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/resources/rates/search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "name:eq": "Albert Murphy"  
    }'
```

> Example Request For Filter By Passing Multiple Rules In JSON Format

```shell
curl -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/resources/rates/search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "name:eq": "Albert Murphy", 
      "roles:all": [3,6] 
    }'
```

Search Resource Rates API allows filtering the results returned in various ways. This enables a great power to find out what is needed. eRS Cloud API also allows filtering on custom defined fields with multiple operators and conditions to cover up complex scenarios for searching.

A filter condition consists of three components which are **_field_**, **_operator_** and **_value_**. For example, fetching only those rates having `resource_type_id` 1, could be achieved by adding `"resource_type_id:eq": 1` to your query. If operator is not supplied, it takes default operator for field.

Below is a list of available fields, which allow filtering rates:


|**Field Code**| **Operator**  | **Example**|
|:--|:---|:--|
**resource_type_id**|<li>**eq** (_default_)  </li><li>any</li>| `"resource_type_id:eq": 1`<br>`"resource_type_id:any": [1,2]`
**name**|<li class="nowrap">**has** (_default_)&nbsp;&nbsp;</li><li>eq</li>|`"name:has": "c"`<br>`"name:eq": "Amy Jones"`
**roles**| <li>**any** (_default_)</li><li>all</li>|`"roles:any": [2,5]`<br>`"roles:all": [4,6]`
**tags**|<li>**any** (_default_)</li><li>all</li>| `"tags:any": ["tagA","tagB"]`<br>`"tags:all": ["tagA","tagB"]`</li>
**email**|<li>**has** (_default_)</li><li>eq</li>| `"email:has": "a"`<br>`"email:eq": "abc@mycompany.com"`
**phone**|<li>**has** (_default_)</li><li>eq</li>|`"phone:has": "753" `<br> `"phone:eq": "(485)555-0202"`
**start_Date**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li> bt</li><li>ex</li>| `"start_date:eq": "2016-01-27"`<br>` "start_date:lt": "1999-12-22"`<br>` "start_date:gt": "1990-01-11"`<br>`"start_date:bt": ["2001-01-01", "2010-12-31"]`<br> `"start_date:ex": ["1992-02-12", "1997-01-27"]`
**last_date**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li> bt</li><li>ex</li>| `"last_date:eq": "2016-05-17"` <br> `"last_date:lt": "2002-12-31"`<br>` "last_date:gt": "2010-01-01"` <br> `"last_date:bt": ["1995-12-31", "1999-01-01"]`<br> `"last_date:ex": ["2001-01-01", "2002-01-01"]`
**timezone**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"timezone:eq": 1`<br>`"timezone:neq": 1`<br>`"timezone:any": [1, 2]`<br>`"timezone:none": [3, 2]`
**disable_parallel_booking**| N/A |`"disable_parallel_booking": true`<br>`"disable_parallel_booking": false`
**created_by**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"created_by:eq": 1`<br>`"created_by:neq": 1`<br>`"created_by:any": [1, 2]`<br>`"created_by:none": [1, 2]`
**modified_by**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"modified_by:eq": 1`<br>`"modified_by:neq": 1`<br>`"modified_by:any": [1, 2]`<br>`"modified_by:none": [1, 2]`
**created_on**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"created_on:eq": ["2021-07-08T00:00:00]`<br>`"created_on:lt": ["2021-07-08T00:00:00]`<br>`"created_on:gt": ["2021-07-08T59:59:59"]`<br>`"created_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]`<br>`"created_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"created_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"created_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"created_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"created_on:ex": ["", "2021-07-10T23:59:59"]]` 
**modified_on**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"modified_on:eq": ["2021-07-08T00:00:00]`<br>`"modified_on:lt": ["2021-07-08T00:00:00]`<br>`"modified_on:gt": ["2021-07-08T59:59:59"]`<br>`"modified_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]`<br>`"modified_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"modified_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"modified_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"modified_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"modified_on:ex": ["", "2021-07-10T23:59:59"]]` 
 _For filtering using custom fields and operators please <a href="#filters-for-user-defined-fields" class="api-ref">check here</a>._ 

### Update Resource Rate

>**`PUT /v1/resources/{ID}/rates/{RATE_ID}`**

Updates an existing rate by setting the values of the parameters passed. Any parameters not passed will be left unchanged. 

This request accepts the same arguments as the rate creation call.

>Example Request

```shell
curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/resources/8/rates/9" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "rate": 150,
      "effective_date": "2018-09-16"
    }'
```

> Example Request For Replace Existing Rate
 
```shell

curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/resources/8/rates/9" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "rate": 250,
      "effective_date": "2018-09-16",
      "replace_existing_rate": true
    }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name     |    Description
---:     |    :----   
**rate** <br> `optional` | Represents rate. Rate value is a floating point number which could not be less than 0 and greater than 99999999.99.
**effective_date** <br>`optional`| String representing date value for effective date of rate. This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd.

### Returns

| Code      | Description | 
| ---:      |    :----    | 
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and rate updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that resource or rate does not exist.
**409** <br> <span class = "error">`Conflict`</span> | Conflict indicates that the rate can not be created as the same type of rate is already associated with passed effective date. If you wish to create rate of the same type any way you must use replace existing rate option by passing <span class = "required"> `true` </span> for parameter <span class = "required"> `replace_existing_rate` </span> or you can create rate of another type on given effective date. This operation replaces existing rate with passed rate. Example request is shown to right.

### Delete Resource Rate

> **`DELETE /v1/resources/{ID}/rates/{RATE_ID}`**

Permanently deletes a rate. It cannot be undone.

> Example Request

```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/resources/1/rates/2" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

### Return

| Code      | Description  
| :---      | :----
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and rate deleted successfully.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This indicates that resource or rate does not exist.

## Project Rates

A rate is an entity that allows you to assign billing rates to a project object. Each project has it's own set of rates assigned on different effective dates.

This API allows you to list, create, delete, update rates and billing status of any project.

<span class="optional"><b>ATTRIBUTES</b></span>


Name         |  Description
 ---:        |    :----   
**id** <br>`integer` | Unique ID of project object to which this rate belongs.
**title** <br> `string` | Name of project object.
**is_billable** <br>`boolean`| Represents billing status of project object.
**rates** <br>`array of objects`| Represents collection of rates that are assigned on the project object. While creating or updating a rate object user must pass arguments which are available for this rate object.
**rates.id** <br>`integer`| Auto generated unique identifier for rate object.
**rates.rate** <br>`float`| Represents applied billing rate.
**rates.effective_date** <br>`string`| Represents effective date for the rate.

### Create Project Rate
 
Creates a new rate object for specified project.

>**`POST /v1/projects/{ID}/rates`**

>Example Request

```shell

curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/projects/2/rates" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "rate": 150,
      "effective_date": "2018-09-16"
    }'
```
> Example Request For Replace Existing Rate
 
```shell

curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/projects/2/rates" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "rate": 250,
      "effective_date": "2018-09-16",
      "replace_existing_rate": true
    }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name     |    Description
---:     |    :----   
**rate** <br> <span class ="required">`required`</span> | Represents billing rate. Rate value is a floating point number which could not be less than 0 and greater than 99999999.99.
**effective_date** <br><span class ="required">`required`</span> | String representing date value for effective date of rate. This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd.

### Returns
 
| Code      |Description |
 :---        |    :----   |
**201** <br><span class = "success">`Created`</span> | Indicates that the operation was successful and rate created successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that project does not exist.
**409** <br> <span class = "error">`Conflict`</span> | Conflict indicates that the rate can not be created as rate is already associated with passed effective date. If you wish to create rate of the same type any way you must use replace existing rate option by passing <span class = "required"> `true` </span> for parameter <span class = "required"> `replace_existing_rate` </span> which will replace existing rate with passed rate. Example request is shown to right.

### List Project Rates

Retrieves list of all the rates on all projects.

>**`GET /v1/projects/rates`**

> Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projects/rates?\
offset=1&limit=10" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
> Example Response
 
 ```json
{
  "total_count": 18,
  "limit": 10,
  "offset": 1,
  "data": [{
        "id": 9,
        "title": "Project-A",
        "is_billable": true,
        "rates":[
            {
                "id": 8,
                "rate": 150,
                "effective_date": "2019-01-01",
                "created_on": "2018-08-20T09:25:34.925474Z",
                "created_by": 
                {
                    "name": "John doe",
                    "id": 118
                },
                "modified_on": "2018-09-28T12:32:44.896426Z",
                "modified_by": 
                {
                    "name": "John doe",
                    "id": 118
                },
                }
            ]
        },
        { ... },
        { ... }
    ]
}
```
<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`25`**</span><br>_Maximum value of `limit` can be_ <span class="required">**`500`**</span>
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>

### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | This status code indicates that the operation was successful and list of rates retrieved successfully.
**400** <br> <span class = "error">`Bad Request` </span> | Bad Request may occur when offset or limit value is negative.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested url is not correct or the data type of query parameters is not integer.


<br><br><br><br><br><br>

### Search Project Rates
>**`POST /v1/projects/rates/search`**

>Example Request For Filter In JSON Format

```shell
curl -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/projects/rates/search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "title:eq": "Project-A"
    }'
```

> Example Request For Filter By Passing Multiple Rules In JSON Format

```shell
curl -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/projects/rates/search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "title:eq": "Project-A", 
      "project_start_date:gt": "2015-04-02" 
    }'
```

Search Project Rates API allows filtering the results returned in various ways. This enables a great power to find out what is needed. eRS Cloud API also allows filtering on custom defined fields with multiple operators and conditions to cover up complex scenarios for searching.

A filter condition consists of three components which are **_field_**, **_operator_** and **_value_**. For example fetching only those rates having `project_type_id` 1, could be achieved by adding `"project_type_id":1 ` to your query.  If operator is not supplied, it takes default operator for field. <a href="#filters" class="api-ref">Read more</a>

Below is a list of available fields, which allow filtering rates:

### Filters for System-defined fields

|**Field Code**| **Operator**  | **Example**|
|:--|:---|:--|
**project_type_id**|<li>**eq** (_default_)  </li><li>any</li>| `"project_type_id":1 `<br>`"project_type_id:any":1`
**email**|<li class="nowrap">**has** (_default_)&nbsp;&nbsp;</li><li>eq</li>|`"email":"abc"` <br>`"email:eq":"ujjwal@gmail.com"`
**project_start_date**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>|`"project_start_date:eq":"2015-02-02"`<br>`"project_start_date:lt":"2015-02-02"`<br>`"project_start_date:gt":"2015-02-02"`<br>`"project_start_date:bt":["2015-02-02","2015-04-05"]` <br>`"project_start_date:ex":["2015-02-02","2015-04-04"]`
**end_date**|<li>**eq** (_default_) </li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"end_date:eq":"2015-02-02"`<br>`"end_date:lt":"2015-02-02"`<br>`"end_date:gt":"2015-02-02"`<br>`"end_date:bt":["2015-02-02","2015-04-05"]`<br>`"end_date:ex":["2015-02-02","2015-04-04"]`
**tags**|<li>**any** (_default_) </li><li>all</li>|`"tags":"["tagA", "tagB"]`<br>`"tags:all":["tagB","tagC"]`
**is_archive**| N/A |`"is_archive":true` <br>`"is_archive":false`
**disable_parallel_booking**| N/A |`"disable_parallel_booking": true`<br>`"disable_parallel_booking": false`
**created_by**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"created_by:eq": 1`<br>`"created_by:neq": 1`<br>`"created_by:any": [1, 2]`<br>`"created_by:none": [1, 2]`
**modified_by**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"modified_by:eq": 1`<br>`"modified_by:neq": 1`<br>`"modified_by:any": [1, 2]`<br>`"modified_by:none": [1, 2]`
**created_on**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"created_on:eq": ["2021-07-08T00:00:00]`<br>`"created_on:lt": ["2021-07-08T00:00:00]`<br>`"created_on:gt": ["2021-07-08T59:59:59"]`<br>`"created_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]`<br>`"created_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"created_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"created_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"created_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"created_on:ex": ["", "2021-07-10T23:59:59"]]` 
**modified_on**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"modified_on:eq": ["2021-07-08T00:00:00]`<br>`"modified_on:lt": ["2021-07-08T00:00:00]`<br>`"modified_on:gt": ["2021-07-08T59:59:59"]`<br>`"modified_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]`<br>`"modified_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"modified_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"modified_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"modified_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"modified_on:ex": ["", "2021-07-10T23:59:59"]]` 
_For filtering using custom fields and operators please <a href="#filters-for-user-defined-fields" class="api-ref">check here</a>._  

### Update Project Rate

>**`PUT /v1/projects/{ID}/rates/{RATE_ID}`**

Updates an existing rate by setting the values of the parameters passed. Any parameters not passed will be left unchanged. 

This request accepts the same arguments as the rate creation call.

>Example Request

```shell
curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/projects/8/rates/9" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "rate": 150,
      "effective_date": "2018-09-16"
    }'

```
> Example Request For Replace Existing Rate
 
```shell

curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/projects/8/rates/9" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "rate": 250,
      "effective_date": "2018-09-16",
      "replace_existing_rate": true
    }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name     |    Description
---:     |    :----   
**rate** <br> `optional` | Represents billing rate. Rate value is a floating point number which could not be less than 0 and greater than 99999999.99.
**effective_date** <br>`optional`| String representing date value for effective date of rate. This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd.

### Returns

| Code      | Description | 
| ---:      |    :----    | 
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and rate updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that project or rate does not exist.
**409** <br> <span class = "error">`Conflict`</span> | Conflict indicates that the rate can not be created as rate is already associated with passed effective date. If you wish to create rate of the same type any way you must use replace existing rate option by passing <span class = "required"> `true` </span> for parameter <span class = "required"> `replace_existing_rate` </span> which will replace existing rate with passed rate. Example request is shown to right.


### Update Billing Status

>**`PUT /v1/projects/{ID}/billingStatus`**

Updates project billing status by setting the value of the `is_billable`.

>Example Request

```shell
curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/projects/8/billingStatus" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "is_billable": true
    }'

```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name         |  Description
 ---:        |    :----   
**is_billable** <br>`boolean`| Represents billing status of project. It's default value is true indicating the project is billable while false value indicates the project is non-billable.

### Returns

| Code      | Description | 
| ---:      |    :----    | 
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and billing status updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that project does not exist.


### Delete Project Rate

> **`DELETE /v1/projects/{ID}/rates/{RATE_ID}`**

Permanently deletes a rate. It cannot be undone.

> Example Request

```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/projects/1/rates/2" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
### Return

| Code      | Description  
| :---      | :----
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and rate deleted successfully.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This indicates that project or rate does not exist.


## Role Rates

A rate is an entity that allows you to assign billing or cost rates to a role object. Each role has it's own set of billing and cost rate assigned on different effective dates.

This API allows you to list, create, delete, update rates of any role.

<span class="optional"><b>ATTRIBUTES</b></span>


Name         |  Description
 ---:        |    :----   
**id** <br><span class="required">`integer`</span> | Unique ID of role object, which this rate belongs to.
**name** <br> <span class ="required">`string`</span> | Name of role object.
**rates** <br>`array of objects`| Represents collection of rates that are assigned on the project object. While creating or updating a rate object user must pass arguments which are available for this rate object.
**rates.id** <br>`integer`| Auto generated unique identifier for rate object.
**rates.rate** <br>`float`| Represents applied billing rate.
**rates.effective_date** <br>`string`| Represents effective date for the rate.
**rates.rate_type** <br>`integer`| Represents rate type. Value of rate type is **1** for cost rate and **2** for billing rate. Both types of rate can be defined on the same `effective_date`.

### Create Role Rate
 
Creates a new rate object for specified role.


>**`POST /v1/roles/{ID}/rates`**

>Example Request

```shell

curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/roles/2/rates" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "cost_rate": 150,
      "billing_rate": 300,
      "effective_date": "2018-09-16"
    }'
```

> Example Request For Replace Existing Rate
 
```shell

curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/roles/2/rates" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "cost_rate": 200,
      "billing_rate": 350,
      "effective_date": "2018-09-16",
      "replace_existing_rate": true
    }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name     |    Description
---:     |    :----   
**cost_rate** <br> `*optional` | Represents cost rate. Rate value is a floating point number which could not be less than 0 and greater than 99999999.99.
**billing_rate/rate** <br> `*optional` | Represents billing rate. Rate value is a floating point number which could not be less than 0 and greater than 99999999.99.<br><br>_**\*Note** : Either of the two rate types, i.e. `cost_rate` or `billing_rate` is necessary for creating rate._
**effective_date** <br> <span class ="required">`required`</span> | String representing date value for effective date of rate. This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd.

### Returns
 
| Code      |Description |
 :---        |    :----   |
**201** <br><span class = "success">`Created`</span> | Indicates that the operation was successful and rate created successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that role does not exist.
**409** <br> <span class = "error">`Conflict`</span> | Conflict indicates that the rate can not be created as rate is already associated with passed effective date. If you wish to create rate of the same type any way you must use replace existing rate option by passing <span class = "required"> `true` </span> for parameter <span class = "required"> `replace_existing_rate` </span> which will replace existing rate with passed rate. Example request is shown to right.

### List Role Rates

Retrieves list of all the rates on all roles.

>**`GET /v1/roles/rates`**

> Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/roles/rates?\
offset=1&limit=10" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
> Example Response
 
 ```json
{
  "total_count": 18,
  "limit": 10,
  "offset": 1,
  "data": [{
        "id": 9,
        "name": "Architect",
        "rates":[
            {
                "id": 8,
                "rate": 150,
                "rate_type": 1,
                "effective_date": "2019-01-01",
                "created_on": "2018-08-20T09:25:34.925474Z",
                "created_by": 
                {
                    "name": "John doe",
                    "id": 118
                },
                "modified_on": "2018-09-28T12:32:44.896426Z",
                "modified_by": 
                {
                    "name": "John doe",
                    "id": 118
                },
            },
            {
                "id": 9,
                "rate": 250,
                "rate_type": 2,
                "effective_date": "2019-01-01",
                "created_on": "2018-08-20T09:25:34.925474Z",
                "created_by": 
                {
                    "name": "John doe",
                    "id": 118
                },
                "modified_on": "2018-09-28T12:32:44.896426Z",
                "modified_by": 
                {
                    "name": "John doe",
                    "id": 118
                },
            }
            ]
        },
        { ... },
        { ... }
    ]
}
```

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`25`**</span><br>_Maximum value of `limit` can be_ <span class="required">**`500`**</span>
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>

### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | This status code indicates that the operation was successful and list of rates retrieved successfully.
**400** <br> <span class = "error">`Bad Request` </span> | Bad Request may occur when offset or limit value is negative.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested url is not correct or the data type of query parameters is not integer.

<br><br><br><br><br><br>

### Update Role Rate

>**`PUT /v1/roles/{ID}/rates/{RATE_ID}`**

Updates an existing rate by setting the values of the parameters passed. Any parameters not passed will be left unchanged. 

This request accepts the same arguments as the rate creation call.

>Example Request

```shell
curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/roles/8/rates/9" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "rate": 150,
      "effective_date": "2018-09-16"
    }'

```

> Example Request For Replace Existing Rate
 
```shell

curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/roles/8/rates/9" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "rate": 250,
      "effective_date": "2018-09-16",
      "replace_existing_rate": true
    }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name     |    Description
---:     |    :----   
**rate** <br> <span class ="required">`required`</span> | Represents billing rate. Rate value is a floating point number which could not be less than 0 and greater than 99999999.99.
**effective_date** <br>`optional`| String representing date value for effective date of rate. This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd.

### Returns

| Code      | Description | 
| ---:      |    :----    | 
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and rate updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that role or rate does not exist.
**409** <br> <span class = "error">`Conflict`</span> | Conflict indicates that the rate can not be created as rate is already associated with passed effective date. If you wish to create rate of the same type any way you must use replace existing rate option by passing <span class = "required"> `true` </span> for parameter <span class = "required"> `replace_existing_rate` </span> which will replace existing rate with passed rate. Example request is shown to right.

### Delete Role Rate

> **`DELETE /v1/roles/{ID}/rates/{RATE_ID}`**

Permanently deletes a rate. It cannot be undone.

> Example Request

```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/roles/1/rates/2" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

### Return

| Code      | Description  
| :---      | :----
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and rate deleted successfully.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This indicates that role or rate does not exist.