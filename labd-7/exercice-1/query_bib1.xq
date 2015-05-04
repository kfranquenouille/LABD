declare variable $bib := "http://www.fil.univ-lille1.fr/~yroos/pxml/pxml-8/tp8/exercice-1/biblio.xml" ;

<bib> 
   { 
   for $b in doc($bib)//book 
   where $b/publisher = "Addison-Wesley" and 
       $b/@year > 1991 
   return 
      <book year="{$b/@year}"> 
         {$b/title} 
      </book> 
   } 
</bib>
