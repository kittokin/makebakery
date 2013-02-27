TITLE(HTML Colors Demonstration)

m4_dnl We're working a lot with HTML colors and the # symbol, so disable the
m4_dnl comment character behavior for the rest of this file.
m4_changecom()

m4_define(`_bgcolor',`ffffff')
m4_define(`_panel1',_ColorAverage(_bgcolor,`0066ff'))
m4_define(`_panel2',_ColorAverage(_bgcolor,`ff9900'))
m4_define(`_panel3',_ColorAverage(_bgcolor,`00ff00'))

<p>This table is built with the specification of three colors:
<span style="background-color: #_panel1">Panel 1</span>
<span style="background-color: #_panel2">Panel 2</span>
<span style="background-color: #_panel3">Panel 3</span>. We use color math
macros to blend these together for the "overlapping" bits.
</p>

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
colored tables.</p>
