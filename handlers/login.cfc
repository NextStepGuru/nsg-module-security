component {

	function index(event,rc,prc){
	}

	function oauth(event,rc,prc){
		if( !event.valueExists('socialService') ){
			setNextEvent('security.login');
		}

		// need to verify the social service is installed

		setNextEvent('#event.getValue('socialService')#.oauth');
	}

}