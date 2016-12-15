package sarakt.development.addingData;

import sarakt.exceptions.InitializationException;
import sarakt.tools.Checkers;
import sarakt.tools.Constants;

public class Ability extends ArticleToAdd {
	private String mark;
	private String desc;
	
	public Ability(String name, int id) throws InitializationException{
		super(name, id );
		this.mark = Constants.EMPTY_TITLE;
		this.desc = Constants.BLOCK_CHARACTER;
	}
	public Ability(String name, int ID, String mark, String description) throws InitializationException{
		this(name, ID);
		if(!Checkers.invalidText(mark)){
			this.mark = mark;
		}
		if(!Checkers.invalidText(description)){
			this.desc = description;
		}
	}
	
	
	
	public void addDescription(String description){
		if (!Checkers.invalidText(description)){
			this.desc = (description);
		}
	}
	@Override
 	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int getID() {
		// TODO Auto-generated method stub
		return 0;
	}

}
