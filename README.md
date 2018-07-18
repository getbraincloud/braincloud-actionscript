# brainCloud ActionScript3 Library

Thanks for downloading the brainCloud AS3 client library! Here are a few notes to get you started. Further information about the brainCloud API, including example Tutorials can be found here:

http://getbraincloud.com/apidocs/

If you haven't signed up or you want to log into the brainCloud portal, you can do that here:

https://portal.braincloudservers.com/

## Releases

Package | Description
 ---- | ----
[**brainCloudClient_actionScript_X.X.X.X**](https://github.com/getbraincloud/braincloud-actionscript/releases) | ActionScript3 for web

## Troubleshooting

Here are a few common errors that you may see on your first attempt to connect to brainCloud.

- **App id not set**: Verify you've set up the app id and app secret correctly in the `initialize()` method.
- **Platform not enabled**: Verify you've enabled your platform on the portal.

If you're still having issues, log into the portal and give us a shout through the help system (bottom right icon with the question mark and chat bubble).

## brainCloud Summary

brainCloud is a ready-made back-end platform for the development of feature-rich games, apps and things. brainCloud provides the features you need – along with comprehensive tools to support your team during development, testing and user support.

brainCloud consists of:
- Cloud Service – an advanced, Software-as-a-Service (SaaS) back-end
- Client Libraries – local client libraries (SDKs)
- Design Portal – a portal that allows you to design and debug your apps
- brainCloud Architecture

![architecture](/Screenshots/bc-architecture.png?raw=true)

## How do I initialize brainCloud?
You initialize the brainCloud Client with the following code

```as3
_bc = new BrainCloudClient();
_bc.initialize(_appId, _secret, _appVersion);
```
Your _appId, _secret, is set on the brainCloud dashboard. Under Design | Core App Info > Application IDs


_appVersion is the current version of our app. Having an _appVersion less than your minimum app version on brainCloud will prevent the user from accessing the service until they update their app to the lastest version you have provided them.

![versions](/Screenshots/bc-minVersions.png?raw=true)

## How do I authenticate a user with brainCloud?
The simplest form of authenticating with brainCloud is an Anonymous Authentication.
```as3
_bc.authenticationService.anonymousId = bc.authenticationService.generateAnonymousId();
_bc.authenticationService.authenticateAnonymous(_forceCreate, SuccessCallback, ErrorCallback, null);

public function SuccessCallback(jsonObject:Object, cbObject:Object):void
	{
		// Handle the return
	}
```

Setting _forceCreate to false will ensure the user will only login to an existing account. Setting it to true, will allow the user to register a new account

You will also pass in a response callback to react to the brainCloud Server response.

When this method creates new account, save the anonymous id locally to continue to use it to login to that account.

## How do I attach an email to a user's brainCloud profile?
After having the user create an anonymous with brainCloud, they are probably going to want to attach an email or username, so their account can be accessed via another platform, or when their local data is discarded.
Attaching email authenticate would look like this.
```as3
_bc.identityService.attach(_email, _password, AuthenticationType.Email, "", SuccessCallback, ErrorCallback);
```
There are many authentication types. You can also merge profiles and detach idenities. See the brainCloud documentation for more information:
http://getbraincloud.com/apidocs/apiref/?java#capi-auth
