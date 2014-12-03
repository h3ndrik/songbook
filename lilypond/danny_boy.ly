% From: https://github.com/Ed-von-Schleck/irish.git
% Copyright: public domain
\version "2.18.0"

%\header {
%  title = "Danny Boy"
%}

global = {
  \key c \major
  \time 4/4
  \tempo 4=150
}

chordNames = \chordmode {
  \global
  \germanChords
  g1

  c1 a:m f1*2
  c1 a2:m d:7 g1 g:7
  c c:7 f f:m
  c g c1. c2/b

  a1:m f c1. c2/b
  a1:m f g1 g:7
  c f2 es:dim c1
  g

  c2 a:m7 f f/g
  c1

}

lead = \relative c' {
  \global
  \repeat volta 4 {
    r4 b c d

    e2 r4 d4
    e a g e
    d( c) a2
    r4 c e f

    g2 r4 a
    g4. e8 c4 e
    d1
    r4 b c d

    e2 r4 d
    e a g e
    d( c) a2
    r4 b c d

    e2 r4 f
    e4. d8 c4 d
    c1
    r4 g' a b

    c2 r4 b
    b a g a
    g( e) c2
    r4 g' a b

    c2 r4 b
    b4. a8 g4 e
    d1
    r4 g g g

    e'2 r4 d
    d c a c
    g( e) c2
    r4 b c d

    e a g e
    d c a b
    c1

  }
}

backingOne = \relative c'' {
  \global
  R1*16
  r4 g f g

  a2 r4 a4
  f4 f f f
  e2 c2
  r4 g' f g

  a2 r4 a4
  f4. f8 c4 c
  b1
  r4 g' g g

  c2 r4 g
  a4 a fis fis
  g( e) c2
  R1*4
}

backingTwo = \relative c'' {
  \global
  R1*16
  r4 g f d

  e2 r4 e
  c c c c
  c2 c
  r4 g' f d

  e2 r4 e
  c4. c8 c4 c
  g1
  r4 g' g g

  g2 r4 g
  f f es es
  c2 c
  R1*4
}

verseOne = \lyricmode {
  \set stanza = "1."
  Oh, Dan -- ny boy, the pipes, the pipes are call -- ing
  from glen to glen, and down the moun -- tain side
  the sum -- mer's gone, and all the ro -- ses fall -- ing
  'tis you, 'tis you must go and I must bide.

  But come ye back when sum -- mer's in the mea -- dow
  or when the val -- ley's hushed and white with snow
  'tis I'll be there in sun -- shine or in sha -- dow
  oh Dan -- ny boy, oh Dan -- ny boy, I love you so!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  But when ye come, and all the flow'rs are dy -- ing.
  if I am dead, as dead I well may be.
  ye'll come and find the place where I am ly -- ing.
  and kneel and say an A  -- ve there for me.

  And I shall hear, tho' soft you tread a -- bove me.
  and all my grave will warm -- er, sweet -- er be.
  for you will bend and tell be that you love me.
  and I shall sleep in peace un -- til you come to me! 
}

verseThree = \lyricmode {
  \set stanza = "3."
}

verseFour = \lyricmode {
  \set stanza = "4."
  
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


