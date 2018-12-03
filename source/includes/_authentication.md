# Authentication


Every eRS Cloud API endpoint require an access token. If not passed one or token is invalid API will return **401** <span class="error">Unauthorized</span> error.

An access token can be generated at [User Profile -> Security](https://app.eresourcescheduler.cloud/#/profile).

Alternatively, OAuth flow can be used to obtain a token if access is required by some third party application.

##OAuth


eRS Cloud API allows access using OAuth 2 code flow to be able integrate with third party application. OAuth 2 is an open standard for authorization that enables third party applications  to obtain access of API on behalf of user who wishes to approve access.

Developer (having admin access to eRS Cloud) are require to register an application to use OAuth. Once application is registered, it is assigned a client Id and client secret. The client secret should be kept confidential and only use when authorizing between application and eRS cloud authorization server.



> Example : Authorization Link 
 
```shell
https://app.eresourcescheduler.cloud/login/oauth/authorize?
response_type=code
&client_id=SZIZIzFXUKfwnUJW
&redirect_uri=https://example.com/oauth/callback
&state=f2g5h3b5
```

###1. Request User Authorization
Give user an authorization link which redirects to eRS Cloud authorization server. If using a phone or desktop app instead of browser, this could be achieved using some browser plugin.


**Grant Code Request Endpoint.**

https://app.eresourcescheduler.cloud/login/oauth/authorize


**Parameters: Auth Code Request** 

Name | Description
----------: | :-------
**client_id** <br>`string` <span class="required">`required`</span>   |  eRS Cloud generated unique client id which was assigned while registering application. 
**redirect_uri** <br>`string` <span class="required">`required`</span>  | The callback url where user will be sent back after authorization. This value must match to redirect uri given at the time of application registration.
**response_type** <br>`string` <span class="required">`required`</span>  | This must be set to `"code"` for obtaining grant code.
**state** <br>`string` `optional`  | It is used to identify or verify origin of request. Usually it is a random string which is passed along with this request and expect the same when eRS Cloud redirects back to defined redirect uri.  



> Example : Access Token Request
 
```shell
curl -X POST "https://app.eresourcescheduler.cloud/login/oauth/token?
grant_type=authorization_code
&code=QbD76mCzJSMJt4fc892i
&client_id=SZIZIzFXUKfwnUJW
&client_secret=4pbxCfKa1kJB2nihfbtPLixtv6Tf4V5q
&redirect_uri=https://example.com/oauth/callback"\
-H "Content-Type:application/x-www-form-urlencoded"
```

###2. Request Access Token

Once authorization is complete from, eRS Cloud sends redirect back to defined redirect_uri with a grant code parameter **"code"** (and **state** parameter if was issued at time of requesting grant code) set. 

Now this grant code can be used to fetch access token from token end point.


**Access Token Request Endpoint.**

https://app.eresourcescheduler.cloud/login/oauth/token


**Parameters: Auth Code Request** 

Name | Description
----------: | :-------
**grant_type** <br> `string` <span class="required">`required`</span>     |  This must be set to "authorization_code" for access token request. 
**code** <br> `string` <span class="required">`required`</span> | The grant code which was received in step 1.
**client_id** <br> `string` <span class="required">`required`</span>     |  eRS Cloud generated unique client id which was assigned while registering application.
**client_secret** <br> `string` <span class="required">`required`</span>  |  The client secret which was assigned while registering application.
**redirect_uri** <br> `string` <span class="required">`required`</span> | The callback url where user will be sent back after authorization. This value must match to redirect uri given at the time of application registration. 



To learn more about OAuth token generation flow please read [here](https://oauth.net/2/grant-types/authorization-code/).



eRS Cloud expects an API token to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer B8x5Vj1O65r6wnoV`



A sample test API key is included in all the example here, so you can test any example right away. To test requests using your account, replace the sample API key with your actual (`provided_authentication_token`) API key.

<aside class="notice" id="noticeAside">
You must replace `B8x5Vj1O65r6wnoV` with your personal API key. 
</aside>


