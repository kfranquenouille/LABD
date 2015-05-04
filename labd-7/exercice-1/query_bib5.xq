let $bib := "http://www.fil.univ-lille1.fr/~yroos/pxml/pxml-8/tp8/exercice-1/biblio.xml"
return
<bib> 
   {  
 for $b in doc($bib)//book 
   where count($b/author) > 0
   return 
      <book> 
      {$b/title} 
      { for $a in $b/author[position() <= 2] 
        return $a } 
      { if (count($b/author) > 2) 
        then <et-al/> else () } 
  </book>
} 
</bib>
