package org.robotlegs.examples.multiContextualDemo.contexts
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.examples.multiContextualDemo.controllers.SwitchContextCommand;
	import org.robotlegs.examples.multiContextualDemo.events.ModulesEvent;
	import org.robotlegs.examples.multiContextualDemo.mediators.ModuleOneMediator;
	import org.robotlegs.examples.multiContextualDemo.views.ModuleOne;
	import org.robotlegs.mvcs.Context;

 
	/**
	 * @author omarfouad - modified by @_ondina
	 */
	public class ModuleOneContext extends Context
	{
		public function ModuleOneContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}

		override public function startup():void
		{
			trace("ModuleOneContext");
			mediatorMap.mapView(ModuleOne, ModuleOneMediator, null, true, true);
			commandMap.mapEvent(ModulesEvent.SWITCH_CONTEXT, SwitchContextCommand, ModulesEvent);
		}
	}
}
