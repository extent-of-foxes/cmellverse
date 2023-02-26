\version "2.18.2"
\language "english"

\header {
  title = "Bank and Bell and Beast"
  subtitle = "fan art of the Instrumentality of Mankind"
  composer = "by \"C'Esther Jefferson\" (extent_of_foxes)"
  meter = "Intro: solo claws a few measures then D.C. with voice"
}

global = {
  \key c \minor
  \time 4/4
  \partial 4
}

altoVoice = \relative c' {
  \global
  \dynamicUp
  % Music follows here.
  af'4
  g2 f8 ef4 f8
  g4 f4 e8 d4 e8
  f4 d4 ef?8 d4 ef8
  f4 \breathe c d4 af'
  g4 f ef?8 f g4
  f4 ef4 d8 e8 f4
  ef?8 c4 d8 ef4 c4
  d2 r4 af'4
  
  \bar "||"
  
  g2 f8 ef?4 f8
  g4 f4 e8 d4 e8
  f4 d4 ef?8 d4 ef8
  f4 \breathe c d4. af'8
  ef?8 f g2.
  d8 e8 f2.
  c8 d ef?4 d4 c
  d2 r4 af'4
  
  
    \bar "||"
  
  g4 f8 ef?8 f8 ef4 f8
  g4 f4 e8 d4 e8
  f4 d4 ef?8 d4 ef8
  f4 \breathe c d4 af'
  g4 f ef?8 f g4
  f4 ef4 d8 e8 f4
  ef?8 c4 d8 ef4 d4
  
  c2.
  
  \bar ":|."
}

verse = \lyricmode {
  % Lyrics follow here.
  The
  Bank knows what you're
  owed and shares in your
  joy, is main, frank, not
  blank. The Bank! It 
  reads your pro -- so -- dy,
  logs your vic -- to -- ry,
  and knows your mel -- o  --
  dy.
  
  The
  Bell shows what you
  are; all that it will
  tell. De -- ny and all --
  ow. The Bell conn --
  ects the facts
  (no -- thing lacks),
  can pre -- sent 
  eve -- ry 
  truth.
  
    The
  beast gives us whisk -- ers and
  fur and fang; makes us
  strong and fast; makes us
  lithe. The beast is
  smart, is un -- im -- proved,
  too base, can be more.
  In -- stinct -- ive thoughts be --
  gone!
}

verseTwo = \lyricmode {
  -
  - - - you
  owe - - - -
  pain, - - - -
  - - - - 
  - their en -- mit -- y,
  logs their cal -- um -- ny,
  and is your har -- mo  --
  ny.
  
  -
  - knows what you've
  done; - - - -
  - To spa -- re, to
  kill. - - com -- 
  bines the acts
  in a mill, 
  then pre -- sents eve -- ry
  view.
  
  -
  - - - hab -- its and
  hung -- er, fear; makes us
  flinch and jump; makes us
  cringe. - -  al --
  ways pre -- pares to strike,
  is not on your side. 
  - - - - -
  - 
}

drum = \relative c' {
  \global
  % Drums follow here.
  c8[ \grace { c16 c16 } c8]
  \repeat percent 7 { \grace { c16 c16 } c4 c4:32~ c16 c8 c16 c8[ \grace { c16 c16 } c8]  }
  \grace { c16 c16 } c4 c4:32~ c16 c8 c16 c4:32
  
  \repeat percent 7 { c8[ \grace { c16 c16 } c8] c16 c c c c2:32 }
  c8[ \grace { c16 c16 } c8] c16 c c c c[ c \grace { c16 c16 } c8] c4:32
  \repeat percent 7 { c8[ \grace { c16 c16 } c8] \grace { c16 c16 } c8 c16 c c[ c \grace { c16 c16 } c8] c4:32 }
  c16 c c c c8[ \grace { c16 c16 } c8] \grace { c16 c16 } c4 
}

altoVoicePart = \new Staff \with {
  instrumentName = "Voice"
  midiInstrument = "choir aahs"
} { \altoVoice }
\addlyrics { \set stanza = "1. " \verse } \addlyrics { \set stanza = "2. " \verseTwo }

drumsPart = \new DrumStaff \with {
  \consists "Instrument_name_engraver"
  instrumentName = "Claws"
  midiInstrument = "xylophone"
  \override StaffSymbol.line-count = #1
} \drum

\score {
  <<
    \altoVoicePart
    \drumsPart
  >>
  \layout {
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
  }
  \midi {
    \tempo 4=120
  }
}

\paper {
  page-count = #1
}
