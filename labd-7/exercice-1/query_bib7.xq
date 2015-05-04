let $bib := "http://www.fil.univ-lille1.fr/~yroos/pxml/pxml-8/tp8/exercice-1/biblio.xml"
return
<data> {
for $year in distinct-values(doc($bib)//book/@year) 
let $avg := avg(doc($bib)//book[@year=$year]/price/text())
return <year value="{$year}" avgprice="{$avg}"/>
   } 
</data>
