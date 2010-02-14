package org.robotlegs.demos.rlpopup.models.proxies
{
	import org.robotlegs.demos.rlpopup.events.PopUpEvent;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpFourView;
	import org.robotlegs.mvcs.Actor;

	/**
	 *
	 * @author Ondina
	 */
	public class SearchFourProxy extends Actor
	{
		public function SearchFourProxy()
		{
		}

		public function dataSearch(searchFor:String):void
		{
			var resultObject:Object=new Object();
			if (searchFor == "rl")
			{
				resultObject="search string was:\"" + searchFor + "\"; found: !!!!!!!!!!";
			}
			else if (searchFor == "next page")
			{
				resultObject="found: nextpage server results";
			}
			else
			{
				resultObject="no results for " + searchFor;
			}
			//create popup in OpenPopUpCommand with resultObject
			dispatch(new PopUpEvent(PopUpEvent.OPEN_POPUP, resultObject, PopUpFourView));
		}
	}
}