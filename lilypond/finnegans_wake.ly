% From: https://github.com/Ed-von-Schleck/irish.git
% Copyright: public domain
\version "2.18.0"

%\header {
%  title = "Finnegan's Wake"
%  composer = "traditional"
%  arranger = "Ed von Schleck"
%}

global = {
  \key c \major
  \time 4/4
  \partial 4
  \tempo 4=160
}

chordNames = \chordmode {
  \global
  \germanChords
  s4

  c1 a:m f g
  c1 a:m f f4 g c2
  c1 a:m f g
  c1 a:m f f4 g c2

  c1 a:m f g 
  c a:m f f4 g c

}

lead = \relative c'' {
  \global 
  g4

  e8 e e4 e d
  e a a b
  c b a8 a g4
  e d d r8 d

  e4 e8 e8 e4 d4
  e a a a8 b 
  c4 b8 b a4 g 
  a8 a b4 c r

  c4 c8 c c4 c8 d 
  c c b4 a g8 g
  c4 c8 c c c d4
  c b a4 r8 g

  c4 c8 c4. c8 d
  c4 b a g8 g
  a4 a8 a a4  g 
  a b c r4

  \break
  e,4 e8 e e4 d
  e4 e8 e a4 b
  c4 b8 a4. g4
  e8 d4. d4 r

  e8 e e2 d4
  e a a b
  c b a g 
  a8 a b4 c

  \bar "|."
}

backingOne = \relative c' {
  \global
  r4
  R1*16

  e4 e8 e e4 d
  c4 c8 c e4 e
  a4 g8 f4. c4
  b8 b4. b4 r

  e8 e e2 d4
  c4 c e e
  a g f f
  f f e
}

backingTwo = \relative c' {
  \global
  r4
  R1*16

  c4 c8 c c4 b
  a4 a8 a a4 a
  c4 c8 a4. a4
  g8 g4. g4 r

  c8 c c2 b4
  a4 a a a
  c c c c
  b b c

  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Tim Fin -- ne -- gan lived in Walk -- in Street
  a gent -- le I -- rish -- man migh -- ty odd
  he had a brogue__ _ both rich and sweet
  an' to rise in the world he car -- ried a hod

  Tim had  a sort of a tipp -- a -- lin' way
  with a love for the li -- quor now he was born _
  help him on with his work each day
  had a drop of the cray  -- chur eve -- ry morn

  \set stanza = "Ref."
  whack fol the da  -- o, dance to your  part -- ner
  'round the floor yer trot -- ters shake
  was -- n't it the truth I told you
  lots of fun at Fin -- ne -- gan's Wake
}
verseTwo = \lyricmode {
  \set stanza = "2."
  One mor _ -- ning Tim got ra -- ther full
  his head felt hea -- vy which made him shake
  _ fell from a ladder and~he broke his skull, and they
  carried him _ home his corpse _ to wake

  rolled him up __ _ in a nice _ clean sheet
  _ _ laid him out __ _ _ up -- on the bed
  a bottle of whis -- key _ at his feet
  and a barrel of _ por -- ter at his head
}

verseThree = \lyricmode {
  \set stanza = "3."
  His friends _ as -- sem -- bled at the wake
  and Wi -- dow Fin -- ne -- gan called for lunch _
  first she brung_ _ in tea and cake
  then _  pipes, to -- _ bacco and whis -- _ key punch

  Biddy O' _ Brien be _ -- gan _  to cry 
  “Such a nice clean _ corpse, _ did_you e -- ver see _
  Tim, a -- vour -- neen _  why did_you die?” _
  “Arrg shut your _ gob” said Paddy Mc -- Gee
}

verseFour = \lyricmode {
  \set stanza = "4."
  _ Mag -- gie O' -- Connor took up the job,
  “Ah Biddy” says she _ “you're wrong I'm sure”
  _ Bid -- dy _ gave her_a belt in_the gob
  and  _ left  her _  spraw -- ling  on _  the floor

  then the war _  did _ soon _ en -- rage,
  _ _ woman to _ wo -- man and man to man _
  shille -- lagh law was _ all the rage
  and a row and a ruc -- tion soon be -- gan
}

verseFive = \lyricmode {
  \set stanza = "5."
  _ Mick -- ey Ma -- lon -- ey ducked his head
  and_a bottle of whis _ -- key flew at him
  _ missed and fal __ -- _ lin' on the bed
  the _ li -- quor _ scat -- tered o -- _ ver Tim

  Tim re -- vives!  _ See  _ how _ he ri -- ses! _
  Timo -- thy _  ri _ -- sin' from the bed
  sayin'  “Whirl your li -- quor a -- round like bla -- zes _
  thunde -- rin' _ Jaysus, do_you think I'm dead?”
}

chordsPart = \new ChordNames << \transpose c d { \chordNames } >>

choirPart = \new ChoirStaff <<
  \new Staff \with {
    instrumentName = \markup \center-column { "Lead" }
  } <<
    \new Voice = "lead" { \transpose c d \lead }
  >>
  \new Lyrics \with {
    \override VerticalAxisGroup #'staff-affinity = #CENTER
  } \lyricsto "lead" \verseOne
  \new Lyrics \with {
    \override VerticalAxisGroup #'staff-affinity = #CENTER
  } \lyricsto "lead" \verseTwo
  \new Lyrics \with {
    \override VerticalAxisGroup #'staff-affinity = #CENTER
  } \lyricsto "lead" \verseThree
  \new Lyrics \with {
    \override VerticalAxisGroup #'staff-affinity = #CENTER
  } \lyricsto "lead" \verseFour
  \new Lyrics \with {
    \override VerticalAxisGroup #'staff-affinity = #CENTER
  } \lyricsto "lead" \verseFive
  \new Staff \with {
    instrumentName = \markup \center-column { "Backing 1" "Backing 2" }
  } <<
    \new Voice = "backingOne" { \transpose c d { \voiceOne \backingOne } }
    \new Voice = "backingTwo" { \transpose c d { \voiceTwo \backingTwo } }
  >>
>>

\score {
  <<
    \chordsPart
    \choirPart
  >>
  \layout {
    \context {
      \RemoveEmptyStaffContext
      \override VerticalAxisGroup #'remove-first = ##t
    }
  }
%  \midi {
%    \context {
%      \Score
%      tempoWholesPerMinute = #(ly:make-moment 100 4)
%    }
%  }
}

\include "header"
#(set-global-staff-size 14)

\paper {
  page-count = #1
  %ragged-last-bottom = ##f
  %ragged-bottom = ##f
  paper-width= 17.5 \cm
  line-width= 17 \cm
  paper-height = 18 \cm
}
