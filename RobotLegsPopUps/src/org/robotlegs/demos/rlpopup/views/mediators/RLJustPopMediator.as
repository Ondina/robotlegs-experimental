package org.robotlegs.demos.rlpopup.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.rlpopup.events.ApplicationEvent;
	import org.robotlegs.demos.rlpopup.views.components.popups.CallerOneView;
	/**
	 *
	 * @author Ondina
	 */
	public class RLJustPopMediator extends Mediator
	{
		[Inject]
		public var view:RLJustPop;

		/*
		 * this is the Application's Mediator for the root View
		 * even if not really needed in here,
		 * I have it just for the sake of seeing if the mapping works,
		 * and for handling the Logg Messages coming from other Mediators onRegister()
		 * I should have a LoggMessage Mediator for this, but I'm too lazy to make the changes
		 */
		public function RLJustPopMediator()
		{
		}

		override public function onRegister():void
		{
			view.loggMessage="Application Mediator registered\n";
			eventMap.mapListener(eventDispatcher, ApplicationEvent.LOGG_MESSAGE, handleLoggMessage);
		}

		protected function handleLoggMessage(event:ApplicationEvent):void
		{
			view.loggMessage+=event.appMessage + " \n";
		}
	}
}