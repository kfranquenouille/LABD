declare variable $cat := "plant_catalog.xml" ;
declare variable $fam := "plant_families.xml" ;

<CATALOG>
	<LIGHT>
		{
		for $plante in doc($cat)//CATALOG/PLANT
		return
			<EXPOSURE>{$plante/LIGHT}</EXPOSURE>
			<PLANT>
				<COMMON>{$plante/COMMON/text()}</COMMON>
				<BOTANICAL>{$plante/BOTANICAL/text()}</BOTANICAL>
				<ZONE>{$plante/ZONE/text()}</ZONE>
				<PRICE>{$plante/PRICE/text()}</PRICE>
				<AVAILABILITY>{$plante/AVAILABILITY/text()}</AVAILABILITY>
			</PLANT>
		}
	</LIGHT>
</CATALOG>
