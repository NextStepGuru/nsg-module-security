component {

	public void function preProcess(event,interceptData) {

		var moduleRoot = "/modules/other-bundle/nsg-module-layout";
		announceInterception( state='addPageHeadStyle',
			     interceptData={"href":"#moduleRoot#/assets/css/bootstrap-social.css","tag":"link","rel":"stylesheet","moduleRoot":moduleRoot});
		announceInterception( state='addPageHeadStyle',
			     interceptData={"href":"#moduleRoot#/assets/css/font-awesome-social.css","tag":"link","rel":"stylesheet","moduleRoot":moduleRoot});
	}
}