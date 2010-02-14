package org.robotlegs.demos.rlpopup.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.rlpopup.events.ApplicationEvent;
	import org.robotlegs.demos.rlpopup.views.components.MainView;
	/**
	 *
	 * @author Ondina
	 */
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
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "MainViewMediator registered"));
		}
		
		protected function setLabelText(value:String):void
		{
			view.introTitle.text=value;
		}
	}
}