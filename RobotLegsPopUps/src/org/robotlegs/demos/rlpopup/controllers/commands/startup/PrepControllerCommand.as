package org.robotlegs.demos.rlpopup.controllers.commands.startup
{
	import org.robotlegs.demos.rlpopup.controllers.commands.popups.*;
	import org.robotlegs.demos.rlpopup.controllers.commands.search.*;
	import org.robotlegs.demos.rlpopup.events.PopUpEvent;
	import org.robotlegs.demos.rlpopup.events.SearchEventOne;
	import org.robotlegs.demos.rlpopup.events.SearchEventTwo;
	import org.robotlegs.demos.rlpopup.events.SearchEventThree;
	import org.robotlegs.demos.rlpopup.events.SearchEventFour;
	import org.robotlegs.demos.rlpopup.events.SearchEventFive;
	import org.robotlegs.mvcs.Command;
	/**
	 *
	 * @author Ondina
	 */
	public class PrepControllerCommand extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent(PopUpEvent.OPEN_POPUP, OpenPopUpCommand, PopUpEvent);
			commandMap.mapEvent(SearchEventOne.GET_DATA, SearchDataCommandOne, SearchEventOne);
			commandMap.mapEvent(SearchEventTwo.GET_DATA_TWO, SearchDataCommandTwo, SearchEventTwo);
			commandMap.mapEvent(SearchEventThree.GET_DATA_THREE, SearchDataCommandThree, SearchEventThree);
			commandMap.mapEvent(SearchEventFour.GET_DATA_FOUR, SearchDataCommandFour, SearchEventFour);
			commandMap.mapEvent(SearchEventFive.GET_DATA_FIVE, SearchDataCommandFive, SearchEventFive);
		}
	}
}