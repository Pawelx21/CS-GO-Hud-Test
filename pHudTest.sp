/* [ Includes ] */
#include <sourcemod>
#include <sdktools>
#include <ripext>
#include <pLogs>
#include <pLicense>

/* [ Compiler Options ] */
#pragma newdecls required
#pragma semicolon		1

/* [ Defines ] */
#define PLUGIN_NAME					"[CS:GO] Pawel - [ Test Hud Positions ]"
#define PLUGIN_AUTHOR				"Paweł"
#define PLUGIN_DESC					"Sprawdzanie pozycji hudu na serwery CS:GO by Paweł."
#define PLUGIN_VERSION				"1.0.0"
#define PLUGIN_URL					"[ https://steamcommunity.com/id/pawelsteam | Paweł#8244 ]"

/* [ Handles ] */
Handle g_hHud;

/* [ Plugin Author And Informations ] */
public Plugin myinfo = {
	name = PLUGIN_NAME, 
	author = PLUGIN_AUTHOR, 
	description = PLUGIN_DESC, 
	version = PLUGIN_VERSION, 
	url = PLUGIN_URL
};

/* [ Plugin Actions ] */
public void OnPluginStart() {
	/* [ Commands ] */
	RegConsoleCmd("sm_phudtest", pHudTest_Command);
	
	/* [ Hud ] */
	g_hHud = CreateHudSynchronizer();
}

/* [ Commands ] */
public Action pHudTest_Command(int iClient, int iArgs) {
	if (iArgs < 2) {
		PrintToConsole(iClient, "Poprawne użycie komendy: sm_phudtest <pozycja_x> <pozycja_y> <tekst>");
		PrintToConsole(iClient, "Przykłład: sm_phudtest -1.0 -1.0 test");
		return Plugin_Handled;
	}
	char sArg[3][32];
	GetCmdArg(1, sArg[0], sizeof(sArg[]));
	GetCmdArg(2, sArg[1], sizeof(sArg[]));
	GetCmdArg(2, sArg[2], sizeof(sArg[]));
	float fPosition[2];
	fPosition[0] = StringToFloat(sArg[0]);
	fPosition[1] = StringToFloat(sArg[1]);
	SetHudTextParams(fPosition[0], fPosition[1], 3.0, 255, 255, 255, 255);
	ShowSyncHudText(iClient, g_hHud, sArg[2]);
	return Plugin_Handled;
}
