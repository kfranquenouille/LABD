import java.nio.file.attribute.AttributeView;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;
import org.xml.sax.helpers.XMLReaderFactory;


public class exo2Handler extends DefaultHandler {

	private float surface =0;
	
	public void startElement(String nameSpaceURI, String localName, String rawName, Attributes attributs) throws SAXException {
		if (localName.equals("maison")){
			surface = 0;
			System.out.print("Maison ");
		}
		if (localName.equals("alcove"))
			return;
		for (int index = 0; index < attributs.getLength(); index++) { // on parcourt la liste des attributs
			if (attributs.getLocalName(index).equals("surface-m2"))
				surface += Float.parseFloat(attributs.getValue(index));
			if (attributs.getLocalName(index).equals("id"))
				System.out.println(attributs.getValue(index)+":");
		}
	}
	
	public void endElement(String nameSpaceURI, String localName, String rawName) throws SAXException {
		if (localName.equals("maison"))
			System.out.println("  superficie totale : "+surface+" m2");
	}
	
	
	public static void main(String[] args) {
		XMLReader saxReader;
		try {
			saxReader = XMLReaderFactory.createXMLReader();
			saxReader.setContentHandler(new exo2Handler());
			saxReader.parse(args[0]);
		} catch (Exception t) {
			t.printStackTrace();
		}

	}

}
