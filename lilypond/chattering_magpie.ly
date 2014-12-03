\include "header"
\paper{
  paper-width= 8.5 \cm
  line-width= 8.0 \cm
  paper-height = 6.25 \cm
}

{
  
<<    
  \relative c'
  {
    \time 2/2 \key g \major
    \repeat volta 2 {b'8 g a fis d8 g g a b4\turn g'8 e fis8 d c a b8 g a fis d8 g g e
                     fis8 g a b c4\turn d8 c b8 g a fis d8 g g a b4\turn g'8 e fis d c a
         b8 g a fis d8 g g e fis g a b c4\turn b8 c}
    \repeat volta 2 {d8 g g fis g4\turn b8 g d8 g g4\turn fis8 g a fis d8 g g fis g4\turn g8 a
                     b8 g a g fis8 d c a d8 g g fis g4\turn b8 g d8 g g4\turn fis8 g a fis 
         d8 g g fis g4\turn g8 a b8 g a g fis8 d c a}
  }
>>

}
