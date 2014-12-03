       #define _GNU_SOURCE
       #include <stdio.h>
       #include <stdlib.h>
       #include <string.h>

       #define MAXLINESIZE 1024
       #define EMPTY 0
       #define TEXT 1
       #define CHORDS 2

char *trimwhitespace(char *str)
{
  char *end;

  // Trim leading space
  while(isspace(*str)) str++;

  if(*str == 0)  // All spaces?
    return str;

  // Trim trailing space
  end = str + strlen(str) - 1;
  while(end > str && isspace(*end)) end--;

  // Write new null terminator
  *(end+1) = 0;

  return str;
}

       int
       main(void)
       {
//           FILE *fp;
           char *line1 = NULL;
           char *line2 = NULL;
           char *ptr = NULL;
           char chord[10] = "";
           char *title = NULL;
           char *author = NULL;
           size_t len = MAXLINESIZE;
           ssize_t read1;
           ssize_t read2;
           int i, k;
           int linetype = 1;

           line1 = malloc(MAXLINESIZE+1);  // Safety precaution if someone wants to write MAXLINESIZE plus \0
           line2 = malloc(MAXLINESIZE+1);

//           fp = fopen("/etc/motd", "r");
//           if (fp == NULL)
//               exit(EXIT_FAILURE);

           read1 = getline(&line1, &len, stdin);
           strtok(line1, "\n");
           title = &(strstr(line1, " - ")[3]);
           title[-3] = '\0';
           author = line1;
           
           // Print docunemt header
           printf("\\selectlanguage{english}\n\\songcolumns{2}\n\n\\beginsong{%s}\n       [by=%s]\n\n\\beginverse\n", title, author);

           read1 = getline(&line1, &len, stdin);
           if (read1 == 1)  read1 = getline(&line1, &len, stdin);  // Skip first empty line
           while (read1 != -1) {
               // Convert line1 from unicode to ascii
/*               k = 0;
               for (i = 0; i < MAXLINESIZE; i++) {
                   if (line1[i] < 0) {
                       printf("%d, ", line1[i]);// Sonderzeichen ä,ö,ü,ß
                       line1[k] = ' ';
                       if (line1[i+1] >= 0) k++;
                   }
                   else {
                       if (k<i) line1[k] = line1[i];
                       if (line1[i] == '\n' || line1[i] == '\0')  {
                           line1[k] == '\0';
                           if (k < read1)  read1 = k+1;
                           break;
                       }
                       k++;
                   }
               }
*/
               read2 = getline(&line2, &len, stdin);
               // Convert line2 from unicode to ascii
/*               k = 0;
               for (i = 0; i < MAXLINESIZE; i++) {
                   if (line2[i] < 0) {
                       line2[k] = ' ';
                       if (line2[i+1] >= 0) k++;
                   }
                   else {
                       if (k<i) line2[k] = line2[i];
                       if (line2[i] == '\n' || line2[i] == '\0')  {
                           line2[k] == '\0';
                           if (k < read2)  read2 = k+1;
                           break;
                       }
                       k++;
                   }
               }
*/
               // Fill line2 with spaces
               k = read2;
               if (read2 < 1)  read2 = 1;
               for (i=(int)read2-1;i<MAXLINESIZE;i++)
               {
                   line2[i] = ' ';
               }
               read2 = k;
               line2[MAXLINESIZE] = '\0';
//               printf("while... line1(%zu) : %s\n", read1, line1);
//               printf("while... line2(%zu) : %s\n", read2, line2);

                   linetype = EMPTY;
                   for(i=(int)read1-2;i>=0 && linetype != TEXT;i--)
                   {
//                       printf("i=%d,  line1[i]=\'%c\'\n", i, line1[i]);
                       if (i == 0 || isspace(line1[i-1]))
                           switch (line1[i])
                           {
                               case 'C':
                               case 'D':
                               case 'E':
                               case 'F':
                               case 'G':
                               case 'A':
                               case 'B':
                               case 'H':
                               case '.':
                               case '(':
                               case ')':
                               case 'x':
                               case '2':
                               case '3':
                               case '4':
                               case '5':
                               case '6':
                               case '7':
                               case '8':
                                   // Chord found
                                   linetype = CHORDS;
                                   // Insert to line2
                                   strncpy(chord,&line1[i],(size_t)10);
                                   chord[10] = '\0';
                                   ptr = strchrnul(chord, ' ');
                                   *ptr = '\0';
                                   ptr = strchrnul(chord, '\n');
                                   *ptr = '\0';
                                   ptr = strchrnul(chord, '\t');
                                   *ptr = '\0';
//                                   printf("chord: %s an stelle %d\n", chord, i);
                                   memmove(&line2[i+strlen(chord)+3],&line2[i],MAXLINESIZE-i-strlen(chord)-3);
                                   line2[i] = '\\';
                                   line2[i+1] = '[';
                                   strncpy(&line2[i+2],chord,strlen(chord));
                                   line2[i+strlen(chord)+2] = ']';
                                   break;
                               case '\n':
                               case ' ':
                               case '\t':
                               case -62:
                                   // Whitespace
                                   break;
                               default:
                                   // No Chord
                                   linetype = TEXT;
//                                   printf("char an pos %d: \"%c\"\n", i, line1[i]);
                                   break;
                           }

                   }
                   switch (linetype) {
                       case EMPTY:
                           printf("\\endverse\n\n\\beginverse\n");
                           read1 = read2;
                           read2 = -1;
//                           printf("read2 = \"%d\"\n", read2);
                           ptr = line1;
                           line1 = line2;
                           line2 = ptr;
                           break;
                       case TEXT:
                           trimwhitespace(line1);
                           line1[read1] = '\0';
                           printf("%s\n", line1);
                           read1 = read2;
                           read2 = -1;
                           ptr = line1;
                           line1 = line2;
                           line2 = ptr;
                           break;
                       case CHORDS:
                           trimwhitespace(line2);
                           //line2[read2] = '\0';
                           printf("%s\n", line2);
                           read1 = getline(&line1, &len, stdin);
                           read2 = -1;
                           break;
                   }
           }

           printf("\\endverse\n\n\\endsong\n");

//           free(line1);
//           free(line2);
           exit(EXIT_SUCCESS);
       }











/*
#### Bash tricks to tidy up the files:
//#!/bin/bash
//
//#csplit Klampfkladde.xml '/<title>/' {*}
//
//# Rename to Artist/Title
//#for i in */*.sg
////#  do
////#  k=$(cat $i | sed -n 's|.*\\beginsong{\(.*\)}.*|\1|p')
//#  l=$(cat $i | sed -n 's|.*\[by=\(.*\)\].*|\1|p')
//#  echo "$k :: $l"
//#  mkdir "$l"
//#  mv "$i" "$l/$k.sg"
//#done
//
//# Rename to Artist - Title
//#for i in xx*
//#  do
//#  k=$(cat $i | sed -n 's|.*<title>\(.*\)</title>.*|\1|p')
//#  mv $i "$k.txt"
//#done
//
//#csplit Klampfkladde_Anhang.xml '/<title>/' {*}
//
//# Rename to Artist - Title
//#for i in xx*
//#  do
//#  k=$(cat $i | sed -n 's|.*<title>\(.*\)</title>.*|\1|p')
//#  mv $i "$k.txt"
//#done
//
//#Remove Tags
//#for i in *.txt
//#  do
//#  cat "$i" | sed 's/^[ \t]*//' | sed 's/<[^<]*>//g' > "$i.2"
//#  mv "$i.2" "$i"
//#done
//
//# Nach dem Titel soll (mindestens) eine newline stehen
//#for i in *.txt
//#do
//#  sed -e '1a\\n' "$i" > "$i.2"
//#  mv "$i.2" "$i"
//#done
//
//#Entferne doppelte leere Zeilen (Zeilen mit max Whitespace)
//#for i in *.txt
//#do
//#sed -e 's/^[SPACE TAB]*$//' -e '/./,/^$/!d' "$i" > "$i.2"
//#  mv "$i.2" "$i"
//#done
//
//#Convert from unicode to html
//#for i in *.txt
//#do
//#uni2ascii -a Q "$i" > "$i.2"
//#  mv "$i.2" "$i"
//#done
//
//#Convert from unicode to ascii
//#for i in *.txt
//#do
//#uni2ascii -By "$i" > "$i.2"
//#  mv "$i.2" "$i"
//#done
//
//# Convert html to ascii
//#for i in *.txt
//#do
//#sed -e "s/&uuml;/ü/g" -e "s/&ouml;/ö/g" -e "s/&auml;/ä/g" -e "s/&Auml;/Ä/g" -e "s/&Ouml;/Ö/g" -e "s/&Uuml;/Ü/g" -e "s/&szlig;/ß/g" "$i" > "$i.2"
//#mv "$i.2" "$i"
//#done
//
//# Convert &nbsp
//#for i in *.txt
//#do
//#sed -e "s/&nbsp;/ /g" "$i" > "$i.2"
//#mv "$i.2" "$i"
//#done
//
//# Convert quotes
//#for i in *.txt
//#do
//#sed -e "s/&rsquo;/'/g" -e "s/&ldquo;/'/g" -e "s/&bdquo;/'/g" -e "s/&lsquo;/'/g" -e "s/&rdquo;/'/g" -e "s/&acute;/'/g" "$i" -e "s/ &#x0301;/'/g" > "$i.2"
//#mv "$i.2" "$i"
//#done
//
//#for i in *.txt
//#do
//#sed -e "s/&hellip;&hellip;&hellip;/\\dots{}/g" -e "s/&hellip;/./g" "$i" > "$i.2"
//#mv "$i.2" "$i"
//#done
//
//#converttoinline
//#for i in *.txt
//#do
//#cat "$i" | ./chords_to_inline > "$i.2"
//#  mv "$i.2" "$i"
//#done
//
//# Remove \\beginverse\n\\endverse ?
*/
