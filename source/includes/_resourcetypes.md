# Resource Types

##  Resource type object


<!-- Resource type is type of any resource. An organization may has multiple types of resources. Resource future categorized into two types, human and non-human.

For ex. Employee(Human),Contractor(Human),Machines(Non-humam).  -->

> Exmple Request

```shell
curl -v -X GET "https://app.eresourcescheduler.cloud/rest/v1/resourcetypes"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Exmple Response

```json
{
   "id":1,
   "name":"Employee",
   "isHuman":true,
   "fields":[
      {
         "name":"First Name",
         "type":"TEXT",
         "code":"first_name"
      },
      {
         "name":"Last Name",
         "type":"TEXT",
         "code":"last_name"
      },
      {
         "name":"Team",
         "type":"DDSS",
         "code":"team",
         "options":[
            {
               "id":1,
               "name":"Developer"
            },
            {
               "id":2,
               "name":"Tester"
            }
         ]
      }
   ]
}
```

This is an object which represents the type of resource. In an organization, there can be multiple types of resources. This object gives you the option to create a resource of two types human and another is non-human. One can categorize the human type of resource as Employee, Contractors, etc. Also, non-humans as Machines,Computers,equipments,etc.

<span class="optional"><b>ATTRIBUTES</b></span>

Name | Description
---------: | :-----------
**id**  <br><span class="optional">`integer`</span>|  Unique identifier for the object.
**name** <br><span class="optional">`string`</span>  |  This is an object which represents the name of a resource type. Also, name of the resource we will find in add resource form. Where we have select which type of user we have to create. There can be multiple types of resource types.
**isHuman** <br><span class="optional">`boolean`</span>| This is a boolean type of value which repr­esents the wether the type of resource is human or not. For example, Human resources are Employee, Contractors, etc.  Where as inhuman resources are Machines, Computers, etc.
**fields** <br><span class="optional">`array of strings`</span> | Fields are the list of objects representing filed that are present is eRS Cloud to be mapped with Resource type, Project type, and Booking profile to represent attributes of  Resource type, Project type, and Booking profile respectively.
**fields.name** <br><span class="optional">`string`</span> |   This is an object which represents field name of the resource type.
**fields. type** <br><span class="optional">`string`</span> |  This is an object which represents the field type of resource type. For example  Text, DDSS, DDMS, etc.
**fields. code** <br><span class="optional">`string`</span> | This is an object which represents the unique code which is referred to as API code.
**fields. options** <br><span class="optional">`string`</span> |  This is an object which represents the options of multi-selections fields. For Ex. DDMS,DDSS,etc.
**fields. options.id** <br><span class="optional">`integer`</span> |  Unique identifier for the object of the option.
**fields.option.name** <br><span class="optional">`string`</span> |  This is an object which represents the name of the option.



## Get a Specific Resource Type



>  `GET v1/resourcetypes/{ID}`

Retrieves the details of an existing resource-type. You only need to  provide the unique resource-type identifier that was returned upon resource-type creation.

>Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/resourcetypes/1" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Response


```json
{
   "id":1,
   "name":"Employee",
   "isHuman":true,
   "fields":[
      {
         "name":"First Name",
         "type":"TEXT",
         "code":"first_name"
      },
      {
         "name":"Last Name",
         "type":"TEXT",
         "code":"last_name"
      },
      {
         "name":"Team",
         "type":"DDSS",
         "code":"team",
         "options":[
            {
               "id":1,
               "name":"Developer"
            },
            {
               "id":2,
               "name":"Tester"
            }
         ]
      }
   ]
}


```


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and  retrieved a resource-type successfully .  |
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that resource-type id  does not exist|


## Get All Resource Types

>  `GET v1/resourcetypes`

Returns a list of resource-types. The resource-types are returned sorted by name.

> Example Request


```shell
curl -v -X GET "https://app.eresourcescheduler.cloud/rest/v1/resourcetypes"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
   "id":1,
   "name":"Employee",
   "isHuman":true,
   "fields":[
      {
         "name":"First Name",
         "type":"TEXT",
         "code":"first_name"
      },
      {
         "name":"Last Name",
         "type":"TEXT",
         "code":"last_name"
      },
      {
         "name":"Team",
         "type":"DDSS",
         "code":"team",
         "options":[
            {
               "id":1,
               "name":"Developer"
            },
            {
               "id":2,
               "name":"Tester"
            }
         ]
      }
   ]
}
```



### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and  list of resource-types is returned.  |



