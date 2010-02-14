package org.robotlegs.demos.rlpopup.views.mediators
{
	import flash.events.MouseEvent;
	import org.robotlegs.demos.rlpopup.events.ApplicationEvent;
	import org.robotlegs.demos.rlpopup.events.PopUpEvent;
	import org.robotlegs.demos.rlpopup.events.SearchEventThree;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpThreeView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 *
	 * @author Ondina
	 */
	public class PopUpThreeMediator extends Mediator
	{
		[Inject]
		public var view:PopUpThreeView;

		public function PopUpThreeMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "PopUpThreeMediator registered"));
			eventMap.mapListener(eventDispatcher, SearchEventThree.SEARCH_RESULT_THREE, handleSearchResult);
			eventMap.mapListener(view, SearchEventThree.SELECTED_RESULT_THREE, handleSelectedResult);
			eventMap.mapListener(view, PopUpEvent.CLOSE_POPUP, handleClosePopup);
			eventMap.mapListener(view.nextPage, MouseEvent.CLICK, handleNeedData);
			handleNeedData();
		}

		protected function handleNeedData(event:MouseEvent=null):void
		{
			/* the searchKeyword has been passed to the PopUpThreeView in the OpenPopUpCommand
			 * SearchDataCommandThree has been mapped to the SearchEventTwo in PrepControllerCommand
			 *commandMap.mapEvent(SearchEventThree.GETDATATHREE, SearchDataCommandThree, SearchEventThree);
			 *SearchDataCommandThree will call a method on SearchThreeProxy
			 */
			var searchKeyword:String=view.popupData.toLowerCase();
			dispatch(new SearchEventThree(SearchEventThree.GET_DATA_THREE, searchKeyword));
		}

		protected function handleSearchResult(event:SearchEventThree):void
		{
			var sResult:String=event.searchObj3 as String;
			view.showResults(sResult);
		}

		protected function handleClosePopup(event:PopUpEvent):void
		{
			removeMediator();
		}

		protected function handleSelectedResult(event:SearchEventThree):void
		{
			dispatch(new SearchEventThree(SearchEventThree.SELECTED_RESULT_THREE, event.searchObj3.toString()));
			removeMediator();
		}

		protected function removeMediator():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "PopUpThreeMediator removed"));
			mediatorMap.removeMediator(this);
		}
	}
}