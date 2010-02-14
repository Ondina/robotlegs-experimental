package org.robotlegs.demos.rlpopup.events
{
	import flash.events.Event;
	/**
	 *
	 * @author Ondina
	 */
	public class SearchEventOne extends Event
	{
		
		public static const SEARCH_RESULT:String="searchResult";
		public static const SHOW_RESULT:String="showResult";
		public static const SELECTED_RESULT:String="selectedResult";
		public static const NEED_DATA:String="needData";
		public static const GET_DATA:String="getData";
		
		public var searchObj:Object;
		
		public function SearchEventOne(type:String, searchObj:Object=null, searchProxy:Class=null)
		{
			this.searchObj=searchObj;
			super(type);
		}
	}
}