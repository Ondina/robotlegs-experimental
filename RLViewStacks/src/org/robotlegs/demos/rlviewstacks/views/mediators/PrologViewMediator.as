package org.robotlegs.demos.rlviewstacks.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.rlviewstacks.events.ApplicationEvent;
	import org.robotlegs.demos.rlviewstacks.views.components.prolog.PrologView;
	
	public class PrologViewMediator extends Mediator
	{
		[Inject]
		public var view:PrologView;
		
		public function PrologViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "PrologViewMediator registerd"));
			view.prologText.text +="\n...text from PrologMediator..";
		}
	}
}