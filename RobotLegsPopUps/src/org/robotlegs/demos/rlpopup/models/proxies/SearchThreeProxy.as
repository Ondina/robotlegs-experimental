package org.robotlegs.demos.rlpopup.models.proxies
{
	import org.robotlegs.demos.rlpopup.events.SearchEventThree;
	import org.robotlegs.mvcs.Actor;

	/**
	 *
	 * @author Ondina
	 */
	public class SearchThreeProxy extends Actor
	{
		public function SearchThreeProxy()
		{
		}

		public function dataSearch(searchFor:String):void
		{
			var resultObject:Object=new Object();
			if (searchFor == "rl")
			{
				resultObject="search string was:\"" + searchFor + "\"; found: Real Life";
			}
			else if (searchFor == "next page")
			{
				resultObject="found: nextpage server results";
			}
			else
			{
				resultObject="no results for " + searchFor;
			}
			dispatch(new SearchEventThree(SearchEventThree.SEARCH_RESULT_THREE, resultObject));
			resultObject=null;
		}
	}
}