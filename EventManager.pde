class EventManager {
  // An EventManager keeps track of which keys are currently pressed.
  boolean shiftPressed = true;

  IntegerSet keySet = new IntegerSet();

  void keyPressed() {
    shiftPressed = lastKeyWasShift();
    if (!shiftPressed) {
      keySet.add(key);
    }
  }

  void keyReleased() {
    if(lastKeyWasShift()) {
      shiftPressed = false;
    }
    if (!shiftPressed) {
      keySet.remove(key);
    }
  }

  boolean shiftIsPressed() {
    return shiftPressed;
  }


  boolean hasKey(int c) {
    return keySet.hasValue(c);
  }
  
  boolean lastKeyWasShift() {
    return (key == CODED) && (keyCode == SHIFT);
  }
}

