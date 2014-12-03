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
    \time 2/4 \key d \major
    \repeat volta 2 {fis'8 a, b8 a fis'8 a, b8 a d4 e8. fis16 e8 d b8 a fis'8 a, b8 a fis'8 a, b8 a d4 e8. fis16 e8 d d4} 
    \repeat volta 2 {fis8 a fis8. e16 e8 d b8 a d4 e8. fis16 e8 d b8 a fis'8 a fis8. e16 e8 d b8 a d4 e8. fis16 e8 d d4}
  }
>>

}
