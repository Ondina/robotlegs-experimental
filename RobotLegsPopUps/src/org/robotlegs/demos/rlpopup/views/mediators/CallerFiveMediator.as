package org.robotlegs.demos.rlpopup.views.mediators
{
	import org.robotlegs.core.IReflector;
	import org.robotlegs.demos.rlpopup.events.ApplicationEvent;
	import org.robotlegs.demos.rlpopup.events.PopUpEvent;
	import org.robotlegs.demos.rlpopup.events.SearchEventFive;
	import org.robotlegs.demos.rlpopup.models.PopUpModel;
	import org.robotlegs.demos.rlpopup.views.components.popups.CallerFiveView;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpFiveView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 *
	 * @author Ondina
	 */
	public class CallerFiveMediator extends Mediator
	{
		[Inject]
		public var view:CallerFiveView;

		[Inject]
		public var reflector:IReflector;

		[Inject]
		public var model:PopUpModel;

		private var searchKeyword:String;

		public function CallerFiveMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "CallerFiveMediator registered"));
			eventMap.mapListener(view, SearchEventFive.NEED_DATA_FIVE, handleNeedData);
			eventMap.mapListener(eventDispatcher, SearchEventFive.SELECTED_RESULT_FIVE, handleSelectedResult);

		}

		protected function handleNeedData(event:SearchEventFive):void
		{ // on search5 button click in the CallerFiveView
			//var className:String=reflector.getFQCN(PopUpFiveView);
			var searchKeyword:String=event.searchObj5.searchFor;
			model._searchFor=searchKeyword;
			if (searchKeyword != null)
			{
				view.searchResult.text="..searching for " + searchKeyword;
				dispatch(new PopUpEvent(PopUpEvent.OPEN_POPUP, "", PopUpFiveView));
			}
			else
			{
				view.searchResult.text="fill in the 'search for' field";
			}
		}

		protected function handleSelectedResult(event:SearchEventFive):void
		{
			view.showData(event.searchObj5.toString());
		}
	}
}