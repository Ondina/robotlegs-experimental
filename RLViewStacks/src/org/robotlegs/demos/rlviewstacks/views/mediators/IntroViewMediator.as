package org.robotlegs.demos.rlviewstacks.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.rlviewstacks.events.ApplicationEvent;
	import org.robotlegs.demos.rlviewstacks.views.components.IntroView;
		
	public class IntroViewMediator extends Mediator
	{
		[Inject]
		public var view:IntroView;
		
		public function IntroViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, ApplicationEvent.CHANGE_INTROVIEW_STATE, handleShowLogin);
		}
		
		protected function setLabelText(value:String):void
		{
			view.introTitle.text=value;
		}
		
		protected function handleShowLogin(event:ApplicationEvent):void
		{
			var msg:String=event.appMessage as String;
			view.currentState=msg;
		}
	}
}