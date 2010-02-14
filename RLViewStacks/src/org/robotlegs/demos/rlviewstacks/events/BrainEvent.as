package org.robotlegs.demos.rlviewstacks.events
{
	import flash.events.Event;

	public class BrainEvent extends Event
	{
		public static const BRAIN_ACTION:String="brainAction";
		public var brainObj:Object;

		public function BrainEvent(type:String, brainObj:Object=null)
		{
			this.brainObj=brainObj;
			super(type);
		}
	}
}