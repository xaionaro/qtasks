

#define protected public
#define private public

#include "moc.h"
#include "_cgo_export.h"

#include <QByteArray>
#include <QChildEvent>
#include <QEvent>
#include <QList>
#include <QMetaMethod>
#include <QMetaObject>
#include <QObject>
#include <QString>
#include <QTimerEvent>

#ifdef QT_QML_LIB
	#include <QQmlEngine>
#endif


class Bridge4d8045: public QObject
{
Q_OBJECT
public:
	Bridge4d8045(QObject *parent = Q_NULLPTR) : QObject(parent) {qRegisterMetaType<quintptr>("quintptr");Bridge4d8045_Bridge4d8045_QRegisterMetaType();Bridge4d8045_Bridge4d8045_QRegisterMetaTypes();callbackBridge4d8045_Constructor(this);};
	 ~Bridge4d8045() { callbackBridge4d8045_DestroyBridge(this); };
	void childEvent(QChildEvent * event) { callbackBridge4d8045_ChildEvent(this, event); };
	void connectNotify(const QMetaMethod & sign) { callbackBridge4d8045_ConnectNotify(this, const_cast<QMetaMethod*>(&sign)); };
	void customEvent(QEvent * event) { callbackBridge4d8045_CustomEvent(this, event); };
	void deleteLater() { callbackBridge4d8045_DeleteLater(this); };
	void Signal_Destroyed(QObject * obj) { callbackBridge4d8045_Destroyed(this, obj); };
	void disconnectNotify(const QMetaMethod & sign) { callbackBridge4d8045_DisconnectNotify(this, const_cast<QMetaMethod*>(&sign)); };
	bool event(QEvent * e) { return callbackBridge4d8045_Event(this, e) != 0; };
	bool eventFilter(QObject * watched, QEvent * event) { return callbackBridge4d8045_EventFilter(this, watched, event) != 0; };
	void Signal_ObjectNameChanged(const QString & objectName) { QByteArray* taa2c4f = new QByteArray(objectName.toUtf8()); Moc_PackedString objectNamePacked = { const_cast<char*>(taa2c4f->prepend("WHITESPACE").constData()+10), taa2c4f->size()-10, taa2c4f };callbackBridge4d8045_ObjectNameChanged(this, objectNamePacked); };
	void timerEvent(QTimerEvent * event) { callbackBridge4d8045_TimerEvent(this, event); };
signals:
public slots:
	void logOnce(qint32 index, QString taskID, QObject* item, QString since, QString until, QString comment) { QByteArray* t302bd0 = new QByteArray(taskID.toUtf8()); Moc_PackedString taskIDPacked = { const_cast<char*>(t302bd0->prepend("WHITESPACE").constData()+10), t302bd0->size()-10, t302bd0 };QByteArray* t2eb888 = new QByteArray(since.toUtf8()); Moc_PackedString sincePacked = { const_cast<char*>(t2eb888->prepend("WHITESPACE").constData()+10), t2eb888->size()-10, t2eb888 };QByteArray* tb310f4 = new QByteArray(until.toUtf8()); Moc_PackedString untilPacked = { const_cast<char*>(tb310f4->prepend("WHITESPACE").constData()+10), tb310f4->size()-10, tb310f4 };QByteArray* t118a99 = new QByteArray(comment.toUtf8()); Moc_PackedString commentPacked = { const_cast<char*>(t118a99->prepend("WHITESPACE").constData()+10), t118a99->size()-10, t118a99 };callbackBridge4d8045_LogOnce(this, index, taskIDPacked, item, sincePacked, untilPacked, commentPacked); };
	void setComment(qint32 index, QString taskID, QObject* item, QString comment) { QByteArray* t302bd0 = new QByteArray(taskID.toUtf8()); Moc_PackedString taskIDPacked = { const_cast<char*>(t302bd0->prepend("WHITESPACE").constData()+10), t302bd0->size()-10, t302bd0 };QByteArray* t118a99 = new QByteArray(comment.toUtf8()); Moc_PackedString commentPacked = { const_cast<char*>(t118a99->prepend("WHITESPACE").constData()+10), t118a99->size()-10, t118a99 };callbackBridge4d8045_SetComment(this, index, taskIDPacked, item, commentPacked); };
	void sendComment(qint32 index, QString taskID, QObject* item, QString comment) { QByteArray* t302bd0 = new QByteArray(taskID.toUtf8()); Moc_PackedString taskIDPacked = { const_cast<char*>(t302bd0->prepend("WHITESPACE").constData()+10), t302bd0->size()-10, t302bd0 };QByteArray* t118a99 = new QByteArray(comment.toUtf8()); Moc_PackedString commentPacked = { const_cast<char*>(t118a99->prepend("WHITESPACE").constData()+10), t118a99->size()-10, t118a99 };callbackBridge4d8045_SendComment(this, index, taskIDPacked, item, commentPacked); };
	void startContinuousTimeTracking(qint32 index, QString taskID, QObject* item, QString comment) { QByteArray* t302bd0 = new QByteArray(taskID.toUtf8()); Moc_PackedString taskIDPacked = { const_cast<char*>(t302bd0->prepend("WHITESPACE").constData()+10), t302bd0->size()-10, t302bd0 };QByteArray* t118a99 = new QByteArray(comment.toUtf8()); Moc_PackedString commentPacked = { const_cast<char*>(t118a99->prepend("WHITESPACE").constData()+10), t118a99->size()-10, t118a99 };callbackBridge4d8045_StartContinuousTimeTracking(this, index, taskIDPacked, item, commentPacked); };
	void stopContinuousTimeTracking() { callbackBridge4d8045_StopContinuousTimeTracking(this); };
	void taskSelect(qint32 index, QString taskID, QObject* item) { QByteArray* t302bd0 = new QByteArray(taskID.toUtf8()); Moc_PackedString taskIDPacked = { const_cast<char*>(t302bd0->prepend("WHITESPACE").constData()+10), t302bd0->size()-10, t302bd0 };callbackBridge4d8045_TaskSelect(this, index, taskIDPacked, item); };
	void taskOpenInBrowser(qint32 index, QString taskID, QObject* item) { QByteArray* t302bd0 = new QByteArray(taskID.toUtf8()); Moc_PackedString taskIDPacked = { const_cast<char*>(t302bd0->prepend("WHITESPACE").constData()+10), t302bd0->size()-10, t302bd0 };callbackBridge4d8045_TaskOpenInBrowser(this, index, taskIDPacked, item); };
	void taskRemove(qint32 index, QString taskID, QObject* item) { QByteArray* t302bd0 = new QByteArray(taskID.toUtf8()); Moc_PackedString taskIDPacked = { const_cast<char*>(t302bd0->prepend("WHITESPACE").constData()+10), t302bd0->size()-10, t302bd0 };callbackBridge4d8045_TaskRemove(this, index, taskIDPacked, item); };
	void taskClose(qint32 index, QString taskID, QObject* item) { QByteArray* t302bd0 = new QByteArray(taskID.toUtf8()); Moc_PackedString taskIDPacked = { const_cast<char*>(t302bd0->prepend("WHITESPACE").constData()+10), t302bd0->size()-10, t302bd0 };callbackBridge4d8045_TaskClose(this, index, taskIDPacked, item); };
	void findTaskSelect(qint32 index, QString taskID, QObject* item) { QByteArray* t302bd0 = new QByteArray(taskID.toUtf8()); Moc_PackedString taskIDPacked = { const_cast<char*>(t302bd0->prepend("WHITESPACE").constData()+10), t302bd0->size()-10, t302bd0 };callbackBridge4d8045_FindTaskSelect(this, index, taskIDPacked, item); };
	void findTaskUpdateFilter(QString pattern) { QByteArray* t91cc2e = new QByteArray(pattern.toUtf8()); Moc_PackedString patternPacked = { const_cast<char*>(t91cc2e->prepend("WHITESPACE").constData()+10), t91cc2e->size()-10, t91cc2e };callbackBridge4d8045_FindTaskUpdateFilter(this, patternPacked); };
private:
};

Q_DECLARE_METATYPE(Bridge4d8045*)


void Bridge4d8045_Bridge4d8045_QRegisterMetaTypes() {
}

void Bridge4d8045_LogOnce(void* ptr, int index, struct Moc_PackedString taskID, void* item, struct Moc_PackedString since, struct Moc_PackedString until, struct Moc_PackedString comment)
{
	QMetaObject::invokeMethod(static_cast<Bridge4d8045*>(ptr), "logOnce", Q_ARG(qint32, index), Q_ARG(QString, QString::fromUtf8(taskID.data, taskID.len)), Q_ARG(QObject*, static_cast<QObject*>(item)), Q_ARG(QString, QString::fromUtf8(since.data, since.len)), Q_ARG(QString, QString::fromUtf8(until.data, until.len)), Q_ARG(QString, QString::fromUtf8(comment.data, comment.len)));
}

void Bridge4d8045_SetComment(void* ptr, int index, struct Moc_PackedString taskID, void* item, struct Moc_PackedString comment)
{
	QMetaObject::invokeMethod(static_cast<Bridge4d8045*>(ptr), "setComment", Q_ARG(qint32, index), Q_ARG(QString, QString::fromUtf8(taskID.data, taskID.len)), Q_ARG(QObject*, static_cast<QObject*>(item)), Q_ARG(QString, QString::fromUtf8(comment.data, comment.len)));
}

void Bridge4d8045_SendComment(void* ptr, int index, struct Moc_PackedString taskID, void* item, struct Moc_PackedString comment)
{
	QMetaObject::invokeMethod(static_cast<Bridge4d8045*>(ptr), "sendComment", Q_ARG(qint32, index), Q_ARG(QString, QString::fromUtf8(taskID.data, taskID.len)), Q_ARG(QObject*, static_cast<QObject*>(item)), Q_ARG(QString, QString::fromUtf8(comment.data, comment.len)));
}

void Bridge4d8045_StartContinuousTimeTracking(void* ptr, int index, struct Moc_PackedString taskID, void* item, struct Moc_PackedString comment)
{
	QMetaObject::invokeMethod(static_cast<Bridge4d8045*>(ptr), "startContinuousTimeTracking", Q_ARG(qint32, index), Q_ARG(QString, QString::fromUtf8(taskID.data, taskID.len)), Q_ARG(QObject*, static_cast<QObject*>(item)), Q_ARG(QString, QString::fromUtf8(comment.data, comment.len)));
}

void Bridge4d8045_StopContinuousTimeTracking(void* ptr)
{
	QMetaObject::invokeMethod(static_cast<Bridge4d8045*>(ptr), "stopContinuousTimeTracking");
}

void Bridge4d8045_TaskSelect(void* ptr, int index, struct Moc_PackedString taskID, void* item)
{
	QMetaObject::invokeMethod(static_cast<Bridge4d8045*>(ptr), "taskSelect", Q_ARG(qint32, index), Q_ARG(QString, QString::fromUtf8(taskID.data, taskID.len)), Q_ARG(QObject*, static_cast<QObject*>(item)));
}

void Bridge4d8045_TaskOpenInBrowser(void* ptr, int index, struct Moc_PackedString taskID, void* item)
{
	QMetaObject::invokeMethod(static_cast<Bridge4d8045*>(ptr), "taskOpenInBrowser", Q_ARG(qint32, index), Q_ARG(QString, QString::fromUtf8(taskID.data, taskID.len)), Q_ARG(QObject*, static_cast<QObject*>(item)));
}

void Bridge4d8045_TaskRemove(void* ptr, int index, struct Moc_PackedString taskID, void* item)
{
	QMetaObject::invokeMethod(static_cast<Bridge4d8045*>(ptr), "taskRemove", Q_ARG(qint32, index), Q_ARG(QString, QString::fromUtf8(taskID.data, taskID.len)), Q_ARG(QObject*, static_cast<QObject*>(item)));
}

void Bridge4d8045_TaskClose(void* ptr, int index, struct Moc_PackedString taskID, void* item)
{
	QMetaObject::invokeMethod(static_cast<Bridge4d8045*>(ptr), "taskClose", Q_ARG(qint32, index), Q_ARG(QString, QString::fromUtf8(taskID.data, taskID.len)), Q_ARG(QObject*, static_cast<QObject*>(item)));
}

void Bridge4d8045_FindTaskSelect(void* ptr, int index, struct Moc_PackedString taskID, void* item)
{
	QMetaObject::invokeMethod(static_cast<Bridge4d8045*>(ptr), "findTaskSelect", Q_ARG(qint32, index), Q_ARG(QString, QString::fromUtf8(taskID.data, taskID.len)), Q_ARG(QObject*, static_cast<QObject*>(item)));
}

void Bridge4d8045_FindTaskUpdateFilter(void* ptr, struct Moc_PackedString pattern)
{
	QMetaObject::invokeMethod(static_cast<Bridge4d8045*>(ptr), "findTaskUpdateFilter", Q_ARG(QString, QString::fromUtf8(pattern.data, pattern.len)));
}

int Bridge4d8045_Bridge4d8045_QRegisterMetaType()
{
	return qRegisterMetaType<Bridge4d8045*>();
}

int Bridge4d8045_Bridge4d8045_QRegisterMetaType2(char* typeName)
{
	return qRegisterMetaType<Bridge4d8045*>(const_cast<const char*>(typeName));
}

int Bridge4d8045_Bridge4d8045_QmlRegisterType()
{
#ifdef QT_QML_LIB
	return qmlRegisterType<Bridge4d8045>();
#else
	return 0;
#endif
}

int Bridge4d8045_Bridge4d8045_QmlRegisterType2(char* uri, int versionMajor, int versionMinor, char* qmlName)
{
#ifdef QT_QML_LIB
	return qmlRegisterType<Bridge4d8045>(const_cast<const char*>(uri), versionMajor, versionMinor, const_cast<const char*>(qmlName));
#else
	return 0;
#endif
}

void* Bridge4d8045___children_atList(void* ptr, int i)
{
	return ({QObject * tmp = static_cast<QList<QObject *>*>(ptr)->at(i); if (i == static_cast<QList<QObject *>*>(ptr)->size()-1) { static_cast<QList<QObject *>*>(ptr)->~QList(); free(ptr); }; tmp; });
}

void Bridge4d8045___children_setList(void* ptr, void* i)
{
	static_cast<QList<QObject *>*>(ptr)->append(static_cast<QObject*>(i));
}

void* Bridge4d8045___children_newList(void* ptr)
{
	Q_UNUSED(ptr);
	return new QList<QObject *>();
}

void* Bridge4d8045___dynamicPropertyNames_atList(void* ptr, int i)
{
	return new QByteArray(({QByteArray tmp = static_cast<QList<QByteArray>*>(ptr)->at(i); if (i == static_cast<QList<QByteArray>*>(ptr)->size()-1) { static_cast<QList<QByteArray>*>(ptr)->~QList(); free(ptr); }; tmp; }));
}

void Bridge4d8045___dynamicPropertyNames_setList(void* ptr, void* i)
{
	static_cast<QList<QByteArray>*>(ptr)->append(*static_cast<QByteArray*>(i));
}

void* Bridge4d8045___dynamicPropertyNames_newList(void* ptr)
{
	Q_UNUSED(ptr);
	return new QList<QByteArray>();
}

void* Bridge4d8045___findChildren_atList(void* ptr, int i)
{
	return ({QObject* tmp = static_cast<QList<QObject*>*>(ptr)->at(i); if (i == static_cast<QList<QObject*>*>(ptr)->size()-1) { static_cast<QList<QObject*>*>(ptr)->~QList(); free(ptr); }; tmp; });
}

void Bridge4d8045___findChildren_setList(void* ptr, void* i)
{
	static_cast<QList<QObject*>*>(ptr)->append(static_cast<QObject*>(i));
}

void* Bridge4d8045___findChildren_newList(void* ptr)
{
	Q_UNUSED(ptr);
	return new QList<QObject*>();
}

void* Bridge4d8045___findChildren_atList3(void* ptr, int i)
{
	return ({QObject* tmp = static_cast<QList<QObject*>*>(ptr)->at(i); if (i == static_cast<QList<QObject*>*>(ptr)->size()-1) { static_cast<QList<QObject*>*>(ptr)->~QList(); free(ptr); }; tmp; });
}

void Bridge4d8045___findChildren_setList3(void* ptr, void* i)
{
	static_cast<QList<QObject*>*>(ptr)->append(static_cast<QObject*>(i));
}

void* Bridge4d8045___findChildren_newList3(void* ptr)
{
	Q_UNUSED(ptr);
	return new QList<QObject*>();
}

void* Bridge4d8045_NewBridge(void* parent)
{
	return new Bridge4d8045(static_cast<QObject*>(parent));
}

void Bridge4d8045_DestroyBridge(void* ptr)
{
	static_cast<Bridge4d8045*>(ptr)->~Bridge4d8045();
}

void Bridge4d8045_DestroyBridgeDefault(void* ptr)
{
	Q_UNUSED(ptr);

}

void Bridge4d8045_ChildEventDefault(void* ptr, void* event)
{
	static_cast<Bridge4d8045*>(ptr)->QObject::childEvent(static_cast<QChildEvent*>(event));
}

void Bridge4d8045_ConnectNotifyDefault(void* ptr, void* sign)
{
	static_cast<Bridge4d8045*>(ptr)->QObject::connectNotify(*static_cast<QMetaMethod*>(sign));
}

void Bridge4d8045_CustomEventDefault(void* ptr, void* event)
{
	static_cast<Bridge4d8045*>(ptr)->QObject::customEvent(static_cast<QEvent*>(event));
}

void Bridge4d8045_DeleteLaterDefault(void* ptr)
{
	static_cast<Bridge4d8045*>(ptr)->QObject::deleteLater();
}

void Bridge4d8045_DisconnectNotifyDefault(void* ptr, void* sign)
{
	static_cast<Bridge4d8045*>(ptr)->QObject::disconnectNotify(*static_cast<QMetaMethod*>(sign));
}

char Bridge4d8045_EventDefault(void* ptr, void* e)
{
	return static_cast<Bridge4d8045*>(ptr)->QObject::event(static_cast<QEvent*>(e));
}

char Bridge4d8045_EventFilterDefault(void* ptr, void* watched, void* event)
{
	return static_cast<Bridge4d8045*>(ptr)->QObject::eventFilter(static_cast<QObject*>(watched), static_cast<QEvent*>(event));
}



void Bridge4d8045_TimerEventDefault(void* ptr, void* event)
{
	static_cast<Bridge4d8045*>(ptr)->QObject::timerEvent(static_cast<QTimerEvent*>(event));
}

#include "moc_moc.h"
