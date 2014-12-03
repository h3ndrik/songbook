% From: https://github.com/Ed-von-Schleck/irish.git
% Copyright: public domain
\version "2.18.0"

%\header {
%  title = "Come Out Ye Black And Tans"
%  composer = "Dominic Behan"
%  arranger = "Ed von Schleck"
%}

global = {
  \key b \minor
  \time 4/4
  \partial 2
  \tempo 4=160
}

chordNames = \chordmode {
  \global
  \germanChords
  s2

  b1*2:m a1 fis:m7
  b1*4:m
  d1*2 a1 fis:m
  b:m fis:m b2.:m fis4:m b1:m

  b1*2:m a1 fis:m7
  b1*4:m
  d1*2 a1 fis:m
  b:m fis:m b2.:m fis4:m b2:m

}

lead = \relative c'' {
  \global 
  b4 b

  b b8 b b cis4 b8~
  b4 r a fis
  e8 e4 e8~ e4 fis
  e r a a8 b~

  b4 b b a
  b b8 b4. cis4
  b4( a2) a8 fis~
  fis2 r4 fis

  a a a b8 a~
  a4 r gis fis8 e~
  e4 cis b8 cis4 a8~
  a4 r b cis

  d d8 cis~ cis4 b
  fis'( e) d cis
  b2.( a4)
  b4 r2 b'8 b~


  b4 b8 b b cis4 b8~
  b4 b8 a~ a4 fis
  e e e fis8 e~
  e4 r a a8 b~

  b4 b b a
  b8 a4. b4 cis
  b2.( a4)
  fis r fis8 fis4.

  a4. a8 a a4 a8~
  a2 gis4 fis8 e~
  e4 cis b cis8 a~
  a4 r b cis8 d~

  d4 d cis b8 fis'~
  fis4 e d cis
  b2.( a4)
  b4 r \bar "|."
}

backingOne = \relative c'' {
  \global
  r2
  R1*15
  r2. b8 b~

  b4 b8 b b cis4 b8~
  b4 b8 a~ a4 fis
  a4 a a a8 a~
  a4 r a a8 b8~

  b4 b b a
  b8 a4. b4 cis
  b2.( a4)
  fis r fis8 fis4.

  a4. a8 a a4 a8~
  a2 gis4 a8 cis8~
  cis4 cis cis cis8 a~
  a4 r a a8 b~

  b4 b b b8 a~
  a4 a a a
  b2.( a4)
  b4 r
}
backingTwo = \relative c' {
  \global
  r2
  R1*15
  r2. b8 b~

  b4 b8 b b cis4 d8~
  d4 d8 b~ b4 b
  cis cis cis cis8 cis~
  cis4 r a a8 b~

  b4 b b cis
  d8 d4. d4 a
  b2.( a4)
  b4 r b8 b4.

  d4. d8 d e4 fis8~
  fis2 e4 d8 cis~
  cis4 a b cis8 cis~
  cis4 r d4 cis8 b~

  b4 b b b8 cis~
  cis4 cis a a
  b2.( a4)
  b4 r

}

violin = \relative c' {
  \global
}

verseOne = \lyricmode {
  \set stanza = "1."
  I was born on a Du -- blin street where the Ro -- yal drums did beat
  and the lo -- ving Eng -- lish feet they walked all o -- ver us
  and e -- very sin -- gle night, when me Da would come home tight
  he'd in -- vite the neigh -- bours out with this cho -- rus: 

  \set stanza = "Ref."
  come out you B -- lack and Tans
  come out and fight me like a man
  show your wife how you won me -- dals down in Flan -- ders
  tell her how the I. R. A. made you run like hell a -- way
  from the green and love -- ly lanes in Kil -- le -- shan -- dra
}
verseTwo = \lyricmode {
  _ _ 
  \set stanza = "2."
  Come, tell us how you slew
  them ol' A -- rabs two by two
  like the Zu -- lus, they had spears and bows and ar -- _ rows
  how~you brave -- ly faced each one
  with your six -- teen poun -- der gun
  and you frigh -- tened them poor natives to their mar -- row

}

verseThree = \lyricmode {
  _ _ 
  \set stanza = "3."
  Come, let us hear you tell
  how you slan -- dered great Par -- nell,
  when you thought him well and tru -- ly per -- se -- cu -- _ ted,
  where are the sneers and jeers
  that you brave -- ly let us hear,
  when our he -- roes of six -- teen~were e -- xe -- cu -- ted. 
  
}

verseFour = \lyricmode {
  _
  \set stanza = "4."
  The day is _ co -- ming fast
  and the time is here at last
  when each sho -- neen will be cast a -- side be -- fore _ us
  and if there be a need
  sure my kids will sing “God -- speed!”
  with a bar or two of Stephen Be -- han's cho -- rus
}

verseFive = \lyricmode {
  \set stanza = "5."
}

chordsPart = \new ChordNames \transpose b c' \chordNames

violinPart = \new Staff \transpose b c' \violin

choirPart = \new ChoirStaff <<
  \new Staff \with {
    instrumentName = \markup \center-column { "Lead" }
  } <<
    \new Voice = "lead" { \transpose b c' \lead }
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
    \new Voice = "backingOne" { \transpose b c' { \voiceOne \backingOne } }
    \new Voice = "backingTwo" { \transpose b c' {\voiceTwo \backingTwo } }
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
  paper-height = 16 \cm
}
