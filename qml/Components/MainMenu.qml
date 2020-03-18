import QtQuick 2.12
import QtQuick.Controls 2.12

MenuBar {
	property ApplicationWindow mainWindow; 
        Menu {
	    title: qsTr("File")

	    MenuItem {
		text: qsTr("Minimize")
		onTriggered: {
			mainWindow.visible = false;
		}
	    }

	    MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
	    }
        }
	Menu {
	    title: qsTr("Help")
	    MenuItem {
		text: qsTr("About")
		onTriggered: {
			mainWindow.showAuthPage = false;
			mainWindow.showSettingsPage = false;
			mainWindow.showAboutPage = true;
		}
	    }
        }
}

