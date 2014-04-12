class EventManager {
  IntegerSet keySet = new IntegerSet();

  void keyPressed() {
    keySet.add(key);
  }

  void keyReleased() {
    keySet.remove(key);
  }

  boolean hasKey(int c) {
    return keySet.hasValue(c);
  }
}

