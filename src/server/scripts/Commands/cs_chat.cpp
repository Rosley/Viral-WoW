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

        static ChatCommandTable commandTable =
        {
            { "announce", WorldChatCommandTable },
        };

		return WorldChatCommandTable;
	}

	static bool HandleWorldChatCommand(ChatHandler* handler, const char* args)
	{
		if (!handler->GetSession()->CanSpeak())
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
			msg +=  player->GetName();
			msg += " |c1f40af20announces:|cffffff00 ";
			break;
			// Subscriber
		case SEC_MODERATOR:
			msg += "|c1f40af20[Viral-WoW] |cffff6060<Subscriber> ";
			msg += player->GetName();
			msg += " |c1f40af20announces:|cffffff00 ";
			break;
			// Moderator
		case SEC_GAMEMASTER:
			msg += "|c1f40af20[Viral-WoW] |cff71C671<Moderator> ";
			msg += player->GetName();
			msg += " |c1f40af20announces:|cffffff00 ";
			break;
			// Developer
		case SEC_ADMINISTRATOR:
			msg += "|c1f40af20[Viral-WoW] |cffDA70D6<Developer> ";
			msg += player->GetName();
			msg += " |c1f40af20announces:|cffffff00 ";
			break;
			// Administrator
		case SEC_CONSOLE:
			msg += "|c1f40af20[Viral-WoW] |cff00ffff<Administrator> ";
			msg += player->GetName();
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
