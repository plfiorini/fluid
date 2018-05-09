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
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
import Fluid.Controls 1.1 as FluidControls

Item {
    id: control

    property string name: ""

    signal clicked()

    width: 32
    height: 32

    FluidControls.Icon {
        id: icon

        anchors.centerIn: parent

        source: "qrc:/liri.io/imports/Fluid/Controls/window-controls/" + control.name + ".svg"

        width: size
        height: size
        size: 24

        MouseArea {
            anchors.fill: parent
            onClicked: control.clicked()
        }
    }
}
