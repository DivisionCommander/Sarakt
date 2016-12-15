package sarakt.development.addingData;

public abstract class ArticleToAdd {
	
	protected final String name;
	protected int id;
	protected String desc;
	
	protected ArticleToAdd(String name){
		this.name = name;
	}

	protected ArticleToAdd(String name, int id){
		this(name);
		this.id = id;
	}
	
	
	public abstract String getName();
	public abstract int getID();
	public abstract void addDescription(String description);
}
