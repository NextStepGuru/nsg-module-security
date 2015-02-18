<cfoutput>
	<div class="row">
		<div class="col-lg-offset-3 col-lg-6 col-md-offset-2 col-md-8">
			<div class="form-signin clearfix">
				<form>
					<h2 class="form-signin-heading"><i class="fa fa-lock"></i> Secure Login Form</h2>
					<div class="form-content">
						<div class="col-sm-5">
							<label>Social Login via...</label>
							<cfset loginList = getSetting('nsgSocialLogin',false,arrayNew())>
							<cfloop index="i" from="1" to="#arrayLen(loginList)#">
								<a href="/security/login/#loginList[i]['name']#" class="btn btn-block btn-social btn-#loginList[i]['icon']#"><i class="fa fa-#loginList[i]['icon']#"></i> Sign in with #loginList[i]['title']#</a>
							</cfloop>
						</div>
						<div class="col-sm-7">
							<label for="inputEmail">Email Address</label>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1"><i class="fa fa-envelope"></i></span>
								<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
							</div>

							<label for="inputPassword">Password</label>
							<a href="/security/login/lost" class="pull-right small-text">Forgot password?</a>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon2"><i class="fa fa-lock"></i></span>
								<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
							</div>

							<div class="text-right clearfix">
								<button class="btn btn-lg btn-primary btn-block btn-sign-in" type="submit"><i class="fa fa-lock"></i> Secure Sign in <i class="fa fa-sign-in"></i></button>
							</div>
							<br>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</cfoutput>