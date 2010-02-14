package org.robotlegs.demos.rlpopup.controllers.commands.startup
{
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.demos.rlpopup.models.proxies.SearchOneProxy;
	import org.robotlegs.demos.rlpopup.models.proxies.SearchTwoProxy;
	import org.robotlegs.demos.rlpopup.models.proxies.SearchThreeProxy;
	import org.robotlegs.demos.rlpopup.models.proxies.SearchFourProxy;
	import org.robotlegs.demos.rlpopup.models.proxies.SearchFiveProxy;
	import org.robotlegs.demos.rlpopup.models.PopUpModel;
	/**
	 *
	 * @author Ondina
	 */
	public class PrepModelCommand extends Command
	{
		override public function execute():void
		{
			injector.mapSingleton(SearchOneProxy);
			injector.mapSingleton(SearchTwoProxy);
			injector.mapSingleton(SearchThreeProxy);
			injector.mapSingleton(SearchFourProxy);
			injector.mapSingleton(SearchFiveProxy);
			injector.mapSingleton(PopUpModel);
		}
	}
}