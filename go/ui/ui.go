//go:generate qtmoc

package ui

import (
	"fmt"

	"github.com/therecipe/qt/core"
	"github.com/therecipe/qt/qml"
)

type UI struct {
	qmlApplicationEngine *qml.QQmlApplicationEngine
	applicationWindow    *core.QObject
	bridge               *Bridge
}

func NewUI(qmlApplicationEngine *qml.QQmlApplicationEngine) *UI {
	applicationWindow := qmlApplicationEngine.RootObjects()[0]
	ui := &UI{
		qmlApplicationEngine: qmlApplicationEngine,
		applicationWindow:    applicationWindow,
		bridge:               NewBridge(applicationWindow),
	}
	qmlApplicationEngine.RootContext().SetContextProperty("backend", ui.bridge)
	ui.connectAll()
	return ui
}

func (ui *UI) connectAll() {
	ui.ConnectStartContinuousTimeTracking(ui.startContinuousTimeTracking)
	ui.ConnectStopContinuousTimeTracking(ui.stopContinuousTimeTracking)
	ui.ConnectSetComment(ui.setComment)
}

func (ui *UI) Bridge() *Bridge {
	return ui.bridge
}

func (ui *UI) ConnectStartContinuousTimeTracking(fn func(index int, taskID core.QString, item *core.QObject, comment core.QString)) {
	ui.bridge.ConnectEvent(func(e *core.QEvent) bool {
		fmt.Printf("event: %#+v\n", e)
		return true
	})
	ui.bridge.ConnectCustomEvent(func(event *core.QEvent) {
		fmt.Printf("event: %#+v\n", event)
	})
	ui.bridge.ConnectStartContinuousTimeTracking(func(index int, taskID string, item *core.QObject, comment string) {
		fmt.Printf("StartContinuousTimeTracking: %#+v %#+v %#+v %#+v\n", index, taskID, item, comment)

	})
	ui.bridge.DumpObjectInfo()
}

func (ui *UI) ConnectStopContinuousTimeTracking(fn func()) {
	ui.bridge.ConnectStopContinuousTimeTracking(fn)
}

func (ui *UI) ConnectSetComment(fn func(index int, taskID string, item *core.QObject, comment string)) {
	ui.bridge.ConnectSetComment(fn)
}

func (ui *UI) startContinuousTimeTracking(index int, taskID core.QString, item *core.QObject, comment core.QString) {
	fmt.Printf("StartContinuousTimeTracking: %#+v %#+v %#+v %#+v\n", index, taskID, item, comment)
}

func (ui *UI) stopContinuousTimeTracking() {
	fmt.Printf("StopContinuousTimeTracking\n")
}

func (ui *UI) setComment(index int, taskID string, item *core.QObject, comment string) {
	fmt.Printf("setComment: %#+v %#+v %#+v %#+v\n", index, taskID, item, comment)
}
