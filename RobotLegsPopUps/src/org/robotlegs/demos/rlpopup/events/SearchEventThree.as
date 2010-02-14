package org.robotlegs.demos.rlpopup.events
{
	import flash.events.Event;
	/**
	 *
	 * @author Ondina
	 */
	public class SearchEventThree extends Event
	{

		public static const SEARCH_RESULT_THREE:String="searchResultThree";
		public static const SHOW_RESULT_THREE:String="showResultThree";
		public static const SELECTED_RESULT_THREE:String="selectedResultThree";
		public static const NEED_DATA_THREE:String="needDataThree";
		public static const GET_DATA_THREE:String="ThreeGetData";

		public var searchObj3:Object;

		public function SearchEventThree(type:String, searchObj3:Object=null)
		{
			this.searchObj3=searchObj3;
			super(type);
		}
	}
}