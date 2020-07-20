import QtQuick 2.12
import Felgo 3.0

Item {
    id: root_testing

// *** UI TESTING ***

    // EDITOR SETTINGS ITEM

    function checkEditorSettingsItemUI(item) {

        let widthTest
        if (item.width === root_app.width) {
            widthTest = true
        } else {
            widthTest = false
        }

        let heightTest
        if (item.height === root_app.height * 0.5) {
            heightTest = true
        } else {
            heightTest = false
        }

        let xTest
        if (item.x === 0) {
            xTest = true
        } else {
            xTest = false
        }

        let yTest
        if (item.y === root_app.height * 0.5) {
            yTest = true
        } else {
            yTest = false
        }

        let radiusTest
        if (item.radius === dp(18)) {
            radiusTest = true
        } else {
            radiusTest = false
        }

        let colorTest
        if (item.color === app_dark) {
            colorTest = true
        } else {
            colorTest = false
        }

        let passed
        if (widthTest === true && heightTest === true && xTest === true && yTest === true && radiusTest === true && colorTest === true) {
            passed = true
        } else {
            passed = false
        }

        let testDict = {
            passed: passed,
            widthTest: widthTest,
            heightTest: heightTest,
            xTest: xTest,
            yTest: yTest,
            radiusTest: radiusTest,
            colorTest: colorTest
        }


        if (testDict['passed'] === true) {
            console.log("[✔️] checkEditorSettingsItemUI: ", "item: ", item, "result: ", testDict['passed'])
        } else {
            console.log("[❌] checkEditorSettingsItemUI: ", "item: ", item, "result: ", testDict['passed'])
            console.log("testDict: ", Object.entries(testDict))
        }

        return testDict

    }

    // EDITOR SETTINGS BUTTONS

    function checkEditorSettingsButtons(item, top_buttons, add_button, settings_button, layers_button) {

        let widthTest
        if (top_buttons.width === item.width * 0.9) {
            widthTest = true
        } else {
            widthTest = false
        }

        let heightTest
        if (top_buttons.height === dp(36)) {
            heightTest = true
        } else {
            heightTest = false
        }

        let xTest
        if (top_buttons.x === item.width * 0.05) {
            xTest = true
        } else {
            xTest = false
        }

        let yTest
        if (top_buttons.y === dp(24)) {
            yTest = true
        } else {
            yTest = false
        }

        let buttonsWidthTest
        if (add_button.width === settings_button.width && add_button.width === layers_button.width) {
            if (add_button.width === top_buttons.width * 0.28) {
                buttonsWidthTest = true
            } else {
                buttonsWidthTest = false
            }
        } else {
            buttonsWidthTest = false
        }

        let buttonsRadiusTest
        if (add_button.radius === settings_button.radius && add_button.radius === layers_button.radius) {
            if (add_button.radius === add_button.height) {
                buttonsRadiusTest = true
            } else {
                buttonsRadiusTest = false
            }
        } else {
            buttonsRadiusTest = false
        }

        let buttonsColorTest
        if (add_button.color === app_blue && settings_button.color === layers_button.color) {
            if (settings_button.color == '#00000000') {
                buttonsColorTest = true
            } else {
                buttonsColorTest = false
            }
        } else {
            buttonsColorTest = false
        }

        let passed
        if (widthTest === true && heightTest === true && xTest === true && yTest === true &&
                buttonsWidthTest === true && buttonsRadiusTest === true && buttonsColorTest === true) {
            passed = true
        } else {
            passed = false
        }

        let testDict = {
            passed: passed,
            widthTest: widthTest,
            heightTest: heightTest,
            xTest: xTest,
            yTest: yTest,
            buttonsWidthTest: buttonsWidthTest,
            buttonsRadiusTest: buttonsRadiusTest,
            buttonsColorTest: buttonsColorTest
        }


        if (testDict['passed'] === true) {
            console.log("[✔️] checkEditorSettingsButtons: ", "item: ", item, "result: ", testDict['passed'])
        } else {
            console.log("[❌] checkEditorSettingsItemUI: ", "item: ", item, "result: ", testDict['passed'])
            console.log("testDict: ", Object.entries(testDict))
        }

        return testDict

    }

    // EDITOR SETTINGS SVIEW

    function checkEditorSettingsSview(item, top_buttons, bottom_sview, editor_sview) {

        let widthTest
        if (bottom_sview.width === item.width) {
            widthTest = true
        } else {
            widthTest = false
        }

        let heightTest
        if (parseInt(bottom_sview.height) ===
                parseInt(item.height - (top_buttons.y +top_buttons.height + bottom_sview.anchors.topMargin))) {
            heightTest = true
        } else {
            heightTest = false
        }

        let xTest
        if (bottom_sview.x === 0) {
            xTest = true
        } else {
            xTest = false
        }

        let yTest
        if (parseInt(bottom_sview.y) === parseInt((top_buttons.y + top_buttons.height + bottom_sview.anchors.topMargin))) {
            yTest = true
        } else {
            yTest = false
        }

        let currIndexTest
        if (editor_sview.currentIndex === 0) {
            currIndexTest = true
        } else {
            currIndexTest = false
        }

        let passed
        if (widthTest === true && heightTest === true && xTest === true && yTest === true && currIndexTest === true) {
            passed = true
        } else {
            passed = false
        }

        let testDict = {
            passed: passed,
            widthTest: widthTest,
            heightTest: heightTest,
            xTest: xTest,
            yTest: yTest,
            currIndexTest: currIndexTest
        }


        if (testDict['passed'] === true) {
            console.log("[✔️] checkEditorSettingsSview: ", "item: ", item, "result: ", testDict['passed'])
        } else {
            console.log("[❌] checkEditorSettingsItemUI: ", "item: ", item, "result: ", testDict['passed'])
            console.log("testDict: ", Object.entries(testDict))
        }

        return testDict

    }

}
