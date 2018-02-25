TITLE(HTML Colors Demonstration)

m4_dnl We're working a lot with HTML colors and the # symbol, so disable the
m4_dnl comment character behavior for the rest of this file.
m4_changecom()

m4_define({m4{_bgcolor}m4},{m4{ffffff}m4})
m4_define({m4{_panel1}m4},_ColorAverage(_bgcolor,{m4{0066ff}m4}))
m4_define({m4{_panel2}m4},_ColorAverage(_bgcolor,{m4{ff9900}m4}))
m4_define({m4{_panel3}m4},_ColorAverage(_bgcolor,{m4{00ff00}m4}))

<p>This table is built with the specification of three colors:
<span style="background-color: #_panel1">Panel 1</span>
<span style="background-color: #_panel2">Panel 2</span>
<span style="background-color: #_panel3">Panel 3</span>. We use color math
macros to blend these together for the "overlapping" bits.
</p>

<!--

If you've just used "view source" and are wondering where the mathematics are
happening, have a look at the file etc/color_math_macros.m4 in the source
repository: https://github.com/datagrok/makebakery

All the color calculations happen when you run "make."

-->

<table cellpadding=8 cellspacing=0 border=0>
<tr>
<td style="background-color: #_bgcolor">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_panel1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_panel1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_bgcolor">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_bgcolor">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td style="background-color: #_panel2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_ColorAverage(_panel1,_panel2)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_ColorAverage(_panel1,_panel2)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_panel2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_panel2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td style="background-color: #_panel2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_ColorAverage(_panel1,_panel2)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_ColorAverage(_ColorAverage(_panel1,_panel2),_panel3)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_ColorAverage(_panel2,_panel3)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_panel2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td style="background-color: #_bgcolor">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_panel1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_ColorAverage(_panel1,_panel3)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_panel3">&nbsp;Wow, remember when HTML tables were used for layout?&nbsp;</td>
<td style="background-color: #_bgcolor">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td style="background-color: #_bgcolor">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_panel1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_panel1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_bgcolor">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #_bgcolor">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
</table>

<p>Of course, this demo is showing this project's age. In the modern, civilized
world, one might use color math in their CSS templates rather than build
colored tables. Which one could totally do with makebakery, by creating files
named something.css.m4.</p>
