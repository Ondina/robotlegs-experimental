package org.robotlegs.demos.rlviewstacks.events
{
	import flash.events.Event;

	public class LegsEvent extends Event
	{
		public static const LABEL_LEGS:String="labelLegs";
		public static const SHOW_LOGIN:String="showLogin";
		public var legsText:String;

		public function LegsEvent(type:String, legsText:String=null)
		{
			this.legsText=legsText;
			super(type);
		}
	}
}