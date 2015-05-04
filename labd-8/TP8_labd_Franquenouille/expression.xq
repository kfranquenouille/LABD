declare default element namespace "http://www.expression.org";
declare variable $expression := "expression.xml";
declare variable $variables := "variables.xml";
declare option saxon:output "omit-xml-declaration=yes";

declare function local:print($name as xs:string)  as xs:string {	
	local:lineaire(doc($expression)//expr/*)
};

declare function local:lineaire($name as node()) as xs:string {
	if (string(node-name($name)) = "op") then
		let $gauche := local:lineaire($name/*[1])
		let $droite := local:lineaire($name/*[2])
		return concat("( ", $gauche, " ", $name/@val, " ", $droite, " )")
	else
		data($name)
};




declare function local:eval($name as xs:string) as xs:integer {
	local:recurEval(doc($expression)//expr/*)
};

declare function local:recurEval($name as node()) as xs:integer {
	if (string(node-name($name)) = "op") then
		let $gauche := local:recurEval($name/*[1])
		let $droite := local:recurEval($name/*[2])
		return local:operator($gauche, string($name/@val), $droite) 
	else if (string(node-name($name)) = "var") then
		fn:error(xs:QName("ERROR"), "a variable was found")
	else
		xs:int($name)
};

declare function local:operator($g as xs:integer, $op as xs:string, $d as xs:integer) as xs:integer 
{
	if ($op = "+") then
		$g + $d
	else if ($op = "/") then
		xs:integer($g div $d)
	else if ($op = "*") then 
		$g * $d
	else 
		$g - $d
};




declare function local:eval-var($name as xs:string, $variables as xs:string) as xs:integer{
	local:evalExprVar(doc($expression)//expr/*, $variables)
};

declare function local:evalExprVar($e as node(), $variables as xs:string) as xs:integer{
	if (name($e) = "op") then
		let $gauche := xs:integer(local:evalExprVar($e/*[1], $variables))
		let $droite := xs:integer(local:evalExprVar($e/*[2], $variables))
		return local:operator($gauche, $e, $droite)
	else if (name($e) = "cons") then
		xs:integer($e/text())
	else
		local:evalVar($e, $variables)
};

declare function local:evalVar($e as node(), $variables as xs:string) as xs:integer{
	if (count(doc($variables)//*[name() = $e/text()]) = 0) then
		fn:error(xs:QName("ERROR"), "variable not found")
	else if (count(doc($variables)//*[name() = $e/text()]) > 1) then
		fn:error(xs:QName("ERROR"), "too much occurence for the same variable")
	else
		xs:integer(doc($variables)//*[name() = $e/text()])
};





local:eval-var($expression, $variables)

