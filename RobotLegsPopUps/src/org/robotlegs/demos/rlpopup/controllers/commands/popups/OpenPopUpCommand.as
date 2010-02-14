package org.robotlegs.demos.rlpopup.controllers.commands.popups
{
	import mx.managers.PopUpManager;

	import org.robotlegs.demos.rlpopup.events.PopUpEvent;
	import org.robotlegs.mvcs.Command;

	/**
	 *
	 * @author Ondina
	 */
	public class OpenPopUpCommand extends Command
	{
		[Inject]
		public var event:PopUpEvent;

		override public function execute():void
		{
			//event.popUpClass is the PopUp Component as Class
			//I don't know how to make titleWindowInstance strongly typed, 
			//when the Class is passed dynamically like in here????
			//popUpObj is the result coming from Proxy(via Mediator) in case the PopUpTwoView has to be created
			//popUpObj is the searchKeyword in case the PopUpThreeView is needed
			//popUpObj is the result coming direct from Proxy in case the PopUpFourView has to be created
			var clazz:Class=event.popUpClass;
			var titleWindowInstance:*=clazz(PopUpManager.createPopUp(this.contextView, clazz, false));
			PopUpManager.centerPopUp(titleWindowInstance);
			titleWindowInstance.title="Title Window " + event.popUpClass;
			titleWindowInstance.popupData=event.popUpObj.toString();
			mediatorMap.createMediator(titleWindowInstance);
		}
	}
}