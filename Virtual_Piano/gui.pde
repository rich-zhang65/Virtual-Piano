/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void tools_window_draw(PApplet appc, GWinData data) { //_CODE_:tools_window:304903:
  appc.background(230);
} //_CODE_:tools_window:304903:

public void tempo_incr_button_click(GButton source, GEvent event) { //_CODE_:tempo_incr_button:332781:
  if (!recordingMode) {  
    metronome_button.setText("Off");
    metronome_button.setLocalColorScheme(GCScheme.GOLD_SCHEME);
    metronomeOn = false;
    
    if (bpm >= 60 && bpm <= 69) {
      bpm += 3;
    }
    else if (bpm >= 72 && bpm <= 116) {
      bpm += 4;
    }
    metronome = new Metronome(bpm);
    tempo_label.setText(str(bpm));
  }
} //_CODE_:tempo_incr_button:332781:

public void tempo_decr_button_click(GButton source, GEvent event) { //_CODE_:tempo_decr_button:746904:
  if (!recordingMode) {  
    metronome_button.setText("Off");
    metronome_button.setLocalColorScheme(GCScheme.GOLD_SCHEME);
    metronomeOn = false;
    
    if (bpm <= 120 && bpm >= 76) {
      bpm -= 4;
    }
    else if (bpm <= 72 && bpm >= 63) {
      bpm -=3;
    }
    metronome = new Metronome(bpm);
    tempo_label.setText(str(bpm));
  }
} //_CODE_:tempo_decr_button:746904:

public void note_image_button_click(GImageButton source, GEvent event) { //_CODE_:note_image_button:574222:
} //_CODE_:note_image_button:574222:

public void metronome_button_click(GButton source, GEvent event) { //_CODE_:metronome_button:531094:
  if (!recordingMode) {  
    if (metronomeOn) {
      metronome_button.setText("Off");
      metronome_button.setLocalColorScheme(GCScheme.GOLD_SCHEME);
      metronomeOn = false;
    }
    else {
      metronome_button.setText("On");
      metronome_button.setLocalColorScheme(GCScheme.GREEN_SCHEME);
      metronomeOn = true;
    }
  }
} //_CODE_:metronome_button:531094:

public void recording_button_click(GButton source, GEvent event) { //_CODE_:recording_button:417799:
  if (recordingMode) {
    recordingMode = false;
    recording.complete();
    recording_button.setText("Off");
    recording_button.setLocalColorScheme(GCScheme.GOLD_SCHEME);
    metronome_button.setText("Off");
  }
  else {
    recordingMode = true;
    recording_button.setText("On");
    recording_button.setLocalColorScheme(GCScheme.RED_SCHEME);
    metronome_button.setText("Recording...");
    metronome_button.setLocalColorScheme(GCScheme.GOLD_SCHEME);
    status_label.setText("");
    recording = new Recording(emptyNotes, emptyDurations);
    metronomeOn = false;
    metronome.countdown();
  }
} //_CODE_:recording_button:417799:

public void recording_save_button_click(GButton source, GEvent event) { //_CODE_:recording_save_button:503034:
  recording.saveRecording();
} //_CODE_:recording_save_button:503034:

public void recording_play_button_click(GButton source, GEvent event) { //_CODE_:recording_play_button:312084:
  if (!recordingMode) {
    recording.playbackRecording();
  }
} //_CODE_:recording_play_button:312084:

public void demo_button1_click(GButton source, GEvent event) { //_CODE_:demo_button1:494853:
  if (!recordingMode) {
    demo1.playbackRecording();
  }
} //_CODE_:demo_button1:494853:

public void demo_button2_click(GButton source, GEvent event) { //_CODE_:demo_button2:481148:
  if (!recordingMode) {
    demo2.playbackRecording();
  }
} //_CODE_:demo_button2:481148:

public void mode_button_click(GButton source, GEvent event) { //_CODE_:mode_button:596297:
  if (!blackKeyPressed && !whiteKeyPressed && !keyPress) {  
    if (currentMode.equals("Mouse")) {
      currentMode = "Keyboard";
    }
    else if (currentMode.equals("Keyboard")) {
      currentMode = "Mouse";
    }
    mode_button.setText(currentMode);
  }
} //_CODE_:mode_button:596297:

synchronized public void layout_window_draw(PApplet appc, GWinData data) { //_CODE_:layout_window:616343:
  appc.background(230);
} //_CODE_:layout_window:616343:

public void c2kc(GButton source, GEvent event) { //_CODE_:c2k:387230:
} //_CODE_:c2k:387230:

public void d2kc(GButton source, GEvent event) { //_CODE_:d2k:722159:
} //_CODE_:d2k:722159:

public void e2kc(GButton source, GEvent event) { //_CODE_:e2k:532252:
} //_CODE_:e2k:532252:

public void f2kc(GButton source, GEvent event) { //_CODE_:f2k:301374:
} //_CODE_:f2k:301374:

public void g2kc(GButton source, GEvent event) { //_CODE_:g2k:286706:
} //_CODE_:g2k:286706:

public void a2kc(GButton source, GEvent event) { //_CODE_:a2k:301952:
} //_CODE_:a2k:301952:

public void b2kc(GButton source, GEvent event) { //_CODE_:b2k:750953:
} //_CODE_:b2k:750953:

public void c3kc(GButton source, GEvent event) { //_CODE_:c3k:855348:
} //_CODE_:c3k:855348:

public void csharp2kc(GButton source, GEvent event) { //_CODE_:csharp2k:873164:
} //_CODE_:csharp2k:873164:

public void dsharp2kc(GButton source, GEvent event) { //_CODE_:dsharp2k:846126:
} //_CODE_:dsharp2k:846126:

public void fsharp2kc(GButton source, GEvent event) { //_CODE_:fsharp2k:789284:
} //_CODE_:fsharp2k:789284:

public void gsharp2kc(GButton source, GEvent event) { //_CODE_:gsharp2k:684337:
} //_CODE_:gsharp2k:684337:

public void asharp2kc(GButton source, GEvent event) { //_CODE_:asharp2k:829938:
} //_CODE_:asharp2k:829938:

public void c1kc(GButton source, GEvent event) { //_CODE_:c1k:222179:
} //_CODE_:c1k:222179:

public void d1kc(GButton source, GEvent event) { //_CODE_:d1k:622758:
} //_CODE_:d1k:622758:

public void e1kc(GButton source, GEvent event) { //_CODE_:e1k:514252:
} //_CODE_:e1k:514252:

public void f1kc(GButton source, GEvent event) { //_CODE_:f1k:285364:
} //_CODE_:f1k:285364:

public void g1kc(GButton source, GEvent event) { //_CODE_:g1k:249282:
} //_CODE_:g1k:249282:

public void a1kc(GButton source, GEvent event) { //_CODE_:a1k:630816:
} //_CODE_:a1k:630816:

public void b1kc(GButton source, GEvent event) { //_CODE_:b1k:792351:
} //_CODE_:b1k:792351:

public void csharp1kc(GButton source, GEvent event) { //_CODE_:csharp1k:857190:
} //_CODE_:csharp1k:857190:

public void dsharp1kc(GButton source, GEvent event) { //_CODE_:dsharp1k:841344:
} //_CODE_:dsharp1k:841344:

public void fsharp1kc(GButton source, GEvent event) { //_CODE_:fsharp1k:465609:
} //_CODE_:fsharp1k:465609:

public void gsharp1kc(GButton source, GEvent event) { //_CODE_:gsharp1k:437617:
} //_CODE_:gsharp1k:437617:

public void asharp1kc(GButton source, GEvent event) { //_CODE_:asharp1k:642255:
} //_CODE_:asharp1k:642255:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Virtual Piano");
  tools_window = GWindow.getWindow(this, "Tools", 100, 100, 300, 500, JAVA2D);
  tools_window.noLoop();
  tools_window.setActionOnClose(G4P.KEEP_OPEN);
  tools_window.addDrawHandler(this, "tools_window_draw");
  tempo_incr_button = new GButton(tools_window, 90, 83, 24, 21);
  tempo_incr_button.setText("+");
  tempo_incr_button.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  tempo_incr_button.addEventHandler(this, "tempo_incr_button_click");
  tempo_decr_button = new GButton(tools_window, 90, 106, 24, 21);
  tempo_decr_button.setTextAlign(GAlign.CENTER, GAlign.BOTTOM);
  tempo_decr_button.setText("-");
  tempo_decr_button.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  tempo_decr_button.addEventHandler(this, "tempo_decr_button_click");
  note_image_button = new GImageButton(tools_window, 30, 90, 18, 30, new String[] { "quarter_note.png", "quarter_note.png", "quarter_note.png" } );
  note_image_button.addEventHandler(this, "note_image_button_click");
  metronome_button = new GButton(tools_window, 30, 130, 80, 30);
  metronome_button.setText("Off");
  metronome_button.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  metronome_button.addEventHandler(this, "metronome_button_click");
  metronome_label = new GLabel(tools_window, 30, 60, 80, 20);
  metronome_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  metronome_label.setText("Metronome");
  metronome_label.setOpaque(false);
  tempo_label = new GLabel(tools_window, 50, 95, 32, 20);
  tempo_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  tempo_label.setText("88");
  tempo_label.setOpaque(false);
  options_window_label = new GLabel(tools_window, 100, 20, 100, 20);
  options_window_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  options_window_label.setText("Piano Settings");
  options_window_label.setOpaque(false);
  recording_label = new GLabel(tools_window, 160, 125, 100, 20);
  recording_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  recording_label.setText("Recording Mode");
  recording_label.setOpaque(false);
  recording_button = new GButton(tools_window, 195, 150, 30, 30);
  recording_button.setText("Off");
  recording_button.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  recording_button.addEventHandler(this, "recording_button_click");
  recording_options_click = new GLabel(tools_window, 95, 200, 110, 20);
  recording_options_click.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  recording_options_click.setText("Recording Options");
  recording_options_click.setOpaque(false);
  recording_save_button = new GButton(tools_window, 35, 240, 100, 30);
  recording_save_button.setText("Save Recording");
  recording_save_button.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  recording_save_button.addEventHandler(this, "recording_save_button_click");
  recording_play_button = new GButton(tools_window, 165, 240, 100, 30);
  recording_play_button.setText("Play Recording");
  recording_play_button.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  recording_play_button.addEventHandler(this, "recording_play_button_click");
  demo_label = new GLabel(tools_window, 110, 365, 80, 20);
  demo_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  demo_label.setText("Demos");
  demo_label.setOpaque(false);
  status_label = new GLabel(tools_window, 50, 290, 200, 60);
  status_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  status_label.setLocalColorScheme(GCScheme.RED_SCHEME);
  status_label.setOpaque(false);
  demo_button1 = new GButton(tools_window, 50, 400, 75, 30);
  demo_button1.setText("Demo 1");
  demo_button1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  demo_button1.addEventHandler(this, "demo_button1_click");
  demo_button2 = new GButton(tools_window, 175, 400, 75, 30);
  demo_button2.setText("Demo 2");
  demo_button2.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  demo_button2.addEventHandler(this, "demo_button2_click");
  important_label = new GLabel(tools_window, 50, 450, 200, 35);
  important_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  important_label.setText("Remember: Click back into piano window after using tools");
  important_label.setOpaque(false);
  piano_mode_label = new GLabel(tools_window, 170, 60, 80, 20);
  piano_mode_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  piano_mode_label.setText("Piano Mode");
  piano_mode_label.setOpaque(false);
  mode_button = new GButton(tools_window, 170, 90, 80, 20);
  mode_button.setText("Mouse");
  mode_button.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  mode_button.addEventHandler(this, "mode_button_click");
  layout_window = GWindow.getWindow(this, "Layout", 1200, 100, 600, 350, JAVA2D);
  layout_window.noLoop();
  layout_window.setActionOnClose(G4P.KEEP_OPEN);
  layout_window.addDrawHandler(this, "layout_window_draw");
  keyboard_controls_label = new GLabel(layout_window, 240, 21, 120, 20);
  keyboard_controls_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  keyboard_controls_label.setText("Keyboard Controls");
  keyboard_controls_label.setOpaque(false);
  guide_label = new GLabel(layout_window, 90, 50, 420, 20);
  guide_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  guide_label.setText("These buttons do nothing! They are only here to show controls to the keys.");
  guide_label.setOpaque(false);
  upper_label = new GLabel(layout_window, 260, 90, 80, 20);
  upper_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  upper_label.setText("Upper Octave");
  upper_label.setOpaque(false);
  c2k = new GButton(layout_window, 110, 165, 30, 30);
  c2k.setText("Q");
  c2k.addEventHandler(this, "c2kc");
  d2k = new GButton(layout_window, 160, 165, 30, 30);
  d2k.setText("W");
  d2k.addEventHandler(this, "d2kc");
  e2k = new GButton(layout_window, 210, 165, 30, 30);
  e2k.setText("E");
  e2k.addEventHandler(this, "e2kc");
  f2k = new GButton(layout_window, 260, 165, 30, 30);
  f2k.setText("R");
  f2k.addEventHandler(this, "f2kc");
  g2k = new GButton(layout_window, 310, 165, 30, 30);
  g2k.setText("T");
  g2k.addEventHandler(this, "g2kc");
  a2k = new GButton(layout_window, 360, 165, 30, 30);
  a2k.setText("Y");
  a2k.addEventHandler(this, "a2kc");
  b2k = new GButton(layout_window, 410, 165, 30, 30);
  b2k.setText("U");
  b2k.addEventHandler(this, "b2kc");
  c3k = new GButton(layout_window, 460, 165, 30, 30);
  c3k.setText("I");
  c3k.addEventHandler(this, "c3kc");
  csharp2k = new GButton(layout_window, 135, 120, 30, 30);
  csharp2k.setText("2");
  csharp2k.addEventHandler(this, "csharp2kc");
  dsharp2k = new GButton(layout_window, 185, 120, 30, 30);
  dsharp2k.setText("3");
  dsharp2k.addEventHandler(this, "dsharp2kc");
  fsharp2k = new GButton(layout_window, 285, 120, 30, 30);
  fsharp2k.setText("5");
  fsharp2k.addEventHandler(this, "fsharp2kc");
  gsharp2k = new GButton(layout_window, 335, 120, 30, 30);
  gsharp2k.setText("6");
  gsharp2k.addEventHandler(this, "gsharp2kc");
  asharp2k = new GButton(layout_window, 385, 120, 30, 30);
  asharp2k.setText("7");
  asharp2k.addEventHandler(this, "asharp2kc");
  lower_label = new GLabel(layout_window, 260, 225, 80, 20);
  lower_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lower_label.setText("Lower Octave");
  lower_label.setOpaque(false);
  c1k = new GButton(layout_window, 105, 300, 30, 30);
  c1k.setText("Z");
  c1k.addEventHandler(this, "c1kc");
  d1k = new GButton(layout_window, 165, 300, 30, 30);
  d1k.setText("X");
  d1k.addEventHandler(this, "d1kc");
  e1k = new GButton(layout_window, 225, 300, 30, 30);
  e1k.setText("C");
  e1k.addEventHandler(this, "e1kc");
  f1k = new GButton(layout_window, 285, 300, 30, 30);
  f1k.setText("V");
  f1k.addEventHandler(this, "f1kc");
  g1k = new GButton(layout_window, 345, 300, 30, 30);
  g1k.setText("B");
  g1k.addEventHandler(this, "g1kc");
  a1k = new GButton(layout_window, 405, 300, 30, 30);
  a1k.setText("N");
  a1k.addEventHandler(this, "a1kc");
  b1k = new GButton(layout_window, 465, 300, 30, 30);
  b1k.setText("M");
  b1k.addEventHandler(this, "b1kc");
  csharp1k = new GButton(layout_window, 135, 255, 30, 30);
  csharp1k.setText("S");
  csharp1k.addEventHandler(this, "csharp1kc");
  dsharp1k = new GButton(layout_window, 195, 255, 30, 30);
  dsharp1k.setText("D");
  dsharp1k.addEventHandler(this, "dsharp1kc");
  fsharp1k = new GButton(layout_window, 315, 255, 30, 30);
  fsharp1k.setText("G");
  fsharp1k.addEventHandler(this, "fsharp1kc");
  gsharp1k = new GButton(layout_window, 375, 255, 30, 30);
  gsharp1k.setText("H");
  gsharp1k.addEventHandler(this, "gsharp1kc");
  asharp1k = new GButton(layout_window, 435, 255, 30, 30);
  asharp1k.setText("J");
  asharp1k.addEventHandler(this, "asharp1kc");
  tools_window.loop();
  layout_window.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow tools_window;
GButton tempo_incr_button; 
GButton tempo_decr_button; 
GImageButton note_image_button; 
GButton metronome_button; 
GLabel metronome_label; 
GLabel tempo_label; 
GLabel options_window_label; 
GLabel recording_label; 
GButton recording_button; 
GLabel recording_options_click; 
GButton recording_save_button; 
GButton recording_play_button; 
GLabel demo_label; 
GLabel status_label; 
GButton demo_button1; 
GButton demo_button2; 
GLabel important_label; 
GLabel piano_mode_label; 
GButton mode_button; 
GWindow layout_window;
GLabel keyboard_controls_label; 
GLabel guide_label; 
GLabel upper_label; 
GButton c2k; 
GButton d2k; 
GButton e2k; 
GButton f2k; 
GButton g2k; 
GButton a2k; 
GButton b2k; 
GButton c3k; 
GButton csharp2k; 
GButton dsharp2k; 
GButton fsharp2k; 
GButton gsharp2k; 
GButton asharp2k; 
GLabel lower_label; 
GButton c1k; 
GButton d1k; 
GButton e1k; 
GButton f1k; 
GButton g1k; 
GButton a1k; 
GButton b1k; 
GButton csharp1k; 
GButton dsharp1k; 
GButton fsharp1k; 
GButton gsharp1k; 
GButton asharp1k; 
