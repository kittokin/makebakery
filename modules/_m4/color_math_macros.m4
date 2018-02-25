m4_dnl  Macros for performing color-mixing operations on HTML color codes.
m4_dnl  ----------------------------------------------------------------------
m4_dnl
m4_dnl  TODO: Hue rotation and colorspace conversion, to enable auto-building
m4_dnl  of palettes with complementary, triadic, and other color relationships.
m4_dnl  See http://paulbourke.net/texture_colour/convert/

m4_define(_3HexLimit,
m4_dnl  Limit values in hex triad to range 0-ff.
m4_dnl    in: hex triad {m4{0}m4},{m4{ca}m4},{m4{fef}m4}
m4_dnl   out: hex triad {m4{0}m4},{m4{ee}m4},{m4{ff}m4}
{m4{m4_ifelse(
   m4_eval(0x$1 < 0), 1, 0,
   m4_eval(0x$1 > 0xff), 1, ff,
   $1),
 m4_ifelse(
   m4_eval(0x$2 < 0), 1, 0,
   m4_eval(0x$2 > 0xff), 1, ff,
   $2),
 m4_ifelse(
   m4_eval(0x$3 < 0), 1, 0,
   m4_eval(0x$3 > 0xff), 1, ff,
   $3)}m4})

m4_define(_3HexAdd,
m4_dnl  Add two hex triads.
m4_dnl    in: two hex triads
m4_dnl        ex: {m4{0}m4},{m4{cc}m4},{m4{ff}m4},{m4{33}m4},{m4{22}m4},{m4{11}m4}
m4_dnl   out: split html color string {m4{33}m4},{m4{ee}m4},{m4{ff}m4}
{m4{_3HexLimit(
   m4_eval({m4{0x$1 + 0x$4}m4},16),
   m4_eval({m4{0x$2 + 0x$5}m4},16),
   m4_eval({m4{0x$3 + 0x$6}m4},16))}m4})

m4_define(_3HexSubtract,
m4_dnl  Subtract second hex triad from first.
m4_dnl    in: two hex triads
m4_dnl        ex: {m4{0}m4},{m4{cc}m4},{m4{ff}m4},{m4{33}m4},{m4{22}m4},{m4{11}m4}
m4_dnl   out: split html color string {m4{33}m4},{m4{ee}m4},{m4{ff}m4}
{m4{_3HexLimit(
   m4_eval({m4{0x$1 - 0x$4}m4},16),
   m4_eval({m4{0x$2 - 0x$5}m4},16),
   m4_eval({m4{0x$3 - 0x$6}m4},16))}m4})

m4_define(_3HexAverage,
m4_dnl  Take average of first and second hex triad.
m4_dnl    in: two hex triads
m4_dnl        ex: {m4{0}m4},{m4{cc}m4},{m4{ff}m4},{m4{33}m4},{m4{22}m4},{m4{11}m4}
m4_dnl   out: split html color string {m4{33}m4},{m4{ee}m4},{m4{ff}m4}
{m4{_3HexLimit(
   m4_eval({m4{(0x$1 + 0x$4) / 2}m4},16),
   m4_eval({m4{(0x$2 + 0x$5) / 2}m4},16),
   m4_eval({m4{(0x$3 + 0x$6) / 2}m4},16))}m4})

m4_define(_3HexMultiply,
m4_dnl  Simulate light shining on a surface.
m4_dnl    in: two hex triads
m4_dnl        ex: {m4{0}m4},{m4{cc}m4},{m4{ff}m4},{m4{33}m4},{m4{22}m4},{m4{11}m4}
m4_dnl   out: split html color string {m4{33}m4},{m4{ee}m4},{m4{ff}m4}
{m4{_3HexLimit(
   m4_eval({m4{0x$1 * 0x$4 / 0xff}m4},16),
   m4_eval({m4{0x$2 * 0x$5 / 0xff}m4},16),
   m4_eval({m4{0x$3 * 0x$6 / 0xff}m4},16))}m4})

m4_define(_ColorTo3Hex,
m4_dnl  Convert a six-hexadecimal-character string to three comma-separated
m4_dnl  two-hexadecimal-character strings representing red, green, and blue.
{m4{m4_substr($1,0,2),
 m4_substr($1,2,2),
 m4_substr($1,4,2)}m4})

m4_define(_3HexToColor,
m4_dnl  Convert three hexadecimal-valued strings to a single six-character html
m4_dnl  color code.
{m4{m4_dnl
m4_ifelse(m4_len($1),{m4{1}m4},{m4{0$1}m4},{m4{$1}m4}){m4{}m4}m4_dnl
m4_ifelse(m4_len($2),{m4{1}m4},{m4{0$2}m4},{m4{$2}m4}){m4{}m4}m4_dnl
m4_ifelse(m4_len($3),{m4{1}m4},{m4{0$3}m4},{m4{$3}m4})}m4})

m4_define(_ColorAdd,
m4_dnl  Add two html colors.
m4_dnl    in: html color string (00ccff),
m4_dnl        html color string (00ccff)
m4_dnl   out: html color string (00ffff)
{m4{_3HexToColor(
   _3HexAdd(
      _ColorTo3Hex($1),
      _ColorTo3Hex($2)))}m4})

m4_define(_ColorSubtract,
m4_dnl  Subtract second html color from first.
m4_dnl    in: html color string (00ccff),
m4_dnl        html color string (00ccff)
m4_dnl   out: html color string (000000)
{m4{_3HexToColor(
   _3HexSubtract(
      _ColorTo3Hex($1),
      _ColorTo3Hex($2)))}m4})

m4_define(_ColorAverage,
m4_dnl  Average html colors.
m4_dnl    in: html color string (00ccff),
m4_dnl        html color string (00ccff)
m4_dnl   out: html color string (000000)
{m4{_3HexToColor(
   _3HexAverage(
      _ColorTo3Hex($1),
      _ColorTo3Hex($2)))}m4})

m4_define(_ColorMultiply,
m4_dnl  Multiply html colors.
m4_dnl    in: html color string (00ccff),
m4_dnl        html color string (00ccff)
m4_dnl   out: html color string (000000)
{m4{_3HexToColor(
   _3HexMultiply(
      _ColorTo3Hex($1),
      _ColorTo3Hex($2)))}m4})

m4_define(_ColorDarken,
m4_dnl  Darken color by one web-safe color level.
m4_dnl    in: html color string (00ccff)
m4_dnl   out: html color string (00ffff)
{m4{_ColorSubtract($1,333333)}m4})
