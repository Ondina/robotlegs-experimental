package org.robotlegs.examples.multiContextualDemo.contexts
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.examples.multiContextualDemo.controllers.SwitchContextCommand;
	import org.robotlegs.examples.multiContextualDemo.events.ModulesEvent;
	import org.robotlegs.examples.multiContextualDemo.mediators.MainViewMediator;
	import org.robotlegs.mvcs.Context;

 
	/**
	 * @author omarfouad - modified by @_ondina
	 *
	 * This class is responsible to run or switch to different contexts on runtime.
	 * For now this is going to switch to a single context per runtime.
	 *
	 * The HomeContext is the default context that is created on startup. The ModuleContext is
	 * the additional module that the application would switch to, on runtime.
	 *
	 * This would require a single singleton: switchContext() that can be called from anywhere.
	 */
	public class MainContext extends Context
	{

		private static var currentContext:Context;
		private static var mainContext:Context;
		private static var moduleToRemove:String;
		private static var contextHolder:DisplayObjectContainer;

		public function MainContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);

			contextHolder=contextView;
		}

		override public function startup():void
		{
			currentContext=this;
			mainContext=this;
			mediatorMap.mapView(RLOmarMultiContextual, MainViewMediator, null, true, false); //application mediator
			commandMap.mapEvent(ModulesEvent.SWITCH_CONTEXT, SwitchContextCommand, ModulesEvent);
		}

		/**
		 * Switches the current module to the module name specified in the first parameter.
		 * If replaceModule is set to false, the loaded module won't be replaced.
		 */
		public static function switchContext(context:String, replaceModule:Boolean=true):void
		{
			trace("switchContext " + context);
			if (replaceModule)
				cleanUp(moduleToRemove);

			switch (context)
			{
				case "ModuleOne":
					currentContext=new ModuleOneContext(contextHolder);
					mainContext.dispatchEvent(new ModulesEvent(ModulesEvent.LOAD_MODULES, context));
					break;
				case "ModuleTwo":
					currentContext=new ModuleTwoContext(contextHolder);
					mainContext.dispatchEvent(new ModulesEvent(ModulesEvent.LOAD_MODULES, context));
					break;
			}
			moduleToRemove=context;
		}

		/**
		 * Cleans up the current module in case the new module replaces it.
		 */
		private static function cleanUp(module:String):void
		{
			trace("cleanUp " + module)
			if (module != null)
				mainContext.dispatchEvent(new ModulesEvent(ModulesEvent.UNLOAD_MODULES, module));
		}
	}
}
