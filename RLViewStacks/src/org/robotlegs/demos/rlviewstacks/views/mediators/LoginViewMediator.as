package org.robotlegs.demos.rlviewstacks.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.rlviewstacks.events.LoginEvent;
	import org.robotlegs.demos.rlviewstacks.events.ApplicationEvent;
	import org.robotlegs.demos.rlviewstacks.views.components.LoginView;

	import org.robotlegs.demos.rlviewstacks.models.vo.LoginVO;

	public class LoginViewMediator extends Mediator
	{
		[Inject]
		public var view:LoginView;

		public function LoginViewMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			eventMap.mapListener(view, LoginEvent.TRY_LOGIN, login);
			dispatch(new ApplicationEvent(ApplicationEvent.LOGG_MESSAGE, "LoginViewMediator registered"));
		}

		protected function login(event:LoginEvent):void
		{
			/*var loginVO:LoginVO=new LoginVO();
			loginVO.user_name=view.user_name.text;
			loginVO.user_password=view.user_password.text;*/

			if (view.user_name.text == "rl")
				loggedin();
		}

		protected function loggedin():void
		{
			dispatch(new ApplicationEvent(ApplicationEvent.CHANGE_MAINVIEW_STATE, "main"));
		}
	}
}