import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3

import Core.SettingsManager 1.0

GridLayout {
	property ApplicationWindow mainWindow;
	property SettingsManager manager;

	visible: mainWindow.showSettingsPage
	anchors.fill: parent
	columns: 1
	ColumnLayout {
		Layout.column: 0
		Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

		Switch {
			id: darkModeSwitch
			checked: mainWindow.isDarkMode
			text: qsTr("Enable Dark Mode.")
		}

		Switch {
			id: notifySend
			checked: mainWindow.isUseNotifySend
			text: qsTr("Use notify send if possible.")
		}

		Switch {
			id: runOnStartupSwitch
			checked: mainWindow.isRunOnStartup
			text: qsTr("Start Blue Glow on System Startup.")
		}
		Switch {
			id: showNotificationsSwitch
			checked: mainWindow.isShowNotifications
			text: qsTr("Show popup messages on new notification.")
		}
		Switch {
			id: useSoundAlertSwitch
			checked: mainWindow.isUseSoundAlert
			text: qsTr("Alert with Sound on new notification.")
		}

		RowLayout {
			Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
			spacing: 10	

		Button {
			id: saveBtn
			objectName: "save"
			highlighted: true	
			
			Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
			Layout.preferredWidth: 185
			Layout.preferredHeight: 70
			text: qsTr("Save")
			Material.background: Material.Teal
			onClicked: {
				manager.setSettings(darkModeSwitch.checked, runOnStartupSwitch.checked, 
				showNotificationsSwitch.checked, useSoundAlertSwitch.checked, 
			        notifySend.checked);
			}
		}
			Button {
			id: resetBtn
			objectName: "reset"
			highlighted: true	
			
			Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
			Layout.preferredWidth: 185
			Layout.preferredHeight: 70
			text: qsTr("Reset")
			onClicked: {
				darkModeSwitch.checked = mainWindow.isDarkMode;
				runOnStartupSwitch.checked = mainWindow.isRunOnStartup;
				showNotificationsSwitch.checked = mainWindow.isShowNotifications;
				useSoundAlertSwitch.checked = mainWindow.isUseSoundAlert;
				notifySend.checked = mainWindow.isUseNotifySend;
			}
		}
			Button {
			id: deleteBtn
			objectName: "delete"
			highlighted: true	
			
			Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
			Layout.preferredWidth: 185
			Layout.preferredHeight: 70
			text: qsTr("Delete Token")
			Material.background: Material.Red
			onClicked: {
				manager.deleteToken();
			}
		}
	    } // Close Row Layout	
	} // Close ColumnLayout 1
}

