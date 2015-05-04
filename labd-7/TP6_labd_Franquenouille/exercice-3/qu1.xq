xquery version "1.0";
let $cat := "/home/kevin/Bureau/LABD/labd-7/exercice-3/plant_catalog.xml"
let $fam := "/home/kevin/Bureau/LABD/labd-7/exercice-3/plant_families.xml"
return 
<CATALOG>
{
	for $plant in doc($cat)//PLANT
		let $nom := $plant/BOTANICAL
		let $famille := doc($fam)/SPECIES eq $nom
	return 
		<PLANT>
			<COMMON>{$plant/COMMON/text()}</COMMON>
			<BOTANICAL>{$plant/BOTANICAL/text()}</BOTANICAL>
			<ZONE>{$plant/ZONE/text()}</ZONE>
			<LIGHT>{$plant/LIGHt/text()}</LIGHT>
			<PRICE>{$plant/PRICE/text()}</PRICE>
			<AVAILABILITY>{$plant/AVAILABILITY/text()}</AVAILABILITY>
			<FAMILY>{$famille}</FAMILY>
		</PLANT>
}
</CATALOG>
