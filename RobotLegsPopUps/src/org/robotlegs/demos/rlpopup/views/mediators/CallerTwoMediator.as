package org.robotlegs.demos.rlpopup.views.mediators
{
	import org.robotlegs.demos.rlpopup.events.ApplicationEvent;
	import org.robotlegs.demos.rlpopup.events.PopUpEvent;
	import org.robotlegs.demos.rlpopup.events.SearchEventTwo;
	import org.robotlegs.demos.rlpopup.views.components.popups.CallerTwoView;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpTwoView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 *
	 * @author Ondina
	 */
	public class CallerTwoMediator extends Mediator
	{
		[Inject]
		public var view:CallerTwoView;

		public function CallerTwoMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "CallerTwoMediator registered"));
			eventMap.mapListener(view, SearchEventTwo.NEED_DATA_TWO, handleNeedData);
			eventMap.mapListener(eventDispatcher, SearchEventTwo.SEARCH_RESULT_TWO, handleSearchResult);
			eventMap.mapListener(eventDispatcher, SearchEventTwo.SELECTED_RESULT_TWO, handleSelectedResult);
		}

		protected function handleNeedData(event:SearchEventTwo):void
		{ // on search2 button click in the CallerTwoView
			var searchKeyword:String=event.searchObj2.searchFor;
			if (searchKeyword != null)
			{
				view.searchResult.text="..searching for " + searchKeyword;
				/*SearchDataCommandTwo has been mapped to the SearchEventTwo in PrepControllerCommand
				 *commandMap.mapEvent(SearchEventTwo.GET_DATATWO, SearchDataCommandTwo, SearchEventTwo);
				 *SearchDataCommandTwo will call a method on SearchTwoProxy
				 */
				dispatch(new SearchEventTwo(SearchEventTwo.GET_DATA_TWO, searchKeyword.toLowerCase()));
			}
			else
			{
				view.searchResult.text="fill in the 'search for' field";
			}
		}

		protected function handleSearchResult(event:SearchEventTwo):void
		{ //results from proxy
			var sResult:String=event.searchObj2 as String;
			if (sResult != "")
			{
				/*create popup in OpenPopUpCommand
				 *in the OpenPopUpCommand the >>>>sResult<<<<< comming from Proxy
				 *will be passed to the titleWindowInstance
				 */
				dispatch(new PopUpEvent(PopUpEvent.OPEN_POPUP, sResult, PopUpTwoView));
			}
		}

		protected function handleSelectedResult(event:SearchEventTwo):void
		{ //on selecting an item in a PopUp's DataGrid , for example
			view.showData(event.searchObj2.toString());
		}
	}
}