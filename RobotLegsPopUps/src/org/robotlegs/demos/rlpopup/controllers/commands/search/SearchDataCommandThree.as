package org.robotlegs.demos.rlpopup.controllers.commands.search
{
	import org.robotlegs.demos.rlpopup.events.SearchEventThree;
	import org.robotlegs.demos.rlpopup.models.proxies.SearchThreeProxy;
	import org.robotlegs.mvcs.Command;
	/**
	 *
	 * @author Ondina
	 */
	public class SearchDataCommandThree extends Command
	{
		[Inject]
		public var event:SearchEventThree;
		
		[Inject]
		public var searchProxyThree:SearchThreeProxy;

		override public function execute():void
		{
			var searchFor:Object=this.event.searchObj3;
			if(searchFor!=null)
				searchProxyThree.dataSearch(searchFor.toString());
		}
	}
}