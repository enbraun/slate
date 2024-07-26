
# Utilization


This API endpoint is used to query the calculated utilization of resources and projects. The API also allows fetching out planned and actual utilization with different filter criteria in various ways. This enables a great power to find out what is needed. eRS Cloud API also allows filtering on custom-defined fields with multiple operators and conditions to cover complex scenarios.
    

##  Get Utilization

>  **`POST /v1/utilization`**

> Example: Get utilization by resources

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/utilization?\
view=resource&start=2022-05-01&end=2022-05-31" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
```

> Response

```json
{
  "end_date": "2022-05-31",
  "offset": 0,
  "total_count": 11,
  "limit": 10,
  "start_date": "2022-05-01",
  "resources": [
      {
        "id": 1,
        "name": "Albert Murphy",
        "total_planned_hrs": 160.79
      },
      {
        "id": 8,
        "name": "Ayn Dante",
        "total_planned_hrs": 71.22
      },
      {
        "id": 2,
        "name": "Chris Rose",
        "total_planned_hrs": 138.6
      },
      {
        "id": 10,
        "name": "Emily Eliot",
        "total_planned_hrs": 187.2
      },
      {
        "id": 9,
        "name": "Jayden Brock",
        "total_planned_hrs": 164.39
      },
      {
        "id": 4,
        "name": "Joanna Collins",
        "total_planned_hrs": 114.0
      },
      {
        "id": 3,
        "name": "Martha Day",
        "total_planned_hrs": 66.0
      },
      
      { ... },
      { ... }
  ]
}
```

> Example: Get utilization by projects

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/utilization?\
view=project&start=2022-05-01&end=2022-05-31" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
```

> Response

```json
{
  "end_date": "2022-05-31",
  "offset": 0,
  "total_count": 6,
  "limit": 10,
  "start_date": "2022-05-01",
  "projects": [
      {
        "id": 1,
        "title": "Apollo 11",
        "total_planned_hrs": 274.0
      },
      {
        "id": 5,
        "title": "Falcon 9",
        "total_planned_hrs": 132.0
      },
      {
        "id": 2,
        "title": "Hubble Telescope",
        "total_planned_hrs": 422.59
      },
      {
        "id": 3,
        "title": "Mangalyaan",
        "total_planned_hrs": 229.20
      },
      {
        "id": 6,
        "title": "Mars Express",
        "total_planned_hrs": 213.79
      },
      {
        "id": 4,
        "title": "Mars Rover",
        "total_planned_hrs": 208.79
      }

  ]
}
```

> Example: Get utilization by projects using project filter

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/utilization?\
view=project&start=2022-05-01&end=2022-05-31" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{        
       "project":{
            "project_start_date:gt":"2022-01-01",
            "tags":["Medium","High"]
        }
    }'
```

> Response

```json
{
  "end_date": "2022-05-31",
  "offset": 0,
  "total_count": 2,
  "limit": 10,
  "start_date": "2022-05-01",
  "projects": [
      {
        "id": 1,
        "title": "Apollo 11",
        "total_planned_hrs": 274.0
      },
      {
        "id": 2,
        "title": "Hubble Telescope",
        "total_planned_hrs": 422.59
      }
   ]
}
```

> Example: Get planned and actual utilization

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/utilization?\
start=2022-05-01&end=2022-05-31&data=actual,planned" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
```

> Response

```json
{
  "end_date": "2022-05-31",
  "offset": 0,
  "total_count": 11,
  "limit": 10,
  "start_date": "2022-05-01",
  "resource": [
      {
        "id": 1,
        "name": "Albert Murphy",
        "total_actual_hrs": 10.4,
        "total_planned_hrs": 160.79,
      },
      {
        "id": 8,
        "name": "Ayn Dante",
        "total_actual_hrs": 0.0,
        "total_planned_hrs": 71.22
      },
      {
        "id": 2,
        "name": "Chris Rose",
        "total_actual_hrs": 30.50,
        "total_planned_hrs": 138.6
      },
      {
        "id": 10,
        "name": "Emily Eliot",
        "total_actual_hrs": 12.8,
        "total_planned_hrs": 187.2
      },
      {
        "id": 9,
        "name": "Jayden Brock",
        "total_actual_hrs": 0.0,
        "total_planned_hrs": 164.39
      },
      {
        "id": 4,
        "name": "Joanna Collins",
        "total_actual_hrs": 15.0,
        "total_planned_hrs": 114.0
      },
      {
        "id": 3,
        "name": "Martha Day",
        "total_actual_hrs": 25.40,
        "total_planned_hrs": 66.0
      },
      { ... },
      { ... }
  ]
}
```

> Example: Get planned and actual utilization with daily breakup 

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/utilization?\
start=2022-05-01&end=2022-05-05&data=actual,planned&daily_hrs=true" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
```

> Response

```json
{
  "end_date": "2022-05-05",
  "offset": 0,
  "total_count": 11,
  "limit": 10,
  "start_date": "2022-05-01",
  "resource": [
      {
        "daily_actual_hrs": {
        "2022-05-01": 3.0,
        "2022-05-02": 2.0,
        "2022-05-03": 5.0,
        "2022-05-04": 0.0,
        "2022-05-05": 3.0,
        },
        "daily_planned_hrs": {
        "2022-05-01": 5.0,
        "2022-05-02": 5.0,
        "2022-05-03": 5.0,
        "2022-05-04": 3.0,
        "2022-05-05": 0.0,
        },

        "id": 1,
        "name": "Albert Murphy",
        "total_actual_hrs": 13.0,
        "total_planned_hrs": 18.0,
      },
      {
        "daily_actual_hrs": {
        "2022-05-01": 4.0,
        "2022-05-02": 4.0,
        "2022-05-03": 4.0,
        "2022-05-04": 4.0,
        "2022-05-05": 5.0,
        },
        "daily_planned_hrs": {
        "2022-05-01": 8.0,
        "2022-05-02": 8.0,
        "2022-05-03": 8.0,
        "2022-05-04": 8.0,
        "2022-05-05": 8.0,
        },

        "id": 8,
        "name": "Ayn Dante",
        "total_actual_hrs": 21.0,
        "total_planned_hrs": 40.0,
      },      
      {...},
      {...}      
   ]
}
```

> Example: Get capacity hours by resource

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/utilization?\
view=resource&data=capacity&start=2022-05-01&end=2022-05-31" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
```

> Response

```json
{
  "end_date": "2022-05-31",
  "offset": 0,
  "total_count": 11,
  "limit": 10,
  "start_date": "2022-05-01",
  "resources": [
      {
        "id": 1,
        "name": "Albert Murphy",
        "total_capacity_hrs": 176.0
      },
      {
        "id": 8,
        "name": "Ayn Dante",
        "total_capacity_hrs": 528.0
      },
      {
        "id": 2,
        "name": "Chris Rose",
        "total_capacity_hrs": 220.0
      },
      {
        "id": 10,
        "name": "Emily Eliot",
        "total_capacity_hrs": 181.5
      },
      {
        "id": 9,
        "name": "Jayden Brock",
        "total_capacity_hrs": 0.0
      },
      {
        "id": 4,
        "name": "Joanna Collins",
        "total_capacity_hrs": 176.0
      },
      {
        "id": 3,
        "name": "Martha Day",
        "total_capacity_hrs": 528.0
      },
      { ... },
      { ... }
  ]
}
```

> Example: Get requested hours by project

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/utilization?\
view=project&data=requested&start=2022-05-01&end=2022-05-31" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
```

> Response

```json
{
  "end_date": "2022-05-31",
  "offset": 0,
  "total_count": 6,
  "limit": 10,
  "start_date": "2022-05-01",
  "projects": [
      {
        "id": 1,
        "title": "Apollo 11",
        "total_requested_hrs": 274.0
      },
      {
        "id": 5,
        "title": "Falcon 9",
        "total_planned_hrs": 132.0
      },
      {
        "id": 2,
        "title": "Hubble Telescope",
        "total_planned_hrs": 422.59
      },
      {
        "id": 3,
        "title": "Mangalyaan",
        "total_planned_hrs": 229.20
      },
      {
        "id": 6,
        "title": "Mars Express",
        "total_planned_hrs": 213.79
      },
      {
        "id": 4,
        "title": "Mars Rover",
        "total_planned_hrs": 208.79
      }

  ]
}
```

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
**start**<br>`optional` | String value representing start date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to get utilization on or after this date.
**end**<br>`optional` | String value representing end date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to get utilization on or before this date.
||_**Note**: By default, if `start` & `end` arguments are omitted, then utilization of the current month will be returned. If utilization of a specific period is required, then both `start` & `end` arguments must be passed._
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields fewer records)<br>_Default value of `limit` is_ <span class="required">**`10`**</span>.<br>_Maximum value of `limit` can be_ <span class="required">**`25`**</span>.
**offset**<br>`optional` | Offset keyword is used to skip n items. If the offset value is given as 10, then the first 10 records will be skipped from the result set. Offset is often used together with the limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>.
**view**<br>`optional` | This parameter allows you to select from the two available views i.e. **resource** or **project**. The `Resource` view aggregates utilization data on resources, whereas the `project` view aggregates data on projects.<br>_Default value of `view` is_ <span class="required">**`resource`**</span>.
**data**<br>`optional` | This parameter allows querying various metrics such as planned utilization, actual utilization, resource capacity, and requested hours. The keys for different metrics are listed below: <br>`planned`: for planned utilization<br>`actual`: for actual utilization<br>`capacity`: for resource capacity (only applicable when the view is set to resource)<br>`requested`: for requirement hours (only applicable when the view is set to project)<br>User can pass any combination of applicable metrics seperated by comma (i.e. planned,actual).<br>_Default value of `data` is_ <span class="required">**`planned`**</span>.
**daily_hrs**<br>`optional` | This parameter defines whether the result should contain a daily breakup of hours or not. If the parameter with the true value exists in the request, then the response will include daily utilization hours along with the aggregated total utilization hours.<br>_Default value of `daily_hrs` is_ <span class="required">**`false`**</span>.


Along with query parameters, this API endpoint also accepts filter criteria as a request body. Kindly refer to the examples shown to the right. To learn more about filters, visit <a href="#filters" class="api-ref">this section</a>.

### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | This indicates that the operation was successful and utilization is returned.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect or when the offset or limit value is a negative integer.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.