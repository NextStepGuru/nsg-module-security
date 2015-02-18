component {

	public void function index(required event, required rc, required prc) output=false {
		structClear(session);
		getPageContext().getSession().invalidate();
		logout;
		setNextEvent(view='.',ssl=( cgi.server_port == 443 ? true : false ))
	}
}