
# User Defined  Fields

	
>Example Response:  

```json
{
  ...
  "emp_birthday": "1997-01-27",
  "qualification": "MBA"
  ...
}
```
    
As the name shows, these fields are user-defined custom fields. A user with admin rights can add such custom fields using eRS Cloud Application. These fields can be used to capture additional information in Resource, Project and Booking forms.

User defined fields are filterable. Also, user can configure the visibility of such fields in the different forms, for example a field named `employee_id` can be created which is meant only for `Employee` type of resources.

There are fifteen types of different fields available for different use cases. Each type of field has its own set of attributes which can be configured to fit your requirements. Once such fields are added and applied, the response for that object will contain these along with normal attributes.    
    

_**Note**: There can be a maximum of 50 user-defined fields._



##  Types of User Defined Fields


User can create one of the following type of field.


Name <span style="width:100px; float:left;"></span>|Description
:-  | :-
**Simple Text** <br>`string` | Allows user to enter any combination of letters and numbers. Also, it can be configured to have different validations like `min length`,  `max length` and `regex pattern` to fit most requirements.
**Multi Line Rich Text**  <br>`string` | Allows user to enter long rich text (up to 2000 characters). This type of field allows formatting such as adding headers, paragraphs, hyperlinks, **bold** and _italic_ text etc.
**Integer Number** <br> `integer` | Allows user to enter numeric data. This is useful for fields like `emp_id`, `ref_no` etc. These fields can be configured to have validations like `min number` and `max number`.
**Fractional Number** <br> `number` | Allows user to enter floating point number. This is useful for fields like `geo_coordinates`, `mean_distance` etc. This type of field can also have validations like `min number` and `max number`.
**Date** <br> `string` | Allows user to enter date value from a popup calendar. This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd. Example use case of this type of fields could be like `emp_birth_dae`, `date_of_delivery`, `date_of_completion` etc.  Available validations for these fields are `min date` and `max date`.
**DateTime** <br> `string` |  This type of field can be used where a specific instant of time needs to be recorded. This field takes input in ISO 8601 extended notation for date and time value i.e. yyyy-MM-ddTHH:mm:ssZ. This field support time zone offset as well. Example use case of this type of fields could be like `eta`, `generated_at` etc.
**URL** <br>`string` | Allows user to enter a valid link address. This field takes string input which should be a valid URL. This type of fields could be used to store a hyperlink to a website or a network resource.
**Email** <br> `string` | Allows user to enter an email address, which is validated to ensure the proper format. 
**Checkbox**  <br> `boolean` | Allows user to select or deselect a value using checkbox. This field takes a boolean value as input. Example use case could be like `is_enabled`, `is_active` etc.
**Radio Group** <br> `integer` | Allows user to select single value from available values. This field can be configured to have multiple options which user can select one from.
**Drop Down Single Select** <br> `integer`  |  Allows user to select a single value from the dropdown list of available options. This field can be configured to have a pick list of multiple options which user can select one from.
**Checkbox Group** <br> `integer array`  |  Allows user to select one or more values from a group of check boxes. This is useful where user needs to pick multiple values from available options. This field can be configured to have a pick list of multiple options which user can select from.
**Dropdown  Multi select** <br> `integer array` | Allows user to select multiple values from the dropdown list. This field can be configured to have a pick list of multiple options which user can select from. Though it is similar to checkbox group field, it additionally allows to search from available options and is recommended when there are large number of options.
**Color Picker** <br> `string`|  Allows user to store a color code for an object. This is useful to visually identity an object when presenting in user interface. This field takes input in string format of hexadecimal color code with foreground color separated by semicolon `;` i.e #XXXXXX;1/0. Here X represent hexadecimal digit for background color, 1 represents white foreground color and 0 represents black foreground color. For example if `red` background with `white` foreground (text color) needs to be stored, then value should be `#FF0000;1`.
**Label**  <br> `integer` | Allows user to select a single value with color, from the dropdown list. This field can be configured to have a pick list of multiple options which user can select one from. These fields are useful for visual representation of meaningful labels. For example a field named `status` can be created having options such as <span class="success label">Active </span>, <span class="warning label">On Hold</span>, <span class="danger label"> Delayed </span>.