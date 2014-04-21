class IntegerSet {
  int[] values = new int[0];

  void add(int value) {
    int[] newValues = new int[values.length + 1];
    for (int i = 0; i < values.length; ++i ) {
      if (values[i] == value) {
        //already have it
        return;
      }
      newValues[i] = values[i];
    }
    newValues[values.length] = value;
    values = newValues;
  }

  boolean hasValue(int value) {
    for (int i = 0; i < values.length; ++i ) {
      if (values[i] == value) {
        return true;
      }
    }
    return false;
  }

  boolean isEmpty() {
    return values.length == 0;
  }

  void remove(int value) {
    int[] newValues = new int[values.length - 1];
    int newIndex = 0;
    for (int i = 0; i < values.length; ++i ) {
      if (values[i] != value) {
        //copy, don't remove
        newValues[newIndex++] = values[i];
      }
    }
    values = newValues;
  }
}

