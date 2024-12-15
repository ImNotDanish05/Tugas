#include <Arduino.h>

const int button1Pin = 32;  // Pin for button 1
const int button2Pin = 33;  // Pin for button 2
const int button3Pin = 34;  // Pin for button 3

unsigned long lastButtonPressTime = 0;
const unsigned long debounceDelay = 50;  // Debounce delay in milliseconds
const unsigned long sequenceTimeout = 2000;  // 2 seconds timeout for sequences

enum ButtonPress {
  NONE,
  BUTTON1,
  BUTTON2,
  BUTTON3
};

ButtonPress lastButtonPress = NONE;

void setup() {
  pinMode(button1Pin, INPUT_PULLDOWN);
  pinMode(button2Pin, INPUT_PULLDOWN);
  pinMode(button3Pin, INPUT_PULLDOWN);
  Serial.begin(115200);
}

void loop() {
  int button1State = digitalRead(button1Pin);
  int button2State = digitalRead(button2Pin);
  int button3State = digitalRead(button3Pin);
  
  unsigned long currentTime = millis();
  Serial.println(currentTime);

  if (button1State == HIGH && (currentTime - lastButtonPressTime > debounceDelay)) {
    handleButtonPress(BUTTON1);
  } else if (button2State == HIGH && (currentTime - lastButtonPressTime > debounceDelay)) {
    handleButtonPress(BUTTON2);
  } else if (button3State == HIGH && (currentTime - lastButtonPressTime > debounceDelay)) {
    handleButtonPress(BUTTON3);
  }

  if (currentTime - lastButtonPressTime > sequenceTimeout && lastButtonPress != NONE) {
    executeCommand(lastButtonPress);
    lastButtonPress = NONE;
  }
}

void handleButtonPress(ButtonPress button) {
  unsigned long currentTime = millis();
  
  if (lastButtonPress == NONE || currentTime - lastButtonPressTime > sequenceTimeout) {
    lastButtonPress = button;
  } else {
    executeSequence(lastButtonPress, button);
    lastButtonPress = NONE;
  }
  
  lastButtonPressTime = currentTime;
}

void executeSequence(ButtonPress firstButton, ButtonPress secondButton) {
  if (firstButton == BUTTON1 && secondButton == BUTTON2) {
    Serial.println("Command: Button 1 -> Button 2");
  } else if (firstButton == BUTTON1 && secondButton == BUTTON3) {
    Serial.println("Command: Button 1 -> Button 3");
  } else if (firstButton == BUTTON2 && secondButton == BUTTON1) {
    Serial.println("Command: Button 2 -> Button 1");
  } else if (firstButton == BUTTON2 && secondButton == BUTTON3) {
    Serial.println("Command: Button 2 -> Button 3");
  } else if (firstButton == BUTTON3 && secondButton == BUTTON1) {
    Serial.println("Command: Button 3 -> Button 1");
  } else if (firstButton == BUTTON3 && secondButton == BUTTON2) {
    Serial.println("Command: Button 3 -> Button 2");
  }
}

void executeCommand(ButtonPress button) {
  if (button == BUTTON1) {
    Serial.println("Single Command: Button 1");
  } else if (button == BUTTON2) {
    Serial.println("Single Command: Button 2");
  } else if (button == BUTTON3) {
    Serial.println("Single Command: Button 3");
  }
}
