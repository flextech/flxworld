interface Visible {
  /* Everything that can be drawn should implement Visible.
  This allows us to have collections of Visibles which we
  can iterate over */
  void draw();
}
