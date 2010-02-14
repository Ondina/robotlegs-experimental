package org.robotlegs.demos.rlpopup.controllers.commands.search
{
	import org.robotlegs.demos.rlpopup.events.SearchEventOne;
	import org.robotlegs.demos.rlpopup.models.proxies.SearchOneProxy;
	import org.robotlegs.mvcs.Command;
	/**
	 *
	 * @author Ondina
	 */
	public class SearchDataCommandOne extends Command
	{
		[Inject]
		public var event:SearchEventOne;
		
		[Inject]
		public var searchProxy:SearchOneProxy;

		override public function execute():void
		{
			// SearchEvent.GET_DATA from CallerMediator
			var searchFor:Object=this.event.searchObj;
			if(searchFor!=null)
			searchProxy.dataSearch(searchFor.toString());
		}
	}
}