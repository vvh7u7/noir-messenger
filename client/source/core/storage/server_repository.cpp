#include "core/storage/server_repository.hpp"

#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QDir>
#include <QStandardPaths>
#include <QSaveFile>


static QString filePath() {
    QString dir = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir().mkpath(dir);
    return dir + "/server.json";
}

QVector<ServerProfile> ServerRepository::load() {
    QVector<ServerProfile> result;

    QFile file(filePath());
    if (!file.open(QIODevice::ReadOnly)) return result;

    auto doc = QJsonDocument::fromJson(file.readAll());

    for (auto v : doc.array())
        result.push_back(ServerProfile::fromJson(v.toObject()));

    return result;
}

void ServerRepository::save(const QVector<ServerProfile> &servers) {
    QJsonArray array;

    for (const auto& server : servers)
    {
        array.append(server.toJson());
    }

    QJsonDocument doc(array);
    QSaveFile file(filePath());

    if (!file.open(QIODevice::WriteOnly))
    {
        qWarning() << "Cannot open servers.json";
        return;
    }

    file.write(doc.toJson(QJsonDocument::Indented));
    if (!file.commit()) qWarning() << "Cannot save servers.json";
}

bool ServerRepository::add(const ServerProfile& server) {
    auto servers = load();

    for (const auto& s : servers) {
        if (s.id == server.id)
        return false;
    }

    servers.push_back(server);
    save(servers);

    return true;
}

bool ServerRepository::remove(const QString& id) {
    auto servers = load();

    auto it = std::remove_if(
        servers.begin(),
        servers.end(),
        [&](const ServerProfile& s)
        {
            return s.id == id;
        });

    if (it == servers.end()) return false;

    servers.erase(it, servers.end());
    save(servers);

    return true;
}

bool ServerRepository::update(const ServerProfile& server) {
    auto servers = load();

    for (auto& s : servers) {
        if (s.id == server.id) {
            s = server;
            save(servers);
            return true;
        }
    }

    return false;
}
