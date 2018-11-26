# Filters

## Definition 

The filter parameter allows for filtering the results returned from the various endpoint in various ways. For example fetching only resources having resource type id 1 by adding resource_type_id:eq=1 to your query.

Filters are made up of rules, with a user-defined or system-defined field, a filter operator and a value.

when specifying a filter, the field-name and filter operator is always separated by a colon: If an operator is omitted, then default operator (which could be different depending upon field type.) will get applied.

## Operator

The full list of all operators is shown below.


| Operator | Meaning  
| -: |:-  |
| any | Result will be displayed if it contains any occurrence within given values from record set. |
| all | Result will be displayed if it contains all occurrence of given values from record set. |
| has | Result will be displayed if it has the given value from record set. |
| eq  | Result will be displayed if it has equal value to given input from record set. |
| gt  | Result will be displayed of if it has  greater values for given input from record set. |
| lt | Result will be displayed of if it has lesser values for given input from record set. |
| bt | Result will be displayed for values which vary between given  range from record set. |
| ex | Result will be displayed for values which vary excluding given  range from record set. |

## Filters for User-defined fields

|**Field Type**| **Operators**  | **Example**|
|:--|:--|:--|
|**Simple Text**| <li>has *(default)* </li><li>eq</li> |<li>-d simtext='Simple Text' (default) </li><li>-d simtext:has='Simple Text' </li><li>-d simtext:eq='Simple Text Ed' </li>
|**Integer Number**|<li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> |<li>-d int_test=41 </li><li>-d int_test:eq=41 </li><li>-d int_test:lt=41</li><li>-d int_test:gt=41</li><li>-d int_test:lt=41</li><li>-d int_test:bt="41&#124;121"</li><li>-d int_test:bt=41</li><li>-d int_test:ex="41&#124;121"</li><li>-d int_test:ex=41</li>
|**Fractional Number**|<li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> |<li>-d float_test=12.1 </li><li>-d float_test:eq=12.1 </li><li>-d float_test:lt=45.6</li><li>-d float_test:gt=121.1</li><li>-d float_test:bt="1.0&#124;121.1"</li><li>-d float_test:bt=22.6</li><li>-d float_test:ex="15.7&#124;45.6"</li><li>-d float_test:ex=45.6</li>
|**Date**| <li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> |<li>-d emp_birthday=1992-02-12</li><li>-d emp_birthday:eq=1992-02-12</li><li>-d emp_birthday:lt=1992-02-12 </li><li>-d emp_birthday:gt=1992-02-12 </li><li>-d emp_birthday:bt="1992-02-12&#124;1999-07-07"</li><li>-d emp_birthday:bt=1992-02-12 </li><li>-d emp_birthday:ex="1992-02-12&#124;1997-01-27" </li><li>-d emp_birthday:ex=1992-02-12 </li>
|**DateTime**|<li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> |<li>-d date_time_test="2018-06-06T18:30:00Z" </li><li>-d date_time_test:eq="2018-06-06T18:30:00Z"</li><li>-d date_time_test:lt="2018-06-06T18:30:00Z"</li><li>-d date_time_test:gt="2018-06-06T18:30:00Z"</li><li>-d date_time_test:bt=2018-06-06T18:30:00Z&#124; 2018-06-06T18:30:00Z </li><li>-d date_time_test:bt="2018-06-06T18:30:00Z"</li><li>-d date_time_test:ex="2018-06-06T18:30:00Z&#124; 2018-06-06T18:30:00Z </li><li>-d date_time_test:ex="2018-06-06T18:30:00Z" </li> 
|**Email**|<li>has *(default)* </li><li>eq</li> |<li>-d email='@'</li><li>-d email:has='a' </li><li>-d email:eq='ana@company.com' </li>
|**Checkbox**|Default value is true, accepts value true and false |<li>-d check_test=true </li><li>-d check_test=false </li> 
|**Checkbox Group**|<li>any *(default)* </li><li>all</li>|<li>-d check_group_test="16&#124;18"</li><li>-d check_group_test:any="17&#124;10"</li><li>-d check_group_test:all="16&#124;17"</li>    
|**Radio Group**| <li>eq *(default)* </li><li>any</li>|<li>-d radio_test=15 </li><li>-d radio_test:eq=15 </li><li>-d radio_test:any=15 </li> 
|**Label**|<li>eq *(default)* </li><li>any</li> |<li>-d label_test=18 </li><li>-d label_test:eq=18 </li><li>-d label_test:any=18 </li>
|**Drop Down Single Select**| <li>eq *(default)* </li><li>any</li>|<li>-d ddss_test=15 </li><li>-d ddss_test:eq=15 </li><li>-d ddss_test:any=15 </li>
|**Drop Down Multi Select**| <li>any *(default)* </li><li>all</li></ul>|<li>-d ddms_test="20&#124;21"</li><li>-d ddms_test:any="20&#124;21"</li><li>-d ddms_test:all="20&#124;21"</li>  
 