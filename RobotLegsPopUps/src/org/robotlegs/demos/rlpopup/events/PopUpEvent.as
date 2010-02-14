package org.robotlegs.demos.rlpopup.events
{
	import flash.events.Event;
	/**
	 *
	 * @author Ondina
	 */
	public class PopUpEvent extends Event
	{
		public static const OPEN_POPUP:String="openPopup";
		public static const CLOSE_POPUP:String="closePopup";

		public var popUpObj:Object;
		public var popUpClass:Class;

		public function PopUpEvent(type:String, popUpObj:Object=null, popUpClass:Class=null)
		{
			this.popUpObj=popUpObj;
			this.popUpClass=popUpClass;
			super(type);
		}
	}
}