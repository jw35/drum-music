\version "2.18.0"

% ====== Drum notations customized
#(define md '(

  (crashcymbal  cross    #f         6)
  (splashcymbal harmonic #f         6)

  (hihat        cross    #f         5)
  (closedhihat  cross    "stopped"  5)
  (openhihat    cross    "open"     5)
  (halfopenhihat cross   "halfopen" 5)

  (ridecymbal   cross    #f         4)
  (ridebell     xcircle  #f         4)

  (hightom      default  #f         3)
  (himidtom     default  #f         3)

  (lowtom       default  #f         2)
  (lowmidtom    default  #f         2)

  (snare        default  #f         1)
  (sidestick    xcircle  #f         1)

  (highfloortom default  #f        -1)

  (lowfloortom  default  #f        -2)

  (bassdrum     default  #f        -3)

  (pedalhihat   cross    #f        -5)

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
  \override Beam #'positions = #'(5.5 . 5.5)

  % Tempo and rehearsal marks

  % Notes

  \mark #1

  cymc4_"cymc"^"Crash" s s s

  cyms_"cyms"^"Splash" s s s

  hh_"hh"^"Hi-hat" s s s

  hho_"hho"^"Open" s s s

  hh^\hop_"hh^\hop"^"Open" s s s

  hhho_"hhho"^"Half-open" s s s

  hh^\hhop_"hh^\hhop"^"Half-open" s s s

  hhc_"hhc"^"Closed" s s s

  cymr_"ctmr"^"Ride" s s s

  rb_"rb"^"Ride Bell" s s s

  tomh_"tomh"^"High Tom" s s s

  tommh_"tommh"^"High Mid Tom" s s s

  toml_"toml"^"Low Tom" s s s

  tomml_"tomml"^"Low Mid Tom" s s s

  sn_"sn"^"Snare" s s s

  ss_"ss"^"Cross-sticks" s s s

  tomfh_"tomfh"^"High Floor Tom" s s s

  tomfl_"tomfl"^"low Floor Tom" s s s

  bd_"bd"^"Bass" s s s

  hhp_"hhp"^"Pedal Hi-Hat" s s s

  % Beams

  hh8 hh hh hh tomh toml tomfh bd

  % Acents

  hh8[^> hh]
  \once \override Script.Y-offset = #'-0.5
  <hh sn>[_>^\act hh16 sn]
  hh8[^> hh]
  \once \override Script.Y-offset = #'-0.5
  <hh sn>[_>^\act hh]

}

% ===== Stems Down voice
down = \drummode {
  % Customizations
  \stemDown
  \override Beam #'positions = #'(-5 . -5)

  % Notes

}

% ====== Layout customizations
\header {
  title = "Symbol reference"
  composer = "Jon Warbrick"
  tagline = "Music engraving by JW using LilyPond  - www.lilypond.org"
}

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
  #(set-paper-size "a4")
  indent=#0
  line-width=#200
}
