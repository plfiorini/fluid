/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick 2.10
import QtQuick.Window 2.3
import QtQuick.Controls 2.3
import Fluid.Controls.Private 1.0 as FluidControlsPrivate
import Qt.labs.handlers 1.0

ToolBar {
    id: titleBar

    property alias title: titleLabel.text

    signal minimizeRequested()
    signal maximizeRequested()
    signal closeRequested()

    leftPadding: 8
    rightPadding: 8

    contentHeight: 32

    implicitHeight: 32

    Item {
        anchors.fill: parent

        TapHandler {
            onTapped: if (tapCount === 2) toggleMaximized()
            gesturePolicy: TapHandler.DragThreshold
        }

        DragHandler {
            grabPermissions: TapHandler.CanTakeOverFromAnything
            onGrabChanged: {
                if (active) {
                    var position = parent.mapToItem(window.contentItem, point.position.x, point.position.y)
                    //window.startSystemMove(position);
                }
            }
        }

        Label {
            id: titleLabel

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            font.pixelSize: 16
            font.bold: true
        }

        Row {
            anchors.top: parent.top
            anchors.right: parent.right

            spacing: 8

            FluidControlsPrivate.TitleBarButton {
                name: "window-minimize"
                onClicked: titleBar.minimizeRequested()
            }

            FluidControlsPrivate.TitleBarButton {
                name: window.visibility === Window.Maximized ? "window-restore" : "window-maximize"
                onClicked: titleBar.maximizeRequested()
            }

            FluidControlsPrivate.TitleBarButton {
                name: "window-close"
                onClicked: titleBar.closeRequested()
            }
        }
    }
}
