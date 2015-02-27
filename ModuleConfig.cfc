component {

	// Module Properties
	this.title 				= "security";
	this.author 			= "Jeremy R DeYoung";
	this.webURL 			= "http://www.nextstep.guru";
	this.description 		= "Security Module with User/ORM, Social Login, & Sign-up";
	this.version			= "1.0.6";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "security";
	// Model Namespace
	this.modelNamespace		= "security";
	// CF Mapping
	this.cfmapping			= "security";
	// Module Dependencies
	this.dependencies 		= [];

	function configure(){

		// parent settings
		parentSettings = {

		};

		// module settings - stored in modules.name.settings
		settings = {

		};

		// Layout Settings
		layoutSettings = {
		};

		// datasources
		datasources = {

		};

		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/login/:socialService", handler="login",action="oauth"},
			{pattern="/logout", handler="logout",action="index"},
			{pattern="/:id?/:sid?/:tid?", handler="login",action="index"}
		];

		// Custom Declared Points
		interceptorSettings = {
			customInterceptionPoints = "loginSuccess,loginFailure,logoutSuccess,logoutFailure,socialLoginSuccess,socialLoginFailure,socialLogout"
		};

		// Custom Declared Interceptors
		interceptors = [
			{name="security@security",class="#moduleMapping#.interceptors.securityInterceptor"}
		];

		// Binder Mappings
		binder.mapDirectory( "#moduleMapping#.models" );
		binder.mapAspect(aspect="secure").to("#moduleMapping#.aspects.securityAspect");

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		var nsgSecurity = controller.getSetting('nsgSecurity',false,{});
		var nsgMenu = controller.getSetting('nsgMenu',false,[]);
		// menu::login
		arrayAppend(nsgMenu,{ "menu"="topRight","icon"="fa fa-sign-in","id":"login","title":"Login","link":"/security/login","roles":"","type":"dropdown","isUserLoggedIn":false });
		arrayAppend(nsgMenu,{ "menu"="topRight","subid":"login","icon"="fa fa-sign-in","id":"accountSignIn","title":"Sign-in to your Account","link":"/security/login","roles":"","type":"link","isUserLoggedIn":false });
		if( structKeyExists(nsgSecurity,'allowAccountCreation') && nsgSecurity['allowAccountCreation'] ){
			arrayAppend(nsgMenu,{ "menu"="topRight","subid":"login","icon"="fa fa-user","id":"accountNew","title":"Sign-up for an Account","link":"/security/signup","roles":"","type":"link","isUserLoggedIn":false });
		}

		// menu::logout
		arrayAppend(nsgMenu,{ "menu"="topRight","icon"="fa fa-sign-out","id":"logout","title":"Logout","link":"/security/logout","type":"dropdown","isUserLoggedIn":true });
		arrayAppend(nsgMenu,{ "menu"="topRight","subid":"logout","icon"="fa fa-sign-out","id":"accountSignOut","title":"Sign-out of your Account","link":"/security/logout","type":"link","isUserLoggedIn":true });
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

	}

}