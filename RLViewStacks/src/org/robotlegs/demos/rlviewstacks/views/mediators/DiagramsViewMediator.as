package org.robotlegs.demos.rlviewstacks.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.rlviewstacks.events.ApplicationEvent;
	import org.robotlegs.demos.rlviewstacks.views.components.diagrams.DiagramsView;

	public class DiagramsViewMediator extends Mediator
	{
		[Inject]
		public var view:DiagramsView;

		public function DiagramsViewMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			view.diagramsText.text="diagrams, schemes, doodles";
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "DiagramsViewMediator registered"));
		}
	}
}