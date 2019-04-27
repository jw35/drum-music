\version "2.18.0"

% ====== Drum notations customized
#(define md '(
  (ridecymbal   cross    #f  4)
  (ridebell     xcircle  #f  4)
  (crashcymbal  cross    #f  6)
  (splashcymbal harmonic #f  6)
  (pedalhihat   cross    #f -5)
  (hihat        cross    #f  5)
  (closedhihat  cross "stopped"  5)
  (openhihat    cross "open"     5)
  (halfopenhihat cross "halfopen" 5)
  (snare        default  #f  1)
  (sidestick    xcircle    #f  1)
  (lowfloortom  default  #f -1)
  (lowtom       default  #f  2)
  (hightom      default  #f  3)
  (bassdrum     default  #f -3)
))

% ====== Custom open and half-open ornamentation
pth = #'((moveto 1 0.4) (lineto 0 -0.4))
hop = \markup{\hspace #0.5 \draw-circle #.4 #0.1 ##f}
hhop = \markup{ \combine \hop \path #0.1 #pth }
act = \markup {\left-align \musicglyph #"scripts.sforzato"}

% ===== Stems Up voice
up = \drummode {
  % Customizations
  \stemUp
  \slurDown
  \numericTimeSignature

  % Tempo and rehearsal marks

  % Notes

  cymc4_"cymc"^"Crash" s s s

  cyms_"cyms"^"Splash" s s s

  hh_"hh"^"Hi-hat" s s s

  hho_"hho"^"Open" s s s

  hhho_"hhho"^"Half-open" s s s

  hhc_"hhc"^"Closed" s s s

  cymr_"ctmr"^"Ride" s s s

  rb_"rb"^"Ride Bell" s s s

  tomh_"tomh"^"High Tom" s s s

  toml_"toml"^"Low Tom" s s s

  sn_"sn"^"Snare" s s s

  ss_"ss"^"Cross-sticks" s s s

  tomfl_"tomfl"^"Floor Tom" s s s

  bd_"bd"^"Bass" s s s

  hhp_"hhp"^"Pedal Hi-Hat" s s s

}

% ===== Stems Down voice
down = \drummode {
  % Customizations
  \stemDown

  % Notes

}

% ====== Layout customizations
\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \new DrumVoice {\voiceOne \up}
      \new DrumVoice {\voiceTwo \down}
    >>
  >>

  \layout {\context {\Score \remove "Bar_number_engraver"}}
}

% ===== Page customizations
\paper{
  #(set-paper-size "letter")
  indent=#0
  line-width=#200
  oddFooterMarkup=##f
  oddHeaderMarkup=##f
  bookTitleMarkup = ##f
  scoreTitleMarkup = ##f
}
