package org.robotlegs.demos.rlpopup.models.proxies
{
	import org.robotlegs.demos.rlpopup.events.SearchEventTwo;
	import org.robotlegs.mvcs.Actor;

	/**
	 *
	 * @author Ondina
	 */
	public class SearchTwoProxy extends Actor
	{
		public function SearchTwoProxy()
		{
		}
		
		public function dataSearch(searchFor:String):void
		{
			var resultObject:Object=new Object();
			if (searchFor == "rl")
			{
				resultObject="search string was:\"" + searchFor + "\"; found: Reckless Life";
			}
			else
			{
				resultObject="no results for "+searchFor;
				
			}
			dispatch(new SearchEventTwo(SearchEventTwo.SEARCH_RESULT_TWO, resultObject));
			resultObject=null;
		}
	}
}