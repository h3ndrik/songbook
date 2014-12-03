% From: https://github.com/Ed-von-Schleck/irish.git
% Copyright: public domain
\version "2.18.0"

%\header {
%  title = "Molly Malone"
%  composer = "traditional"
%  arranger = "Ed von Schleck"
%}

global = {
  \key g \major
  \time 3/4
  \partial 4
  \tempo 4=160
}

chordNames = \chordmode {
  \global
  \germanChords
  s4

  g2. e:m a:m d:7 g2. b:m a:7 d:7
  g2. e:m a:m d:7 g2. b:m e2:m d4 g2.

  g2. e:m a:m d:7 g2. b:m e2:m d4 g2.
  g2. e:m a:m d:7 g2. b:m e2:m d4 g2

}

lead = \relative c' {
  \global 
  d4

  g g g
  g8 b r4 g8 g
  a4 a a
  a8 c r4 a

  b4 d c8 b~
  b4 d c
  b8 a2 g8
  a4 r d,8 d

  g4. g8 g4
  g8 b r4 g
  a4 a a
  a8 c r4 a8 a

  b8 d4. c4
  b8 d4. c4
  b4. g8 a4
  g4 r d
  
  g4. g8 g4
  g8( b) r4 g
  a4. a8 a4
  a8( c) r4 a8 a

  b8 d4. c4
  b8 d4. c4
  b4. g8 a4
  g4 r2

  R2.*7
  R2
}

backingOne = \relative c' {
  \global
  r4
  R2.*15
  \break
  r2 d4

  d4. d8 d4
  e8( g) r4 e
  e4. e8 e4
  fis8( a) r4 fis8 fis

  g8 g4. g4
  fis8 fis4. fis4
  e4. e8 d4
  d4 r2

  R2.*7
  R2
}
backingTwo = \relative c' {
  \global
}

violin = \relative c'' {
  \global
  r4
  R2.*24
  \break

  g4. b8 d4
  g8( fis e) b g( a)
  b4( a) g8 fis~(
  fis4 e) fis8 g~

  g8 b4. d4
  fis,8 b4. d4
  b8( a g fis) e( fis)
  g2

  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  In Dub -- lin's fair ci -- ty
  where the girls are so pret -- ty
  I first set my eyes on sweet Mol -- ly Ma -- lone
  as she wheeled her wheel -- bar -- row
  through streets broad and nar -- row
  cry -- ing “cock -- les and mus -- sels, a -- live, a -- live, oh” 

  \set stanza = "Ref."
  “A -- live, a -- live, oh
  a -- live, a -- live, oh”
  cry -- ing “cock -- les and mus -- sels, a -- live, a -- live, oh”
}
verseTwo = \lyricmode {
  \set stanza = "2."
  She was a fish -- mon -- ger
  but it sure 'twas no won -- der
  for so were her fa -- ther and mo -- ther be -- fore
  and they each wheeled their bar -- rows
  through streets …

}

verseThree = \lyricmode {
  \set stanza = "3."
  She died of a fe -- ver
  and _ none could re -- lieve her
  and that was the end of sweet Mol -- ly Ma -- lone
  but her ghost wheels her bar -- row
  through streets …
}

verseFour = \lyricmode {
  \set stanza = "4."
}

verseFive = \lyricmode {
  \set stanza = "5."
}

chordsPart = \new ChordNames \transpose g g \chordNames

violinPart = \new Staff \transpose g g \violin

choirPart = \new ChoirStaff <<
  \new Staff \with {
    instrumentName = \markup \center-column { "Lead" }
  } <<
    \new Voice = "lead" { \transpose g g \lead }
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
    \new Voice = "backingOne" { \transpose g g { \backingOne } }
    %\new Voice = "backingTwo" { \transpose g g {\voiceTwo \backingTwo } }
  >>
>>

\score {
  <<
    \chordsPart
    \violinPart
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
  paper-height = 9.5 \cm
}
