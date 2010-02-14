package org.robotlegs.demos.rlviewstacks.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.rlviewstacks.events.ApplicationEvent;
	import org.robotlegs.demos.rlviewstacks.views.components.faqs.FaqView;

	public class FaqViewMediator extends Mediator
	{
		[Inject]
		public var view:FaqView;

		public function FaqViewMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			view.faqText.text="tons of questions, some answers";
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "FaqViewMediator registered"));
		}
	}
}