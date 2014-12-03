% From: https://github.com/Ed-von-Schleck/irish.git
% Copyright: public domain
\version "2.18.0"

%\header {
%  title = "The Green Fields of France"
%  composer = "Eric Bogle"
%  arranger = "Ed von Schleck"
%}

global = {
  \key g \major
  \time 3/4
  \partial 4
  \tempo 4=135
}

chordNames = \chordmode {
  \global
  \germanChords
  s4

  g2. e:m c d
  d2.*2 c2. g2.
  g2. e:m c d
  d2.*2 c2. g2.

  g2. e:m a:m c
  d2.*2 c2. d2.
  g2. e:m a:m c
  d2.*2 c2. g2.

  d2.*2 c2. g
  d2.*2 c2. d
  c2.*2 g2. e:m
  g e:m d g2

}

lead = \relative c' {
  \global 
  d4

  d2 d8 g
  g2 g4
  e8 e4. c4
  a4 r4 fis'8 fis

  fis4. fis8 g4
  a8 a4. g4
  g4. c,8 e4
  d4 r d

  d2 d8 g
  g2 g8 g
  e4 e8 c4.
  a4 r fis'8 fis

  fis4 fis8 g4.
  a2 g4
  g g a
  g4 r d'


  d4 d d8 d~
  d4 c c8 b
  a4 a8 b4.
  c4 r c8 b

  a4. a8 b4
  c4 b a
  g a b8 a~
  a4 r d8 d

  d4 d8 d4.
  d4 c b
  a a8 g4.
  e4 r a8 a

  a a4. b4
  c4 r b8 a
  g4 g8 g4.
  g4 r g8 a


  a4. a8 a4
  a b b8 c
  c4. d8 c4
  b16( a) g4 r8 g a

  a4. a8 a4
  a b c
  c8 d4. c4
  a4 r c8 c

  c4 c4. c8
  c4 d4. c8
  b b r2
  r2 g8 g

  g4 a b8 b~
  b4 c b8 a~(
  a4. g8 fis4)
  g4 r4
  \bar "|."
  
}

backingOne = \relative c'' {
  \global
  r4

  R2.*31
  r2 g8 e

  fis4. fis8 fis4
  fis4 fis fis8 fis
  g4. g8 g4
  g8 g4 r8 g e

  fis4. fis8 fis4
  fis4 fis fis
  g8 g4. g4
  fis4 r fis8 fis

  g4 g4. g8
  g4 g4. g8
  g g r2
  r2 g8 g

  g4 fis g8 g~
  g4 g g8 fis~(
  fis4. e8 fis4)
  g4 r4


}

backingTwo = \relative c'' {
  \global
  r4

  R2.*31
  r2 g8 e

  d4. d8 d4
  d4 d d8 d
  e4. e8 e4
  d8 d4 r8 d8 e

  d4. d8 d4
  d d d
  e8 e4. e4
  d4 r d8 d

  e4 e4. e8
  e4 e4. c8
  d8 d r2
  r2 e8 e

  d4 d d8 e~
  e4 e e8 d~(
  d2 c4)
  b4 r4
}

violin = \relative c' {
  \global
  r4
  R2.*31
  g8 a b c d e

  fis2 fis8 g
  a4. g8 fis4
  e8 fis g a c d
  b4 b,8 c d e

  fis2 fis8 g
  a4. g8 fis4
  e8 fis g a c d
  d4 r c8 d

  e4 e4. fis8
  g4 fis4. e8
  d8 d4 c8 b a
  g fis e r b' b

  b4 c d8 e~
  e4 e d8 e
  a,8 b c b a b
  g4 r4
}

verseOne = \lyricmode {
  \set stanza = "1."
  Well how do you do young Wil -- ly Mc -- Bride
  do you mind if I sit here down by your grave -- side
  and rest for a while in the warm sum -- mer sun
  I've been wal -- king all day and I'm near -- ly done

  I see by your grave -- stone your were on -- ly nine -- teen
  when you joined the great fal -- ling in nine -- teen -- six -- teen
  well I hope you died well and I hope you died clean
  or young Wil -- ly Mc -- Bride was it slow and ob -- scene

  \set stanza = "Ref."
  Did they beat the drum slow -- ly
  did they play the fifes low -- ly
  did they sound the death march as they lo -- wered you down
  did the band play the last post and cho -- rus
  did the pipes play the flowers of the fo -- rest
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Did~you leave _ a wife or~a sweet -- heart be -- hind
  in _ some faith -- ful heart is your memo -- ry en -- shrined
  and though you died back _ in nine -- teen -- six -- teen
  in _ some faith -- ful heart you're~for -- e -- ver nine -- teen
   
  or are you a stran -- ger with -- out e -- ven a name
  en --  _ shrined _ for -- e -- ver be -- hind a glass frame
  in an old pho -- to -- graph torn, _ bat -- tered and stained
  and _ fa -- ding to yellow in a brown lea -- ther frame

}

verseThree = \lyricmode {
  \set stanza = "3."
  Well~the sun now it shines on~the green fields of France
  there's a warm sum -- mer breeze it~makes the red pop -- pies dance
  and look how the sun shines from un -- der the clouds
  there's no gas, no barbed wire, there's~no gun fi -- ring now.
   
  but here in this grave -- yard it is still no man's land
  the _ count -- less white cros -- ses stand mute in the sand
  to _ man's blind in -- dif -- ference to his fel -- low man
  to a whole ge -- ne -- ration that were but -- chered and dammed
  
}

verseFour = \lyricmode {
  \set stanza = "4."
  Well Will Mc -- _ Bride I~can't help won -- der why
  do _ those _ that lie here know why did they die
  and did they be -- lieve when they ans -- wered the call
  did they real -- ly believe that this war would end war
   
  well~the sor -- row, the suf -- fering, the _ glo -- ry, the pain
  the _ kil -- ling, the dy -- ing was all done in vain
  for young Wil -- ly Mc -- Bride, it all hap -- pened a -- gain
  and a -- gain, and a -- gain, and a -- gain, and a -- gain
}

verseFive = \lyricmode {
  \set stanza = "5."
}

chordsPart = \new ChordNames \chordNames

violinPart = \new Staff \violin

choirPart = \new ChoirStaff <<
  \new Staff \with {
    instrumentName = \markup \center-column { "Lead" }
  } <<
    \new Voice = "lead" { \lead }
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
    \new Voice = "backingOne" { \voiceOne \backingOne }
    \new Voice = "backingTwo" { \voiceTwo \backingTwo }
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
  paper-height = 24 \cm
}
