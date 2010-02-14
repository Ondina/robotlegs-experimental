package org.robotlegs.demos.rlpopup.controllers.commands.search
{
	import org.robotlegs.demos.rlpopup.events.SearchEventFour;
	import org.robotlegs.demos.rlpopup.models.proxies.SearchFourProxy;
	import org.robotlegs.mvcs.Command;
	/**
	 *
	 * @author Ondina
	 */
	public class SearchDataCommandFour extends Command
	{
		[Inject]
		public var event:SearchEventFour;
		
		[Inject]
		public var searchProxyThree:SearchFourProxy;

		override public function execute():void
		{
			var searchFor:Object=this.event.searchObj4;
			if(searchFor!=null)
				searchProxyThree.dataSearch(searchFor.toString());
		}
	}
}