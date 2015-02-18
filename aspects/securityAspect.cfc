/**
* @classMatcher any
* @methodMatcher annotatedWith:secure
*/
component name="securityAspect" {

	property name="coldbox" inject="coldbox";

    function invokeMethod( invocation ) {

    	// Enforce our security check
    	if( !isUserLoggedIn() ) {
    		session['loginRedirect'] = cgi.path_info & '?' & cgi.query_string;

    		// Kick out people who aren't logged in
    		coldbox.setNextEvent( 'security.login' );
    	}

		return arguments.invocation.proceed();
    }

}