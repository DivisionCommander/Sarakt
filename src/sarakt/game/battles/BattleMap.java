package sarakt.game.battles;

import sarakt.exceptions.InitializationException;
import sarakt.exceptions.SomethingGoesWrongException;
import sarakt.game.battles.interfaces.IMapObject;

public class BattleMap implements IMapObject {

	private IMapObject[][] battlemap;

	public BattleMap(IMapObject[][] battlemap) throws SomethingGoesWrongException {
		try {
			if (battlemap == null) {
				throw new InitializationException("Cannot build map for combat!");
			}
			this.battlemap = battlemap;
		} catch (Exception exc) {
			throw new SomethingGoesWrongException("Error in map!", exc);
		}
	}
	
	
}
