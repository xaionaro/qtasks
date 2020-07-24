

#pragma once

#ifndef GO_MOC_4d8045_H
#define GO_MOC_4d8045_H

#include <stdint.h>

#ifdef __cplusplus
class Bridge4d8045;
void Bridge4d8045_Bridge4d8045_QRegisterMetaTypes();
extern "C" {
#endif

struct Moc_PackedString { char* data; long long len; void* ptr; };
struct Moc_PackedList { void* data; long long len; };
void Bridge4d8045_LogOnce(void* ptr, int index, struct Moc_PackedString taskID, void* item, struct Moc_PackedString since, struct Moc_PackedString until, struct Moc_PackedString comment);
void Bridge4d8045_SetComment(void* ptr, int index, struct Moc_PackedString taskID, void* item, struct Moc_PackedString comment);
void Bridge4d8045_SendComment(void* ptr, int index, struct Moc_PackedString taskID, void* item, struct Moc_PackedString comment);
void Bridge4d8045_StartContinuousTimeTracking(void* ptr, int index, struct Moc_PackedString taskID, void* item, struct Moc_PackedString comment);
void Bridge4d8045_StopContinuousTimeTracking(void* ptr);
void Bridge4d8045_TaskSelect(void* ptr, int index, struct Moc_PackedString taskID, void* item);
void Bridge4d8045_TaskOpenInBrowser(void* ptr, int index, struct Moc_PackedString taskID, void* item);
void Bridge4d8045_TaskRemove(void* ptr, int index, struct Moc_PackedString taskID, void* item);
void Bridge4d8045_TaskClose(void* ptr, int index, struct Moc_PackedString taskID, void* item);
void Bridge4d8045_FindTaskSelect(void* ptr, int index, struct Moc_PackedString taskID, void* item);
void Bridge4d8045_FindTaskUpdateFilter(void* ptr, struct Moc_PackedString pattern);
int Bridge4d8045_Bridge4d8045_QRegisterMetaType();
int Bridge4d8045_Bridge4d8045_QRegisterMetaType2(char* typeName);
int Bridge4d8045_Bridge4d8045_QmlRegisterType();
int Bridge4d8045_Bridge4d8045_QmlRegisterType2(char* uri, int versionMajor, int versionMinor, char* qmlName);
void* Bridge4d8045___children_atList(void* ptr, int i);
void Bridge4d8045___children_setList(void* ptr, void* i);
void* Bridge4d8045___children_newList(void* ptr);
void* Bridge4d8045___dynamicPropertyNames_atList(void* ptr, int i);
void Bridge4d8045___dynamicPropertyNames_setList(void* ptr, void* i);
void* Bridge4d8045___dynamicPropertyNames_newList(void* ptr);
void* Bridge4d8045___findChildren_atList(void* ptr, int i);
void Bridge4d8045___findChildren_setList(void* ptr, void* i);
void* Bridge4d8045___findChildren_newList(void* ptr);
void* Bridge4d8045___findChildren_atList3(void* ptr, int i);
void Bridge4d8045___findChildren_setList3(void* ptr, void* i);
void* Bridge4d8045___findChildren_newList3(void* ptr);
void* Bridge4d8045_NewBridge(void* parent);
void Bridge4d8045_DestroyBridge(void* ptr);
void Bridge4d8045_DestroyBridgeDefault(void* ptr);
void Bridge4d8045_ChildEventDefault(void* ptr, void* event);
void Bridge4d8045_ConnectNotifyDefault(void* ptr, void* sign);
void Bridge4d8045_CustomEventDefault(void* ptr, void* event);
void Bridge4d8045_DeleteLaterDefault(void* ptr);
void Bridge4d8045_DisconnectNotifyDefault(void* ptr, void* sign);
char Bridge4d8045_EventDefault(void* ptr, void* e);
char Bridge4d8045_EventFilterDefault(void* ptr, void* watched, void* event);
;
void Bridge4d8045_TimerEventDefault(void* ptr, void* event);

#ifdef __cplusplus
}
#endif

#endif