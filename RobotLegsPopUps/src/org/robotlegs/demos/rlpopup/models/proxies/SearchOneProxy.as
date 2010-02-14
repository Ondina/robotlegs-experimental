package org.robotlegs.demos.rlpopup.models.proxies
{
	import org.robotlegs.demos.rlpopup.events.SearchEventOne;
	import org.robotlegs.mvcs.Actor;

	/**
	 *
	 * @author Ondina
	 */
	public class SearchOneProxy extends Actor
	{
		public function SearchOneProxy()
		{
		}
		
		public function dataSearch(searchFor:String):void
		{
			//Don't laugh!! It's not funny. A real remote call will be added sometime in the future
			var resultObject:Object=new Object();
			if (searchFor == "rl")
			{
				resultObject="search string was:\"" + searchFor + "\"; found: RobotLegs";
			}
			else
			{
				resultObject="no results for " + searchFor;

			}
			dispatch(new SearchEventOne(SearchEventOne.SEARCH_RESULT, resultObject));
			resultObject=null;
		}
	}
}