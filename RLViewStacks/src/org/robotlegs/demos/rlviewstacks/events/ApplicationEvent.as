package org.robotlegs.demos.rlviewstacks.events
{
	import flash.events.Event;

	public class ApplicationEvent extends Event
	{
		public static const CHANGE_INTROVIEW_STATE:String="changeIntroViewState";
		public static const CHANGE_MAINVIEW_STATE:String="changeMainViewState";
		public static const LOGG_MESSAGE:String="loggMessage";
		public static const MAP_MEDIATOR:String="mapMediator";
		
		public var appMessage:Object;

		public function ApplicationEvent(type:String, appMessage:Object=null)
		{
			this.appMessage=appMessage;
			super(type);
		}
	}
}