package sarakt.development.addingData;

import java.util.*;

import sarakt.exceptions.InitializationException;

public class Skill extends ArticleToAdd {
	
	private static final int MINIMAL_VALUE = 0;
	Map<Attribute, Integer> requirement;

	public Skill(String name) throws InitializationException {
		super(name);
		this.requirement = new HashMap<Attribute, Integer>();
	}

	public Skill(String name, int id) throws InitializationException {
		super(name, id);
	}

	public Skill(String name, int id, String description) throws InitializationException {
		super(name, id, description);
	}
	
	// Return true if successful add requiring attribute;
	public boolean addRequirement(Attribute attribute, int value){
		if( attribute == null){
			return false;
		}
		if (value < MINIMAL_VALUE){
			return false;
		}
	return true;
	}
}
