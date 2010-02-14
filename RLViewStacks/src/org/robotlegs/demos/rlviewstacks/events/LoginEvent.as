package org.robotlegs.demos.rlviewstacks.events
{
	import flash.events.Event;

	public class LoginEvent extends Event
	{
		public static const TRY_LOGIN:String="tryLogin";
		public static const LOGGED_IN:String="loggedIn";
		public var loginObj:Object;

		public function LoginEvent(type:String, loginObj:Object=null)
		{
			this.loginObj=loginObj;
			super(type);
		}
	}
}