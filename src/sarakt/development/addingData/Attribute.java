package sarakt.development.addingData;

import sarakt.exceptions.InitializationException;

public class Attribute extends ArticleToAdd {
	
	public Attribute(String name, int id) throws InitializationException{
		super(name, id );
	}
	public Attribute(String name, int ID, String mark, String description) throws InitializationException{
		super(name, ID, description);
	}
//	public Ability(String name, int id, String mark, String description)
}
