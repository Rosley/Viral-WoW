#include "ScriptPCH.h"
#include "ScriptMgr.h"
#include "Channel.h"
#include "ChannelMgr.h"
#include "Chat.h"
#include "Language.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "RBAC.h"
#include "World.h"
#include "WorldSession.h"

#define FACTION_SPECIFIC 0

std::string GetNameLink(Player* player)
{
	std::string name = player->GetName();
	std::string color;
	switch (player->GetClass())
	{
	case CLASS_DEATH_KNIGHT:
		color = "|cffff0000";
		break;
	case CLASS_DRUID:
		color = "|cffff0000";
		break;
	case CLASS_HUNTER:
		color = "|cffff0000";
		break;
	case CLASS_MAGE:
		color = "|cffff0000";
		break;
	case CLASS_PALADIN:
		color = "|cffff0000";
		break;
	case CLASS_PRIEST:
		color = "|cffff0000";
		break;
	case CLASS_ROGUE:
		color = "|cffff0000";
		break;
	case CLASS_SHAMAN:
		color = "|cffff0000";
		break;
	case CLASS_WARLOCK:
		color = "|cffff0000";
		break;
	case CLASS_WARRIOR:
		color = "|cffff0000";
		break;
	}
	return "|Hplayer:" + name + "|h|cffFFFFFF[" + color + name + "|cffFFFFFF]|h|r";
}

using namespace Trinity::ChatCommands;

class cs_world_chat : public CommandScript
{
public:
	cs_world_chat() : CommandScript("cs_world_chat") {}

	ChatCommandTable GetCommands() const override
	{
		static ChatCommandTable WorldChatCommandTable =
		{
            { "announce",           HandleWorldChatCommand,      rbac::RBAC_PERM_COMMAND_WORLD_CHAT,           Console::Yes },
		};

		return WorldChatCommandTable;
	}

	static bool HandleWorldChatCommand(ChatHandler* handler, const char* args)
	{
		if (!handler->GetSession()->GetPlayer()->CanSpeak())
			return false;
		std::string temp = args;

		if (!args || temp.find_first_not_of(' ') == std::string::npos)
			return false;

		std::string msg = "";
		Player* player = handler->GetSession()->GetPlayer();

		switch (player->GetSession()->GetSecurity())
		{
			// Player
		case SEC_PLAYER:
			msg += "|c1f40af20[Viral-WoW] |cffffff00<Player> ";
			msg += GetNameLink(player);
			msg += " |c1f40af20announces:|cffffff00 ";
			break;
			// Subscriber
		case SEC_MODERATOR:
			msg += "|c1f40af20[Viral-WoW] |cffff6060<Subscriber> ";
			msg += GetNameLink(player);
			msg += " |c1f40af20announces:|cffffff00 ";
			break;
			// Moderator
		case SEC_GAMEMASTER:
			msg += "|c1f40af20[Viral-WoW] |cff71C671<Moderator> ";
			msg += GetNameLink(player);
			msg += " |c1f40af20announces:|cffffff00 ";
			break;
			// Developer
		case SEC_ADMINISTRATOR:
			msg += "|c1f40af20[Viral-WoW] |cffDA70D6<Developer> ";
			msg += GetNameLink(player);
			msg += " |c1f40af20announces:|cffffff00 ";
			break;
			// Administrator
		case SEC_CONSOLE:
			msg += "|c1f40af20[Viral-WoW] |cff00ffff<Administrator> ";
			msg += GetNameLink(player);
			msg += " |c1f40af20announces:|cffffff00 ";
			break;

		}
		return true;
	}
};

void AddSC_cs_world_chat()
{
	new cs_world_chat();
}
