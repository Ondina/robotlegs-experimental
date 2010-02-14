package org.robotlegs.demos.rlviewstacks.controllers.commands.startup
{
	import org.robotlegs.demos.rlviewstacks.views.components.*;
	import org.robotlegs.demos.rlviewstacks.views.components.diagrams.DiagramsView;
	import org.robotlegs.demos.rlviewstacks.views.components.faqs.FaqView;
	import org.robotlegs.demos.rlviewstacks.views.components.issues.IssuesView;
	import org.robotlegs.demos.rlviewstacks.views.components.prolog.PrologView;
	import org.robotlegs.demos.rlviewstacks.views.mediators.*;
	import org.robotlegs.mvcs.Command;

	public class PrepViewCommand extends Command
	{
		override public function execute():void
		{
			mediatorMap.mapView(RLViewStacks, RLViewStacksMediator);
			//	mediatorMap.createMediator(contextView); //application mediator's creation not needed anymore
			//
			mediatorMap.mapView(IntroView, IntroViewMediator);
			mediatorMap.mapView(TheLegs, TheLegsMediator);
			mediatorMap.mapView(LoginView, LoginViewMediator);
			//
			mediatorMap.mapView(MainView, MainViewMediator);
			mediatorMap.mapView(TheBrain, TheBrainMediator);
			mediatorMap.mapView(PrologView, PrologViewMediator);
			mediatorMap.mapView(DiagramsView, DiagramsViewMediator);
			mediatorMap.mapView(FaqView, FaqViewMediator);
			mediatorMap.mapView(IssuesView, IssuesViewMediator);
		}
	}
}