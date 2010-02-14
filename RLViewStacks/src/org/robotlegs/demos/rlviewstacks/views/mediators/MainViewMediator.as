package org.robotlegs.demos.rlviewstacks.views.mediators
{
	import org.robotlegs.demos.rlviewstacks.events.ApplicationEvent;
	import org.robotlegs.demos.rlviewstacks.views.components.MainView;
	import org.robotlegs.mvcs.Mediator;

	public class MainViewMediator extends Mediator
	{
		[Inject]
		public var view:MainView;
		
		public function MainViewMediator()
		{
			super();
		}
		override public function onRegister():void
		{
			//eventMap.mapListener( eventDispatcher, MessageListEvent.RECEIVED_FROM_SERVICE, handleMessagesReceived );

			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "MainViewMediator registered"));
		}
	}
}