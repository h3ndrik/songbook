% From: https://github.com/Ed-von-Schleck/irish.git
% Copyright: public domain
\version "2.18.0"

%\header {
%  title = "Whiskey in the Jar"
%}

global = {
  \key d \major
  \time 4/4
  \tempo 4=150
  \partial 4
}

chordNames = \chordmode {
  \global
  \germanChords
  s4

  d1*2 b:m g d1 b:m
  d1*2 b:m g d1 b:m

  a1*2 d g d2 a d2.
}

lead = \relative c' {
  \global
  \repeat volta 4 {
  fis4

  a4. a8 a4 b8 a~
  a fis4. r4 fis
  b4 b b cis8 b~
  b8 fis4. r4 fis

  b b b cis
  d8 d4. cis4 b
  a8 a4. d4 cis
  b fis r fis

  a4. a8 a4 b8 a~
  a8 fis4. r4 fis
  b4. b8 b4 cis8 b~
  b8 fis4. r4 fis

  b2 b4. cis8
  d d4. cis4 b
  a a d cis
  b fis fis fis

  \break
  e e8 e e e e e~
  e2 r2
  r4 fis fis4. e8
  fis8 g4 a8~ a2

  r4 b b4. a8
  b8 cis4 d8~ d4 cis8( b)
  a4 fis e fis
  d d r
  }
}

backingOne = \relative c' {
  \global
  r4
  R1*15
  r2 fis4 fis

  e e8 e e e e e~
  e2 r2
  r4 d d4. cis8
  d8 e4 fis8~ fis2

  r4 g g4. fis8
  g8 a4 b8~ b4 a8( g)
  fis4 d cis cis
  d d r

}

backingTwo = \relative c' {
  \global
  r4
  R1*15
  r2 fis4 fis

  e e8 e e e e e~
  e2 r2
  r4 d4 d4. a8
  d8 d4 d8~ d2

  r4 g g4. d8
  g8 g4 g8~ g4 d
  d d a a
  d d r
}

verseOne = \lyricmode {
  \set stanza = "1."
  As I was  go -- in' o -- ver the far famed Ker -- ry moun -- tains
  I met with cap -- tain Far -- rell and his mon -- ey he was coun -- ting.
  I first pro -- duced me pis -- tol and  then pro -- duced me rap -- ier
  said “Stand and de -- li -- ver” for he were a bold de -- cei -- ver
  
  \set stanza = "Ref."
  mush -- a ring dum -- a do dum -- a da
  wack fall the dad -- dy -- o, wack fall the dad -- dy -- o
  there's whis -- key in the jar -- oh
}

verseTwo = \lyricmode {
  \set stanza = "2."
  I coun -- ted out his mo -- ney and_it made a pret -- ty pen -- ny
  I put it in me pock -- et and I took it home to Jen -- ny
  she sighed _ and she swore _  that~she ne -- ver would de -- ceive me
  but~the devil take the wo -- men for they ne -- ver can be ea -- sy
}

verseThree = \lyricmode {
  \set stanza = "3."
  I went up to me cham -- ber, all for to take a slum -- ber
  I dreamt of gold and je -- wels and for sure it was no won -- der
  but Jen -- ny blew me char -- ges and~she filled them up with wa -- ter
  then sent~for cap -- tain Far -- rell to be rea -- dy for the slaugh -- ter
}

verseFour = \lyricmode {
  \set stanza = "4."
  It~was ear -- ly in the mor -- ning, just~be -- fore I rose to tra -- vel
  up comes a band of foot -- men _ and like -- wise cap -- tain Far -- rell
  I first pro -- duced me pis -- tol for~she stole a -- way me ra -- pier
  but~I couldn't shoot the wa -- ter, so a priso -- ner I was ta -- ken
  
}

chordsPart = \new ChordNames \transpose d d \chordNames

choirPart = \new ChoirStaff <<
  \new Staff \with {
    instrumentName = \markup \center-column { "Lead" }
  } <<
    \new Voice = "lead" { \transpose d d \lead }
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
  \new Staff \with {
    instrumentName = \markup \center-column { "Backing 1" "Backing 2" }
  } <<
    \new Voice = "backingOne" { \voiceOne \transpose d d \backingOne }
    \new Voice = "backingTwo" { \voiceTwo \transpose d d \backingTwo }
  >>
>>

\score {
  <<
    \chordsPart
    \choirPart
  >>
  \layout {
    \context {
      \Staff \RemoveEmptyStaves
      \override VerticalAxisGroup #'remove-first = ##t
    }
  }
%  \midi {
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
  paper-height = 12 \cm
}

