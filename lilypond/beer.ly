% From: https://github.com/Ed-von-Schleck/irish.git
% Copyright: public domain
\version "2.18.0"

%\header {
%  title = "Beer Beer Beer (The Charlie Mops Song)"
%}

global = {
  \key d \major
  \time 4/4
  \tempo 4=140
  \partial 8
}

chordNames = \chordmode {
  \global
  \germanChords
  s8

  d1 a d g2 a2
  d1 g2 d
  a1 d4 a d2

  d2 fis:m b:m a
  fis:m b:m g a
  d d:7/fis g2 d
  a fis:m b4:m a

  d1*2
  d1 a d g2 a2
  d1 g2 d
  s1*4 a1
}

lead = \relative c' {
  \global
  a8^\markup { \italic shuffled }

  d4 d8 e fis4 r8 d
  e d cis b a4 r8 d
  d' d d d d4 a
  \tuplet 3/2 4 { b8 a g } fis8 fis e4 r8 d

  d'4 d8 d d4 a8 a
  b g d' b a4 r8 a
  a a \tuplet 3/2 4 { a a a  a a a  a a g }
  \break
  fis8 d e cis d4 r8 d

  \repeat volta 2 {

  fis8 fis fis fis fis fis fis fis
  fis fis e d a'4 r
  a4 a8 a a4 d,
  b'8 a g fis e4 r8 d
  
  d' d d d d a a a
  b g d' b a4 r8 a
  a4 a a8 a a g
  \time 2/4
  \tuplet 3/2 { fis fis fis } e e
  \time 4/4

  d4^\markup{ \italic Fine } cis b \tuplet 3/2 { a8 b cis }
  d4 cis b r8 a
  \break

  d8 d d d d d d d
  \tuplet 3/2 { e e d } cis b a4 r8 d
  \tuplet 3/2 { d' d d } d d d a r a
  b a g fis e4 r8 d

  d' d d d d a a a
  \tuplet 3/2 { b b g } d' b a4 r
  \override NoteHead #'style = #'cross
  a4 a a8 a \tuplet 3/2 { a a g }
  fis d e cis d4 r
  d r d r
  d r d r
  d r2 r8
  \revert NoteHead #'style
  d
  }

}

backingOne = \relative c' {
  \global
  r8
  R1*7 r2.. d8

  fis fis fis fis fis fis fis fis
  d d d d cis4 r
  fis4 fis8 e d4 d
  g8 fis e d cis4 r8 d

  fis8 fis fis fis fis fis fis fis
  g g g g fis4 r8 fis
  e4 cis cis8 cis cis cis
  \tuplet 3/2 { d d d } cis8 cis
  d4 cis b \tuplet 3/2 { a8 b cis }
  d4 cis b s4
 
}

backingTwo = \relative c' {
  \global
  r8
  R1*7 r2.. d8

  d8 d d d cis cis cis cis
  b b b b a4 r
  cis4 a8 a b4 b
  b8 b b b cis4 r8 d

  d d d d c c c c
  b b b b a4 r8 a
  a4 a a8 a a a
  \tuplet 3/2 { b b b } a8 a
  
  d4 cis b \tuplet 3/2 { a8 b cis }
  d4 cis b r4
 
}

verseOne = \lyricmode {
  \set stanza = "1."
  a long time a -- go, way back in his -- to -- ry.
  when all there was to drink was no -- thing but cups of tea
  a -- long came a man by the name of Char -- lie Mopps
  and he in -- ven -- ted a won -- der -- ful drink and he made it out of hops.
  
  \set stanza = "Ref."
  He must have been an ad -- mi -- ral, a sul -- tan or a king.
  and to his prai -- ses we shall al -- ways sing
  a -- look what he has done for us, he's filled us up with cheer,
  A -- lord, bless Char -- lie Mopps, the man who in -- ven -- ted   

  beer, beer, beer, ti -- dl -- ey beer, beer, beer

  \set stanza = "2."
  O'  -- ca -- sey's  bar, the Bray Head Pub, the Hole in the Wall as well
  there's one thing you can be sure of, it's Char -- lie's beer they sell
  so all ye lads a las -- ses at e -- le -- ven O' -- clock ye stop
   five short sec -- onds,  now to re -- mem -- ber Char -- lie Mops:
  one, two, three, four, five
  He
}

verseTwo = \lyricmode {
  \set stanza = "2."
}

verseThree = \lyricmode {
  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
  \set stanza = "3."
  A barrel of malt, a bushel of hops, you stir it a -- round~with a stick,
  the kind _ of lu -- bri -- ca -- tion to make your en -- gine tick
  _ for -- ty pints of wallop a day will keep _ a -- way the quacks
  it's~only eight~pence~ ha' -- penny  a pot and one and six in tax, one, two, three, four, five
  He
  
}

verseFour = \lyricmode {
  \set stanza = "4."
  
}

chordsPart = \new ChordNames \transpose d e \chordNames

choirPart = \new ChoirStaff <<
  \new Staff \with {
    instrumentName = \markup \center-column { "Lead" }
  } <<
    \new Voice = "lead" { \transpose d e \lead }
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
    \new Voice = "backingOne" { \voiceOne \transpose d e \backingOne }
    \new Voice = "backingTwo" { \voiceTwo \transpose d e \backingTwo }
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
  paper-height = 19 \cm
}
