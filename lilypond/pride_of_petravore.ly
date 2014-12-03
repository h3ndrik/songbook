\include "header"
\paper{
  paper-width= 8.5 \cm
  line-width= 8.0 \cm
  paper-height = 5 \cm
}

{
  
<<    
  \relative c'
  {
    \time 4/4 \key e \minor
    \repeat volta 2 {e4. fis8 g4. a8 b8 c b a g4 fis4 d4. e8 fis4. g8 a8 b a g fis4 d4
         e4. fis8 g4. a8 b8 c b a g4 a4 b4 b8 c b8 a g fis e4 d4 e2} 
    \repeat volta 2 {e'4 e4 e4 e4 d8 b g a b4 b8 c b8 a fis g a4 a8 b a8 g e d e4 b'8 d
         e4 e4 g8 fis g e d8 b g a b4 g8 a b4 b8 c b8 a g fis e4 d4 e2}
  }
>>

}

% Alternativ:
% Aus: http://abcnotation.com/tunePage?a=www.pick.ucam.org/~aswaine/music/brbsets/0023
%\include "header"
%\paper{paper-height = 8\cm}
%
%{
%
%<<
%  \chords {
%    \repeat volta 2 { g1 c2 g2 d1 }
%    \repeat volta 2 { g1 c2 g2 d1 }
%  }
%
%
%  \relative c' {
%    \key g \major \time 2/2
%    \repeat volta 2 { d4 g b4. b8 | c4 b b4. b8 | b4 a a4. b8 }
%    
%    \repeat volta 2 { d'4^"Chorus" d d b | c c c a | b b8 b b4 g | a fis e8 d4. }
%  }
%>>
%
%}
