package org.robotlegs.examples.multiContextualDemo.events
{
	import flash.events.Event;

	public class ModulesEvent extends Event
	{
		public static const LOAD_MODULES:String="loadModules";
		public static const UNLOAD_MODULES:String="unloadModules";
		public static const SWITCH_CONTEXT:String="switchContext";

		public var module:String;

		public function ModulesEvent(type:String, module:String=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.module=module;
			super(type, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new ModulesEvent(type, module, bubbles, cancelable);
		}
	}
}