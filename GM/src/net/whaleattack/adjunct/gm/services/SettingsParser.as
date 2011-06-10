package net.whaleattack.adjunct.gm.services
{
	import net.whaleattack.adjunct.gm.models.vo.SettingsVO;

	public class SettingsParser
	{
		public function parseSettings(xml:XML, settingsVO:SettingsVO):SettingsVO
		{
			settingsVO.decks = new Array();
			
			for each(var deck:XML in xml..deck)
			{
				settingsVO.decks.push(deck.@source);
			}
			
			return settingsVO;
		}
	}
}