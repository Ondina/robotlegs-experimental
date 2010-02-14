package org.robotlegs.demos.rlpopup.views.mediators
{
	import org.robotlegs.demos.rlpopup.events.ApplicationEvent;
	import org.robotlegs.demos.rlpopup.events.PopUpEvent;
	import org.robotlegs.demos.rlpopup.events.SearchEventOne;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpOneView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 *
	 * @author Ondina
	 */
	public class PopUpOneMediator extends Mediator
	{
		[Inject]
		public var view:PopUpOneView;

		public function PopUpOneMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "PopUpOneMediator registered"));
			eventMap.mapListener(eventDispatcher, SearchEventOne.SHOW_RESULT, handleShowResults);
			eventMap.mapListener(view, PopUpEvent.CLOSE_POPUP, handleClosePopup);
		}

		protected function handleShowResults(event:SearchEventOne):void
		{
			var sResult:String=event.searchObj as String;
			view.writeResultLabel(sResult);
		}

		protected function handleClosePopup(event:PopUpEvent):void
		{
			mediatorMap.removeMediator(this);
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "PopUpOneMediator removed"));
		}
	}
}