#pragma once

#include <QString>
#include <QJsonObject>
#include <qjsonobject.h>

struct ServerProfile {
    QString id;
    QString name;
    QString url;
    QString token;
    QString userId;

    QJsonObject toJson() const {
        return {
            {"id", id},
            {"name", name},
            {"url", url},
            {"token", token},
            {"userId", userId}
        };
    }

    static ServerProfile fromJson(const QJsonObject& obj) {
        ServerProfile p;
        p.id = obj["id"].toString();
        p.name = obj["name"].toString();
        p.url = obj["url"].toString();
        p.token = obj["token"].toString();
        p.userId = obj["userId"].toString();
        return p;
    }
};
