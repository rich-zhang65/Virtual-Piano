class Note {
  String note;
  AudioPlayer notePlayback;
  boolean isRest;
  
  Note(String n) {
    this.note = n;
    this.isRest = checkRest();
    
    if (!isRest) {
      this.notePlayback = minim.loadFile(this.note + ".wav"); // Load sound file with its respective string
    }
  }
  
  boolean checkRest() {
    // Detects if the current note is a rest
    if (this.note.equals("rest")) {
      return true;
    }
    else {
      return false;
    }
  }
  
  void playNote() {
    // Note will only play if note is not a rest, as there is no sound file for rest nor is it needed
    if (!isRest) {
      this.notePlayback.rewind();
      this.notePlayback.play();
    }
  }
}
