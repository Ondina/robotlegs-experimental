package org.robotlegs.demos.rlpopup.controllers.commands.startup
{
	//import org.robotlegs.demos.rlpopup.views.components.MainView;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpOneView;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpTwoView;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpThreeView;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpFourView;
	import org.robotlegs.demos.rlpopup.views.components.popups.PopUpFiveView;
	import org.robotlegs.demos.rlpopup.views.components.popups.CallerOneView;
	import org.robotlegs.demos.rlpopup.views.components.popups.CallerTwoView;
	import org.robotlegs.demos.rlpopup.views.components.popups.CallerThreeView;
	import org.robotlegs.demos.rlpopup.views.components.popups.CallerFourView;
	import org.robotlegs.demos.rlpopup.views.components.popups.CallerFiveView;

	import org.robotlegs.demos.rlpopup.views.mediators.RLJustPopMediator;
	import org.robotlegs.demos.rlpopup.views.mediators.MainViewMediator;
	import org.robotlegs.demos.rlpopup.views.mediators.PopUpOneMediator;
	import org.robotlegs.demos.rlpopup.views.mediators.PopUpTwoMediator;
	import org.robotlegs.demos.rlpopup.views.mediators.PopUpThreeMediator;
	import org.robotlegs.demos.rlpopup.views.mediators.PopUpFourMediator;
	import org.robotlegs.demos.rlpopup.views.mediators.PopUpFiveMediator;
	import org.robotlegs.demos.rlpopup.views.mediators.CallerOneMediator;
	import org.robotlegs.demos.rlpopup.views.mediators.CallerTwoMediator;
	import org.robotlegs.demos.rlpopup.views.mediators.CallerThreeMediator;
	import org.robotlegs.demos.rlpopup.views.mediators.CallerFourMediator;
	import org.robotlegs.demos.rlpopup.views.mediators.CallerFiveMediator;
	import org.robotlegs.mvcs.Command;
	/**
	 *
	 * @author Ondina
	 */
	public class PrepViewCommand extends Command
	{
		private var poppy:PopUpOneView;

		override public function execute():void
		{
			mediatorMap.mapView(RLJustPop, RLJustPopMediator); //application mediator
			//	mediatorMap.mapView(MainView, MainViewMediator);
			mediatorMap.mapView(CallerOneView, CallerOneMediator);
			mediatorMap.mapView(CallerTwoView, CallerTwoMediator);
			mediatorMap.mapView(CallerThreeView, CallerThreeMediator);
			mediatorMap.mapView(CallerFourView, CallerFourMediator);
			mediatorMap.mapView(CallerFiveView, CallerFiveMediator);
			mediatorMap.mapView(PopUpOneView, PopUpOneMediator);
			mediatorMap.mapView(PopUpTwoView, PopUpTwoMediator);
			mediatorMap.mapView(PopUpThreeView, PopUpThreeMediator);
			mediatorMap.mapView(PopUpFourView, PopUpFourMediator);
			mediatorMap.mapView(PopUpFiveView, PopUpFiveMediator);
		}
	}
}