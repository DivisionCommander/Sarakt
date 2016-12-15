package sarakt.game.battles;

import java.util.*;

import sarakt.exceptions.InitializationException;
import sarakt.exceptions.SomethingGoesWrongException;
import sarakt.tools.Constants;

public class BattleRow {
	
	private List<CombatUnit> participants;
	
	
	BattleRow(Collection<CombatUnit> combatants) throws SomethingGoesWrongException{
		
		try {
			if ((combatants == null) || (combatants.isEmpty())) {
				throw new InitializationException("Noone has participe in this combat!");
			}
			this.participants= new LinkedList<CombatUnit>();
			this.participants.addAll(combatants);
			this.configureBattleRow();
		} catch (Exception exc) {
			throw new SomethingGoesWrongException("Something is going wrong!", exc);
		}
	}

	
	protected void configureBattleRow(){
		this.quicksort(Constants.ZERO, this.participants.size());
	}
	
	private void quicksort(int start, int end){
		if( start >= end){
			return;
		}
		int splitter = this.split(start, end);
		this.quicksort(start, splitter-1);
		this.quicksort(splitter+1, end);
	}
	
	private int split(int start, int end){
		CombatUnit pivot = this.participants.get(end);
		int lowest  = (start-1);
		for (int index = start; index < end; index++){
			CombatUnit current = this.participants.get(index);
			if (CombatUnitDAO.isFirstSlower(current, pivot)){
				lowest++;
				this.swapCombatant(index, end);
			}
		}
		return lowest;
	}
	
	private void swapCombatant(int first, int second){
		CombatUnit swapper = this.participants.get(first);
		this.participants.set(first, this.participants.get(second));
		this.participants.set(second, swapper);
	}
}
