\include "header"
\paper{
  paper-width= 8.5 \cm
  line-width= 8.0 \cm
  paper-height = 3.75 \cm
}

{
  
<<    
  \relative c'
  {
    \time 2/4 \key g \major
    \repeat volta 2 {d8 e g8 a b4 a8 g16 a b8 a a8 g16 a b8 a b8 d d,8 e g8 a b4 a8 g16 a b8 g g8 a b8 g g4} 
    \repeat volta 2 {e'8 d e8 g d4 c8 a b8 a a8 g16 a b8 a a8 d e8 d e8 g d4 c8 a b8 g g8 a b8 g g4}
  }
>>

}
