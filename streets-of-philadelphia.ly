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

  hh8 hh hh hh hh hh hh hh

}

% ===== Stems Down voice
down = \drummode {
  % Customizations
  \stemDown

  % Notes

  bd8 [ bd16 bd sn8. sn16 ] bd8 [ bd ] sn4

}

\header {
  title = "Streets of Philadelphia"
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
  #(set-paper-size "a4")
  indent=#0
  line-width=#200
}


