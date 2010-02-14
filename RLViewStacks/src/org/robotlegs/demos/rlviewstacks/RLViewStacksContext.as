package org.robotlegs.demos.rlviewstacks
{
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.core.IContext;

	import org.robotlegs.demos.rlviewstacks.controllers.commands.startup.*;

	public class RLViewStacksContext extends Context implements IContext

	{
		public function RLViewStacksContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}

		override public function startup():void
		{
			commandMap.mapEvent(ContextEvent.STARTUP, PrepViewCommand, ContextEvent, true);
			this.dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
			//dispatchEvent!!! not dispatch
			//this.startup();
		}
	}
}