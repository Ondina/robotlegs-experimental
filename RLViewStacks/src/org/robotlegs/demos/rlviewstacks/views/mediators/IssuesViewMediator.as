package org.robotlegs.demos.rlviewstacks.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.rlviewstacks.events.ApplicationEvent;
	import org.robotlegs.demos.rlviewstacks.views.components.issues.IssuesView;

	public class IssuesViewMediator extends Mediator
	{
		[Inject]
		public var view:IssuesView;

		public function IssuesViewMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			view.issuesText.text="issues with the framework, issues with FlashBuilder";
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "IssuesViewMediator having some issues"));
		}
	}
}