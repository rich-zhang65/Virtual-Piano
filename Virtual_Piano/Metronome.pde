class Metronome {
  int bpm;
  float msBetweenBeats;
  
  Metronome(int t) {
    this.bpm = t;
    this.msBetweenBeats = 60000.0 / this.bpm; // Detects average delay between ticks to maintain a steady amount of beats per minute
  }
  
  void playBeat() {
    timeSinceLastBeat = millis(); // Calculates current time program has ran for
    metroBeat.rewind(); // Resets the audio
    metroBeat.play(); // Plays the tick
  }
  
  void countdown() {
    // In recording and playback mode, plays a metronome speed prior to playing notes
    countdown = true;
    int time = millis();
    
    for (int i = 3; i > 0; i--) {
      countdownText = str(i);
      
      this.playBeat();
      
      // Cuts off audio every 80 milliseconds to prevent overload
      while (time - timeSinceLastBeat < this.msBetweenBeats) {
        time = millis();
      }
      // Calculates time after delay
      timeSinceLastBeat = time;
      
      // Pauses/cuts off audio
      metroBeat.pause();
    }
    
    // Once numbers stop showing, show one last message that tells the user they can begin playing
    countdownText = "Go!";
    this.playBeat();
    
    // Turns off countdown
    countdown = false;
    while (time - timeSinceLastBeat < this.msBetweenBeats) {
      time = millis();
    }
    
    // Clears text and starts tracking note durations
    countdownText = "";
    recordTime = millis();
  }
}
