package sarakt.game.battles;

import java.util.*;

import sarakt.exceptions.InitializationException;
import sarakt.exceptions.SomethingGoesWrongException;
import sarakt.game.battles.interfaces.IMapObject;
import sarakt.tools.Constants;

public class Battle implements Runnable {

	private BattleMap battlemap;
	private BattleRow battleRow;
	private int roundNumber;
	private boolean stillFight;

	public Battle(Collection<CombatUnit> combatants, IMapObject[][] battlemap) throws SomethingGoesWrongException{
		try {
			if ((combatants == null) || (combatants.isEmpty())) {
				throw new InitializationException("Noone has participe in this combat!");
			}
			if ( battlemap == null){
				throw new InitializationException("Invalid battle map");
			}
		this.battleRow = new BattleRow(combatants);
		this.battlemap = new BattleMap(battlemap);
		
		} catch (Exception exc) {
			throw new SomethingGoesWrongException("Something is going wrong!", exc);
		}
	}

	
	@Override
	public void run() {
		while ( this.stillFight){
			
			roundNumber++;
		}
		// TODO Auto-generated method stub

	}
}
