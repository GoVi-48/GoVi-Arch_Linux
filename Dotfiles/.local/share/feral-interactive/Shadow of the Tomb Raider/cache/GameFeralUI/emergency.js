"use strict";

function initialiseEmergencyCountermeasures()
{
	return hookPropertyToFunction(	"substitute-#{game_version}",
									"string",
									insertCssRulesForVersion );
}

function insertCssRulesForVersion(propertyName, typePattern, propValueArray)
{
	var version = propValueArray[0]; 
	
	if(version === "1.0")
	{
		//Insert changes to version 1.0 here
	}
	
	return true;
};

startupCompleteTasks.push(initialiseEmergencyCountermeasures);