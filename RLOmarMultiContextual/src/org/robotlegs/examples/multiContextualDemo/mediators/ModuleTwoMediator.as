package org.robotlegs.examples.multiContextualDemo.mediators
{
	import org.robotlegs.examples.multiContextualDemo.events.ModulesEvent;
	import org.robotlegs.examples.multiContextualDemo.views.ModuleTwo;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author  @_ondina
	 *
	 * */
	public class ModuleTwoMediator extends Mediator
	{
		[Inject]
		public var view:ModuleTwo;

		public function ModuleTwoMediator()
		{

		}

		override public function onRegister():void
		{
			trace("ModuleTwoMediator");
			view.moduleInfo.text="ModuleTwoMediator onregister";
			eventMap.mapListener(view, ModulesEvent.SWITCH_CONTEXT, onUnloadModules);
		}

		protected function onUnloadModules(event:ModulesEvent):void
		{
			trace("ModuleTwoMediator onUnloadModules " + event.module);
			dispatch(new ModulesEvent(ModulesEvent.SWITCH_CONTEXT, event.module));
		}
	}
}