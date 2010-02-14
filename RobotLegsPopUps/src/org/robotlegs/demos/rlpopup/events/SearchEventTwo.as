package org.robotlegs.demos.rlpopup.events
{
	import flash.events.Event;
	/**
	 *
	 * @author Ondina
	 */
	public class SearchEventTwo extends Event
	{
		
		public static const SEARCH_RESULT_TWO:String="searchResultTwo";
		public static const SHOW_RESULT_TWO:String="showResultTwo";
		public static const SELECTED_RESULT_TWO:String="selectedResultTwo";
		public static const NEED_DATA_TWO:String="needDataTwo";
		public static const GET_DATA_TWO:String="getDataTwo";
		
		public var searchObj2:Object;
		public function SearchEventTwo(type:String, searchObj2:Object=null)
		{
			this.searchObj2=searchObj2;
			super(type);
		}
	}
}