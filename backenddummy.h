#ifndef BACKENDDUMMY_H
#define BACKENDDUMMY_H

#include <iostream>
#include <QObject>

class BackendDummy : public QObject
{
    Q_OBJECT
public:
    explicit BackendDummy(QObject *parent = nullptr);

public slots:

    static void logOnce(int index, QString taskID, QObject *item, QString since, QString until, QString comment) {
        (void)index; (void)taskID; (void)item; (void)since; (void)until; (void)comment;
    };
    static void setComment(int index, QString taskID, QObject *item, QString comment) {
        (void)index; (void)taskID; (void)item; (void)comment;
    };
    static void sendComment(int index, QString taskID, QObject *item, QString comment) {
        (void)index; (void)taskID; (void)item; (void)comment;
    };
    static void startContinuousTimeTracking(int index, QString taskID, QObject *item, QString comment) {
        std::cout << index << " " << taskID.toStdString() << " " << (void *)item << " " << comment.toStdString() << std::endl;
    };
    static void stopContinuousTimeTracking() {};

    static void taskSelect(int index, QString taskID, QObject *item) {
        (void)index; (void)taskID; (void)item;
    }
    static void taskOpenInBrowser(int index, QString taskID, QObject *item) {
        (void)index; (void)taskID; (void)item;
    }
    static void taskRemove(int index, QString taskID, QObject *item) {
        (void)index; (void)taskID; (void)item;
    }
    static void taskClose(int index, QString taskID, QObject *item) {
        (void)index; (void)taskID; (void)item;
    }

    static void findTaskSelect(int index, QString taskID, QObject *item) {
        (void)index; (void)taskID; (void)item;
    }
    static void findTaskUpdateFilter(QString pattern) {
        (void)pattern;
    }

    static void noteSelect(QObject * item) {
        (void)item;
    }
    static void noteSaveToFile(QObject * item) {
        (void)item;
    }
    static void noteRenderToFile(QObject * item) {
        (void)item;
    }
    static void noteUpdate(QObject * item) {
        (void)item;
    }
    static void noteAdd(int index, QObject * item) {
        (void)index; (void)item;
    }
    static void noteRemove(QObject * item) {
        (void)item;
    }

    static void activityLogDateRangeChange(QString since, QString until) {
        (void)since; (void)until;
    }
    static void activityLogSelect(int index, QString taskID, QObject * item) {
        (void)index; (void)taskID; (void)item;
    }
    static void activityLogOpenInBrowser(int index, QString taskID, QObject * item) {
        (void)index; (void)taskID; (void)item;
    }
};

#endif // BACKENDDUMMY_H
