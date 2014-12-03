% From: https://github.com/Ed-von-Schleck/irish.git
% Copyright: public domain
\version "2.18.0"

%\header {
%  title = "The Irish Rover"
%}

global = {
  \key a \major
  \time 4/4
  \partial 4
  \tempo 4=160
}

chordNames = \chordmode {
  \global
  \germanChords
  s4
  a1. d2 a fis:m e1:7
  a1. d2 a e:7 a1

  a1 e a e:7
  a1 a2:7 d a f:m e:7 a4


}

lead = \relative c' {
  \global
  e8 cis

  a4 cis8 d e4 a8 b
  cis4 b8 gis a4 gis8 fis
  e4 fis8 e cis4 d8 cis
  b2 r4 e8 cis

  a4 cis8 d e4 a8 b
  cis4 b8 gis a4 gis8 fis
  e4 fis8 d cis4 d8 b
  a2 r4 e'8 e

  a4 a8 b cis4 b8 a
  b4 b8 gis e4 r8 e
  a4. b8 cis4 a
  b4.( gis8) e r cis b

  a4 cis8 d e4 a8 b
  cis4 b8 a d,4 cis8 b
  a4 cis8 e a4 cis
  b2 a8 r
  \bar "|."
}

backingOne = \relative c'' {
  \global
}
backingTwo = \relative c' {
  \global
}

violin = \relative c' {
  \global
}

verseOne = \lyricmode {
  \set stanza = "1."
  In the year of our Lord eigh -- teen hun -- dred and six
  we set sail from the coal quay of Cork
  we were sai -- ling a -- way with a car -- go of bricks
  for the grand ci -- ty hall in New York
  'twas an e -- le -- gant craft, she was rigged fore and aft
  and how the trade winds drove her
  she had twen -- ty -- three masts and she stood sev -- 'ral blasts
  and they called her the I -- rish Ro -- ver
}
verseTwo = \lyricmode {
  \set stanza = "2."
  There was Bar -- ney Ma -- gee from the banks of the Lee
  there was Ho -- gan from Coun -- ty Ty -- rone
  there was John -- ny Mc -- Gurk who was scared stiff of work
  and a chap from West -- meath named Ma -- lone
  there was Slug -- ger O' -- Toole who was drunk as a rule
  and fighting Bill Tra -- cy~from Do -- ver
  and your man Mick Mc -- Cann from the banks of the Bann
  was the skipper of the I -- rish Ro -- ver

}

verseThree = \lyricmode {
  \set stanza = "3."
  We had one mil -- lion bags of the best Sli -- go rags
  we had two mil -- lion bar -- rels of bone
  we had three mil -- lion bales of old nan -- ny goats' tails
  we had four mil -- lion bar -- rels of stone
  we had five mil -- lion hogs and __ _ six mil -- lion dogs
  and sev'n~mil -- lion bar -- rels~of Por -- ter
  we had eight mil -- lion bales of old nan -- ny goats' tails
  in the hold of the I -- rish Ro -- ver
  
}

verseFour = \lyricmode {
  \set stanza = "4."
  We had sail'd se -- ven years when the mea -- sels broke out
  and our ship lost her way in a fog
  and the whole of the crew was re -- duced down to two
  'twas me -- self and the cap -- tain's old dog
  then the ship struck a rock Oh __ _ Lord what a shock
  and near -- ly tumb -- led o -- ver
  turned _ nine times a -- round and the poor dog was drowned
  I'm the last of the I -- rish Ro -- ver
}

verseFive = \lyricmode {
  \set stanza = "5."
}

chordsPart = \new ChordNames \transpose a a \chordNames

violinPart = \new Staff \transpose a a \violin

choirPart = \new ChoirStaff <<
  \new Staff \with {
    instrumentName = \markup \center-column { "Lead" }
  } <<
    \new Voice = "lead" { \transpose a a \lead }
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
    \new Voice = "backingOne" { \transpose a a { \voiceOne \backingOne } }
    \new Voice = "backingTwo" { \transpose a a {\voiceTwo \backingTwo } }
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
  paper-height = 12 \cm
}
