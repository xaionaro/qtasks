package ui

import (
	"github.com/therecipe/qt/core"
)

type Bridge struct {
	core.QObject

	_ func(index int, taskID core.QString, item *core.QObject, since, until, comment core.QString) `slot:"logOnce"`
	_ func(index int, taskID core.QString, item *core.QObject, comment core.QString)               `slot:"setComment"`
	_ func(index int, taskID core.QString, item *core.QObject, comment core.QString)               `slot:"sendComment"`
	_ func(index int, taskID core.QString, item *core.QObject, comment core.QString)               `slot:"startContinuousTimeTracking"`
	_ func()                                                                                       `slot:"stopContinuousTimeTracking"`

	_ func(index int, taskID core.QString, item *core.QObject) `slot:"taskSelect"`
	_ func(index int, taskID core.QString, item *core.QObject) `slot:"taskOpenInBrowser"`
	_ func(index int, taskID core.QString, item *core.QObject) `slot:"taskRemove"`
	_ func(index int, taskID core.QString, item *core.QObject) `slot:"taskClose"`

	_ func(index int, taskID core.QString, item *core.QObject) `slot:"findTaskSelect"`
	_ func(pattern core.QString)                               `slot:"findTaskUpdateFilter"`

	_ func(item *core.QObject)            `slot:"noteSelect"`
	_ func(item *core.QObject)            `slot:"noteSaveToFile"`
	_ func(item *core.QObject)            `slot:"noteRenderToFile"`
	_ func(item *core.QObject)            `slot:"noteUpdate"`
	_ func(index int, item *core.QObject) `slot:"noteAdd"`
	_ func(item *core.QObject)            `slot:"noteRemove"`

	_ func(since, until core.QString)                          `slot:"activityLogDateRangeChange"`
	_ func(index int, taskID core.QString, item *core.QObject) `slot:"activityLogSelect"`
	_ func(index int, taskID core.QString, item *core.QObject) `slot:"activityLogOpenInBrowser"`
}
