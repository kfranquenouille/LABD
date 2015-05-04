declare variable $expression := "testGen.xml";

declare option saxon:output "omit-xml-declaration=yes";



declare function local:print($name as xs:string)  as xs:string 
{	
	local:lineaire(doc($exp)//expr/*)
};

declare function local:lineaire($name as node()) as xs:string
{
	if nodename($name) = "op" then
		let $gauche = local:lineaire($name/*[1])
		let $droite = local:lineaire($name/*[2))
		
		return concat("(", $gauche, $name[@val], $droite, ")")
	else
		return data($name)
	 	
};



local:print($expression)
