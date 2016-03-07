@echo off

timeout 5
REM taskkill /f /fi "status eq not responding" /im armarma.exe
taskkill /f /im arma3server.exe
taskkill /im Bec.exe

timeout 5
if exist c:\update (
	echo update folder present
	cd c:\update
	if exist Altis_Life.Altis (
		echo MAltis_Life.Altis folder is being updated
		ren Altis_Life.Altis MAltis_Life.Altis	
		rd /q /s c:\arma\MPMissions\MAltis_Life.Altis
		move MAltis_Life.Altis c:\arma\MPMissions
	)
	if exist life_server.pbo (
		rd /q /s life_server
		echo life_server.pbo is being updated
		move life_server.pbo c:\arma\@life_server\addons\life_server.pbo
	)
	if exist @extDB (
		echo extDB is being updated
		move @extDB\extdb\db_custom\altis-life-rpg-4.ini  c:\arma\@extDB\extDB\db_custom
		rd /q /s @extDB
	)
)
timeout 1
cd c:\arma\
start arma3server.exe "-config=c:\arma\configs\serverConfig.cfg" "-cfg=c:\arma\configs\server_network.cfg" "-BEPath=c:\arma\battleye" "-profiles=c:\arma\Profiles" "-mod=@life_server;@extDB;@infiSTAR_A3" "-enableHT " "-loadMissionToMemory" "-autoInit"
echo ARMA 3 Server has started.

timeout 60
set becpath="c:\arma\Bec"
cd /d %becpath%
start "" /min "Bec.exe" -f Config.cfg
echo Battleye has started.. 
echo Exiting.
timeout 3
exit