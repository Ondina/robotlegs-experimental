package org.robotlegs.demos.rlpopup.views.mediators
{
	import org.robotlegs.demos.rlpopup.events.ApplicationEvent;
	import org.robotlegs.demos.rlpopup.events.SearchEventThree;
	import org.robotlegs.demos.rlpopup.events.PopUpEvent;
	import org.robotlegs.demos.rlpopup.views.components.popups.CallerThreeView;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpThreeView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 *
	 * @author Ondina
	 */
	public class CallerThreeMediator extends Mediator
	{
		[Inject]
		public var view:CallerThreeView;

		private var searchKeyword:String;

		public function CallerThreeMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "CallerThreeMediator registered"));
			eventMap.mapListener(view, SearchEventThree.NEED_DATA_THREE, handleNeedData);
			eventMap.mapListener(eventDispatcher, SearchEventThree.SELECTED_RESULT_THREE, handleSelectedResult);
		}

		protected function handleNeedData(event:SearchEventThree):void
		{ // on search3 button click in the CallerThreeView
			var searchKeyword:String=event.searchObj3.searchFor;
			if (searchKeyword != null)
			{
				view.searchResult.text="..searching for " + searchKeyword;
				/*create popup in OpenPopUpCommand
				 *in the OpenPopUpCommand the >>>>searchKeyword<<<<<<
				 *will be passed to the titleWindowInstance
				 *and the PopUpThreeMediator will make the call to the service
				 */
				dispatch(new PopUpEvent(PopUpEvent.OPEN_POPUP, searchKeyword, PopUpThreeView));
			}
			else
			{
				view.searchResult.text="fill in the 'search for' field";
			}
		}

		protected function handleSelectedResult(event:SearchEventThree):void
		{
			view.showData(event.searchObj3.toString());
		}
	}
}