package org.robotlegs.demos.rlpopup.models
{
	import org.robotlegs.demos.rlpopup.events.SearchEventFive;
	
	import org.robotlegs.mvcs.Actor;	
	public class PopUpModel extends Actor
	{
		public var _searchFor:String;
		public var _searchResult:String;
		
		public function PopUpModel()
		{
			super();
		}
		
		public function set searchResult(val:String):void
		{
			_searchResult = val;
		}
		
		public function get searchResult():String
		{
			return _searchResult;
		}
		public function set searchFor(val:String):void
		{
			_searchFor = val;
		}
		
		public function get searchFor():String
		{
			return _searchFor;
		}
	}
}