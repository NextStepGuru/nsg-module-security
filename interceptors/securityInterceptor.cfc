component {

	public void function preProcess(event,interceptData) {

		announceInterception( state='addPageHeadStyle',
			     interceptData={"href":"/modules/nsg-module-layout/assets/css/bootstrap-social.css","tag":"link","rel":"stylesheet"});
		announceInterception( state='addPageHeadStyle',
			     interceptData={"href":"/modules/nsg-module-layout/assets/css/font-awesome-social.css","tag":"link","rel":"stylesheet"});
	}
}