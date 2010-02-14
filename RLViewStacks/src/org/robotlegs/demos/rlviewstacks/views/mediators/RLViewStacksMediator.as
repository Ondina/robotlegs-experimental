package org.robotlegs.demos.rlviewstacks.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.rlviewstacks.events.ApplicationEvent;
	
	public class RLViewStacksMediator extends Mediator
	{
		[Inject]
		public var view:RLViewStacks;
		
		public function RLViewStacksMediator()
		{
		}
		
		override public function onRegister():void
		{
			view.loggMessage = "Application Mediator registered\n";
			eventMap.mapListener(eventDispatcher, ApplicationEvent.CHANGE_MAINVIEW_STATE, handleChangeViewState);
			eventMap.mapListener(eventDispatcher, ApplicationEvent.LOGG_MESSAGE, handleLoggMessage);
		}
		protected function handleChangeViewState(event:ApplicationEvent):void
		{
			view.currentState=event.appMessage.toString();
		}
		protected function handleLoggMessage(event:ApplicationEvent):void
		{
			view.loggMessage+=event.appMessage+" \n";
		}
	}
}