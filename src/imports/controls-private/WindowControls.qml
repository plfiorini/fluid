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

Row {
    id: windowControls

    signal minimizeRequested()
    signal maximizeRequested()
    signal closeRequested()

    spacing: 8

    ToolButton {
        icon.source: "qrc:/liri.io/imports/Fluid/Controls/window-controls/window-minimize.svg"
        onClicked: windowControls.minimizeRequested()
    }

    ToolButton {
        icon.source: "qrc:/liri.io/imports/Fluid/Controls/window-controls/window-" + (window.visibility === Window.Maximized ? "restore" : "maximize") + ".svg"
        onClicked: windowControls.maximizeRequested()
    }

    ToolButton {
        icon.source: "qrc:/liri.io/imports/Fluid/Controls/window-controls/window-close.svg"
        onClicked: windowControls.closeRequested()
    }
}
