package org.robotlegs.examples.multiContextualDemo.mediators
{
	import org.robotlegs.examples.multiContextualDemo.events.ModulesEvent;
	import org.robotlegs.examples.multiContextualDemo.views.ModuleOne;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author  @_ondina
	 *
	 * */
	public class ModuleOneMediator extends Mediator
	{
		[Inject]
		public var view:ModuleOne;
		
		public function ModuleOneMediator()
		{
			
		}
		override public function onRegister():void
		{
			trace("ModuleOneMediator onregister");
			view.moduleInfo.text="ModuleOneMediator onregister";
			eventMap.mapListener(view, ModulesEvent.SWITCH_CONTEXT, onUnloadModules);
		}
		protected function onUnloadModules(event:ModulesEvent):void
		{
			trace("ModuleOneMediator onUnloadModules "+event.module);
			dispatch(new ModulesEvent(ModulesEvent.SWITCH_CONTEXT, event.module));
		}
	}
}