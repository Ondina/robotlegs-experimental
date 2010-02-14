package org.robotlegs.demos.rlpopup.views.validators
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.registerClassAlias;
	import flash.utils.describeType;
	import flash.utils.Dictionary;
	import mx.utils.StringUtil;
	import mx.events.ValidationResultEvent;
	/**
	 *
	 * @author Ondina
	 */
	public class FormChecker
	{
		private var vResult:ValidationResultEvent;
		private var viewsVO:*;
		private var view:Object;
		private var chainText:Dictionary;
		public var requiredFieldsArray:Array=new Array();
		private var actualDate:Date=new Date();
		
		public function FormChecker(viewComp:Object)
		{
			view=viewComp;
			viewsVO=view.viewsVO;
			chainText=view.chainText;
		}
		
		/******************************************/
		public function getFormVO(clazz:Class):void
		{
			var typeInfo:XML=describeType(clazz);
			var fullyQualifiedName:String=typeInfo.@name.toString().replace(/::/, ".");
			registerClassAlias(fullyQualifiedName, clazz);
			var item:String;
			for each (var v:XML in typeInfo..accessor)
			{
				if (v.@name.toString() != "prototype" && v.@name.toString() != "cloneChild")
				{
					item=v.@name.toString();
					if (view[item] != null)
					{
						if (view[item].hasOwnProperty("text") && view[item].text != "")
						{
							view.viewsVO[item]=view[item].text;
						}
						else if (view[item].hasOwnProperty("selectedValue"))
						{
							if (view[item].hasOwnProperty("selection") && view[item].selection != null)
							{
								view.viewsVO[item]=view[item].selectedValue.toString();
							}
							else
							{
								if (view[item].selectedValue != null)
									view.viewsVO[item]=view[item].selectedItem.toString();
							}
						}
						else if (view[item].hasOwnProperty("value"))
						{
							view.viewsVO[item]=view[item].value;
						}
					}
				}
			}
			viewsVO=view.viewsVO;
		}
		
		public function writeFormFromVO(clazz:Class):void
		{
			var typeInfo:XML=describeType(clazz);
			var fullyQualifiedName:String=typeInfo.@name.toString().replace(/::/, ".");
			registerClassAlias(fullyQualifiedName, clazz);
			var item:String;
			for each (var v:XML in typeInfo..accessor)
			{
				if (v.@name.toString() != "prototype")
				{
					item=v.@name.toString();
					
					if (view[item] != null)
					{
						if (view[item].hasOwnProperty("text"))
						{
							view[item].text=view.viewsVO[item];
						}
						else if (view[item].hasOwnProperty("selectedValue"))
						{
							if (view[item].hasOwnProperty("selection"))
							{
								view[item].selectedValue=view.viewsVO[item];
							}
							else
							{
								view[item].selectedItem.label=view.viewsVO[item];
							}
						}
						else if (view[item].hasOwnProperty("value"))
						{
							view[item].value=view.viewsVO[item];
						}
						else if (view[item].hasOwnProperty("selected"))
						{
							view[item].selected=view.viewsVO[item];
						}
					}
				}
			}
		}
		
		public function checkRequired(requiredArray:Array):Boolean
		{
			var validresult:Number=0;
			var item:Object;
			var req:String;
			requiredFieldsArray=[];
			for (var i:uint=0; i < requiredArray.length; i++)
			{
				req=requiredArray[i];
				item=view[req];
				view.requiredValidator.source=item;
				if (item.hasOwnProperty("selectedValue") && item.hasOwnProperty("selection"))
				{
					var wrapper:Object=item.getRadioButtonAt(0).parent;
					view.requiredValidator.property="selectedValue";
					view.requiredValidator.listener=wrapper;
					vResult=view.requiredValidator.validate();
					if (vResult.type == ValidationResultEvent.VALID && item.selectedValue != "0")
					{
						wrapper.setStyle('borderStyle', 'none');
						validresult++;
					}
					else
					{
						wrapper.setStyle('borderStyle', 'solid');
						wrapper.setStyle('borderColor', 'red');
					}
				}
				else
				{
					view.requiredValidator.listener=item;
					view.requiredValidator.property="text";
					vResult=view.requiredValidator.validate();
					if (vResult.type == ValidationResultEvent.VALID)
					{
						validresult++;
					}
					else
					{
						if (requiredFieldsArray.indexOf(req) == -1)
							requiredFieldsArray.push(req);
					}
				}
			}
			if (validresult == i)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		public function enableInputs(clazz:Class, enabling:Boolean):void
		{
			var typeInfo:XML=describeType(clazz);
			var fullyQualifiedName:String=typeInfo.@name.toString().replace(/::/, ".");
			registerClassAlias(fullyQualifiedName, clazz);
			var item:String;
			for each (var v:XML in typeInfo..accessor)
			{
				if (v.@name.toString() != "prototype")
				{
					item=v.@name.toString();
					if (view[item] != null)
					{
						if (view[item].hasOwnProperty("text"))
						{
							view[item].enabled=enabling;
						}
						else if (view[item].hasOwnProperty("selectedValue"))
						{
							if (view[item].hasOwnProperty("selection"))
							{
								view[item].enabled=enabling;
							}
							else
							{
								view[item].enabled=enabling;
							}
						}
					}
				}
			}
			
		}
		
		public function defaultInputs(clazz:Class):void
		{
			var typeInfo:XML=describeType(clazz);
			var fullyQualifiedName:String=typeInfo.@name.toString().replace(/::/, ".");
			registerClassAlias(fullyQualifiedName, clazz);
			var item:String;
			for each (var v:XML in typeInfo..accessor)
			{
				if (v.@name.toString() != "prototype")
				{
					item=v.@name.toString();
					
					if (view[item] != null)
					{
						if (view[item].hasOwnProperty("text"))
						{
							view[item].text=view.viewsVO[item];
							view[item].errorString="";
						}
						else if (view[item].hasOwnProperty("selectedValue"))
						{
							if (view[item].hasOwnProperty("selection"))
							{
								var wrapper:Object=view[item].getRadioButtonAt(0).parent;
								wrapper.errorString="";
								wrapper.setStyle('borderStyle', 'none');
								view[item].selectedValue=view.viewsVO[item];
							}
							else
							{
								view[item].selectedItem.label=view.viewsVO[item];
							}
						}
						else if (view[item].hasOwnProperty("value"))
						{
							view[item].value=view.viewsVO[item];
						}
						else if (view[item].hasOwnProperty("selected"))
						{
							view[item].selected=view.viewsVO[item];
						}
					}
				}
			}
		}
		
		public function checkInput(event:Event):Boolean
		{
			var validresult:Number=0;
			var item:Object;
			item=event.currentTarget;
			view.requiredValidator.source=item;
			if (item.hasOwnProperty("selectedValue"))
			{
				var wrapper:Object=item.getRadioButtonAt(0).parent;
				view.requiredValidator.property="selectedValue";
				view.requiredValidator.listener=wrapper;
				vResult=view.requiredValidator.validate();
				if (vResult.type == ValidationResultEvent.VALID && item.selectedValue != "0")
				{
					wrapper.setStyle('borderStyle', 'none');
					validresult++;
				}
				else
				{
					wrapper.setStyle('borderStyle', 'solid');
					wrapper.setStyle('borderColor', 'red');
				}
			}
			else
			{
				view.requiredValidator.listener=item;
				view.requiredValidator.property="text";
				vResult=view.requiredValidator.validate();
				if (vResult.type == ValidationResultEvent.VALID)
				{
					validresult++;
				}
			}
			if (validresult == 1)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		public function giveFocus(event:Event, nextField:Object):void
		{
			if (event.currentTarget.text.length == event.currentTarget.maxChars)
			{
				nextField.setFocus();
			}
		}
	}
}