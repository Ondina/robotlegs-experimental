package org.robotlegs.demos.rlviewstacks.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.rlviewstacks.events.ApplicationEvent;
	import org.robotlegs.demos.rlviewstacks.events.BrainEvent;
	import org.robotlegs.demos.rlviewstacks.views.components.TheBrain;

	public class TheBrainMediator extends Mediator
	{
		[Inject]
		public var view:TheBrain;

		public function TheBrainMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			eventMap.mapListener(view, BrainEvent.BRAIN_ACTION, handleBrainAction);
		}

		protected function handleBrainAction(event:BrainEvent):void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "TheBrainMediator reporting: " + event.brainObj));
		}
	}
}