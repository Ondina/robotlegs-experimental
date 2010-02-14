package org.robotlegs.demos.rlpopup.controllers.commands.search
{
	import org.robotlegs.demos.rlpopup.events.SearchEventTwo;
	import org.robotlegs.demos.rlpopup.models.proxies.SearchTwoProxy;
	import org.robotlegs.mvcs.Command;
	/**
	 *
	 * @author Ondina
	 */
	public class SearchDataCommandTwo extends Command
	{
		[Inject]
		public var event:SearchEventTwo;
		
		[Inject]
		public var searchProxy:SearchTwoProxy;

		override public function execute():void
		{
			var searchFor:Object=this.event.searchObj2;
			if(searchFor!=null)
			searchProxy.dataSearch(searchFor.toString());
		}
	}
}