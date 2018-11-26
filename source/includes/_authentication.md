# Authentication



> Example Request

```shell
# With shell, you can just pass the correct header with each request
curl -v -X GET
 "https://www.eresourcescheduler.cloud/rest/v1/resources"\
  -H "Authorization: Bearer <provided_authentication_token>"
```



Every eRS Cloud API endpoint require an access token.

eRS Cloud uses API keys to allow access to the API. You can register a new eRS Cloud API key at [Authentication Tokens](https://www.eresourcescheduler.cloud/#/profile).

eRS Cloud expects an API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer B8x5Vj1O65r6wnoV`

A sample test API key is included in all the example here, so you can test any example right away. To test requests using your account, replace the sample API key with your actual (`provided_authentication_token`) API key.

<aside class="notice" id="noticeAside">
You must replace <code>B8x5Vj1O65r6wnoV</code> with your personal API key. 
</aside>


