package org.robotlegs.demos.rlpopup.events
{
	import flash.events.Event;
	/**
	 *
	 * @author Ondina
	 */
	public class SearchEventFour extends Event
	{

		public static const SEARCH_RESULT_FOUR:String="searchResultFour";
		public static const SHOW_RESULT_FOUR:String="showResultFour";
		public static const SELECTED_RESULT_FOUR:String="selectedResultFour";
		public static const NEED_DATA_FOUR:String="needDataFour";
		public static const GET_DATA_FOUR:String="getDataFour";

		public var searchObj4:Object;

		public function SearchEventFour(type:String, searchObj4:Object=null)
		{
			this.searchObj4=searchObj4;
			super(type);
		}
	}
}