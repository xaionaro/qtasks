package ui

//#include <stdint.h>
//#include <stdlib.h>
//#include <string.h>
//#include "moc.h"
import "C"
import (
	"strings"
	"unsafe"

	"github.com/therecipe/qt"
	std_core "github.com/therecipe/qt/core"
)

func cGoFreePacked(ptr unsafe.Pointer) { std_core.NewQByteArrayFromPointer(ptr).DestroyQByteArray() }
func cGoUnpackString(s C.struct_Moc_PackedString) string {
	defer cGoFreePacked(s.ptr)
	if int(s.len) == -1 {
		return C.GoString(s.data)
	}
	return C.GoStringN(s.data, C.int(s.len))
}
func cGoUnpackBytes(s C.struct_Moc_PackedString) []byte {
	defer cGoFreePacked(s.ptr)
	if int(s.len) == -1 {
		gs := C.GoString(s.data)
		return []byte(gs)
	}
	return C.GoBytes(unsafe.Pointer(s.data), C.int(s.len))
}
func unpackStringList(s string) []string {
	if len(s) == 0 {
		return make([]string, 0)
	}
	return strings.Split(s, "¡¦!")
}

type Bridge_ITF interface {
	std_core.QObject_ITF
	Bridge_PTR() *Bridge
}

func (ptr *Bridge) Bridge_PTR() *Bridge {
	return ptr
}

func (ptr *Bridge) Pointer() unsafe.Pointer {
	if ptr != nil {
		return ptr.QObject_PTR().Pointer()
	}
	return nil
}

func (ptr *Bridge) SetPointer(p unsafe.Pointer) {
	if ptr != nil {
		ptr.QObject_PTR().SetPointer(p)
	}
}

func PointerFromBridge(ptr Bridge_ITF) unsafe.Pointer {
	if ptr != nil {
		return ptr.Bridge_PTR().Pointer()
	}
	return nil
}

func NewBridgeFromPointer(ptr unsafe.Pointer) (n *Bridge) {
	if gPtr, ok := qt.Receive(ptr); !ok {
		n = new(Bridge)
		n.SetPointer(ptr)
	} else {
		switch deduced := gPtr.(type) {
		case *Bridge:
			n = deduced

		case *std_core.QObject:
			n = &Bridge{QObject: *deduced}

		default:
			n = new(Bridge)
			n.SetPointer(ptr)
		}
	}
	return
}

//export callbackBridge4d8045_Constructor
func callbackBridge4d8045_Constructor(ptr unsafe.Pointer) {
	this := NewBridgeFromPointer(ptr)
	qt.Register(ptr, this)
}

//export callbackBridge4d8045_LogOnce
func callbackBridge4d8045_LogOnce(ptr unsafe.Pointer, index C.int, taskID C.struct_Moc_PackedString, item unsafe.Pointer, since C.struct_Moc_PackedString, until C.struct_Moc_PackedString, comment C.struct_Moc_PackedString) {
	if signal := qt.GetSignal(ptr, "logOnce"); signal != nil {
		(*(*func(int, string, *std_core.QObject, string, string, string))(signal))(int(int32(index)), cGoUnpackString(taskID), std_core.NewQObjectFromPointer(item), cGoUnpackString(since), cGoUnpackString(until), cGoUnpackString(comment))
	}

}

func (ptr *Bridge) ConnectLogOnce(f func(index int, taskID string, item *std_core.QObject, since string, until string, comment string)) {
	if ptr.Pointer() != nil {

		if signal := qt.LendSignal(ptr.Pointer(), "logOnce"); signal != nil {
			f := func(index int, taskID string, item *std_core.QObject, since string, until string, comment string) {
				(*(*func(int, string, *std_core.QObject, string, string, string))(signal))(index, taskID, item, since, until, comment)
				f(index, taskID, item, since, until, comment)
			}
			qt.ConnectSignal(ptr.Pointer(), "logOnce", unsafe.Pointer(&f))
		} else {
			qt.ConnectSignal(ptr.Pointer(), "logOnce", unsafe.Pointer(&f))
		}
	}
}

func (ptr *Bridge) DisconnectLogOnce() {
	if ptr.Pointer() != nil {

		qt.DisconnectSignal(ptr.Pointer(), "logOnce")
	}
}

func (ptr *Bridge) LogOnce(index int, taskID string, item std_core.QObject_ITF, since string, until string, comment string) {
	if ptr.Pointer() != nil {
		var taskIDC *C.char
		if taskID != "" {
			taskIDC = C.CString(taskID)
			defer C.free(unsafe.Pointer(taskIDC))
		}
		var sinceC *C.char
		if since != "" {
			sinceC = C.CString(since)
			defer C.free(unsafe.Pointer(sinceC))
		}
		var untilC *C.char
		if until != "" {
			untilC = C.CString(until)
			defer C.free(unsafe.Pointer(untilC))
		}
		var commentC *C.char
		if comment != "" {
			commentC = C.CString(comment)
			defer C.free(unsafe.Pointer(commentC))
		}
		C.Bridge4d8045_LogOnce(ptr.Pointer(), C.int(int32(index)), C.struct_Moc_PackedString{data: taskIDC, len: C.longlong(len(taskID))}, std_core.PointerFromQObject(item), C.struct_Moc_PackedString{data: sinceC, len: C.longlong(len(since))}, C.struct_Moc_PackedString{data: untilC, len: C.longlong(len(until))}, C.struct_Moc_PackedString{data: commentC, len: C.longlong(len(comment))})
	}
}

//export callbackBridge4d8045_SetComment
func callbackBridge4d8045_SetComment(ptr unsafe.Pointer, index C.int, taskID C.struct_Moc_PackedString, item unsafe.Pointer, comment C.struct_Moc_PackedString) {
	if signal := qt.GetSignal(ptr, "setComment"); signal != nil {
		(*(*func(int, string, *std_core.QObject, string))(signal))(int(int32(index)), cGoUnpackString(taskID), std_core.NewQObjectFromPointer(item), cGoUnpackString(comment))
	}

}

func (ptr *Bridge) ConnectSetComment(f func(index int, taskID string, item *std_core.QObject, comment string)) {
	if ptr.Pointer() != nil {

		if signal := qt.LendSignal(ptr.Pointer(), "setComment"); signal != nil {
			f := func(index int, taskID string, item *std_core.QObject, comment string) {
				(*(*func(int, string, *std_core.QObject, string))(signal))(index, taskID, item, comment)
				f(index, taskID, item, comment)
			}
			qt.ConnectSignal(ptr.Pointer(), "setComment", unsafe.Pointer(&f))
		} else {
			qt.ConnectSignal(ptr.Pointer(), "setComment", unsafe.Pointer(&f))
		}
	}
}

func (ptr *Bridge) DisconnectSetComment() {
	if ptr.Pointer() != nil {

		qt.DisconnectSignal(ptr.Pointer(), "setComment")
	}
}

func (ptr *Bridge) SetComment(index int, taskID string, item std_core.QObject_ITF, comment string) {
	if ptr.Pointer() != nil {
		var taskIDC *C.char
		if taskID != "" {
			taskIDC = C.CString(taskID)
			defer C.free(unsafe.Pointer(taskIDC))
		}
		var commentC *C.char
		if comment != "" {
			commentC = C.CString(comment)
			defer C.free(unsafe.Pointer(commentC))
		}
		C.Bridge4d8045_SetComment(ptr.Pointer(), C.int(int32(index)), C.struct_Moc_PackedString{data: taskIDC, len: C.longlong(len(taskID))}, std_core.PointerFromQObject(item), C.struct_Moc_PackedString{data: commentC, len: C.longlong(len(comment))})
	}
}

//export callbackBridge4d8045_SendComment
func callbackBridge4d8045_SendComment(ptr unsafe.Pointer, index C.int, taskID C.struct_Moc_PackedString, item unsafe.Pointer, comment C.struct_Moc_PackedString) {
	if signal := qt.GetSignal(ptr, "sendComment"); signal != nil {
		(*(*func(int, string, *std_core.QObject, string))(signal))(int(int32(index)), cGoUnpackString(taskID), std_core.NewQObjectFromPointer(item), cGoUnpackString(comment))
	}

}

func (ptr *Bridge) ConnectSendComment(f func(index int, taskID string, item *std_core.QObject, comment string)) {
	if ptr.Pointer() != nil {

		if signal := qt.LendSignal(ptr.Pointer(), "sendComment"); signal != nil {
			f := func(index int, taskID string, item *std_core.QObject, comment string) {
				(*(*func(int, string, *std_core.QObject, string))(signal))(index, taskID, item, comment)
				f(index, taskID, item, comment)
			}
			qt.ConnectSignal(ptr.Pointer(), "sendComment", unsafe.Pointer(&f))
		} else {
			qt.ConnectSignal(ptr.Pointer(), "sendComment", unsafe.Pointer(&f))
		}
	}
}

func (ptr *Bridge) DisconnectSendComment() {
	if ptr.Pointer() != nil {

		qt.DisconnectSignal(ptr.Pointer(), "sendComment")
	}
}

func (ptr *Bridge) SendComment(index int, taskID string, item std_core.QObject_ITF, comment string) {
	if ptr.Pointer() != nil {
		var taskIDC *C.char
		if taskID != "" {
			taskIDC = C.CString(taskID)
			defer C.free(unsafe.Pointer(taskIDC))
		}
		var commentC *C.char
		if comment != "" {
			commentC = C.CString(comment)
			defer C.free(unsafe.Pointer(commentC))
		}
		C.Bridge4d8045_SendComment(ptr.Pointer(), C.int(int32(index)), C.struct_Moc_PackedString{data: taskIDC, len: C.longlong(len(taskID))}, std_core.PointerFromQObject(item), C.struct_Moc_PackedString{data: commentC, len: C.longlong(len(comment))})
	}
}

//export callbackBridge4d8045_StartContinuousTimeTracking
func callbackBridge4d8045_StartContinuousTimeTracking(ptr unsafe.Pointer, index C.int, taskID C.struct_Moc_PackedString, item unsafe.Pointer, comment C.struct_Moc_PackedString) {
	if signal := qt.GetSignal(ptr, "startContinuousTimeTracking"); signal != nil {
		(*(*func(int, string, *std_core.QObject, string))(signal))(int(int32(index)), cGoUnpackString(taskID), std_core.NewQObjectFromPointer(item), cGoUnpackString(comment))
	}

}

func (ptr *Bridge) ConnectStartContinuousTimeTracking(f func(index int, taskID string, item *std_core.QObject, comment string)) {
	if ptr.Pointer() != nil {

		if signal := qt.LendSignal(ptr.Pointer(), "startContinuousTimeTracking"); signal != nil {
			f := func(index int, taskID string, item *std_core.QObject, comment string) {
				(*(*func(int, string, *std_core.QObject, string))(signal))(index, taskID, item, comment)
				f(index, taskID, item, comment)
			}
			qt.ConnectSignal(ptr.Pointer(), "startContinuousTimeTracking", unsafe.Pointer(&f))
		} else {
			qt.ConnectSignal(ptr.Pointer(), "startContinuousTimeTracking", unsafe.Pointer(&f))
		}
	}
}

func (ptr *Bridge) DisconnectStartContinuousTimeTracking() {
	if ptr.Pointer() != nil {

		qt.DisconnectSignal(ptr.Pointer(), "startContinuousTimeTracking")
	}
}

func (ptr *Bridge) StartContinuousTimeTracking(index int, taskID string, item std_core.QObject_ITF, comment string) {
	if ptr.Pointer() != nil {
		var taskIDC *C.char
		if taskID != "" {
			taskIDC = C.CString(taskID)
			defer C.free(unsafe.Pointer(taskIDC))
		}
		var commentC *C.char
		if comment != "" {
			commentC = C.CString(comment)
			defer C.free(unsafe.Pointer(commentC))
		}
		C.Bridge4d8045_StartContinuousTimeTracking(ptr.Pointer(), C.int(int32(index)), C.struct_Moc_PackedString{data: taskIDC, len: C.longlong(len(taskID))}, std_core.PointerFromQObject(item), C.struct_Moc_PackedString{data: commentC, len: C.longlong(len(comment))})
	}
}

//export callbackBridge4d8045_StopContinuousTimeTracking
func callbackBridge4d8045_StopContinuousTimeTracking(ptr unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "stopContinuousTimeTracking"); signal != nil {
		(*(*func())(signal))()
	}

}

func (ptr *Bridge) ConnectStopContinuousTimeTracking(f func()) {
	if ptr.Pointer() != nil {

		if signal := qt.LendSignal(ptr.Pointer(), "stopContinuousTimeTracking"); signal != nil {
			f := func() {
				(*(*func())(signal))()
				f()
			}
			qt.ConnectSignal(ptr.Pointer(), "stopContinuousTimeTracking", unsafe.Pointer(&f))
		} else {
			qt.ConnectSignal(ptr.Pointer(), "stopContinuousTimeTracking", unsafe.Pointer(&f))
		}
	}
}

func (ptr *Bridge) DisconnectStopContinuousTimeTracking() {
	if ptr.Pointer() != nil {

		qt.DisconnectSignal(ptr.Pointer(), "stopContinuousTimeTracking")
	}
}

func (ptr *Bridge) StopContinuousTimeTracking() {
	if ptr.Pointer() != nil {
		C.Bridge4d8045_StopContinuousTimeTracking(ptr.Pointer())
	}
}

//export callbackBridge4d8045_TaskSelect
func callbackBridge4d8045_TaskSelect(ptr unsafe.Pointer, index C.int, taskID C.struct_Moc_PackedString, item unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "taskSelect"); signal != nil {
		(*(*func(int, string, *std_core.QObject))(signal))(int(int32(index)), cGoUnpackString(taskID), std_core.NewQObjectFromPointer(item))
	}

}

func (ptr *Bridge) ConnectTaskSelect(f func(index int, taskID string, item *std_core.QObject)) {
	if ptr.Pointer() != nil {

		if signal := qt.LendSignal(ptr.Pointer(), "taskSelect"); signal != nil {
			f := func(index int, taskID string, item *std_core.QObject) {
				(*(*func(int, string, *std_core.QObject))(signal))(index, taskID, item)
				f(index, taskID, item)
			}
			qt.ConnectSignal(ptr.Pointer(), "taskSelect", unsafe.Pointer(&f))
		} else {
			qt.ConnectSignal(ptr.Pointer(), "taskSelect", unsafe.Pointer(&f))
		}
	}
}

func (ptr *Bridge) DisconnectTaskSelect() {
	if ptr.Pointer() != nil {

		qt.DisconnectSignal(ptr.Pointer(), "taskSelect")
	}
}

func (ptr *Bridge) TaskSelect(index int, taskID string, item std_core.QObject_ITF) {
	if ptr.Pointer() != nil {
		var taskIDC *C.char
		if taskID != "" {
			taskIDC = C.CString(taskID)
			defer C.free(unsafe.Pointer(taskIDC))
		}
		C.Bridge4d8045_TaskSelect(ptr.Pointer(), C.int(int32(index)), C.struct_Moc_PackedString{data: taskIDC, len: C.longlong(len(taskID))}, std_core.PointerFromQObject(item))
	}
}

//export callbackBridge4d8045_TaskOpenInBrowser
func callbackBridge4d8045_TaskOpenInBrowser(ptr unsafe.Pointer, index C.int, taskID C.struct_Moc_PackedString, item unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "taskOpenInBrowser"); signal != nil {
		(*(*func(int, string, *std_core.QObject))(signal))(int(int32(index)), cGoUnpackString(taskID), std_core.NewQObjectFromPointer(item))
	}

}

func (ptr *Bridge) ConnectTaskOpenInBrowser(f func(index int, taskID string, item *std_core.QObject)) {
	if ptr.Pointer() != nil {

		if signal := qt.LendSignal(ptr.Pointer(), "taskOpenInBrowser"); signal != nil {
			f := func(index int, taskID string, item *std_core.QObject) {
				(*(*func(int, string, *std_core.QObject))(signal))(index, taskID, item)
				f(index, taskID, item)
			}
			qt.ConnectSignal(ptr.Pointer(), "taskOpenInBrowser", unsafe.Pointer(&f))
		} else {
			qt.ConnectSignal(ptr.Pointer(), "taskOpenInBrowser", unsafe.Pointer(&f))
		}
	}
}

func (ptr *Bridge) DisconnectTaskOpenInBrowser() {
	if ptr.Pointer() != nil {

		qt.DisconnectSignal(ptr.Pointer(), "taskOpenInBrowser")
	}
}

func (ptr *Bridge) TaskOpenInBrowser(index int, taskID string, item std_core.QObject_ITF) {
	if ptr.Pointer() != nil {
		var taskIDC *C.char
		if taskID != "" {
			taskIDC = C.CString(taskID)
			defer C.free(unsafe.Pointer(taskIDC))
		}
		C.Bridge4d8045_TaskOpenInBrowser(ptr.Pointer(), C.int(int32(index)), C.struct_Moc_PackedString{data: taskIDC, len: C.longlong(len(taskID))}, std_core.PointerFromQObject(item))
	}
}

//export callbackBridge4d8045_TaskRemove
func callbackBridge4d8045_TaskRemove(ptr unsafe.Pointer, index C.int, taskID C.struct_Moc_PackedString, item unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "taskRemove"); signal != nil {
		(*(*func(int, string, *std_core.QObject))(signal))(int(int32(index)), cGoUnpackString(taskID), std_core.NewQObjectFromPointer(item))
	}

}

func (ptr *Bridge) ConnectTaskRemove(f func(index int, taskID string, item *std_core.QObject)) {
	if ptr.Pointer() != nil {

		if signal := qt.LendSignal(ptr.Pointer(), "taskRemove"); signal != nil {
			f := func(index int, taskID string, item *std_core.QObject) {
				(*(*func(int, string, *std_core.QObject))(signal))(index, taskID, item)
				f(index, taskID, item)
			}
			qt.ConnectSignal(ptr.Pointer(), "taskRemove", unsafe.Pointer(&f))
		} else {
			qt.ConnectSignal(ptr.Pointer(), "taskRemove", unsafe.Pointer(&f))
		}
	}
}

func (ptr *Bridge) DisconnectTaskRemove() {
	if ptr.Pointer() != nil {

		qt.DisconnectSignal(ptr.Pointer(), "taskRemove")
	}
}

func (ptr *Bridge) TaskRemove(index int, taskID string, item std_core.QObject_ITF) {
	if ptr.Pointer() != nil {
		var taskIDC *C.char
		if taskID != "" {
			taskIDC = C.CString(taskID)
			defer C.free(unsafe.Pointer(taskIDC))
		}
		C.Bridge4d8045_TaskRemove(ptr.Pointer(), C.int(int32(index)), C.struct_Moc_PackedString{data: taskIDC, len: C.longlong(len(taskID))}, std_core.PointerFromQObject(item))
	}
}

//export callbackBridge4d8045_TaskClose
func callbackBridge4d8045_TaskClose(ptr unsafe.Pointer, index C.int, taskID C.struct_Moc_PackedString, item unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "taskClose"); signal != nil {
		(*(*func(int, string, *std_core.QObject))(signal))(int(int32(index)), cGoUnpackString(taskID), std_core.NewQObjectFromPointer(item))
	}

}

func (ptr *Bridge) ConnectTaskClose(f func(index int, taskID string, item *std_core.QObject)) {
	if ptr.Pointer() != nil {

		if signal := qt.LendSignal(ptr.Pointer(), "taskClose"); signal != nil {
			f := func(index int, taskID string, item *std_core.QObject) {
				(*(*func(int, string, *std_core.QObject))(signal))(index, taskID, item)
				f(index, taskID, item)
			}
			qt.ConnectSignal(ptr.Pointer(), "taskClose", unsafe.Pointer(&f))
		} else {
			qt.ConnectSignal(ptr.Pointer(), "taskClose", unsafe.Pointer(&f))
		}
	}
}

func (ptr *Bridge) DisconnectTaskClose() {
	if ptr.Pointer() != nil {

		qt.DisconnectSignal(ptr.Pointer(), "taskClose")
	}
}

func (ptr *Bridge) TaskClose(index int, taskID string, item std_core.QObject_ITF) {
	if ptr.Pointer() != nil {
		var taskIDC *C.char
		if taskID != "" {
			taskIDC = C.CString(taskID)
			defer C.free(unsafe.Pointer(taskIDC))
		}
		C.Bridge4d8045_TaskClose(ptr.Pointer(), C.int(int32(index)), C.struct_Moc_PackedString{data: taskIDC, len: C.longlong(len(taskID))}, std_core.PointerFromQObject(item))
	}
}

//export callbackBridge4d8045_FindTaskSelect
func callbackBridge4d8045_FindTaskSelect(ptr unsafe.Pointer, index C.int, taskID C.struct_Moc_PackedString, item unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "findTaskSelect"); signal != nil {
		(*(*func(int, string, *std_core.QObject))(signal))(int(int32(index)), cGoUnpackString(taskID), std_core.NewQObjectFromPointer(item))
	}

}

func (ptr *Bridge) ConnectFindTaskSelect(f func(index int, taskID string, item *std_core.QObject)) {
	if ptr.Pointer() != nil {

		if signal := qt.LendSignal(ptr.Pointer(), "findTaskSelect"); signal != nil {
			f := func(index int, taskID string, item *std_core.QObject) {
				(*(*func(int, string, *std_core.QObject))(signal))(index, taskID, item)
				f(index, taskID, item)
			}
			qt.ConnectSignal(ptr.Pointer(), "findTaskSelect", unsafe.Pointer(&f))
		} else {
			qt.ConnectSignal(ptr.Pointer(), "findTaskSelect", unsafe.Pointer(&f))
		}
	}
}

func (ptr *Bridge) DisconnectFindTaskSelect() {
	if ptr.Pointer() != nil {

		qt.DisconnectSignal(ptr.Pointer(), "findTaskSelect")
	}
}

func (ptr *Bridge) FindTaskSelect(index int, taskID string, item std_core.QObject_ITF) {
	if ptr.Pointer() != nil {
		var taskIDC *C.char
		if taskID != "" {
			taskIDC = C.CString(taskID)
			defer C.free(unsafe.Pointer(taskIDC))
		}
		C.Bridge4d8045_FindTaskSelect(ptr.Pointer(), C.int(int32(index)), C.struct_Moc_PackedString{data: taskIDC, len: C.longlong(len(taskID))}, std_core.PointerFromQObject(item))
	}
}

//export callbackBridge4d8045_FindTaskUpdateFilter
func callbackBridge4d8045_FindTaskUpdateFilter(ptr unsafe.Pointer, pattern C.struct_Moc_PackedString) {
	if signal := qt.GetSignal(ptr, "findTaskUpdateFilter"); signal != nil {
		(*(*func(string))(signal))(cGoUnpackString(pattern))
	}

}

func (ptr *Bridge) ConnectFindTaskUpdateFilter(f func(pattern string)) {
	if ptr.Pointer() != nil {

		if signal := qt.LendSignal(ptr.Pointer(), "findTaskUpdateFilter"); signal != nil {
			f := func(pattern string) {
				(*(*func(string))(signal))(pattern)
				f(pattern)
			}
			qt.ConnectSignal(ptr.Pointer(), "findTaskUpdateFilter", unsafe.Pointer(&f))
		} else {
			qt.ConnectSignal(ptr.Pointer(), "findTaskUpdateFilter", unsafe.Pointer(&f))
		}
	}
}

func (ptr *Bridge) DisconnectFindTaskUpdateFilter() {
	if ptr.Pointer() != nil {

		qt.DisconnectSignal(ptr.Pointer(), "findTaskUpdateFilter")
	}
}

func (ptr *Bridge) FindTaskUpdateFilter(pattern string) {
	if ptr.Pointer() != nil {
		var patternC *C.char
		if pattern != "" {
			patternC = C.CString(pattern)
			defer C.free(unsafe.Pointer(patternC))
		}
		C.Bridge4d8045_FindTaskUpdateFilter(ptr.Pointer(), C.struct_Moc_PackedString{data: patternC, len: C.longlong(len(pattern))})
	}
}

func Bridge_QRegisterMetaType() int {
	return int(int32(C.Bridge4d8045_Bridge4d8045_QRegisterMetaType()))
}

func (ptr *Bridge) QRegisterMetaType() int {
	return int(int32(C.Bridge4d8045_Bridge4d8045_QRegisterMetaType()))
}

func Bridge_QRegisterMetaType2(typeName string) int {
	var typeNameC *C.char
	if typeName != "" {
		typeNameC = C.CString(typeName)
		defer C.free(unsafe.Pointer(typeNameC))
	}
	return int(int32(C.Bridge4d8045_Bridge4d8045_QRegisterMetaType2(typeNameC)))
}

func (ptr *Bridge) QRegisterMetaType2(typeName string) int {
	var typeNameC *C.char
	if typeName != "" {
		typeNameC = C.CString(typeName)
		defer C.free(unsafe.Pointer(typeNameC))
	}
	return int(int32(C.Bridge4d8045_Bridge4d8045_QRegisterMetaType2(typeNameC)))
}

func Bridge_QmlRegisterType() int {
	return int(int32(C.Bridge4d8045_Bridge4d8045_QmlRegisterType()))
}

func (ptr *Bridge) QmlRegisterType() int {
	return int(int32(C.Bridge4d8045_Bridge4d8045_QmlRegisterType()))
}

func Bridge_QmlRegisterType2(uri string, versionMajor int, versionMinor int, qmlName string) int {
	var uriC *C.char
	if uri != "" {
		uriC = C.CString(uri)
		defer C.free(unsafe.Pointer(uriC))
	}
	var qmlNameC *C.char
	if qmlName != "" {
		qmlNameC = C.CString(qmlName)
		defer C.free(unsafe.Pointer(qmlNameC))
	}
	return int(int32(C.Bridge4d8045_Bridge4d8045_QmlRegisterType2(uriC, C.int(int32(versionMajor)), C.int(int32(versionMinor)), qmlNameC)))
}

func (ptr *Bridge) QmlRegisterType2(uri string, versionMajor int, versionMinor int, qmlName string) int {
	var uriC *C.char
	if uri != "" {
		uriC = C.CString(uri)
		defer C.free(unsafe.Pointer(uriC))
	}
	var qmlNameC *C.char
	if qmlName != "" {
		qmlNameC = C.CString(qmlName)
		defer C.free(unsafe.Pointer(qmlNameC))
	}
	return int(int32(C.Bridge4d8045_Bridge4d8045_QmlRegisterType2(uriC, C.int(int32(versionMajor)), C.int(int32(versionMinor)), qmlNameC)))
}

func (ptr *Bridge) __children_atList(i int) *std_core.QObject {
	if ptr.Pointer() != nil {
		tmpValue := std_core.NewQObjectFromPointer(C.Bridge4d8045___children_atList(ptr.Pointer(), C.int(int32(i))))
		if !qt.ExistsSignal(tmpValue.Pointer(), "destroyed") {
			tmpValue.ConnectDestroyed(func(*std_core.QObject) { tmpValue.SetPointer(nil) })
		}
		return tmpValue
	}
	return nil
}

func (ptr *Bridge) __children_setList(i std_core.QObject_ITF) {
	if ptr.Pointer() != nil {
		C.Bridge4d8045___children_setList(ptr.Pointer(), std_core.PointerFromQObject(i))
	}
}

func (ptr *Bridge) __children_newList() unsafe.Pointer {
	return C.Bridge4d8045___children_newList(ptr.Pointer())
}

func (ptr *Bridge) __dynamicPropertyNames_atList(i int) *std_core.QByteArray {
	if ptr.Pointer() != nil {
		tmpValue := std_core.NewQByteArrayFromPointer(C.Bridge4d8045___dynamicPropertyNames_atList(ptr.Pointer(), C.int(int32(i))))
		qt.SetFinalizer(tmpValue, (*std_core.QByteArray).DestroyQByteArray)
		return tmpValue
	}
	return nil
}

func (ptr *Bridge) __dynamicPropertyNames_setList(i std_core.QByteArray_ITF) {
	if ptr.Pointer() != nil {
		C.Bridge4d8045___dynamicPropertyNames_setList(ptr.Pointer(), std_core.PointerFromQByteArray(i))
	}
}

func (ptr *Bridge) __dynamicPropertyNames_newList() unsafe.Pointer {
	return C.Bridge4d8045___dynamicPropertyNames_newList(ptr.Pointer())
}

func (ptr *Bridge) __findChildren_atList(i int) *std_core.QObject {
	if ptr.Pointer() != nil {
		tmpValue := std_core.NewQObjectFromPointer(C.Bridge4d8045___findChildren_atList(ptr.Pointer(), C.int(int32(i))))
		if !qt.ExistsSignal(tmpValue.Pointer(), "destroyed") {
			tmpValue.ConnectDestroyed(func(*std_core.QObject) { tmpValue.SetPointer(nil) })
		}
		return tmpValue
	}
	return nil
}

func (ptr *Bridge) __findChildren_setList(i std_core.QObject_ITF) {
	if ptr.Pointer() != nil {
		C.Bridge4d8045___findChildren_setList(ptr.Pointer(), std_core.PointerFromQObject(i))
	}
}

func (ptr *Bridge) __findChildren_newList() unsafe.Pointer {
	return C.Bridge4d8045___findChildren_newList(ptr.Pointer())
}

func (ptr *Bridge) __findChildren_atList3(i int) *std_core.QObject {
	if ptr.Pointer() != nil {
		tmpValue := std_core.NewQObjectFromPointer(C.Bridge4d8045___findChildren_atList3(ptr.Pointer(), C.int(int32(i))))
		if !qt.ExistsSignal(tmpValue.Pointer(), "destroyed") {
			tmpValue.ConnectDestroyed(func(*std_core.QObject) { tmpValue.SetPointer(nil) })
		}
		return tmpValue
	}
	return nil
}

func (ptr *Bridge) __findChildren_setList3(i std_core.QObject_ITF) {
	if ptr.Pointer() != nil {
		C.Bridge4d8045___findChildren_setList3(ptr.Pointer(), std_core.PointerFromQObject(i))
	}
}

func (ptr *Bridge) __findChildren_newList3() unsafe.Pointer {
	return C.Bridge4d8045___findChildren_newList3(ptr.Pointer())
}

func NewBridge(parent std_core.QObject_ITF) *Bridge {
	Bridge_QRegisterMetaType()
	tmpValue := NewBridgeFromPointer(C.Bridge4d8045_NewBridge(std_core.PointerFromQObject(parent)))
	if !qt.ExistsSignal(tmpValue.Pointer(), "destroyed") {
		tmpValue.ConnectDestroyed(func(*std_core.QObject) { tmpValue.SetPointer(nil) })
	}
	return tmpValue
}

//export callbackBridge4d8045_DestroyBridge
func callbackBridge4d8045_DestroyBridge(ptr unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "~Bridge"); signal != nil {
		(*(*func())(signal))()
	} else {
		NewBridgeFromPointer(ptr).DestroyBridgeDefault()
	}
}

func (ptr *Bridge) ConnectDestroyBridge(f func()) {
	if ptr.Pointer() != nil {

		if signal := qt.LendSignal(ptr.Pointer(), "~Bridge"); signal != nil {
			f := func() {
				(*(*func())(signal))()
				f()
			}
			qt.ConnectSignal(ptr.Pointer(), "~Bridge", unsafe.Pointer(&f))
		} else {
			qt.ConnectSignal(ptr.Pointer(), "~Bridge", unsafe.Pointer(&f))
		}
	}
}

func (ptr *Bridge) DisconnectDestroyBridge() {
	if ptr.Pointer() != nil {

		qt.DisconnectSignal(ptr.Pointer(), "~Bridge")
	}
}

func (ptr *Bridge) DestroyBridge() {
	if ptr.Pointer() != nil {

		qt.SetFinalizer(ptr, nil)
		C.Bridge4d8045_DestroyBridge(ptr.Pointer())
		ptr.SetPointer(nil)
	}
}

func (ptr *Bridge) DestroyBridgeDefault() {
	if ptr.Pointer() != nil {

		qt.SetFinalizer(ptr, nil)
		C.Bridge4d8045_DestroyBridgeDefault(ptr.Pointer())
		ptr.SetPointer(nil)
	}
}

//export callbackBridge4d8045_ChildEvent
func callbackBridge4d8045_ChildEvent(ptr unsafe.Pointer, event unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "childEvent"); signal != nil {
		(*(*func(*std_core.QChildEvent))(signal))(std_core.NewQChildEventFromPointer(event))
	} else {
		NewBridgeFromPointer(ptr).ChildEventDefault(std_core.NewQChildEventFromPointer(event))
	}
}

func (ptr *Bridge) ChildEventDefault(event std_core.QChildEvent_ITF) {
	if ptr.Pointer() != nil {
		C.Bridge4d8045_ChildEventDefault(ptr.Pointer(), std_core.PointerFromQChildEvent(event))
	}
}

//export callbackBridge4d8045_ConnectNotify
func callbackBridge4d8045_ConnectNotify(ptr unsafe.Pointer, sign unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "connectNotify"); signal != nil {
		(*(*func(*std_core.QMetaMethod))(signal))(std_core.NewQMetaMethodFromPointer(sign))
	} else {
		NewBridgeFromPointer(ptr).ConnectNotifyDefault(std_core.NewQMetaMethodFromPointer(sign))
	}
}

func (ptr *Bridge) ConnectNotifyDefault(sign std_core.QMetaMethod_ITF) {
	if ptr.Pointer() != nil {
		C.Bridge4d8045_ConnectNotifyDefault(ptr.Pointer(), std_core.PointerFromQMetaMethod(sign))
	}
}

//export callbackBridge4d8045_CustomEvent
func callbackBridge4d8045_CustomEvent(ptr unsafe.Pointer, event unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "customEvent"); signal != nil {
		(*(*func(*std_core.QEvent))(signal))(std_core.NewQEventFromPointer(event))
	} else {
		NewBridgeFromPointer(ptr).CustomEventDefault(std_core.NewQEventFromPointer(event))
	}
}

func (ptr *Bridge) CustomEventDefault(event std_core.QEvent_ITF) {
	if ptr.Pointer() != nil {
		C.Bridge4d8045_CustomEventDefault(ptr.Pointer(), std_core.PointerFromQEvent(event))
	}
}

//export callbackBridge4d8045_DeleteLater
func callbackBridge4d8045_DeleteLater(ptr unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "deleteLater"); signal != nil {
		(*(*func())(signal))()
	} else {
		NewBridgeFromPointer(ptr).DeleteLaterDefault()
	}
}

func (ptr *Bridge) DeleteLaterDefault() {
	if ptr.Pointer() != nil {

		qt.SetFinalizer(ptr, nil)
		C.Bridge4d8045_DeleteLaterDefault(ptr.Pointer())
	}
}

//export callbackBridge4d8045_Destroyed
func callbackBridge4d8045_Destroyed(ptr unsafe.Pointer, obj unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "destroyed"); signal != nil {
		(*(*func(*std_core.QObject))(signal))(std_core.NewQObjectFromPointer(obj))
	}
	qt.Unregister(ptr)

}

//export callbackBridge4d8045_DisconnectNotify
func callbackBridge4d8045_DisconnectNotify(ptr unsafe.Pointer, sign unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "disconnectNotify"); signal != nil {
		(*(*func(*std_core.QMetaMethod))(signal))(std_core.NewQMetaMethodFromPointer(sign))
	} else {
		NewBridgeFromPointer(ptr).DisconnectNotifyDefault(std_core.NewQMetaMethodFromPointer(sign))
	}
}

func (ptr *Bridge) DisconnectNotifyDefault(sign std_core.QMetaMethod_ITF) {
	if ptr.Pointer() != nil {
		C.Bridge4d8045_DisconnectNotifyDefault(ptr.Pointer(), std_core.PointerFromQMetaMethod(sign))
	}
}

//export callbackBridge4d8045_Event
func callbackBridge4d8045_Event(ptr unsafe.Pointer, e unsafe.Pointer) C.char {
	if signal := qt.GetSignal(ptr, "event"); signal != nil {
		return C.char(int8(qt.GoBoolToInt((*(*func(*std_core.QEvent) bool)(signal))(std_core.NewQEventFromPointer(e)))))
	}

	return C.char(int8(qt.GoBoolToInt(NewBridgeFromPointer(ptr).EventDefault(std_core.NewQEventFromPointer(e)))))
}

func (ptr *Bridge) EventDefault(e std_core.QEvent_ITF) bool {
	if ptr.Pointer() != nil {
		return int8(C.Bridge4d8045_EventDefault(ptr.Pointer(), std_core.PointerFromQEvent(e))) != 0
	}
	return false
}

//export callbackBridge4d8045_EventFilter
func callbackBridge4d8045_EventFilter(ptr unsafe.Pointer, watched unsafe.Pointer, event unsafe.Pointer) C.char {
	if signal := qt.GetSignal(ptr, "eventFilter"); signal != nil {
		return C.char(int8(qt.GoBoolToInt((*(*func(*std_core.QObject, *std_core.QEvent) bool)(signal))(std_core.NewQObjectFromPointer(watched), std_core.NewQEventFromPointer(event)))))
	}

	return C.char(int8(qt.GoBoolToInt(NewBridgeFromPointer(ptr).EventFilterDefault(std_core.NewQObjectFromPointer(watched), std_core.NewQEventFromPointer(event)))))
}

func (ptr *Bridge) EventFilterDefault(watched std_core.QObject_ITF, event std_core.QEvent_ITF) bool {
	if ptr.Pointer() != nil {
		return int8(C.Bridge4d8045_EventFilterDefault(ptr.Pointer(), std_core.PointerFromQObject(watched), std_core.PointerFromQEvent(event))) != 0
	}
	return false
}

//export callbackBridge4d8045_ObjectNameChanged
func callbackBridge4d8045_ObjectNameChanged(ptr unsafe.Pointer, objectName C.struct_Moc_PackedString) {
	if signal := qt.GetSignal(ptr, "objectNameChanged"); signal != nil {
		(*(*func(string))(signal))(cGoUnpackString(objectName))
	}

}

//export callbackBridge4d8045_TimerEvent
func callbackBridge4d8045_TimerEvent(ptr unsafe.Pointer, event unsafe.Pointer) {
	if signal := qt.GetSignal(ptr, "timerEvent"); signal != nil {
		(*(*func(*std_core.QTimerEvent))(signal))(std_core.NewQTimerEventFromPointer(event))
	} else {
		NewBridgeFromPointer(ptr).TimerEventDefault(std_core.NewQTimerEventFromPointer(event))
	}
}

func (ptr *Bridge) TimerEventDefault(event std_core.QTimerEvent_ITF) {
	if ptr.Pointer() != nil {
		C.Bridge4d8045_TimerEventDefault(ptr.Pointer(), std_core.PointerFromQTimerEvent(event))
	}
}

func init() {
	qt.ItfMap["ui.Bridge_ITF"] = Bridge{}
	qt.FuncMap["ui.NewBridge"] = NewBridge
}
