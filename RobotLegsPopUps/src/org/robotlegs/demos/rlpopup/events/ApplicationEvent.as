package org.robotlegs.demos.rlpopup.events
{
	import flash.events.Event;
	/**
	 *
	 * @author Ondina
	 */
	public class ApplicationEvent extends Event
	{
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