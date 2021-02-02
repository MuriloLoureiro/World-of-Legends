local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

function onGetFormulaValues(player, level, maglevel, dmgValue, healValue, dmgValuePercent, healValuePercent, arcaneValue, deathValue, fireValue, earthValue, holyValue, iceValue, energyValue)
	local min = (level / 5) + (maglevel * 1.4) + 8 + (dmgValue+energyValue)+(energyValue*dmgValuePercent/100)+(dmgValue*dmgValuePercent/100)
	local max = (level / 5) + (maglevel * 2.2) + 14 + (dmgValue+energyValue)+(energyValue*dmgValuePercent/100)+(dmgValue*dmgValuePercent/100)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
