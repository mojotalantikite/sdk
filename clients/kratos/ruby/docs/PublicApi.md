# OryHydraClient::PublicApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**complete_self_service_browser_settings_oidc_settings_flow**](PublicApi.md#complete_self_service_browser_settings_oidc_settings_flow) | **POST** /self-service/browser/flows/registration/strategies/oidc/settings/connections | Complete the Browser-Based Settings Flow for the OpenID Connect Strategy
[**complete_self_service_login_flow_with_password_method**](PublicApi.md#complete_self_service_login_flow_with_password_method) | **POST** /self-service/login/methods/password | Complete Login Flow with Username/Email Password Method
[**complete_self_service_recovery_flow_with_link_method**](PublicApi.md#complete_self_service_recovery_flow_with_link_method) | **POST** /self-service/recovery/methods/link | Complete Recovery Flow with Link Method
[**complete_self_service_registration_flow_with_password_method**](PublicApi.md#complete_self_service_registration_flow_with_password_method) | **POST** /self-service/registration/methods/password | Complete Registration Flow with Username/Email Password Method
[**complete_self_service_settings_flow_with_password_method**](PublicApi.md#complete_self_service_settings_flow_with_password_method) | **POST** /self-service/settings/methods/password | Complete Settings Flow with Username/Email Password Method
[**complete_self_service_settings_flow_with_profile_method**](PublicApi.md#complete_self_service_settings_flow_with_profile_method) | **POST** /self-service/settings/methods/profile | Complete Settings Flow with Profile Method
[**complete_self_service_verification_flow_with_link_method**](PublicApi.md#complete_self_service_verification_flow_with_link_method) | **POST** /self-service/verification/methods/link | Complete Verification Flow with Link Method
[**get_schema**](PublicApi.md#get_schema) | **GET** /schemas/{id} | 
[**get_self_service_error**](PublicApi.md#get_self_service_error) | **GET** /self-service/errors | Get User-Facing Self-Service Errors
[**get_self_service_login_flow**](PublicApi.md#get_self_service_login_flow) | **GET** /self-service/login/flows | Get Login Flow
[**get_self_service_recovery_flow**](PublicApi.md#get_self_service_recovery_flow) | **GET** /self-service/recovery/flows | Get information about a recovery flow
[**get_self_service_registration_flow**](PublicApi.md#get_self_service_registration_flow) | **GET** /self-service/registration/flows | Get Registration Flow
[**get_self_service_settings_flow**](PublicApi.md#get_self_service_settings_flow) | **GET** /self-service/settings/flows | Get Settings Flow
[**get_self_service_verification_flow**](PublicApi.md#get_self_service_verification_flow) | **GET** /self-service/verification/flows | Get Verification Flow
[**initialize_self_service_browser_logout_flow**](PublicApi.md#initialize_self_service_browser_logout_flow) | **GET** /self-service/browser/flows/logout | Initialize Browser-Based Logout User Flow
[**initialize_self_service_login_via_api_flow**](PublicApi.md#initialize_self_service_login_via_api_flow) | **GET** /self-service/login/api | Initialize Login Flow for API clients
[**initialize_self_service_login_via_browser_flow**](PublicApi.md#initialize_self_service_login_via_browser_flow) | **GET** /self-service/login/browser | Initialize Login Flow for browsers
[**initialize_self_service_recovery_via_api_flow**](PublicApi.md#initialize_self_service_recovery_via_api_flow) | **GET** /self-service/recovery/api | Initialize Recovery Flow for API Clients
[**initialize_self_service_recovery_via_browser_flow**](PublicApi.md#initialize_self_service_recovery_via_browser_flow) | **GET** /self-service/recovery/browser | Initialize Recovery Flow for Browser Clients
[**initialize_self_service_registration_via_api_flow**](PublicApi.md#initialize_self_service_registration_via_api_flow) | **GET** /self-service/registration/api | Initialize Registration Flow for API clients
[**initialize_self_service_registration_via_browser_flow**](PublicApi.md#initialize_self_service_registration_via_browser_flow) | **GET** /self-service/registration/browser | Initialize Registration Flow for browsers
[**initialize_self_service_settings_via_api_flow**](PublicApi.md#initialize_self_service_settings_via_api_flow) | **GET** /self-service/settings/api | Initialize Settings Flow for API Clients
[**initialize_self_service_settings_via_browser_flow**](PublicApi.md#initialize_self_service_settings_via_browser_flow) | **GET** /self-service/settings/browser/flows | Initialize Settings Flow for Browsers
[**initialize_self_service_verification_via_api_flow**](PublicApi.md#initialize_self_service_verification_via_api_flow) | **GET** /self-service/verification/api | Initialize Verification Flow for API Clients
[**initialize_self_service_verification_via_browser_flow**](PublicApi.md#initialize_self_service_verification_via_browser_flow) | **GET** /self-service/verification/browser | Initialize Verification Flow for Browser Clients
[**revoke_session**](PublicApi.md#revoke_session) | **DELETE** /sessions | Revoke and Invalidate a Session
[**whoami**](PublicApi.md#whoami) | **GET** /sessions/whoami | Check Who the Current HTTP Session Belongs To



## complete_self_service_browser_settings_oidc_settings_flow

> complete_self_service_browser_settings_oidc_settings_flow

Complete the Browser-Based Settings Flow for the OpenID Connect Strategy

This endpoint completes a browser-based settings flow. This is usually achieved by POSTing data to this endpoint.  > This endpoint is NOT INTENDED for API clients and only works with browsers (Chrome, Firefox, ...) and HTML Forms.  More information can be found at [ORY Kratos User Settings & Profile Management Documentation](../self-service/flows/user-settings).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new

begin
  #Complete the Browser-Based Settings Flow for the OpenID Connect Strategy
  api_instance.complete_self_service_browser_settings_oidc_settings_flow
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->complete_self_service_browser_settings_oidc_settings_flow: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## complete_self_service_login_flow_with_password_method

> LoginViaApiResponse complete_self_service_login_flow_with_password_method(flow, opts)

Complete Login Flow with Username/Email Password Method

Use this endpoint to complete a login flow by sending an identity's identifier and password. This endpoint behaves differently for API and browser flows.  API flows expect `application/json` to be sent in the body and responds with HTTP 200 and a application/json body with the session token on success; HTTP 302 redirect to a fresh login flow if the original flow expired with the appropriate error messages set; HTTP 400 on form validation errors.  Browser flows expect `application/x-www-form-urlencoded` to be sent in the body and responds with a HTTP 302 redirect to the post/after login URL or the `return_to` value if it was set and if the login succeeded; a HTTP 302 redirect to the login UI URL with the flow ID containing the validation errors otherwise.  More information can be found at [ORY Kratos User Login and User Registration Documentation](https://www.ory.sh/docs/next/kratos/self-service/flows/user-login-user-registration).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new
flow = 'flow_example' # String | The Flow ID
opts = {
  body: OryHydraClient::CompleteSelfServiceLoginFlowWithPasswordMethod.new # CompleteSelfServiceLoginFlowWithPasswordMethod | 
}

begin
  #Complete Login Flow with Username/Email Password Method
  result = api_instance.complete_self_service_login_flow_with_password_method(flow, opts)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->complete_self_service_login_flow_with_password_method: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **flow** | **String**| The Flow ID | 
 **body** | [**CompleteSelfServiceLoginFlowWithPasswordMethod**](CompleteSelfServiceLoginFlowWithPasswordMethod.md)|  | [optional] 

### Return type

[**LoginViaApiResponse**](LoginViaApiResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## complete_self_service_recovery_flow_with_link_method

> complete_self_service_recovery_flow_with_link_method(opts)

Complete Recovery Flow with Link Method

Use this endpoint to complete a recovery flow using the link method. This endpoint behaves differently for API and browser flows and has several states:  `choose_method` expects `flow` (in the URL query) and `email` (in the body) to be sent and works with API- and Browser-initiated flows. For API clients it either returns a HTTP 200 OK when the form is valid and HTTP 400 OK when the form is invalid and a HTTP 302 Found redirect with a fresh recovery flow if the flow was otherwise invalid (e.g. expired). For Browser clients it returns a HTTP 302 Found redirect to the Recovery UI URL with the Recovery Flow ID appended. `sent_email` is the success state after `choose_method` and allows the user to request another recovery email. It works for both API and Browser-initiated flows and returns the same responses as the flow in `choose_method` state. `passed_challenge` expects a `token` to be sent in the URL query and given the nature of the flow (\"sending a recovery link\") does not have any API capabilities. The server responds with a HTTP 302 Found redirect either to the Settings UI URL (if the link was valid) and instructs the user to update their password, or a redirect to the Recover UI URL with a new Recovery Flow ID which contains an error message that the recovery link was invalid.  More information can be found at [ORY Kratos Account Recovery Documentation](../self-service/flows/account-recovery.mdx).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new
opts = {
  token: 'token_example', # String | Recovery Token  The recovery token which completes the recovery request. If the token is invalid (e.g. expired) an error will be shown to the end-user.
  flow: 'flow_example', # String | The Flow ID  format: uuid
  body: OryHydraClient::CompleteSelfServiceRecoveryFlowWithLinkMethod.new # CompleteSelfServiceRecoveryFlowWithLinkMethod | 
}

begin
  #Complete Recovery Flow with Link Method
  api_instance.complete_self_service_recovery_flow_with_link_method(opts)
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->complete_self_service_recovery_flow_with_link_method: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**| Recovery Token  The recovery token which completes the recovery request. If the token is invalid (e.g. expired) an error will be shown to the end-user. | [optional] 
 **flow** | **String**| The Flow ID  format: uuid | [optional] 
 **body** | [**CompleteSelfServiceRecoveryFlowWithLinkMethod**](CompleteSelfServiceRecoveryFlowWithLinkMethod.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## complete_self_service_registration_flow_with_password_method

> RegistrationViaApiResponse complete_self_service_registration_flow_with_password_method(opts)

Complete Registration Flow with Username/Email Password Method

Use this endpoint to complete a registration flow by sending an identity's traits and password. This endpoint behaves differently for API and browser flows.  API flows expect `application/json` to be sent in the body and respond with HTTP 200 and a application/json body with the created identity success - if the session hook is configured the `session` and `session_token` will also be included; HTTP 302 redirect to a fresh registration flow if the original flow expired with the appropriate error messages set; HTTP 400 on form validation errors.  Browser flows expect `application/x-www-form-urlencoded` to be sent in the body and responds with a HTTP 302 redirect to the post/after registration URL or the `return_to` value if it was set and if the registration succeeded; a HTTP 302 redirect to the registration UI URL with the flow ID containing the validation errors otherwise.  More information can be found at [ORY Kratos User Login and User Registration Documentation](https://www.ory.sh/docs/next/kratos/self-service/flows/user-login-user-registration).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new
opts = {
  flow: 'flow_example', # String | Flow is flow ID.
  payload: nil # Object | 
}

begin
  #Complete Registration Flow with Username/Email Password Method
  result = api_instance.complete_self_service_registration_flow_with_password_method(opts)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->complete_self_service_registration_flow_with_password_method: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **flow** | **String**| Flow is flow ID. | [optional] 
 **payload** | **Object**|  | [optional] 

### Return type

[**RegistrationViaApiResponse**](RegistrationViaApiResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## complete_self_service_settings_flow_with_password_method

> SettingsViaApiResponse complete_self_service_settings_flow_with_password_method(opts)

Complete Settings Flow with Username/Email Password Method

Use this endpoint to complete a settings flow by sending an identity's updated password. This endpoint behaves differently for API and browser flows.  API-initiated flows expect `application/json` to be sent in the body and respond with HTTP 200 and an application/json body with the session token on success; HTTP 302 redirect to a fresh settings flow if the original flow expired with the appropriate error messages set; HTTP 400 on form validation errors. HTTP 401 when the endpoint is called without a valid session token. HTTP 403 when `selfservice.flows.settings.privileged_session_max_age` was reached. Implies that the user needs to re-authenticate.  Browser flows expect `application/x-www-form-urlencoded` to be sent in the body and responds with a HTTP 302 redirect to the post/after settings URL or the `return_to` value if it was set and if the flow succeeded; a HTTP 302 redirect to the Settings UI URL with the flow ID containing the validation errors otherwise. a HTTP 302 redirect to the login endpoint when `selfservice.flows.settings.privileged_session_max_age` was reached.  More information can be found at [ORY Kratos User Settings & Profile Management Documentation](../self-service/flows/user-settings).

### Example

```ruby
# load the gem
require 'ory-kratos-client'
# setup authorization
OryHydraClient.configure do |config|
  # Configure API key authorization: sessionToken
  config.api_key['X-Session-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Session-Token'] = 'Bearer'
end

api_instance = OryHydraClient::PublicApi.new
opts = {
  flow: 'flow_example', # String | Flow is flow ID.
  body: OryHydraClient::CompleteSelfServiceSettingsFlowWithPasswordMethod.new # CompleteSelfServiceSettingsFlowWithPasswordMethod | 
}

begin
  #Complete Settings Flow with Username/Email Password Method
  result = api_instance.complete_self_service_settings_flow_with_password_method(opts)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->complete_self_service_settings_flow_with_password_method: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **flow** | **String**| Flow is flow ID. | [optional] 
 **body** | [**CompleteSelfServiceSettingsFlowWithPasswordMethod**](CompleteSelfServiceSettingsFlowWithPasswordMethod.md)|  | [optional] 

### Return type

[**SettingsViaApiResponse**](SettingsViaApiResponse.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## complete_self_service_settings_flow_with_profile_method

> SettingsFlow complete_self_service_settings_flow_with_profile_method(opts)

Complete Settings Flow with Profile Method

Use this endpoint to complete a settings flow by sending an identity's updated traits. This endpoint behaves differently for API and browser flows.  API-initiated flows expect `application/json` to be sent in the body and respond with HTTP 200 and an application/json body with the session token on success; HTTP 302 redirect to a fresh settings flow if the original flow expired with the appropriate error messages set; HTTP 400 on form validation errors. HTTP 401 when the endpoint is called without a valid session token. HTTP 403 when `selfservice.flows.settings.privileged_session_max_age` was reached and a sensitive field was updated (e.g. recovery email). Implies that the user needs to re-authenticate.  Browser flows expect `application/x-www-form-urlencoded` to be sent in the body and responds with a HTTP 302 redirect to the post/after settings URL or the `return_to` value if it was set and if the flow succeeded; a HTTP 302 redirect to the settings UI URL with the flow ID containing the validation errors otherwise. a HTTP 302 redirect to the login endpoint when `selfservice.flows.settings.privileged_session_max_age` was reached.  More information can be found at [ORY Kratos User Settings & Profile Management Documentation](../self-service/flows/user-settings).

### Example

```ruby
# load the gem
require 'ory-kratos-client'
# setup authorization
OryHydraClient.configure do |config|
  # Configure API key authorization: sessionToken
  config.api_key['X-Session-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Session-Token'] = 'Bearer'
end

api_instance = OryHydraClient::PublicApi.new
opts = {
  flow: 'flow_example', # String | Flow is flow ID.
  payload: nil # Object | 
}

begin
  #Complete Settings Flow with Profile Method
  result = api_instance.complete_self_service_settings_flow_with_profile_method(opts)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->complete_self_service_settings_flow_with_profile_method: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **flow** | **String**| Flow is flow ID. | [optional] 
 **payload** | **Object**|  | [optional] 

### Return type

[**SettingsFlow**](SettingsFlow.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## complete_self_service_verification_flow_with_link_method

> complete_self_service_verification_flow_with_link_method(opts)

Complete Verification Flow with Link Method

Use this endpoint to complete a verification flow using the link method. This endpoint behaves differently for API and browser flows and has several states:  `choose_method` expects `flow` (in the URL query) and `email` (in the body) to be sent and works with API- and Browser-initiated flows. For API clients it either returns a HTTP 200 OK when the form is valid and HTTP 400 OK when the form is invalid and a HTTP 302 Found redirect with a fresh verification flow if the flow was otherwise invalid (e.g. expired). For Browser clients it returns a HTTP 302 Found redirect to the Verification UI URL with the Verification Flow ID appended. `sent_email` is the success state after `choose_method` and allows the user to request another verification email. It works for both API and Browser-initiated flows and returns the same responses as the flow in `choose_method` state. `passed_challenge` expects a `token` to be sent in the URL query and given the nature of the flow (\"sending a verification link\") does not have any API capabilities. The server responds with a HTTP 302 Found redirect either to the Settings UI URL (if the link was valid) and instructs the user to update their password, or a redirect to the Verification UI URL with a new Verification Flow ID which contains an error message that the verification link was invalid.  More information can be found at [ORY Kratos Email and Phone Verification Documentation](https://www.ory.sh/docs/kratos/selfservice/flows/verify-email-account-activation).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new
opts = {
  token: 'token_example', # String | Verification Token  The verification token which completes the verification request. If the token is invalid (e.g. expired) an error will be shown to the end-user.
  flow: 'flow_example', # String | The Flow ID  format: uuid
  body: OryHydraClient::CompleteSelfServiceVerificationFlowWithLinkMethod.new # CompleteSelfServiceVerificationFlowWithLinkMethod | 
}

begin
  #Complete Verification Flow with Link Method
  api_instance.complete_self_service_verification_flow_with_link_method(opts)
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->complete_self_service_verification_flow_with_link_method: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**| Verification Token  The verification token which completes the verification request. If the token is invalid (e.g. expired) an error will be shown to the end-user. | [optional] 
 **flow** | **String**| The Flow ID  format: uuid | [optional] 
 **body** | [**CompleteSelfServiceVerificationFlowWithLinkMethod**](CompleteSelfServiceVerificationFlowWithLinkMethod.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## get_schema

> Object get_schema(id)



Get a Traits Schema Definition

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new
id = 'id_example' # String | ID must be set to the ID of schema you want to get

begin
  result = api_instance.get_schema(id)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->get_schema: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID must be set to the ID of schema you want to get | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_self_service_error

> ErrorContainer get_self_service_error(error)

Get User-Facing Self-Service Errors

This endpoint returns the error associated with a user-facing self service errors.  This endpoint supports stub values to help you implement the error UI:  `?error=stub:500` - returns a stub 500 (Internal Server Error) error.  More information can be found at [ORY Kratos User User Facing Error Documentation](https://www.ory.sh/docs/kratos/self-service/flows/user-facing-errors).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new
error = 'error_example' # String | Error is the container's ID

begin
  #Get User-Facing Self-Service Errors
  result = api_instance.get_self_service_error(error)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->get_self_service_error: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **error** | **String**| Error is the container&#39;s ID | 

### Return type

[**ErrorContainer**](ErrorContainer.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_self_service_login_flow

> LoginFlow get_self_service_login_flow(id)

Get Login Flow

This endpoint returns a login flow's context with, for example, error details and other information.  More information can be found at [ORY Kratos User Login and User Registration Documentation](https://www.ory.sh/docs/next/kratos/self-service/flows/user-login-user-registration).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new
id = 'id_example' # String | The Login Flow ID  The value for this parameter comes from `flow` URL Query parameter sent to your application (e.g. `/login?flow=abcde`).

begin
  #Get Login Flow
  result = api_instance.get_self_service_login_flow(id)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->get_self_service_login_flow: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The Login Flow ID  The value for this parameter comes from &#x60;flow&#x60; URL Query parameter sent to your application (e.g. &#x60;/login?flow&#x3D;abcde&#x60;). | 

### Return type

[**LoginFlow**](LoginFlow.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_self_service_recovery_flow

> RecoveryFlow get_self_service_recovery_flow(id)

Get information about a recovery flow

This endpoint returns a recovery flow's context with, for example, error details and other information.  More information can be found at [ORY Kratos Account Recovery Documentation](../self-service/flows/account-recovery.mdx).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new
id = 'id_example' # String | The Flow ID  The value for this parameter comes from `request` URL Query parameter sent to your application (e.g. `/recovery?flow=abcde`).

begin
  #Get information about a recovery flow
  result = api_instance.get_self_service_recovery_flow(id)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->get_self_service_recovery_flow: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The Flow ID  The value for this parameter comes from &#x60;request&#x60; URL Query parameter sent to your application (e.g. &#x60;/recovery?flow&#x3D;abcde&#x60;). | 

### Return type

[**RecoveryFlow**](RecoveryFlow.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_self_service_registration_flow

> RegistrationFlow get_self_service_registration_flow(id)

Get Registration Flow

This endpoint returns a registration flow's context with, for example, error details and other information.  More information can be found at [ORY Kratos User Login and User Registration Documentation](https://www.ory.sh/docs/next/kratos/self-service/flows/user-login-user-registration).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new
id = 'id_example' # String | The Registration Flow ID  The value for this parameter comes from `flow` URL Query parameter sent to your application (e.g. `/registration?flow=abcde`).

begin
  #Get Registration Flow
  result = api_instance.get_self_service_registration_flow(id)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->get_self_service_registration_flow: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The Registration Flow ID  The value for this parameter comes from &#x60;flow&#x60; URL Query parameter sent to your application (e.g. &#x60;/registration?flow&#x3D;abcde&#x60;). | 

### Return type

[**RegistrationFlow**](RegistrationFlow.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_self_service_settings_flow

> SettingsFlow get_self_service_settings_flow(id)

Get Settings Flow

When accessing this endpoint through ORY Kratos' Public API you must ensure that either the ORY Kratos Session Cookie or the ORY Kratos Session Token are set. The public endpoint does not return 404 status codes but instead 403 or 500 to improve data privacy.  You can access this endpoint without credentials when using ORY Kratos' Admin API.  More information can be found at [ORY Kratos User Settings & Profile Management Documentation](../self-service/flows/user-settings).

### Example

```ruby
# load the gem
require 'ory-kratos-client'
# setup authorization
OryHydraClient.configure do |config|
  # Configure API key authorization: sessionToken
  config.api_key['X-Session-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Session-Token'] = 'Bearer'
end

api_instance = OryHydraClient::PublicApi.new
id = 'id_example' # String | ID is the Settings Flow ID  The value for this parameter comes from `flow` URL Query parameter sent to your application (e.g. `/settings?flow=abcde`).

begin
  #Get Settings Flow
  result = api_instance.get_self_service_settings_flow(id)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->get_self_service_settings_flow: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID is the Settings Flow ID  The value for this parameter comes from &#x60;flow&#x60; URL Query parameter sent to your application (e.g. &#x60;/settings?flow&#x3D;abcde&#x60;). | 

### Return type

[**SettingsFlow**](SettingsFlow.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_self_service_verification_flow

> VerificationFlow get_self_service_verification_flow(id)

Get Verification Flow

This endpoint returns a verification flow's context with, for example, error details and other information.  More information can be found at [ORY Kratos Email and Phone Verification Documentation](https://www.ory.sh/docs/kratos/selfservice/flows/verify-email-account-activation).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new
id = 'id_example' # String | The Flow ID  The value for this parameter comes from `request` URL Query parameter sent to your application (e.g. `/verification?flow=abcde`).

begin
  #Get Verification Flow
  result = api_instance.get_self_service_verification_flow(id)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->get_self_service_verification_flow: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The Flow ID  The value for this parameter comes from &#x60;request&#x60; URL Query parameter sent to your application (e.g. &#x60;/verification?flow&#x3D;abcde&#x60;). | 

### Return type

[**VerificationFlow**](VerificationFlow.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## initialize_self_service_browser_logout_flow

> initialize_self_service_browser_logout_flow

Initialize Browser-Based Logout User Flow

This endpoint initializes a logout flow.  > This endpoint is NOT INTENDED for API clients and only works with browsers (Chrome, Firefox, ...).  On successful logout, the browser will be redirected (HTTP 302 Found) to `urls.default_return_to`.  More information can be found at [ORY Kratos User Logout Documentation](https://www.ory.sh/docs/next/kratos/self-service/flows/user-logout).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new

begin
  #Initialize Browser-Based Logout User Flow
  api_instance.initialize_self_service_browser_logout_flow
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->initialize_self_service_browser_logout_flow: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## initialize_self_service_login_via_api_flow

> LoginFlow initialize_self_service_login_via_api_flow(opts)

Initialize Login Flow for API clients

This endpoint initiates a login flow for API clients such as mobile devices, smart TVs, and so on.  If a valid provided session cookie or session token is provided, a 400 Bad Request error will be returned unless the URL query parameter `?refresh=true` is set.  To fetch an existing login flow call `/self-service/login/flows?flow=<flow_id>`.  :::warning  You MUST NOT use this endpoint in client-side (Single Page Apps, ReactJS, AngularJS) nor server-side (Java Server Pages, NodeJS, PHP, Golang, ...) browser applications. Using this endpoint in these applications will make you vulnerable to a variety of CSRF attacks, including CSRF login attacks.  This endpoint MUST ONLY be used in scenarios such as native mobile apps (React Native, Objective C, Swift, Java, ...).  :::  More information can be found at [ORY Kratos User Login and User Registration Documentation](https://www.ory.sh/docs/next/kratos/self-service/flows/user-login-user-registration).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new
opts = {
  refresh: true # Boolean | Refresh a login session  If set to true, this will refresh an existing login session by asking the user to sign in again. This will reset the authenticated_at time of the session.
}

begin
  #Initialize Login Flow for API clients
  result = api_instance.initialize_self_service_login_via_api_flow(opts)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->initialize_self_service_login_via_api_flow: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refresh** | **Boolean**| Refresh a login session  If set to true, this will refresh an existing login session by asking the user to sign in again. This will reset the authenticated_at time of the session. | [optional] 

### Return type

[**LoginFlow**](LoginFlow.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## initialize_self_service_login_via_browser_flow

> initialize_self_service_login_via_browser_flow

Initialize Login Flow for browsers

This endpoint initializes a browser-based user login flow. Once initialized, the browser will be redirected to `selfservice.flows.login.ui_url` with the flow ID set as the query parameter `?flow=`. If a valid user session exists already, the browser will be redirected to `urls.default_redirect_url` unless the query parameter `?refresh=true` was set.  This endpoint is NOT INTENDED for API clients and only works with browsers (Chrome, Firefox, ...).  More information can be found at [ORY Kratos User Login and User Registration Documentation](https://www.ory.sh/docs/next/kratos/self-service/flows/user-login-user-registration).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new

begin
  #Initialize Login Flow for browsers
  api_instance.initialize_self_service_login_via_browser_flow
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->initialize_self_service_login_via_browser_flow: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## initialize_self_service_recovery_via_api_flow

> RecoveryFlow initialize_self_service_recovery_via_api_flow

Initialize Recovery Flow for API Clients

This endpoint initiates a recovery flow for API clients such as mobile devices, smart TVs, and so on.  If a valid provided session cookie or session token is provided, a 400 Bad Request error.  To fetch an existing recovery flow call `/self-service/recovery/flows?flow=<flow_id>`.  :::warning  You MUST NOT use this endpoint in client-side (Single Page Apps, ReactJS, AngularJS) nor server-side (Java Server Pages, NodeJS, PHP, Golang, ...) browser applications. Using this endpoint in these applications will make you vulnerable to a variety of CSRF attacks.  This endpoint MUST ONLY be used in scenarios such as native mobile apps (React Native, Objective C, Swift, Java, ...).  :::  More information can be found at [ORY Kratos Account Recovery Documentation](../self-service/flows/account-recovery.mdx).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new

begin
  #Initialize Recovery Flow for API Clients
  result = api_instance.initialize_self_service_recovery_via_api_flow
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->initialize_self_service_recovery_via_api_flow: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**RecoveryFlow**](RecoveryFlow.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## initialize_self_service_recovery_via_browser_flow

> initialize_self_service_recovery_via_browser_flow

Initialize Recovery Flow for Browser Clients

This endpoint initializes a browser-based account recovery flow. Once initialized, the browser will be redirected to `selfservice.flows.recovery.ui_url` with the flow ID set as the query parameter `?flow=`. If a valid user session exists, the browser is returned to the configured return URL.  This endpoint is NOT INTENDED for API clients and only works with browsers (Chrome, Firefox, ...).  More information can be found at [ORY Kratos Account Recovery Documentation](../self-service/flows/account-recovery.mdx).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new

begin
  #Initialize Recovery Flow for Browser Clients
  api_instance.initialize_self_service_recovery_via_browser_flow
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->initialize_self_service_recovery_via_browser_flow: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## initialize_self_service_registration_via_api_flow

> RegistrationFlow initialize_self_service_registration_via_api_flow

Initialize Registration Flow for API clients

This endpoint initiates a registration flow for API clients such as mobile devices, smart TVs, and so on.  If a valid provided session cookie or session token is provided, a 400 Bad Request error will be returned unless the URL query parameter `?refresh=true` is set.  To fetch an existing registration flow call `/self-service/registration/flows?flow=<flow_id>`.  :::warning  You MUST NOT use this endpoint in client-side (Single Page Apps, ReactJS, AngularJS) nor server-side (Java Server Pages, NodeJS, PHP, Golang, ...) browser applications. Using this endpoint in these applications will make you vulnerable to a variety of CSRF attacks.  This endpoint MUST ONLY be used in scenarios such as native mobile apps (React Native, Objective C, Swift, Java, ...).  :::  More information can be found at [ORY Kratos User Login and User Registration Documentation](https://www.ory.sh/docs/next/kratos/self-service/flows/user-login-user-registration).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new

begin
  #Initialize Registration Flow for API clients
  result = api_instance.initialize_self_service_registration_via_api_flow
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->initialize_self_service_registration_via_api_flow: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**RegistrationFlow**](RegistrationFlow.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## initialize_self_service_registration_via_browser_flow

> initialize_self_service_registration_via_browser_flow

Initialize Registration Flow for browsers

This endpoint initializes a browser-based user registration flow. Once initialized, the browser will be redirected to `selfservice.flows.registration.ui_url` with the flow ID set as the query parameter `?flow=`. If a valid user session exists already, the browser will be redirected to `urls.default_redirect_url` unless the query parameter `?refresh=true` was set.  :::note  This endpoint is NOT INTENDED for API clients and only works with browsers (Chrome, Firefox, ...).  :::  More information can be found at [ORY Kratos User Login and User Registration Documentation](https://www.ory.sh/docs/next/kratos/self-service/flows/user-login-user-registration).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new

begin
  #Initialize Registration Flow for browsers
  api_instance.initialize_self_service_registration_via_browser_flow
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->initialize_self_service_registration_via_browser_flow: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## initialize_self_service_settings_via_api_flow

> SettingsFlow initialize_self_service_settings_via_api_flow

Initialize Settings Flow for API Clients

This endpoint initiates a settings flow for API clients such as mobile devices, smart TVs, and so on. You must provide a valid ORY Kratos Session Token for this endpoint to respond with HTTP 200 OK.  To fetch an existing settings flow call `/self-service/settings/flows?flow=<flow_id>`.  :::warning  You MUST NOT use this endpoint in client-side (Single Page Apps, ReactJS, AngularJS) nor server-side (Java Server Pages, NodeJS, PHP, Golang, ...) browser applications. Using this endpoint in these applications will make you vulnerable to a variety of CSRF attacks.  This endpoint MUST ONLY be used in scenarios such as native mobile apps (React Native, Objective C, Swift, Java, ...).  :::  More information can be found at [ORY Kratos User Settings & Profile Management Documentation](../self-service/flows/user-settings).

### Example

```ruby
# load the gem
require 'ory-kratos-client'
# setup authorization
OryHydraClient.configure do |config|
  # Configure API key authorization: sessionToken
  config.api_key['X-Session-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Session-Token'] = 'Bearer'
end

api_instance = OryHydraClient::PublicApi.new

begin
  #Initialize Settings Flow for API Clients
  result = api_instance.initialize_self_service_settings_via_api_flow
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->initialize_self_service_settings_via_api_flow: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**SettingsFlow**](SettingsFlow.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## initialize_self_service_settings_via_browser_flow

> initialize_self_service_settings_via_browser_flow

Initialize Settings Flow for Browsers

This endpoint initializes a browser-based user settings flow. Once initialized, the browser will be redirected to `selfservice.flows.settings.ui_url` with the flow ID set as the query parameter `?flow=`. If no valid ORY Kratos Session Cookie is included in the request, a login flow will be initialized.  :::note  This endpoint is NOT INTENDED for API clients and only works with browsers (Chrome, Firefox, ...).  :::  More information can be found at [ORY Kratos User Settings & Profile Management Documentation](../self-service/flows/user-settings).

### Example

```ruby
# load the gem
require 'ory-kratos-client'
# setup authorization
OryHydraClient.configure do |config|
  # Configure API key authorization: sessionToken
  config.api_key['X-Session-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Session-Token'] = 'Bearer'
end

api_instance = OryHydraClient::PublicApi.new

begin
  #Initialize Settings Flow for Browsers
  api_instance.initialize_self_service_settings_via_browser_flow
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->initialize_self_service_settings_via_browser_flow: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## initialize_self_service_verification_via_api_flow

> VerificationFlow initialize_self_service_verification_via_api_flow

Initialize Verification Flow for API Clients

This endpoint initiates a verification flow for API clients such as mobile devices, smart TVs, and so on.  To fetch an existing verification flow call `/self-service/verification/flows?flow=<flow_id>`.  :::warning  You MUST NOT use this endpoint in client-side (Single Page Apps, ReactJS, AngularJS) nor server-side (Java Server Pages, NodeJS, PHP, Golang, ...) browser applications. Using this endpoint in these applications will make you vulnerable to a variety of CSRF attacks.  This endpoint MUST ONLY be used in scenarios such as native mobile apps (React Native, Objective C, Swift, Java, ...).  :::  More information can be found at [ORY Kratos Email and Phone Verification Documentation](https://www.ory.sh/docs/kratos/selfservice/flows/verify-email-account-activation).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new

begin
  #Initialize Verification Flow for API Clients
  result = api_instance.initialize_self_service_verification_via_api_flow
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->initialize_self_service_verification_via_api_flow: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**VerificationFlow**](VerificationFlow.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## initialize_self_service_verification_via_browser_flow

> initialize_self_service_verification_via_browser_flow

Initialize Verification Flow for Browser Clients

This endpoint initializes a browser-based account verification flow. Once initialized, the browser will be redirected to `selfservice.flows.verification.ui_url` with the flow ID set as the query parameter `?flow=`.  This endpoint is NOT INTENDED for API clients and only works with browsers (Chrome, Firefox, ...).  More information can be found at [ORY Kratos Email and Phone Verification Documentation](https://www.ory.sh/docs/kratos/selfservice/flows/verify-email-account-activation).

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new

begin
  #Initialize Verification Flow for Browser Clients
  api_instance.initialize_self_service_verification_via_browser_flow
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->initialize_self_service_verification_via_browser_flow: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## revoke_session

> revoke_session(body)

Revoke and Invalidate a Session

Use this endpoint to revoke a session using its token. This endpoint is particularly useful for API clients such as mobile apps to log the user out of the system and invalidate the session.  This endpoint does not remove any HTTP Cookies - use the Self-Service Logout Flow instead.

### Example

```ruby
# load the gem
require 'ory-kratos-client'

api_instance = OryHydraClient::PublicApi.new
body = OryHydraClient::RevokeSession.new # RevokeSession | 

begin
  #Revoke and Invalidate a Session
  api_instance.revoke_session(body)
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->revoke_session: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RevokeSession**](RevokeSession.md)|  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## whoami

> Session whoami(opts)

Check Who the Current HTTP Session Belongs To

Uses the HTTP Headers in the GET request to determine (e.g. by using checking the cookies) who is authenticated. Returns a session object in the body or 401 if the credentials are invalid or no credentials were sent. Additionally when the request it successful it adds the user ID to the 'X-Kratos-Authenticated-Identity-Id' header in the response.  This endpoint is useful for reverse proxies and API Gateways.

### Example

```ruby
# load the gem
require 'ory-kratos-client'
# setup authorization
OryHydraClient.configure do |config|
  # Configure API key authorization: sessionToken
  config.api_key['X-Session-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Session-Token'] = 'Bearer'
end

api_instance = OryHydraClient::PublicApi.new
opts = {
  cookie: 'cookie_example', # String | 
  authorization: 'authorization_example' # String | in: authorization
}

begin
  #Check Who the Current HTTP Session Belongs To
  result = api_instance.whoami(opts)
  p result
rescue OryHydraClient::ApiError => e
  puts "Exception when calling PublicApi->whoami: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cookie** | **String**|  | [optional] 
 **authorization** | **String**| in: authorization | [optional] 

### Return type

[**Session**](Session.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

