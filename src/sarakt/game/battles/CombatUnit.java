package sarakt.game.battles;

import java.util.*;

import sarakt.exceptions.*;
import sarakt.game.battles.interfaces.IBattleAction;
import sarakt.game.characters.*;
import sarakt.game.effects.SpellEffect;

public class CombatUnit implements IBattleAction{

	private GameCharacter gameUnit;
	private boolean actedThisRound;
	private double minDamage;
	private double maxDamage;
	private int hitPoints;
	private int actingnPoints;
	private List<SpellEffect> buffs;
	private List<SpellEffect> debuffs;
	private int quickness;
	private boolean isPlayer;
	private byte position;

	public CombatUnit(GameCharacter character, boolean isPlayer) throws SomethingGoesWrongException{
		try {
			
			if (character == null) {
				throw new InitializationException("No character to add!");
			}
			if (character instanceof Player){
				this.isPlayer = true;
			} else {
				if (character instanceof Monster){
					this.isPlayer = false;
				} else {
					throw new InitializationException("Invalid character! Must be player or monster!");
				}
			}
			this.gameUnit = character;

			this.actedThisRound = false;
			this.buffs = new LinkedList<SpellEffect>();
			this.debuffs = new LinkedList<SpellEffect>();
			
		} catch (Exception exc) {
			throw new SomethingGoesWrongException("Cannot add this unit to battle", exc);
		}
	}

	
	
	
	

	public int getQuickness() {
		return this.quickness;
	}

	@Override
	public void attack() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void defend() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void move() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void finishRound() {
		// TODO Auto-generated method stub
		
	}

}
