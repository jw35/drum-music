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
upi = \drummode {
  % Customizations
  \stemUp
  \slurDown
  \numericTimeSignature
  \override Beam #'positions = #'(5.5 . 5.5)

  % Tempo and rehearsal marks

  % Notes

  % Intro

  R1 | R | R | r4 r4 r8 tomh16 toml sn toml tomfh tomfh |

  \break

  \repeat percent 3 {

    hh16 hh hh hh <hh sn> hh hh hh hh hh hh hh <hh sn> hh hh hh |

    hh16 hh hh hh <hh sn> hh hh hh  hh hh sn tomh sn tomh tomfh tomfh |

  }

  r4 sn r sn |

  \time 2/4 r8 sn tomh16 tomh  tomfh8 |

}

upv = \drummode {
  % Customizations
  \stemUp
  \slurDown
  \numericTimeSignature
  \override Beam #'positions = #'(5.5 . 5.5)

  \time 4/4

  \repeat volta 2 {

    hh8 hh <hh sn> hh <hh sn> hh <hh sn> hh |

    hh8 hh <hh sn> hh[ <hh sn> hh <hh sn> <hh sn>16 sn16] |

    hh8 hh <hh sn> hh <hh sn> hh <hh sn> hh  |

  }
  \alternative {

    { r8 sn16 sn tomh8 toml sn toml tomfh tomfh | }

    { sn8 tomh toml16 toml tomfh r16 r4 r4 | }

  }

}

upc = \drummode {
  % Customizations
  \stemUp
  \slurDown
  \numericTimeSignature
  \override Beam #'positions = #'(5.5 . 5.5)

  \repeat volta 2 {

    cymr8 cymr <cymr sn> cymr cymr cymr <cymr sn> cymr | cymr8 cymr <cymr sn> cymr cymr cymr <cymr sn> cymr |

    cymr8 cymr <cymr sn> cymr cymr cymr <cymr sn> cymr | cymr8 cymr <cymr sn> cymr cymr cymr <cymr sn> sn16 sn

  }

}

upia = \drummode {
  % Customizations
  \stemUp
  \slurDown
  \numericTimeSignature
  \override Beam #'positions = #'(5.5 . 5.5)

  \set countPercentRepeats = ##t
  \set repeatCountVisibility = #(every-nth-repeat-count-visible 5)

  \repeat percent 15 {

    cymr8 cymr <cymr sn> cymr cymr cymr <cymr sn> cymr |

    cymr cymr <cymr sn> cymr cymr sn16 tomh sn tomh tomfh tomfh |

  }

  cymr8 cymr <cymr sn> cymr cymr cymr <cymr sn> cymr |

  cymr8 cymr <cymr sn> cymr cymr cymr <cymr sn> cymr |

}

upib = \drummode {
  % Customizations
  \stemUp
  \slurDown
  \numericTimeSignature
  \override Beam #'positions = #'(5.5 . 5.5)

  \repeat percent 3 { hh8 hh <hh sn> hh hh hh <hh sn> hh | }

  hh8 hh <hh sn> hh hh <hh sn> <hh sn> hh |

  \repeat percent 3 { hh8 hh <hh sn> hh hh hh <hh sn> hh | }

  hh8 hh <hh sn> <hh sn>16 sn <hh sn>8 tomh toml16 toml tomfh8 |

}

% ===== Stems Down voice
downi = \drummode {
  % Customizations
  \stemDown
  \override Beam #'positions = #'(-5 . -5)

  % Notes

  % Intro

  s1 | s1 | s1 | s1 \break

  \repeat percent 3 {

    bd4 bd bd bd  |

    bd4 bd bd bd |

  }

  bd4 bd bd bd |

  bd bd |

}

downv = \drummode {
  % Customizations
  \stemDown
  \override Beam #'positions = #'(-5 . -5)

  % Verse

  \repeat volta 2 {

    bd4 bd bd bd |

    bd4 bd bd bd |

    bd4 bd bd bd |

  }
  \alternative {

    { bd4 s s s | }

    { bd4 s s s | }

  }

}

downc = \drummode {
  % Customizations
  \stemDown
  \override Beam #'positions = #'(-5 . -5)

  \repeat volta 2 {

    bd4 bd bd bd |

    bd4 bd bd bd |

    bd4 bd bd bd |

    bd4 bd bd bd |

  }

}

downia = \drummode {
  % Customizations
  \stemDown
  \override Beam #'positions = #'(-5 . -5)

  \repeat percent 15 {

    bd4 bd bd bd |

    bd4 bd bd bd |

  }

  bd4 r8 bd bd4 s |

  bd4 r8 bd bd4 s |

}

downib = \drummode {
  % Customizations
  \stemDown
  \override Beam #'positions = #'(-5 . -5)

  \repeat percent 3 { bd4 s bd s | }

  bd4 s bd s |

  \repeat percent 3 { bd4 s bd s | }

  bd4 s s s

}


% ====== Layout customizations
\header {
  title = "Layla"
  composer = "Eric Clapton"
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
      \new DrumVoice {\voiceOne \upi}
      \new DrumVoice {\voiceTwo \downi}
    >>
  >>

  \header {
      piece = "Intro"
  }

  \layout {\context {\Score \remove "Bar_number_engraver"}}
}

\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \new DrumVoice {\voiceOne \upv}
      \new DrumVoice {\voiceTwo \downv}
    >>
  >>

  \header {
      piece = "Verse"
  }

  \layout {\context {\Score \remove "Bar_number_engraver"}}
}

\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \new DrumVoice {\voiceOne \upc}
      \new DrumVoice {\voiceTwo \downc}
    >>
  >>

  \header {
      piece = "Chorus"
  }

  \layout {\context {\Score \remove "Bar_number_engraver"}}
}

\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \new DrumVoice {\voiceOne \upia}
      \new DrumVoice {\voiceTwo \downia}
    >>
  >>

  \header {
      piece = "Instrumental 1"
  }

  \layout {\context {\Score \remove "Bar_number_engraver"}}
}

\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \new DrumVoice {\voiceOne \upib}
      \new DrumVoice {\voiceTwo \downib}
    >>
  >>

  \header {
      piece = "Instrumental 2"
  }

  \layout {\context {\Score \remove "Bar_number_engraver"}}
}


% ===== Page customizations
\paper{
  #(set-paper-size "a4")
  indent=#0
  line-width=#200
}
