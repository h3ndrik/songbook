% From: https://github.com/Ed-von-Schleck/irish.git
% Copyright: public domain
\version "2.18.0"

%\header {
%  title = "Drunken Lullabies"
%  composer = "Flogging Molly"
%}

global = {
  \key g \major
  \time 4/4
  \partial 4
  \tempo 4=140
}

chordNames = \chordmode {
  \global
  \germanChords
  s4 

  g1*2 e:m
  c e1:m d
  g1*2 e:m
  c e1:m d

  %refrain
  c1 g c d g2 c
  e1:m g2 d2 g1*2

  %bridge
  c1 g c g
  c2 d g e:m c d g1
  c g c d
  g2 c e1:m g2 d g2.

}

lead = \relative c'' {
  \global
  \repeat volta 2 {
  \repeat volta 2 {
  g8 b
  d8 e4 d8~ d4 d
  d8 e4 d8~ d4 c8 c
  b8 b4. b4 a8 g~ 
  g2 r4  g8 g
  c4 c c c
  c c c c8 c
  b4 b b g8 a~
  a2 r4 b4

  d8 e4 d8~ d d d d 
  d8 e4 d8~ d r8 c4
  b b b8 a4 g8~
  g2 r8 g g8 g
  c8 c4. c4 c
  c c8 c~ c4 c8 c
  b8 b~b4  b4 g8 a~
  a2 r4 a8 b

  %Refrain
  c4. e8 g4. e8 
  d8 c4 b8~ b4 r8 b
  c4 e g e
  d2 r4 e8 fis
  g4 fis4 e4 d8 d
  e8 d4 b8~ b r8 g a
  b d4. a4. g8
  }
  \alternative{
  {g2 r2}
  {g2 r4 a8 b}
  }
  %Bridge
  c8 c c b a4. g8 
  b2 r4 g4
  c8 c c b a4. g8
  b2 r4 a8 b 
  c4 c8 b a4 g8 a
  b4 b8 a g4 a8 b
  c4 c8 b a4 g8 fis
  g2 r4 a8 b
  c4 b a g
  g2 r8 g a b
  c8 c4 b8 a4 c
  d2 r4  e8 fis
  g4 fis4 e4 d8 d
  e8 d4 b8~ b r8 g a
  b d4. a4. g8
  g2 r4
  }
  
}

backingOne = \relative c'' {
  \global
  r4
  R1*15
  r2. a8 b

  c4. c8 c4. c8
  g g4 g8~ g4 r8 g
  c4 c c c
  d2 r4 c8 d

  d4 b c g8 g
  b b4 b8~ b r8 g a
  g8 g4. d4. d8
  g2 r2
  g2 r2

  R1*8
 
}

backingTwo = \relative c' {
  \global
}

verseOne = \lyricmode {
  \set stanza = "1."
  Must it take a life for hate -- ful eyes _ to glis -- ten
  once a -- gain.
  Five _  hund -- red years like ge -- lig  --  nite
  have  _ blown us all to hell.
  What sa -- voir rests while on his
  cross we die for -- got -- ten
  free -- dom burns.
  _ Has the shep -- ard led his lambs
  a -- stray to the bi  -- got and the gun. 
   
  \set stanza = "Ref."
  Must it take a life for hate -- ful eyes
  to glis -- ten once a -- gain.
  Cause we find our -- selves in the same old mess
  sing -- in'  drunk -- en lul -- la -- bies. 

  bies Ah, but may -- be it's the way
  you're  taught. Or may -- be it's the way we fought.
  But a smile ne -- ver grins with -- out tears to be -- gin
  for each kiss is a cry we all lost
  though there's no -- thing left to gain
  but for the ban -- shee that stole the grave
  cause we find our -- selves in the same old mess
  sing -- in'  drunk -- en lul -- la -- bies. 

}

verseTwo = \lyricmode {
  \set stanza = "2."
  I _ watch and stare as Ro -- sin's eyes
  turn a dar -- ker shade of red.
  And the bul -- let with this snip -- er
  lie in their bloo -- dy gut -- less cell.
  Must_we starve on crumbs _  from _ long a -- go
  through  bars of men made steel.
  Is it a great or litt -- le
  thing we fought knelt the con -- science
  blessed to kill.
}

verseThree = \lyricmode {
  \set stanza = "3."
  I sit in and dwell on fac -- es past
  _ like memo -- ries seem to fade.
  No _ co -- lour left but black and white and _ soon
  all will turn grey.
  But may theese sha -- dows rise to walk
  a -- gain. With les -- sons tru -- ly learnt.
  _ When the blos -- som flowers in each our
  hearts shall _ beat a new found flame.

 
}

verseFour = \lyricmode {
  \set stanza = "4."
  
}

chordsPart = \new ChordNames \transpose g d \chordNames

choirPart = \new ChoirStaff <<
  \new Staff \with {
    instrumentName = \markup \center-column { "Lead" }
  } <<
    \new Voice = "lead" { \transpose g d \lead }
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
    \new Voice = "backingOne" { \transpose g d \backingOne }
    %\new Voice = "backingTwo" { \voiceTwo \transpose g d \backingTwo }
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
