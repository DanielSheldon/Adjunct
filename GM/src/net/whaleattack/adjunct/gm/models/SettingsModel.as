package net.whaleattack.adjunct.gm.models
{
	import net.whaleattack.adjunct.gm.models.vo.SettingsVO;
	
	import org.robotlegs.mvcs.Actor;
	
	public class SettingsModel extends Actor
	{
		private var _settingsVO:SettingsVO;
		private var _decksToLoad:Array;
		private var _source:String;
		
		public function SettingsModel()
		{
			super();
		}

		public function get settingsVO():SettingsVO
		{
			return _settingsVO;
		}

		public function set settingsVO(value:SettingsVO):void
		{
			_settingsVO = value;
			
			_decksToLoad = new Array();
			for each(var source:String in _settingsVO.decks)
			{
				_decksToLoad.push(source);
			}
		}
		
		public function getNextDeck():String
		{
			if(_decksToLoad.length <= 0)
			{
				return "";				
			}else{
				return _decksToLoad.pop();
			}
		}

	}
}