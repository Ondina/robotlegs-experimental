package org.robotlegs.demos.rlpopup.events
{
	import flash.events.Event;
	/**
	 *
	 * @author Ondina
	 */
	public class SearchEventFive extends Event
	{

		public static const SEARCH_RESULT_FIVE:String="searchResultFive";
		public static const SHOW_RESULT_FIVE:String="showResultFive";
		public static const SELECTED_RESULT_FIVE:String="selectedResultFive";
		public static const NEED_DATA_FIVE:String="needDataFive";
		public static const GET_DATA_FIVE:String="getDataFive";

		public var searchObj5:Object;

		public function SearchEventFive(type:String, searchObj5:Object=null )
		{
			this.searchObj5=searchObj5;
			super(type);
		}
	}
}