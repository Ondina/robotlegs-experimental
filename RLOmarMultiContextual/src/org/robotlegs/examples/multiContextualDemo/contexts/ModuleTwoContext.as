package org.robotlegs.examples.multiContextualDemo.contexts
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.examples.multiContextualDemo.controllers.SwitchContextCommand;
	import org.robotlegs.examples.multiContextualDemo.events.ModulesEvent;
	import org.robotlegs.examples.multiContextualDemo.mediators.ModuleTwoMediator;
	import org.robotlegs.examples.multiContextualDemo.views.ModuleTwo;
	import org.robotlegs.mvcs.Context;
 
	/**
	 * @author omarfouad - modified by @_ondina
	 */
	public class ModuleTwoContext extends Context
	{
		public function ModuleTwoContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}

		override public function startup():void
		{
			trace("ModuleTwoContext");
			mediatorMap.mapView(ModuleTwo, ModuleTwoMediator, null, true, true);
			commandMap.mapEvent(ModulesEvent.SWITCH_CONTEXT, SwitchContextCommand, ModulesEvent);
		}
	}
}
