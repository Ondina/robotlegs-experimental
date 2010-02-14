package org.robotlegs.demos.rlviewstacks.models.vo
{

	[RemoteClass(alias="VOLogin")]
	[Bindable]
	public class LoginVO
	{
		public var user_id:String;
		public var user_name:String;
		public var user_password:String;
		public var user_priority:uint;
	}
}