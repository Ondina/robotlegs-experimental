package org.robotlegs.demos.rlpopup.views.mediators
{
	import org.robotlegs.demos.rlpopup.events.ApplicationEvent;
	import org.robotlegs.demos.rlpopup.events.SearchEventFour;
	import org.robotlegs.demos.rlpopup.events.PopUpEvent;
	import org.robotlegs.demos.rlpopup.views.components.popups.CallerFourView;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpFourView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 *
	 * @author Ondina
	 */
	public class CallerFourMediator extends Mediator
	{
		[Inject]
		public var view:CallerFourView;

		private var searchKeyword:String;

		public function CallerFourMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "CallerThreeMediator registered"));
			eventMap.mapListener(view, SearchEventFour.NEED_DATA_FOUR, handleNeedData);
			eventMap.mapListener(eventDispatcher, SearchEventFour.SELECTED_RESULT_FOUR, handleSelectedResult);
		}

		protected function handleNeedData(event:SearchEventFour):void
		{ // on search4 button click in the CallerFourView
			var searchKeyword:String=event.searchObj4.searchFor;
			if (searchKeyword != null)
			{
				view.searchResult.text="..searching for " + searchKeyword;
				dispatch(new SearchEventFour(SearchEventFour.GET_DATA_FOUR, searchKeyword.toLowerCase()));
			}
			else
			{
				view.searchResult.text="fill in the 'search for' field";
			}
		}

		protected function handleSelectedResult(event:SearchEventFour):void
		{
			view.showData(event.searchObj4.toString());
		}
	}
}