package org.robotlegs.demos.rlpopup.views.mediators
{
	import flash.events.MouseEvent;
	import org.robotlegs.demos.rlpopup.events.ApplicationEvent;
	import org.robotlegs.demos.rlpopup.events.PopUpEvent;
	import org.robotlegs.demos.rlpopup.events.SearchEventFour;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpFourView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 *
	 * @author Ondina
	 */
	public class PopUpFourMediator extends Mediator
	{
		[Inject]
		public var view:PopUpFourView;

		public function PopUpFourMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "PopUpFourMediator registered"));
			eventMap.mapListener(eventDispatcher, SearchEventFour.SEARCH_RESULT_FOUR, handleSearchResult);
			eventMap.mapListener(view, SearchEventFour.SELECTED_RESULT_FOUR, handleSelectedResult);
			eventMap.mapListener(view, PopUpEvent.CLOSE_POPUP, handleClosePopup);
		}

		protected function handleSearchResult(event:SearchEventFour):void
		{
			var sResult:String=event.searchObj4 as String;
			view.showResults(sResult);
		}

		protected function handleClosePopup(event:PopUpEvent):void
		{
			removeMediator();
		}

		protected function handleSelectedResult(event:SearchEventFour):void
		{
			dispatch(new SearchEventFour(SearchEventFour.SELECTED_RESULT_FOUR, event.searchObj4.toString()));
			removeMediator();
		}

		protected function removeMediator():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "PopUpFourMediator removed"));
			mediatorMap.removeMediator(this);
		}
	}
}