package org.robotlegs.demos.rlviewstacks.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.rlviewstacks.views.components.TheLegs;
	import org.robotlegs.demos.rlviewstacks.events.LegsEvent;
	import org.robotlegs.demos.rlviewstacks.events.ApplicationEvent;
	
	public class TheLegsMediator extends Mediator
	{
		[Inject]
		public var theLegs:TheLegs;
		
		public function TheLegsMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			this.theLegs.legsLabel.text="some legs";
			eventMap.mapListener(theLegs, LegsEvent.LABEL_LEGS, handleLabelLegs);
			eventMap.mapListener(theLegs, LegsEvent.SHOW_LOGIN, handleShowLogin);
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "TheLegsMediator registered"));
		}
		
		protected function setLabelText(value:String):void
		{
			this.theLegs.legsLabel.text=value;
		}
		
		protected function handleLabelLegs(event:LegsEvent):void
		{
			this.setLabelText(event.legsText);
		}
		
		protected function handleShowLogin(event:LegsEvent):void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.CHANGE_INTROVIEW_STATE, "login"));
		}
	}
}