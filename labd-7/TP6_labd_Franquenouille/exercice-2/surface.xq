xquery version "1.0";
let $mais := "./maisons.xml"
return
<html>
<body><table border="1"><tr><th>Maisons</th><th>Surface (m2)</th></tr>
{ 
	for $home in doc($mais)//maison
	return <tr><td>Maisons { data($home/@id)}</td><td>{sum ($home/*/*/@surface-m2)}</td></tr>
} 
</table></body>
</html>
