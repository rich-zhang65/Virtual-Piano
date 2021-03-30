class Recording {
  String[] playbackNotes;
  int[] playbackDurations;
  ArrayList<String> notes;
  ArrayList<Integer> durations;
  
  Recording(String[] n, int[] d) {
    this.playbackNotes = n;
    this.playbackDurations = d;
    this.notes = new ArrayList<String>();
    this.durations = new ArrayList<Integer>();
  }
  
  void complete() {
    // Once recording is completed, copy all arraylist items into arrays
    // Since notes were only recorded when changes were made, track the last note played as it was included in the recording
    this.notes.add(currentNote.note);
    timeSinceNote = millis();
    recording.durations.add(timeSinceNote - recordTime);
    recordTime = millis();
    
    // Form arrays with equivalent sizes to arraylists
    playbackNotes = new String[this.notes.size()];
    playbackDurations = new int[this.durations.size()];
    
    // Copy values
    for (int i = 0; i < this.notes.size(); i++) {
      playbackNotes[i] = this.notes.get(i);
      playbackDurations[i] = this.durations.get(i);
    }
    
    // Let the user know they may save
    status_label.setText("Press Save Recording to keep this audio piece!");
  }
  
  void playbackRecording() {
    Note recordingNote;
    
    // Counts down prior to playing back
    metronome.countdown();
    int lastNote = millis();
    int playbackTime = millis();
    
    // Play through each note
    for (int i = 0; i < playbackNotes.length; i++) {
      recordingNote = new Note(playbackNotes[i]);
      if (!recordingNote.note.equals("rest")) {
        recordingNote.playNote();
        
        // Delay between each note
        while (playbackTime - lastNote < playbackDurations[i]) {
          playbackTime = millis();
        }
        
        lastNote = millis();
        
        recordingNote.notePlayback.pause();
      }
      
      // If note is a rest, just delay the program
      else {
         while (playbackTime - lastNote < playbackDurations[i]) {
          playbackTime = millis();
        }
        
        lastNote = millis();
      }
    }
  }
  
  void saveRecording() {
    // Lets the user know that they cannot save a blank recording
    if (playbackNotes.length == 0) {
      status_label.setText("Error: No audio recorded");
    }
    // Save the recording to recording text file
    else {
      PrintWriter rw = createWriter("Recording.txt");
      
      for (int i = 0; i < playbackNotes.length; i++) {
        rw.println(playbackNotes[i] + "," + playbackDurations[i]);
      }
      
      rw.close();
      
      // Lets the user know that recording has been successfully saved
      status_label.setText("Recording saved.");
    }
  }
}
