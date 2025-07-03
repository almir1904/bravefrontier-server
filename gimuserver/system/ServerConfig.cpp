#include "ServerConfig.hpp"

void ServerConfig::ParseFromJson(const Json::Value& v)
{
        Wallpaper = v["wallpaper_banner"].asString();
        GameVersion = v["game_version"].asInt();
        NoticeUrl = v["notice_url"].asString();
        if (v.isMember("public_hostname"))
                PublicHostname = v["public_hostname"].asString();
}

