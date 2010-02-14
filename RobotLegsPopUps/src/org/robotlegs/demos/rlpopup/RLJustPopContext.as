package org.robotlegs.demos.rlpopup
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IContext;
	import org.robotlegs.demos.rlpopup.controllers.commands.startup.*;
	import org.robotlegs.mvcs.Context;

	/**
	 *
	 * @author Ondina
	 */
	public class RLJustPopContext extends Context implements IContext
	{
		public function RLJustPopContext(contextView:DisplayObjectContainer, autoStartup:Boolean=true)
		{
			//the constructor isn't needed actually, as Joel mentioned on the forum
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			//these commands will map the views, model and other commands
			commandMap.mapEvent(ContextEvent.STARTUP, PrepModelCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepViewCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepControllerCommand, ContextEvent, true);

			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}