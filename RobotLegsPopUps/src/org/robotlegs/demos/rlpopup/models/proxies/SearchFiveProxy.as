package org.robotlegs.demos.rlpopup.models.proxies
{
	import org.robotlegs.demos.rlpopup.events.SearchEventFive;
	import org.robotlegs.demos.rlpopup.models.PopUpModel;
	import org.robotlegs.mvcs.Actor;

	/**
	 *
	 * @author Ondina
	 */
	public class SearchFiveProxy extends Actor
	{
		
		[Inject]
		public var model:PopUpModel;
		
		public function SearchFiveProxy()
		{
		}
		
		public function dataSearch():void
		{
			var searchFor:String=model.searchFor;
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
			model.searchResult=resultObject.toString();
			dispatch(new SearchEventFive(SearchEventFive.SEARCH_RESULT_FIVE));
		}
	}
}