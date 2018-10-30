# Resource Types

## The resource type object


<!-- Resource type is type of any resource. An organization may has multiple types of resources. Resource future categorized into two types, human and non-human.

For ex. Employee(Human),Contractor(Human),Machines(Non-humam).  -->

> Exmple Request

```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/resourcetype"\
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
id  <br><span class="optional">`integer`</span>|  Unique identifier for the object.
name <br><span class="optional">`string`</span>  |  This is an object which represents the name of a resource type. Also, name of the resource we will find in add resource form. Where we have select which type of user we have to create. There can be multiple types of resource types.
isHuman <br><span class="optional">`boolean`</span>| This is a boolean type of value which repr­esents the wether the type of resource is human or not. For example, Human resources are Employee, Contractors, etc.  Where as inhuman resources are Machines, Computers, etc.
fields <br><span class="optional">`array of strings`</span> | Fields are the list of objects representing filed that are present is eRS Cloud to be mapped with Resource type, Project type, and Booking profile to represent attributes of  Resource type, Project type, and Booking profile respectively.
fileds.name <br><span class="optional">`string`</span> |   This is an object which represents field name of the resource type.
fileds. type <br><span class="optional">`string`</span> |  This is an object which represents the filed type of resource type. For example  Text, DDSS, DDMS, etc.
fields. code <br><span class="optional">`string`</span> | This is an object which represents the unique code which is referred to as API code.
fields. options <br><span class="optional">`string`</span> |  This is an object which represents the options of multi-selections fields. For Ex. DDMS,DDSS,etc.
fields. options.id <br><span class="optional">`integer`</span> |  Unique identifier for the object of the option.
fields.option.name <br><span class="optional">`string`</span> |  This is an object which represents the name of the option.


### Returns

Retrieves the details of all types of existing resource. 



## Get a Specific Resource Type



>  `GET v1/resourcetype/{ID}`



>Example Request

```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/resourcetype/1"\
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

<span class="optional"><b>ARGUMENTS</b></span>

Parameter | Description
---------: | :-----------
**id** <br><span class="required">**`required`**</span> | Unique identifier for the object.

### Returns

Retrieves the details of all types of existing resource. You need only provide the unique resource type identifier that was returned upon resource type creation.



## Get All Resource Types

>  `GET v1/resourcetype`

> Example Request


```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/resourcetype"\
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




<span class="optional"><b>ARGUMENTS</b></span>

Name | Description
---------: | :-----------
id <br><span class="required">`required`</span> |  Unique identifier for the object.
name  <br><span class="optional">`optional`</span> |  This is an object which represents the name of the resource type. Also, the name of the resource we will find in add resource form. Where we have select which type of user we have to create. There can be multiple types of resource types.
isHuman  <br><span class="optional">`optional`</span> | This is a boolean type of value which repr­esents the wether the type of resource is human or not. For example, Human resources are Employee, Contractors, etc.  Whereas inhuman resources are Machines, Computers, etc.
fields <br><span class="optional">`optional`</span>  |  Fields are the list of objects representing filed that are present is eRS Cloud to be mapped with Resource type, Project type, and Booking profile to represent attributes of  Resource, Project, and Booking respectively.
fileds.name <br><span class="optional">`optional`</span>  |   This is an object which represents field name of the resource type.
fileds. type  <br><span class="optional">`optional`</span>  |  This is an object which represents the filed type of resource type. Ex  Text, DDSS, DDMS,etc.
fields. code <br><span class="optional">`optional`</span>   |  This is an object which represents the unique code which is referred to as API code.
fields. options <br><span class="optional">`optional`</span>  |  This is an object which represents the options of multi-selections fields. For Ex. DDMS,DDSS,etc.
fields. options.id  <br><span class="optional">`optional`</span>  |  Unique identifier for the object of the option.
fields.option.name   <br><span class="optional">`optional`</span>  |  This is an object which represents the name of the option.


### Results

This endpoint retrieves all Resource Types.

