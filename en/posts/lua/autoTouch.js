// --------------------------------------
// Information of recording
// Time: 2022-05-06 15:22:09
// Resolution: 640, 1136
// Front most app: AutoTouch
// Orientation of front most app: Portrait
// --------------------------------------

const { touchDown, touchMove, touchUp, usleep, appActivate, keyDown, keyUp } = at


// appActivate("me.autotouch.AutoTouch.ios8");

// Import required classes of iOS/Objective-C
const UIAlertView = use_jsbridge('UIAlertView')
// You can also use it directly like this: `use_jsbridge('UIAlertView').alloc().init()`

//-------------------------------------------------------------------------------
// !!!!!!!!ANYTHING relative to UI should be in dispatch_async_main block!!!!!!!!
//-------------------------------------------------------------------------------
dispatch_async_main(function () {
    // Show an alert view of iOS
    var alertView = use_jsbridge('UIAlertView').alloc().init();

    alertView.setTitle('What is this?');
    alertView.setMessage('This is UIAlertView of iOS which is called through JSBridge, you can use JSBridge to call any class/methods/variables of iOS, it makes anything possible!');
    alertView.addButtonWithTitle('OK');

    alertView.show();
})

// const label = { type: CONTROLLER_TYPE.LABEL, text: "Would you mind to provide some personal informations?" }
// const nameInput = { type: CONTROLLER_TYPE.INPUT, title: "Name:", key: "Name", value: "Bob" }
// const positionPicker = { type: CONTROLLER_TYPE.PICKER, title: "Position:", key: "Position", value: "CEO", options: ["CEO", "CTO", "CFO", "CXO"] }
// const developerSwitch = { type: CONTROLLER_TYPE.SWITCH, title: "A Developer:", key: "ADeveloper", value: 1 }

// // It's an option for users to determine weather the inputs should be remembered, if you use this control in the dialog.
// const remember = { type: CONTROLLER_TYPE.REMEMBER, on: false }

// /*
// Define buttons:
// type = CONTROLLER_TYPE.BUTTON
// title = Button text
// color = Button background color, it's optional, the default value is 0x428BCA
// width = Button width upon percentage of the dialog width, it's optional, the default value is 0.5, max value is 1.0.
// flag = Integer type of button flag for identifying which button is tapped.
// collectInputs = Boolean type specifying wheather the dialog should collect the inputs while this button is tapped.
// */
// const btn1 = { type: CONTROLLER_TYPE.BUTTON, title: "Button 1", color: 0x71C69E, width: 0.8, flag: 1, collectInputs: true }
// const btn2 = { type: CONTROLLER_TYPE.BUTTON, title: "Button 2", color: 0xFF5733, flag: 2, collectInputs: true }
// const btn3 = { type: CONTROLLER_TYPE.BUTTON, title: "Button 3", color: 0xFFB7D0, width: 1.0, flag: 3, collectInputs: false }
// const btn4 = { type: CONTROLLER_TYPE.BUTTON, title: "Button 4", width: 1.0, flag: 4, collectInputs: true }

// const controls = [label, nameInput, positionPicker, developerSwitch, btn1, btn2, remember, btn3, btn4]

// // Pop up the dialog. After popping, the script will suspend waiting for user input until any button is tapped, then returns the flag of tapped button.

// // What orientations the dialog could be, it's optional
// const orientations = [INTERFACE_ORIENTATION_TYPE.LANDSCAPE_LEFT, INTERFACE_ORIENTATION_TYPE.LANDSCAPE_RIGHT];

// const result = at.dialog({ controls, orientations });

// if (result == 1) {
//     alert("name:%s, birthday:%s, gender:%d", nameInput.value, positionPicker.value, developerSwitch.value)
// } else {
//     alert("Dialog returned: %s", result)
// }

// keyDown(KEY_TYPE.HOME_BUTTON);
// usleep(210379.33);
// keyUp(KEY_TYPE.HOME_BUTTON);
// usleep(139874.00);
// keyUp(KEY_TYPE.HOME_BUTTON);
// usleep(1144181.58);

// touchDown(5, 131.05, 409.76);
// usleep(33364.67);
// touchMove(5, 160.53, 409.76);
// usleep(16492.92);
// touchMove(5, 178.81, 412.79);
// usleep(16842.92);
// touchMove(5, 205.22, 420.90);
// usleep(16647.12);
// touchMove(5, 234.69, 430.02);
// usleep(16622.50);
// touchMove(5, 272.29, 441.17);
// usleep(16645.00);
// touchMove(5, 304.79, 455.35);
// usleep(16689.54);
// touchMove(5, 333.24, 474.59);
// usleep(16508.54);
// touchUp(5, 356.61, 496.88);
// usleep(1117099.67);

// touchDown(4, 194.05, 388.47);
// usleep(16409.12);
// touchMove(4, 180.84, 387.47);
// usleep(16612.38);
// touchMove(4, 163.57, 387.47);
// usleep(16949.62);
// touchMove(4, 141.22, 380.38);
// usleep(16569.04);
// touchMove(4, 90.42, 336.80);
// usleep(16399.29);
// touchUp(4, 28.45, 294.26);
// usleep(2450580.29);

// touchDown(8, 237.73, 825.15);
// usleep(33116.25);
// touchUp(8, 237.73, 825.15);
// usleep(1490067.29);

// keyDown(KEY_TYPE.HOME_BUTTON);
// usleep(191630.04);
// keyUp(KEY_TYPE.HOME_BUTTON);
// usleep(158470.17);
// keyUp(KEY_TYPE.HOME_BUTTON);
