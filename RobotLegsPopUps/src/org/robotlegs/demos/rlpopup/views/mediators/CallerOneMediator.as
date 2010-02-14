package org.robotlegs.demos.rlpopup.views.mediators
{
	import mx.core.IFlexDisplayObject;
	import mx.managers.PopUpManager;

	import org.robotlegs.demos.rlpopup.events.ApplicationEvent;
	import org.robotlegs.demos.rlpopup.events.SearchEventOne;
	import org.robotlegs.demos.rlpopup.views.components.popups.CallerOneView;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpOneView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 *
	 * @author Ondina
	 */
	public class CallerOneMediator extends Mediator
	{
		[Inject]
		public var view:CallerOneView;

		private var titleWindow:IFlexDisplayObject;
		private var sResult:String;

		public function CallerOneMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "CallerOneMediator registered"));
			eventMap.mapListener(view, SearchEventOne.NEED_DATA, handleNeedData);
			eventMap.mapListener(eventDispatcher, SearchEventOne.SEARCH_RESULT, handleSearchResult);
		}

		protected function handleNeedData(event:SearchEventOne):void
		{
			var searchKeyword:String=event.searchObj.searchFor;
			if (searchKeyword != null)
			{
				/*SearchDataCommandOne has been mapped to the SearchEventOne in PrepControllerCommand
				 *commandMap.mapEvent(SearchEventOne.GET_DATA, SearchDataCommandOne, SearchEventOne);
				 *SearchCommand will call a method on SearchOneProxy
				 */
				view.searchResult.text="..searching for " + searchKeyword;
				dispatch(new SearchEventOne(SearchEventOne.GET_DATA, searchKeyword.toLowerCase()));
			}
			else
			{
				view.searchResult.text="fill in the 'search for' field";
			}

		}

		protected function handleSearchResult(event:SearchEventOne):void
		{
			//remote data from proxy
			sResult=event.searchObj as String;

			//modal TitleWindow creation 
			titleWindow=PopUpManager.createPopUp(this.contextView, PopUpOneView, true);
			titleWindow.x=view.width / 4;
			titleWindow.y=view.height;

			//event dispatched after the PopUp has been created
			eventMap.mapListener(titleWindow.parent, ApplicationEvent.MAP_MEDIATOR, handleMapMediator);
			//event dispatched when an Item is selected (in a DataGrid)
			eventMap.mapListener(titleWindow, SearchEventOne.SELECTED_RESULT, handleSelectedResult);
		}

		protected function handleMapMediator(event:ApplicationEvent):void
		{
			//the PopUp's Mediator is created after onCreationComplete of the PopUpOneView 
			mediatorMap.createMediator(titleWindow);
			//tell the PopUpViewMediator to populate the ResultsView with the remote data
			dispatch(new SearchEventOne(SearchEventOne.SHOW_RESULT, sResult));
		}

		protected function handleSelectedResult(event:SearchEventOne):void
		{
			//SearchEvent.SELECTED_RESULT is dispatched from the TitleWindows' child view:ResultsView
			//selecting an Item in the ResultsView (a DataGrid for example) will populate the CallerView with the selected data
			sResult=event.searchObj as String;
			view.showData(sResult);
			//and remove the popup
			PopUpManager.removePopUp(titleWindow);
		}
	}
}