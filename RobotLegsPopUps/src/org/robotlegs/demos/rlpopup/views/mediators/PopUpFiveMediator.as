package org.robotlegs.demos.rlpopup.views.mediators
{
	import flash.events.MouseEvent;

	import org.robotlegs.demos.rlpopup.events.ApplicationEvent;
	import org.robotlegs.demos.rlpopup.events.PopUpEvent;
	import org.robotlegs.demos.rlpopup.events.SearchEventFive;
	import org.robotlegs.demos.rlpopup.models.PopUpModel;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpFiveView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 *
	 * @author Ondina
	 */
	public class PopUpFiveMediator extends Mediator
	{
		[Inject]
		public var view:PopUpFiveView;

		[Inject]
		public var model:PopUpModel;

		public function PopUpFiveMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "PopUpFiveMediator registered"));
			eventMap.mapListener(eventDispatcher, SearchEventFive.SEARCH_RESULT_FIVE, handleSearchResult);
			eventMap.mapListener(view, SearchEventFive.SELECTED_RESULT_FIVE, handleSelectedResult);
			eventMap.mapListener(view, PopUpEvent.CLOSE_POPUP, handleClosePopup);
			eventMap.mapListener(view.nextPage, MouseEvent.CLICK, handleNeedData);
			handleNeedData();
		}

		protected function handleNeedData(event:MouseEvent=null):void
		{
			if (view.popupData == "next page")
			{
				model.searchFor=view.popupData;
			}
			dispatch(new SearchEventFive(SearchEventFive.GET_DATA_FIVE));
		}

		protected function handleSearchResult(event:SearchEventFive):void
		{
			var sResult:String=event.searchObj5 as String;
			sResult=model.searchResult;
			view.showResults(sResult);
		}

		protected function handleClosePopup(event:PopUpEvent):void
		{
			removeMediator();
		}

		protected function handleSelectedResult(event:SearchEventFive):void
		{
			dispatch(new SearchEventFive(SearchEventFive.SELECTED_RESULT_FIVE, event.searchObj5.toString()));
			removeMediator();
		}

		protected function removeMediator():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "PopUpFiveMediator removed"));
			mediatorMap.removeMediator(this);
		}
	}
}