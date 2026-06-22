#pragma once

#include <QVector>

#include "../models/server_profile.hpp"


class ServerRepository {
public:
    static QVector<ServerProfile> load();
    static void save(const QVector<ServerProfile>& servers);

    static bool add(const ServerProfile& server);
    static bool remove(const QString& id);
    static bool update(const ServerProfile& server);
};
