\version "2.18.0"
up = \drummode {
    \stemUp

    sn4^"snare" ss s2 bd4^"bass" s hh^"hat" hhp
    cymr4^"ride" cymra s2
    tomh4^"4 pc" toml s2 tommh4^"5 pc" tomml tomfh s
    cymc4^"cymbals" cyms chinesecymbal s
}

\score { << \new DrumStaff << \up >> >> }
