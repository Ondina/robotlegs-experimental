package org.robotlegs.examples.multiContextualDemo.controllers
{
	import org.robotlegs.examples.multiContextualDemo.contexts.MainContext;
	import org.robotlegs.examples.multiContextualDemo.events.ModulesEvent;
	import org.robotlegs.mvcs.Command;
 
	/**
	 * @author omarfouad - modified by @_ondina
	 */
	public class SwitchContextCommand extends Command
	{
		[Inject]
		public var event:ModulesEvent;
		
		override public function execute():void
		{
			MainContext.switchContext(event.module);
		}
	}
}
