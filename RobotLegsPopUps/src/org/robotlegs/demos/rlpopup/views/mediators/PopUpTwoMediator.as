package org.robotlegs.demos.rlpopup.views.mediators
{
	import org.robotlegs.demos.rlpopup.events.ApplicationEvent;
	import org.robotlegs.demos.rlpopup.events.PopUpEvent;
	import org.robotlegs.demos.rlpopup.events.SearchEventTwo;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpTwoView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 *
	 * @author Ondina
	 */
	public class PopUpTwoMediator extends Mediator
	{
		[Inject]
		public var view:PopUpTwoView;

		public function PopUpTwoMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			eventMap.mapListener(view, SearchEventTwo.SELECTED_RESULT_TWO, handleSelectedResult);
			eventMap.mapListener(view, PopUpEvent.CLOSE_POPUP, handleClosePopup);
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "PopUpTwoMediator registered"));
		}

		protected function handleClosePopup(event:PopUpEvent):void
		{
			removeMediator();
		}

		protected function handleSelectedResult(event:SearchEventTwo):void
		{
			removeMediator();
			dispatch(new SearchEventTwo(SearchEventTwo.SELECTED_RESULT_TWO, event.searchObj2.toString()));
		}

		protected function removeMediator():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "PopUpTwoMediator removed"));
			mediatorMap.removeMediator(this);
		}
	}
}