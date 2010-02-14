package org.robotlegs.demos.rlpopup.controllers.commands.search
{
	import org.robotlegs.demos.rlpopup.events.SearchEventFive;
	import org.robotlegs.demos.rlpopup.models.proxies.SearchFiveProxy;
	import org.robotlegs.mvcs.Command;

	/**
	 *
	 * @author Ondina
	 */
	public class SearchDataCommandFive extends Command
	{
		[Inject]
		public var event:SearchEventFive;

		[Inject]
		public var searchProxyFive:SearchFiveProxy;

		override public function execute():void
		{
			searchProxyFive.dataSearch();
		}
	}
}