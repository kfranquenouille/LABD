declare function local:books-by-author ($root, $last, $first) { 
   for $b in $root/book 
   where some $ba in $b/author 
   satisfies ($ba/last = $last and  
              $ba/first=$first) 
   return $b/title  
}; 
let $bib := "http://www.fil.univ-lille1.fr/~yroos/pxml/pxml-8/tp8/exercice-1/biblio.xml"
return
<results> {
let $a := doc($bib)//author 
for $last in distinct-values($a/last), 
$first in distinct-values($a[last=$last]/first) 
order by $last, $first
return <result> 
   <author> <last>{$last}</last>   
   <first>{$first}</first> </author> 
   {local:books-by-author(doc($bib)/bib, $last, $first)} 
   </result> 
   } 
</results>
