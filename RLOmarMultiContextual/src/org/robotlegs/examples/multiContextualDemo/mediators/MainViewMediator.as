package org.robotlegs.examples.multiContextualDemo.mediators
{
	import org.robotlegs.examples.multiContextualDemo.events.ModulesEvent;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author  @_ondina
	 *
	 * */
	public class MainViewMediator extends Mediator
	{
		[Inject]
		public var view:RLOmarMultiContextual;

		public function MainViewMediator()
		{

		}

		override public function onRegister():void
		{
			trace("MainViewMediator");
			eventMap.mapListener(view, ModulesEvent.SWITCH_CONTEXT, onSwitchContext);
			eventMap.mapListener(eventDispatcher, ModulesEvent.LOAD_MODULES, onLoadModules);
			eventMap.mapListener(eventDispatcher, ModulesEvent.UNLOAD_MODULES, onUnloadModules);
		}

		protected function onSwitchContext(event:ModulesEvent):void
		{
			trace("MainViewMediator onLoadModules");
			//to SwitchContextCommand
			dispatch(new ModulesEvent(ModulesEvent.SWITCH_CONTEXT, event.module));
		}

		protected function onLoadModules(event:ModulesEvent):void
		{
			trace("MainViewMediator onLoadModules");
			view.addTheModule(event.module);
		}

		protected function onUnloadModules(event:ModulesEvent):void
		{
			trace("MainViewMediator onUnloadModules " + event.module);
			//view remove module
			view.removeTheModule(event.module);
		}
	}
}