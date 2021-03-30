// Must download G4P GUI Editor (library and tool) to use GUI functions
import g4p_controls.*;

// Must download minim audio library to access sound features
import ddf.minim.*;

// Sound files
Minim minim = new Minim(this);
AudioPlayer metroBeat;

// Arrays of possible notes
String[] blackPrintNotes = {"C#/Db", "D#/Eb", "", "F#/Gb", "G#/Ab", "A#/Bb", "", "C#/Db", "D#/Eb", "", "F#/Gb", "G#/Ab", "A#/Bb"};
String[] whitePrintNotes = {"C", "D", "E", "F", "G", "A", "B", "C", "D", "E", "F", "G", "A", "B", "C"};
String[] blackPossibleNotes = {"csharp1", "dsharp1", "", "fsharp1", "gsharp1", "asharp1", "", "csharp2", "dsharp2", "", "fsharp2", "gsharp2", "asharp2"};
String[] whitePossibleNotes = {"c1", "d1", "e1", "f1", "g1", "a1", "b1", "c2", "d2", "e2", "f2", "g2", "a2", "b2", "c3"};

// Display variables
String noteText = "";
String countdownText = "";

// Sets starting mode of program
String currentMode = "Mouse";
Note currentNote = new Note("rest");

// Mouse detection variables
boolean blackHover;
boolean whiteHover;
boolean blackKeyPressed;
boolean whiteKeyPressed;

int blackHoverVal = -1;
int whiteHoverVal = -1;

// Keyboard detection variables
boolean keyPress;
int blackKeyValue = -1;
int whiteKeyValue = -1;

// Recording mode variables
boolean countdown = false;
boolean recordingMode = false;
int recordTime;
int timeSinceNote;
String recentNote = "rest";

// Recording arrays for notes and durations
String[] emptyNotes;
int[] emptyDurations;
Recording recording, demo1, demo2;

// Metronome variables
Metronome metronome;
boolean metronomeOn = false;
int bpm = 88;
int timeSinceLastBeat = millis();
int currentTime;

// Stores value for equal width between white keys
float keyWidth;

void setup() {
  size(1000, 700);
  frameRate(144);
  createGUI();
  
  // Calculates viable distance between white keys
  keyWidth = width / 15.0;
  
  // Loads starting metronome features
  metronome = new Metronome(bpm);
  metroBeat = minim.loadFile("beat.wav");
  
  // Load audio tracks from text files
  recording = loadRecording("Recording.txt");
  demo1 = loadRecording("demo1.txt");
  demo2 = loadRecording("demo2.txt");
  
  // If starting mode is mouse, checks position mouse is hovering over
  if (currentMode.equals("Mouse")) {
    checkHover();
  }
}

void draw() {
  background(0, 40, 100);
  
  // Draw in instruction box
  fill(255);
  rect(90, 40, 820, 145);
  fill(0);
  rect(100, 50, 800, 125);
  
  // Draw in note display box
  fill(255);
  rect(290, 215, 420, 145);
  fill(0);
  rect(300, 225, 400, 125);
  
  // Writes countdown text into instruction box
  textAlign(CENTER, CENTER);
  textSize(75);
  fill(255);
  text(countdownText, 500, 100);
  
  // Writes note label into display box
  textAlign(CENTER, CENTER);
  textSize(75);
  fill(255);
  text(noteText, 500, 275);
  
  // Draws white keys
  for (int i = 0; i < 15; i++) {
    // If the mode is currently for mouse, keys change colour according to mouse action
    if (currentMode.equals("Mouse")) {
      if (whiteKeyPressed && whiteHover && i == whiteHoverVal) { // If key is pressed, highlight white key blue
        fill(20, 200, 230);
      }
      else if (whiteHover && i == whiteHoverVal) { // If mouse is hovering over a key, highlight white key gray
        fill(190);
      }
      else { // Make white key white
        fill(255);
      }
      
      // If no keys are pressed, checks mouse position again
      if (!blackKeyPressed && !whiteKeyPressed) {
        whiteHoverVal = -1;
        checkHover();
      }
    }
    // If the mode is currently keyboard mode, highlight keys blue or white according to which corresponding keys are pressed
    else if (currentMode.equals("Keyboard")) {
      if (whiteKeyValue == i) { // If correct key is pressed (blue)
        fill(20, 200, 230);
      }
      else { // If key is not pressed (white)
        fill(255);
      }
    }
    
    // Draws white key
    rect(0 + keyWidth * i, height - 300, keyWidth, 300);
  }
  
  // Draws black keys
  for (int i = 0; i < 13; i++) {
    if (i != 2 && i != 6 && i != 9) {
      // Again, mouse mode draws keys according to mouse action
      if (currentMode.equals("Mouse")) {
        if (blackKeyPressed && blackHover && i == blackHoverVal) { // Mouse pressed highlights blue
          fill(20, 200, 230);
        }
        else if (blackHover && i == blackHoverVal) { // Mouse hovering highlights gray
          fill(190);
        }
        else { // No action highlights black
          fill(0);
        }
        
        // If keys are not pressed, calculate mouse position
        if (!blackKeyPressed && !whiteKeyPressed) {
          blackHoverVal = -1;
          checkHover();
        }
      }
      // If keyboard mode, colour keys black or blue according to proper keys
      else if (currentMode.equals("Keyboard")) {
        if (blackKeyValue == i) { // If correct key is pressed, highlight blue
          fill(20, 200, 230);
        }
        else { // If the proper key is not pressed, colour black
          fill(0);
        }
      }
      
      // Draws black key
      rect(keyWidth * (i + 1) - keyWidth / 3, height - 300, keyWidth / 3 * 2, 200);
    }  
  }
  
  // If metronome is on, play the metronome
  if (metronomeOn) {
    playMetronome();
  }
}

void mousePressed() {
  // Detect mouse press if currently mouse mode
  if (currentMode.equals("Mouse")) {
    // If mouse is on the piano and no keys were pressed previously (no dragging)
    if (!blackKeyPressed && !whiteKeyPressed) {
      if (mouseY >= height - 300 && mouseY <= height) {
        
        for (int i = 0; i < 14; i++) {
          if (i != 2 && i != 6 && i != 9 && i != 13) {
            if (mouseX >= keyWidth * (i + 1) - keyWidth / 3 && mouseX <= keyWidth * (i + 1) + keyWidth / 3) {
              if (mouseY >= height - 300 && mouseY <= height - 100) { // If mouse is within any of the black keys
                blackKeyPressed = true;
                break;
              }
            }
          }
        }
        // If mouse is on the piano but not on a black key, it is on a white key
        if (!blackKeyPressed) {
          whiteKeyPressed = true;
        }
      }
    }
    // Checks key mouse has played when mouse is pressed
    checkMouseKeyPlayed();
  }
}

void mouseReleased() {
  // When mouse is released in mouse mode, no keys are pressed
  if (currentMode.equals("Mouse")) { 
    blackKeyPressed = false;
    whiteKeyPressed = false;
    checkMouseKeyPlayed();
  }
}

void checkHover() {
  // Checks position of mouse and finds the corresponding key
  for (int i = 0; i < 13; i++) {
    if (i != 2 && i != 6 && i != 9) {
      if (mouseY <= height - 100 && mouseY >= height - 300) {
        if (mouseX >= keyWidth * (i + 1) - keyWidth / 3 && mouseX <= keyWidth * (i + 1) + keyWidth / 3) {
          blackHover = true; // The mouse is hovering over a black key
          blackHoverVal = i; // Records the current black key the mouse is hovering over
          break; // Breaks out of the loop
        }
        else {
          blackHover = false; // Not hovering over a black key
        }
      }
      else {
        blackHover = false; // Not hovering over a black key
      }
    }  
  }
  // If mouse is not hovering over a black key, it must be hovering over a white key
  if (!blackHover) {
    for (int i = 0; i < 15; i++) {
      if (mouseY <= height && mouseY >= height - 300) {
        if (mouseX >= 0 + keyWidth * i && mouseX <= 0 + keyWidth * (i + 1)) {
          whiteHover = true; // The mouse is hovering over a white key
          whiteHoverVal = i; // Records the current white key the mouse is hovering over
          break; // Breaks out of the loop
        }
        else {
          whiteHover = false; // Not hovering over a white key
        }
      }
      else {
        whiteHover = false; // Not hovering over a white key
      }
    }
  }
}

void checkMouseKeyPlayed() {
  // If a black key is being played
  if (blackKeyPressed) {
    for (int i = 0; i < blackPossibleNotes.length; i++) {
      if (i == blackHoverVal) {
        if (blackPossibleNotes[i] != currentNote.note) {
          // Sets the current note and matches the index to a pre-sorted array of possible notes
          recentNote = currentNote.note; // For recording mode
          currentNote = new Note(blackPossibleNotes[i]);
          currentNote.playNote(); // Plays the corresponding note
          noteText = blackPrintNotes[i]; // Prints the note onto the screen
        }
      }
    }
  }
  // If a white key is being played
  else if (whiteKeyPressed) {
    for (int i = 0; i < whitePossibleNotes.length; i++) {
      if (i == whiteHoverVal) {
        if (whitePossibleNotes[i] != currentNote.note) {
          // Sets the current note and matches the index to a pre-sorted array of possible notes
          recentNote = currentNote.note; // For recording mode
          currentNote = new Note(whitePossibleNotes[i]);
          currentNote.playNote(); // Plays the corresponding note
          noteText = whitePrintNotes[i]; // Prints the note onto the screen
        }
      }
    }
  }
  // If no keys are being played, then it is currently resting
  else {
    if (currentNote.note != "rest") {
      recentNote = currentNote.note; // For recording mode
      currentNote.notePlayback.pause();
      currentNote = new Note("rest");
      noteText = "";
    }
  }
  // If currently in recording mode, if there is a detection of note change, record how long the previous note was played for
  if (recordingMode) {
    if (!recentNote.equals(currentNote.note)) {
      recording.notes.add(recentNote);
      timeSinceNote = millis();
      recording.durations.add(timeSinceNote - recordTime);
      recordTime = millis();
    }
  }
}

void keyPressed() {
  // For keyboard mode
  if (currentMode.equals("Keyboard")) {
    if (!keyPress) {
      int keyboardNum = -1;
      String keyType = "none";
      
      // Matches the proper key to the corresponding released piano key
      switch(key) {
        case 'z':
          keyboardNum = 0;
          keyType = "white";
          break;
        case 'x':
          keyboardNum = 1;
          keyType = "white";
          break;
        case 'c':
          keyboardNum = 2;
          keyType = "white";
          break;
        case 'v':
          keyboardNum = 3;
          keyType = "white";
          break;
        case 'b':
          keyboardNum = 4;
          keyType = "white";
          break;
        case 'n':
          keyboardNum = 5;
          keyType = "white";
          break;
        case 'm':
          keyboardNum = 6;
          keyType = "white";
          break;
        case 's':
          keyboardNum = 0;
          keyType = "black";
          break;
        case 'd':
          keyboardNum = 1;
          keyType = "black";
          break;
        case 'g':
          keyboardNum = 3;
          keyType = "black";
          break;
        case 'h':
          keyboardNum = 4;
          keyType = "black";
          break;
        case 'j':
          keyboardNum = 5;
          keyType = "black";
          break;
        case 'q':
          keyboardNum = 7;
          keyType = "white";
          break;
        case 'w':
          keyboardNum = 8;
          keyType = "white";
          break;
        case 'e':
          keyboardNum = 9;
          keyType = "white";
          break;
        case 'r':
          keyboardNum = 10;
          keyType = "white";
          break;
        case 't':
          keyboardNum = 11;
          keyType = "white";
          break;
        case 'y':
          keyboardNum = 12;
          keyType = "white";
          break;
        case 'u':
          keyboardNum = 13;
          keyType = "white";
          break;
        case 'i':
          keyboardNum = 14;
          keyType = "white";
          break;
        case '2':
          keyboardNum = 7;
          keyType = "black";
          break;
        case '3':
          keyboardNum = 8;
          keyType = "black";
          break;
        case '5':
          keyboardNum = 10;
          keyType = "black";
          break;
        case '6':
          keyboardNum = 11;
          keyType = "black";
          break;
        case '7':
          keyboardNum = 12;
          keyType = "black";
          break;
      }
      
      // Finalizes which key is pressed and stores the values within global variables
      if (keyboardNum != -1) {
        keyPress = true;
        
        // If keyboard triggered a black key
        if (keyType.equals("black")) {
          recentNote = currentNote.note; // For recording mode
          blackKeyValue = keyboardNum;
          noteText = blackPrintNotes[keyboardNum];
          currentNote = new Note(blackPossibleNotes[keyboardNum]);
          currentNote.playNote();
        }
        // If keyboard triggered a white key
        else if (keyType.equals("white")) {
          recentNote = currentNote.note; // For recording mode
          whiteKeyValue = keyboardNum;
          noteText = whitePrintNotes[keyboardNum];
          currentNote = new Note(whitePossibleNotes[keyboardNum]);
          currentNote.playNote();
        }
        // If recording mode is active, if note change is detected then record previous note and duration
        if (recordingMode) {
          if (!recentNote.equals(currentNote.note)) {
            recording.notes.add(recentNote);
            timeSinceNote = millis();
            recording.durations.add(timeSinceNote - recordTime);
            recordTime = millis();
          }
        }
      }
    }
  }
}

void keyReleased() {
  // For keyboard mode
  if (currentMode.equals("Keyboard")) {
    if (keyPress) {
      int keyboardNum = -1;
      String keyType = "none";
      
      switch(key) {
        case 'z':
          keyboardNum = 0;
          keyType = "white";
          break;
        case 'x':
          keyboardNum = 1;
          keyType = "white";
          break;
        case 'c':
          keyboardNum = 2;
          keyType = "white";
          break;
        case 'v':
          keyboardNum = 3;
          keyType = "white";
          break;
        case 'b':
          keyboardNum = 4;
          keyType = "white";
          break;
        case 'n':
          keyboardNum = 5;
          keyType = "white";
          break;
        case 'm':
          keyboardNum = 6;
          keyType = "white";
          break;
        case 's':
          keyboardNum = 0;
          keyType = "black";
          break;
        case 'd':
          keyboardNum = 1;
          keyType = "black";
          break;
        case 'g':
          keyboardNum = 3;
          keyType = "black";
          break;
        case 'h':
          keyboardNum = 4;
          keyType = "black";
          break;
        case 'j':
          keyboardNum = 5;
          keyType = "black";
          break;
        case 'q':
          keyboardNum = 7;
          keyType = "white";
          break;
        case 'w':
          keyboardNum = 8;
          keyType = "white";
          break;
        case 'e':
          keyboardNum = 9;
          keyType = "white";
          break;
        case 'r':
          keyboardNum = 10;
          keyType = "white";
          break;
        case 't':
          keyboardNum = 11;
          keyType = "white";
          break;
        case 'y':
          keyboardNum = 12;
          keyType = "white";
          break;
        case 'u':
          keyboardNum = 13;
          keyType = "white";
          break;
        case 'i':
          keyboardNum = 14;
          keyType = "white";
          break;
        case '2':
          keyboardNum = 7;
          keyType = "black";
          break;
        case '3':
          keyboardNum = 8;
          keyType = "black";
          break;
        case '5':
          keyboardNum = 10;
          keyType = "black";
          break;
        case '6':
          keyboardNum = 11;
          keyType = "black";
          break;
        case '7':
          keyboardNum = 12;
          keyType = "black";
          break;
      }
      
      if (keyboardNum != -1) {
        if ((keyType.equals("white") && keyboardNum == whiteKeyValue) || (keyType.equals("black") && keyboardNum == blackKeyValue)) {
          recentNote = currentNote.note; // For recording mode
          currentNote.notePlayback.pause();
          blackKeyValue = -1;
          whiteKeyValue = -1;
          noteText = "";
          currentNote = new Note("rest");
          keyPress = false;
        }
        // If recording mode is active, store the note and duration of note into recording arrays
        if (recordingMode) {
          if (!recentNote.equals(currentNote.note)) {
            recording.notes.add(recentNote);
            timeSinceNote = millis();
            recording.durations.add(timeSinceNote - recordTime);
            recordTime = millis();
          }
        }
      }
    }
  }
}

void playMetronome() {
  // Counts the current time program is at
  currentTime = millis();
  
  // Makes sure beats are played on time with the metronome, and maintains a number of beats per minute
  if (currentTime - timeSinceLastBeat >= metronome.msBetweenBeats) {
    metronome.playBeat();
  }
  
  // Cuts off audio every 80 milliseconds to prevent overload
  while (millis() - timeSinceLastBeat < 80) {
  }
  
  // Pauses/cuts off audio
  metroBeat.pause();
}

Recording loadRecording(String f) {
  // Loads strings from specified text file
  String[] audioRows = loadStrings(f);
  String[] savedNotes = new String[audioRows.length]; // Create new arrays which will have the notes and durations that were saved
  int[] savedDurations = new int[audioRows.length];
  
  // Split up strings and sort the values into the respective arrays
  for (int i = 0; i < audioRows.length; i++) {
    String currentRow = audioRows[i];
    String[] notesAndTime = currentRow.split(",");
    
    savedNotes[i] = notesAndTime[0];
    savedDurations[i] = int(notesAndTime[1]);
  }
  
  // Return recording object that has pre-recorded audio
  return new Recording(savedNotes, savedDurations);
}
