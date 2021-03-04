--[[ src/init.lua ]]--
game = {}
n={}
game.startMap=597079
banned={}
game.round=0
game.things={}
game.open={}
game.skins = {{"a5a3e21a746611e7af4488d7f643024a.png","1d51f478746711e7af4488d7f643024a.png", -22, -6, -2, -6},{"0813e3e864e311e78ef9109836a51f7d.png","0813e3e864e311e78ef9109836a51f7d.png", -80, -45, -45, -45},{"000119aae7f111e7b5f688d7f643024a.png","000119aae7f111e7b5f688d7f643024a.png", -30, -1, -1, -1}}
game.maps = {'@596748', '@597107', '@597305', '@597076', '@597206', '@597094', '@597071', '@596772', '@596684', '@596769', '@596713', '@596612', '@596662', '@596751', '@596597', '@596538', '@588295','@588375','@596712', '@596599', '@596651', '@596642', '@596652', '@596653', '@596755', '@596654',  '@596666', '@596711', '@596737', '@596747', '@596756', '@597095', '@597623', '@597627'}
game.canStart = false
game.isStarted = false
game.delay = os.time()
game.playerList = {}
game.playersAlive = {}
game.mapcrews = {["Nightsea"]=true, ["Admiire_me#6770"]=true, ["Sukaru"]=true, ["+cosmikk"]=true, ["+alpen"]=true, ["Putnam"]=true}
game.admins = {["Nightsea"]=true, ["Admiire_me#6770"]=true, ["Sukaru"]=true}
game.phrased = false
game.phrases = {"Hater's gonna hate, potatoes' gonna potate", "Save the potato lord","Do you know why potatoes are so nice? because they are sweet potatoes","I am a tiny potato","Feeling down? Hug a potato!","Friends are like potatoes. When you eat them, they die", "Kawaii Potato ;3c", "Halloween is coming, watch out for potatogeists!", "Boo! Potatoes!", "In batata, we use potatoes instead of water for carnival!"}
game.isFinished = false
game.potato = nil
game.explosionTime = 15
game.currentTime = game.explosionTime * 2
game.playerCount = {}
game.isRoom = true
game.potatoImage = nil
game.data={}

-- [[ src/translations ]]--
lang = {
-- [[ src/translations/en.lua ]]--
    ["EN"] = {
        ["help"] = "Help",
        ["menutxt"] = "Menu",
        ["seven"] = "Sevenops Skin",
        ["vSk"] = "Voltorb Skin",
        ["wonR"] = "rounds won.",
        ["potatoSk"] = "Potato Skin",
        ["equip"] = "Equip",
        ["upd"] = "<p align='center'><R><B>Updates (Scroll)</B></R>\n<V>Current Version: 3.7</V></p>\n\n<V>V.3.7</V> - Voltorb skin fixed. Sparkles came back, new maps, RO translation. New skin: Sevenops!\n<V>V.3.6</v> - Some new things, see them yourself!\n<V>V.3.5</V> - New maps and bugs fixed\n<V>V.3.4</V> - Translations Improved! New Maps (tys, Putnam and Yam+!) :D\n<V>V.3.3</V> - BUG FIXES, PPL!!!!! Waiting and ban fixes, now the exploding time is in the center! New maps, 1s delay for passing the potato \n<V>V.3.2</V> - New Section: Updates. Bug fixes, new map, credit fixes and some things were optimized more! Big Update\n<V>V.3.1</V> - Bug fixes\n<V>V.3.0</V> - Added some codes to make better the game, added phrases and leaderboard\n<V>V.3.0</V> - Improved profile and new skin: Voltorb\n<V>V.2.7</V> - Bug fixes & new maps! \n<V>V.2.5</V> - Bug fixes\n<V>V.2.0</V> - New Systems! Working in gettin' maps :D Submit a map by whispering Nightsea\n<V>V.1.5</V> - Skins added, but just a potato :( At least we hug it\n<V>V.1.0</V> - Dudugz's original version with changes.",
        ["lsmap"] = "<p align='center'><R><B>Maps (Scroll)</B></R></p>\n#batata has actually %d maps.\n<j>List</j>:",
        ["credits"] = "<p align='center'><BV>Credits</BV></p>\n\n#batata V.3.7 remade by Nightsea (programming) and Laagaddoo (original)<br>All these people helped with a piece of a code, a translation, etc.:<br><V>Nightsea, +cosmikk, Ouchi, Nyah+, S1r, Sukaru, Putnam, Yam+, Dudugz, Soulzone,  Bolodefchoco, Laagaadoo</V>\nThanks! <R>&lt;3</R>",
        ["profile"] = "Profile",
        ["stats"] = "<B><V><font size='20'>%s<br></V></font><N>Rounds played: <V>%d\n<n>Rounds won: <v>%d",
        ["close"] = "Close",
        ["minPlayers"] = "<R>Batata needs at least two players :(\n<V>So lets hug a potato!",
        ["welcome"] = "<N>Welcome to #batata! Access Menu>Help to more info.",
        ["updates"] = "Updates",
        ["skins"] = "Skins",
        ["lb"] = "Ranking",
        ["crds"] = "Credits",
        ["maps"] = "Maps",
        ["ban"] = "You are banned. Do not cheat!",
        ["uban"] = "You are unbanned. Do not cheat!",
        ["fRnd"] = "The round has ended.",
        ["ugotP"] = "You got the potato!",
        ["wtP"] = "Waiting players... 1/2",
        ["gotPotato"] = "<V>%s <BL>has the potato!",
        ["finishedRound"] = "<BL>The round has ended! <V>%s <BL>is the winner!",
        ["time"]  = "<J>%s <BL>- %s   |  <N>Time : <V>%i seconds",
        ["HowToPlay"] = "<V>How to play?</V><br>You need at least two players to start, if you have the potato, you need to press SPACE near to a player to pass it avoiding its explosion on you. If the countdown reached 0, the player with the potato will die! You can see ur profile in Menu>Profile"
    },
  --[[ src/translations/br.lua ]]--
    ["BR"] = {
        ["help"] = "Ajuda",
        ["menutxt"] = "Menú",
        ["seven"] = "Skin do Sevenops",
        ["vSk"] = "Skin do Voltorb",
        ["wonR"] = "rondas ganadas.",
        ["potatoSk"] = "Skin da Batata",
        ["equip"] = "Equipar",
        ["upd"] = "<p align='center'><R><B>Actualizaçoes (Mouse para baixar)</B></R>\n<V>Versão atual: 3.7</V></p>\n\n<V>V.3.7</V> - Skin do Voltorb resolvida. Luzes amarelas e laranjas voltaram, novos mapas, translação de RO. Nova skin: Sevenops!\n<V>V.3.6</v> - Novas coisas, vejalas você mesmo!\n<V>V.3.5</V> - Novos mapas\n<V>V.3.4</V> - Traduçoes melhores! Novos mapas (obgs, Putnam é Yam+!) :D\n<V>V.3.3</V> - ERROS RESOLVIDOS, GALERA!!!!! Bug da espera arreglado, agora la exploção é no centro! Novos mapas, 1s delay pra passar a batata \n<V>V.3.2</V> - Nova sección: Actualizaçoes. Erros resolvidos, Novo mapa, créditos resolvidos e novas coisas han sido optimizadas!\n<V>V.3.1</V> - Erros resolvidos\n<V>V.3.0</V> - Agregadas novas coisas pra melhorar o jogo, nova skin: Voltorb\n<V>V.3.0</V> - Perfil melhorado e nova Skin: Voltorb\n<V>V.2.7</V> - Erros resolvidos & novos mapas! \n<V>V.2.5</V> - Erros Resolvidos\n<V>V.2.0</V> - Novo sistema! Trabalhando en mais mapas :D Agrege um mapa cochichando Nightsea\n<V>V.1.5</V> - Skins agregadas, mais solo uma batata :( Apenas la abraçamos \n<V>V.1.0</V> - Versão original do Dudugz com cambios.",
        ["lsmap"] = "<p align='center'><R><B>Mapas (Mouse para baixar)</B></R></p>\n#batata tem atualmente %d mapas.\n<j>Mapas:</j>:",
        ["credits"] = "<p align='center'><BV>Credits</BV></p>\n\n#batata V.3.7 remasterizado por Nightsea (programacão) é Laagaddoo (original)<br>Tudas essas pessoas ajudaram com uma peça de código, uma translação, etc.:<br><V>Nightsea, +cosmikk, Ouchi, Nyah+, S1r, Sukaru, Putnam, Yam+, Dudugz, Soulzone,  Bolodefchoco, Laagaadoo</V>\nObrigado! <R>&lt;3</R>",
        ["profile"] = "Perfil",
        ["stats"] = "<B><V><font size='20'>%s<br></V></font><N>Rodadas jogadas: <V>%d\n<n>Rodadas ganhadas: <v>%d",
        ["close"] = "Fechar",
        ["minPlayers"] = "<R>Batata precisa apenas dois jogadores :(\n<V>Vamos abraçar uma batata!",
        ["welcome"] = "<N>Bem-vindo a #batata! Accesse Menú>Ajuda pra mais informaçao.",
        ["updates"] = "Actualizaçoes",
        ["skins"] = "Skins",
        ["lb"] = "Clasificação",
        ["crds"] = "Créditos",
        ["maps"] = "Mapas",
        ["ban"] = "Você a sido banido. Não faça trampa!",
        ["uban"] = "Você ja a sido desbanido. Não faça trampa!",
        ["fRnd"] = "A ronda acabou.",
        ["ugotP"] = "Você tem a batata!",
        ["wtP"] = "Esperando jogadores... 1/2",
        ["gotPotato"] = "<V>%s <BL>tem a batata!",
        ["finishedRound"] = "<BL>Finaliçou! <V>%s <BL>ganhou!",
        ["time"]  = "<J>%s <BL>- %s   |  <N>Tempo : <V>%i segúndos",
        ["HowToPlay"] = "<V>Como jogar?</V><br>Você precisa apenas dos jogadores pra jogar, se você tem a batata, você precisa tocar ESPAÇO pra evadir a exploçao do ela em você. Se o Countdown finaliçou, o jogador com a batata vai morrer! Você pode ver seu menú en Menú>Perfil"
    },
  --[[ src/translations/ro.lua ]]--
    ["RO"] = {
        ["help"] = "Ajutor",
        ["menutxt"] = "Meniu",
        ["seven"] = "Skin-ul Sevenops",
        ["vSk"] = "Skin-ul Voltorb",
        ["wonR"] = "runde câştigate",
        ["potatoSk"] = "Skin-ul cartofului",
        ["equip"] = "Echipează",
        ["upd"] = "<p align='center'><R><B>Actualizări (derulați)</B></R>\n<V>Versiunea curentă: 3.7</V></p>\n\n<V>V.3.7</V> - Skin lui Voltorb remediat. Scânteile revin, mape noi, traducere RO. Skin nou: Sevenops!\n<V>V.3.6</v> - Câteva lucruri noi, verifică-le chiar tu!\n<V>V.3.5</V> - Mape noi și erori remediate\n<V>V.3.4</V> - Traduceri îmbunătățite! Mape noi (mulțumiri, Putnam și Yam+!) :D\n<V>V.3.3</V> - ERORI REMEDIATE, OAMENI!!!!! Timpul de așteptare și ban-urile remediate, acum timpul care explodează este în centru! Mape noi, 1s întârziere pentru a îndemâna cartoful \n<V>V.3.2</V> - Secție nouă: Update-uri. Erori remediate, mapă nouă, credite îmbunătățite şi unele lucruri au fost optimizate! Update Mare\n<V>V.3.1</V> - Erori remediate\n<V>V.3.0</V> - S-au adăugat câteva coduri pentru a îmbunătăți jocul, s-au adăugat mai multe fraze și clasament\n<V>V.3.0</V> - Profil îmbunătățit și skin nou: Voltorb\n<V>V.2.7</V> - Erori remediate & mape noi! \n<V>V.2.5</V> - Erori remediate\n<V>V.2.0</V> - Sisteme noi! Lucrăm la obţinerea mapelor :D Trimiteți o mapă șoptind Nightsea\n<V>V.1.5</V> - Custome adăugate, dar doar un cartof :( Cel puțin îl îmbrățișăm\n<V>V.1.0</V> - Versiunea originală a lui Dudugz cu modificări.",
        ["lsmap"] = "<p align='center'><R><B>Mape (derulați)</B></R></p>\n#batata are defapt %d mape.\n<j>List</j>:",
        ["credits"] = "<p align='center'><BV>Credite</BV></p>\n\n#batata V.3.7 refăcut de Nightsea (programat) și Laagaddoo (original)<br>Toți acești oameni au ajutat cu puțină codare, câte o traducere etc.:<br><V>Nightsea, +cosmikk, Ouchi, Nyah+, S1r, Sukaru, Putnam, Yam+, Dudugz, Soulzone,  Bolodefchoco, Laagaadoo</V>\nMulțumesc! <R>&lt;3</R>",
        ["profile"] = "Profil",
        ["stats"] = "<B><V><font size='20'>%s<br></V></font><N>Runde jucate: <V>%d\n<n>Runde câştigate: <v>%d",
        ["close"] = "Închide",
        ["minPlayers"] = "<R>Batata are nevoie de 2 sau mai multe persoane ca să poți juca:(\n<V>Deci, să îmbrățișăm un cartof!",
        ["welcome"] = "<N>Bine ai venit pe mini-jocul #batata! Accesează Meniul>Ajutor pentru mai multe informații.",
        ["updates"] = "Actualizări",
        ["skins"] = "Costume",
        ["lb"] = "Clasament",
        ["crds"] = "Credite",
        ["maps"] = "Mape",
        ["ban"] = "Ești banat. Nu trişa!",
        ["uban"] = "Nu mai ești banat. Nu trișa!",
        ["fRnd"] = "Runda s-a încheiat.",
        ["ugotP"] = "Tu ai cartoful!",
        ["wtP"] = "Se așteaptă jucători... 1/2",
        ["gotPotato"] = "<V>%s <BL>are cartoful!",
        ["finishedRound"] = "<BL>S-a terminat! <V>%s <BL>a câștigat!",
        ["time"]  = "<J>%s <BL>- %s   |  <N>Timp : <V>%i secunde",
        ["HowToPlay"] = "<V>Cum se joacă?</V><br>Ai nevoie de cel puțin doi jucători pentru a începe, dacă ai cartoful, trebuie să apeși SPAŢIU lângă un jucător pentru a-l pasa evitând explozia sa asupra ta. Dacă numărătoarea inversă a ajuns la 0, jucătorul cu cartoful la el va muri! Puteți vedea profilul dvs. în Meniu>Profil "
    },
  --[[ src/translations/es.lua ]]--
    ["ES"] = {
        ["help"] = "Ayuda",
        ["menutxt"] = "Menú",
        ["seven"] = "Traje de Sevenops",
        ["vSk"] = "Traje de Voltorb",
        ["wonR"] = "rondas ganadas.",
        ["potatoSk"] = "Traje de la Papa Normal",
        ["equip"] = "Equipar",
        ["upd"] = "<p align='center'><R><B>Actualizaciones (Rueda del mouse para bajar)</B></R>\n<V>Versión Actual: 3.7</V></p>\n\n<V>V.3.7</V> - Traje de voltorb arreglado. Los fuegos artificiales volvieron, nuevos mapas y traducción RO. ¡Nuevo traje! ¡Sevenops!\n<V>V.3.6</V> - Muchas cosas nuevas que deben ver por su cuenta\n<V>V.3.5</V> - Nuevos mapas y bugs arreglados\n<V>V.3.4</V> - ¡Traducciones Hechas! Nuevos mapas (grxs, Putnam y Yam+!) :D\n<V>V.3.3</V> - BUGS ARREGLADOS, GENTE!!!!! Arreglados los bugs de ban y espera, ¡ahora el tiempo de explosión es en el centro! Nuevos mapas, delay de 1s para pasar la papa \n<V>V.3.2</V> - Nueva Sección: Actualizaciones. Bugs arreglados, nuevo mapa, créditos arreglados y las cosas fueron optimizadas más\n<V>V.3.1</V> - Bugs arreglados\n<V>V.3.0</V> - Añadidas cositas para mejorar el juego, frases y ranking\n<V>V.3.0</V> - Finalizado el perfil, y nuevo traje: Voltorb\n<V>V.2.7</V> - Nuevos mapas y bugs arreglados! \n<V>V.2.5</V> - Bugs arreglados\n<V>V.2.0</V> - ¡Nuevos sistemas! Trabajando en tener más mapitas :D Manda un mapa susurrándole a Nightsea\n<V>V.1.5</V> - Trajes añadidos, pero sólo una papa :( Al menos la abrazamos\n<V>V.1.0</V> - Versión original de Dudugz con cambios.",
        ["lsmap"] = "<p align='center'><R><B>Mapas (Rueda del mouse para bajar)</B></R>\n#batata actualmente tiene %d mapas.\n<j>Lista</j>:",
        ["profile"] = "Perfil",
        ["credits"] = "<p align='center'><BV>Créditos</BV></p>\n\n#batata V.3.7 re-hecha por Nightsea (programador) y Laagaddoo (original)<br>Todas estas personas ayudaron con una pieza de código, una traducción, etc.:<br><V>Nightsea, +cosmikk, Ouchi, Nyah+, S1r, Sukaru, Putnam, Yam+, Dudugz, Soulzone,  Bolodefchoco, Laagaadoo</V>\n¡Gracias! <R>&lt;3</R>",
        ["stats"] = "<B><V><font size='20'>%s<br></V></font><N>Rondas jugadas: <V>%d\n<n>Rondas ganadas: <v>%d",
        ["close"] = "Cerrar",
        ["minPlayers"] = "<R>Batata necesita al menos 2 jugadores :(\n<V>¡Entonces abrazemos una papa!",
        ["welcome"] = "<N>¡Bienvenido a #batata! Accede a Menú>Ayuda para más información.",
        ["updates"] = "Actualizaciones",
        ["skins"] = "Trajes",
        ["lb"] = "Clasificación",
        ["maps"] = "Mapas",
        ["crds"] = "Créditos",
        ["ban"] = "Has sido baneado. ¡No hagas trampa!",
        ["unban"] = "Te han desbaneado. ¡No hagas trampa!",
        ["fRnd"] = "La ronda ha terminado.",
        ["ugotP"] = "¡Has recibido la papa!",
        ["wtP"] = "Esperando jugadores... 1/2",
        ["gotPotato"] = "<BL>¡<V>%s <BL>tiene la papa!",
        ["finishedRound"] = "<BL>¡Terminó! ¡<V>%s <BL>ha ganado!",
        ["time"]  = "<J>%s <BL>- %s   |  <N>Tiempo : <V>%i segundos",
        ["HowToPlay"] = "<V>¿Cómo jugar?</V><br>Necesitas 2 jugadores para empezar, si tienes la papa, debes presionar ESPACIO cerca de un jugador evitando que explote en ti. Si la cuenta alcanzó el 0, ¡el jugador con la papa morirá! Puedes ver tu perfil en Menú>Perfil"
    },
}

  --[[ src/translations/pt.lua ]]--
lang.PT=lang.BR

--[[ src/others/main.lua ]]---
main=function()
    tfm.exec.disableAutoShaman()
    tfm.exec.disableAutoNewGame()
    tfm.exec.setRoomMaxPlayers(25)
    tfm.exec.disablePhysicalConsumables()
    tfm.exec.disableAutoTimeLeft()
    tfm.exec.snow(1)
    system.disableCommands(true)
    for n,p in pairs(tfm.get.room.playerList) do
        eventNewPlayer(n)
        loaData(n)
    end
    
    if game.canStart then
        game.newGame()
        ui.removeTextArea(6854)
    else
        ui.setMapName(game.phrases[math.random(#game.phrases)])
        tfm.exec.newGame(game.startMap)
        for name,v in pairs(tfm.get.room.playerList) do
            sendMessage(translate(name,"minPlayers"),name)
            ui.addTextArea(6854,"<p align='center'><font size='50' face='Freestyle Script' color='#FFFFFF'>"..translate(name,"wtP"),nil,449,207,nil,nil,nil,nil,0,false)
        end
    end
end

--[[ src/events ]]--
--[[ src/events/newPlayer ]]--
eventNewPlayer = function(name)
    game.data[name]={
        played = 0,
        won = 0,
        lang = "EN",
        skin = 1
    }

    banned[name] = false
    loaData(name)
    for i=0,300 do
        tfm.exec.bindKeyboard(name,i,true,true)
    end

    game.things[name]={
        delay=os.time(),
        image=tfm.exec.addImage("177d168a0b8-png.25303","!1000", 150, 100, name),
        banner=3
    }

    if not contains(game.playerCount, name) then
        table.insert(game.playerCount, name)
    end
	--game.playerCount = game.playerCount + 1
	ui.addTextArea(3, "<a href='event:menu'><p align='center'><font size='13'>"..translate(name, "menutxt").." »", name, 9, 29, 57, 22, 0x324650, 0x23343d, 1, false)	
    
    if #game.playerCount > 1 then
        game.canStart = true
        ui.removeTextArea(6854)
    elseif #game.playerCount == 2 then
        game.newGame()
        tfm.exec.newGame(maps[math.random(#maps)])
    else
        tfm.exec.setUIMapName(game.phrases[math.random(#game.phrases)])
    end

    if game.isRoom then
        sendMessage(translate(name,"welcome"), name)
    end

    eventTextAreaCallback(0,name,"help")
end

--[[ src/events/newGame ]]--
eventNewGame = function()
    phrased=false
    game.round=game.round+1

    if game.round<=1 then
        for a,b in pairs(tfm.get.room.playerList) do
            tfm.exec.addImage("177d168a0b8-png.25303","&-1000", 150, 100, a, -1000)
            system.newTimer(function() tfm.exec.removeImage(-1000, a) end, 3000, false)
        end
    end

    for n,p in pairs(tfm.get.room.playerList) do
        system.newTimer(function() 
            if #game.playerCount>3 then
                game.data[n].played=game.data[n].played+1
                savData(n)
            end
        end, 500, false)
    end

    if game.canStart then
        ui.removeTextArea(6854)
        tfm.exec.setGameTime(#game.playerCount*20)
        game.delay = os.time()
        game.isStarted = false
        game.isFinished = false
        game.currentTime = game.explosionTime * 2
    end
end

--[[ src/events/playerLeft.lua ]]--
eventPlayerLeft = function(name)
    local n = {}

    for i,v in pairs(tfm.get.room.playerList) do if not v.isDead and not #game.playerCount==1 then table.insert(n,i) end end

    if game.potato == name then
        game.setPotato(game.highScore())
        game.currentTime = game.explosionTime * 2
    end

    if contains(game.playerCount, name) then
        table.delete(game.playerCount, name)
    end
    
    if #game.playerCount < 2 then
        game.canStart = false
        phrased=false
        tfm.exec.setUIMapName(game.phrases[math.random(#game.phrases)])
        for name,v in pairs(tfm.get.room.playerList) do
            sendMessage(translate(name,"minPlayers"),name)
            ui.addTextArea(6854,"<p align='center'><font size='50' face='Freestyle Script' color='#FFFFFF'>"..translate(name,"wtP"),nil,449,207,nil,nil,nil,nil,0,false)
        end
        tfm.exec.newGame(game.startMap)
    else
        isAlone=false
    end
end

--[[ src/events/textAreaCallback.lua ]]--
eventTextAreaCallback = function(id, name, callback)
    if callback == "menu" then
        ui.addTextArea(3, "<a href='event:menu'><p align='center'><font size='13'>"..translate(name, "menutxt"), name, 9, 29, 57, 22, 0x324650, 0x23343d, 1, false)
        ui.addTextArea(4, "<font size='13'><a href='event:help'>"..translate(name,"help").."</a> | <a href='event:Profile'>"..translate(name,"profile").."</a> | <a href='event:credits'>"..translate(name,"crds").."</a> | <a href='event:LB'>"..translate(name,"lb").."</a> | <a href='event:Skin'>"..translate(name,"skins").."</a> | <a href='event:updates'>"..translate(name,"updates").."</a> | <a href='event:lsmap'>"..translate(name, "maps").."</a> <a href='event:closeMenu'>«", name, 74, 29, nil, nil, 0x101d24, 0x1c3d4d, 0.8, false)
    elseif callback == "closeMenu" then
        ui.removeTextArea(id, name)
        ui.addTextArea(3, "<a href='event:menu'><p align='center'><font size='13'>"..translate(name, "menutxt").." »", name, 9, 29, 57, 22, 0x324650, 0x23343d, 1, false)
    elseif callback == "LB" then
        showLB(name)
    elseif callback == "updates" then
        eventTextAreaCallback(4,name,"closeMenu")
        ui.addTextArea(755, translate(name,"upd"), name, 100, 80, 300,300,nil, nil, 1, false)
        ui.addTextArea(855, "<p align='center'><a href='event:closeUPD'><R>X", name, 411, 78, 30, 20, nil,nil, 1, false)
    elseif callback=="lsmap" then
        eventTextAreaCallback(4,name,"closeMenu")
        ui.addTextArea(7, "<p align='center'>"..string.format(translate(name,"lsmap"),#game.maps).."\n\n"..table.concat(game.maps, "\n"), name, 100, 80, 300,300,nil, nil, 1, false)
        ui.addTextArea(8, "<p align='center'><a href='event:closeHelp'><R>X", name, 411, 78, 30, 20, nil,nil, 1, false)
    elseif callback=="Skin" then
        system.skins(name)
    elseif callback=="closeUPD" then
        ui.removeTextArea(855)
        ui.removeTextArea(755)
    elseif callback:sub(1,2)=="cs" then
        game.data[name].skin=tonumber(callback:sub(3,#callback))
        savData(name)
    elseif callback == "help" then
        eventTextAreaCallback(4,name,"closeMenu")
        ui.addTextArea(7, "<p align='center'>"..translate(name,"HowToPlay"), name, 100, 80, 300,300,nil, nil, 1, false)
        ui.addTextArea(8, "<p align='center'><a href='event:closeHelp'><R>X", name, 411, 78, 30, 20, nil,nil, 1, false)
    elseif callback == "closeHelp" then
        ui.removeTextArea(8,name)
        ui.removeTextArea(7,name)
        ui.removeTextArea(9,name)
        eventTextAreaCallback(4,name,"menu")
    elseif callback == "cls300" then
        for idsz=300,310 do
            ui.removeTextArea(idsz,name)
        end
    elseif callback=="cls311" then
        for idsz=311,323 do
            ui.removeTextArea(idsz,name)
        end
        tfm.exec.removeImage(1,name)
        tfm.exec.removeImage(2,name)
        tfm.exec.removeImage(3,name)
    elseif callback == "credits" then
        ui.addTextArea(7, translate(name,"credits"), name, 100, 80, 300,300,nil, nil, 1, false)
        ui.addTextArea(8, "<p align='center'><a href='event:closeHelp'><R>X", name, 411, 78, 30, 20, nil,nil, 1, false)
        eventTextAreaCallback(4,name,"closeMenu")
    elseif callback == "Profile" then
        eventTextAreaCallback(4,name,"closeMenu")
        ui.addTextArea(8, string.format(translate(name,"stats"),name,game.data[name].played,game.data[name].won), name, 340, 65, 300, 300, nil, nil, 1, false)
        ui.addTextArea(9, "<p align='center'><a href='event:closeHelp'><R>X", name, 648, 58, 30, 20, nil,nil, 1, false)
    end
end

--[[ src/events/keyboard.lua ]]--
eventKeyboard = function(name, key, down, x,y)
    if key == 32 then
        if game.delay < os.time()-1000 then
            if name == game.potato then
                for target, player in pairs(tfm.get.room.playerList) do
                    if (target ~= name) and not player.isDead then
                        if (math.abs(player.x - tfm.get.room.playerList[game.potato].x) <= 30) and (math.abs(player.y - tfm.get.room.playerList[game.potato].y) <= 30) then
                            tfm.exec.removeImage(game.potatoImage)
                            game.setPotato(target) 
                            game.delay=os.time();
                            break
                        end 
                    end
                end 
            end
        end
    end

    if key == 0 and game.isStarted and name == game.potato then
        tfm.exec.removeImage(game.potatoImage)
        game.potatoImage = tfm.exec.addImage(game.skins[game.data[name].skin][1], "$"..name, game.skins[game.data[name].skin][3], game.skins[game.data[name].skin][4])
    elseif key == 2 and game.isStarted and name == game.potato then
        tfm.exec.removeImage(game.potatoImage)
        game.potatoImage = tfm.exec.addImage(game.skins[game.data[name].skin][2], "$"..name, game.skins[game.data[name].skin][5],game.skins[game.data[name].skin][6])
    elseif key==string.byte("H") then
        eventChatCommand(name, "help")
    elseif key==string.byte("P") then
        eventTextAreaCallback(4, name, "Profile", name)
    elseif key==string.byte("U") then
        eventChatCommand(name, "u")
    elseif key==string.byte("M") then
        eventChatCommand(name, "m")
    elseif key==string.byte("O") then
        eventChatCommand(name, "s")
    elseif key==string.byte("L") then
        eventChatCommand(name, "lb")
    elseif key==string.byte("K") then
        eventChatCommand(name, "keys")
    elseif key==string.byte("C") then
        eventChatCommand(name, "c")
    end
end

--[[ src/events/playerDied.lua ]]--
eventPlayerDied = function(name)
tfm.exec.setPlayerScore(name,1,true)
	if name == game.potato then
            if not game.isFinished then

              game.setPotato(game.highScore())
              game.currentTime = game.explosionTime * 2

		else
			if game.canStart then

			else
				sendMessage(translate(name,"minPlayers"),name)
			end
		end
	end
end


--[[ src/events/playerWon.lua ]]--
function eventPlayerWon(n)
    if #game.playerCount>3 then
        game.data[n].won=game.data[n].won+1
        savData(n)
    end

    game.newGame()
end
    
-- [[ src/events/loop.lua ]]-- 
eventLoop = function(current, remaining)
    if tfm.get.room.xmlMapInfo and tfm.get.room.xmlMapInfo.mapCode==game.startMap and #game.playerCount>=2 then
        tfm.exec.newGame(game.maps[math.random(#game.maps)])
    end
 
    for n in pairs(tfm.get.room.playerList) do
        if banned[n]==true then
            ui.addTextArea(555555, "", n, -300, -16, 3000, 3000, 0x000001, 0x000001, 1, false)
            ui.addTextArea(555556, "<B><R>BAN</R></B>", n, 400, 200, nil, nil, nil, nil, 1, false)
        end
    end
 
    if #game.playerCount > 1 then
        game.canStart = true
        ui.removeTextArea(6854)
    else
        if not phrased then
            tfm.exec.setUIMapName(game.phrases[math.random(#game.phrases)])
            phrased=true
        end
    end
 
    if game.canStart then
        ui.removeTextArea(6854)
        if tfm.get.room.xmlMapInfo then
            ui.setMapName("#batata <G>| <J>"..tfm.get.room.xmlMapInfo.author.."<G> - @"..tfm.get.room.xmlMapInfo.mapCode)
        else
            ui.setMapName("#batata<G> - @0")
        end
        
        if game.isStarted then
 
            local alive, Alive = 0, {}
 
            for name, player in pairs(tfm.get.room.playerList) do
                if not player.isDead then
                    alive = alive + 1
                    Alive = name
                end
            end
 
            if alive == 1 then
                game.isFinished = true
 
                for i,v in pairs(tfm.get.room.playerList) do
                    sendMessage(translate(i,"finishedRound"):format(Alive), i)
                end
 
                tfm.exec.giveCheese(Alive)
                tfm.exec.playerVictory(Alive)
                tfm.exec.setGameTime(6)
 
                
            end
 
            if remaining <= 0 then game.newGame() end
 
            if not game.isFinished then
            ui.addTextArea(10, "<p align=\"center\"><font size=\"25\"><J><B>"..math.floor(game.currentTime/2), nil, 367, 355, 46, 39, 0x000001, 0x000000, 0.8, false)
            game.currentTime = game.currentTime - 1
 
            local particles = {2, 13}
            for i = 1, 3 do
                if tfm.get.room.playerList[game.potato] then
                    tfm.exec.displayParticle(particles[math.random(#particles)], tfm.get.room.playerList[game.potato].x or 1, tfm.get.room.playerList[game.potato].y - math.random(5, 15) or 1, math.random(-2, 2), math.random(-2, 2))
                end 
            end
 
            if game.currentTime == 0 then
                if alive == 2 then
                    game.currentTime = game.explosionTime * 2
                    tfm.exec.killPlayer(game.potato)
 
                    local i = 1
                    while(game.potato == Alive) do
                        i = i + 1
                    end
 
                    game.isFinished = true
                    tfm.exec.giveCheese(Alive)
                    tfm.exec.playerVictory(Alive)
                    tfm.exec.setGameTime(6)
 
                    for k,v in pairs(tfm.get.room.playerList) do
                        sendMessage(translate(k,"finishedRound"):format(Alive), k)
                        
                    end
                else
                    game.currentTime = game.explosionTime * 2
                    tfm.exec.killPlayer(game.potato)
                end
            end
        end
    else
        if current >= 5000 then
            game.setPotato(game.highScore())
            game.isStarted = true
            if game.potato then
                tfm.exec.setPlayerScore(game.potato, 0) end
            end
        end
    end
end

--[[ src/events/chatCommand.lua ]]--
eventChatCommand = function(name,cmd)
    local n = name
    local args = {}

    for arg in cmd:gmatch ("[^%s]+") do
        table.insert (args, arg)
    end

    if args[1] == "np" then
        if args[2] then
            if game.admins[name] or game.mapcrews[name] then
                tfm.exec.newGame(args[2])
            end
        end
    elseif args[1] == "ban" and game.admins[name] then
        if args[2] then
            banned[args[2]]=true
            tfm.exec.chatMessage(translate(args[2],"ban"),args[2])
            savData(args[2])
        end
    elseif args[1] == "unban" then
        if args[2] then
            tfm.exec.chatMessage(translate(args[2], "uban"),args[2])
            banned[args[2]]=false
            ui.removeTextArea(555555, args[2])
            ui.removeTextArea(555556, args[2])
            savData(args[2])
        end
    elseif args[1]=="maps" or args[1]=="m" or args[1]=="ls" or args[1]=="lsmap" then
        eventTextAreaCallback(4,n,"lsmap")
    elseif args[1]=="help" or args[1]=="info" or args[1]=="h" then
        eventTextAreaCallback(4, n, "help")
    elseif args[1]=="lang" then
        game.data[name].lang=cmd:sub(6,7)
        savData(name)
    elseif args[1]=="updates" or args[1]=="upd" or args[1]=="u" then
        eventTextAreaCallback(4, n, "updates")
    elseif args[1]=="s" or args[1]=="skins" then
        system.skins(n)
    elseif args[1]=="profile" or args[1]=="p" or args[1]=="stats" then
        if args[2] and tfm.get.room.playerList[args[2]] then
            eventTextAreaCallback(4,name,"closeMenu")
            ui.addTextArea(8, string.format(translate(name,"stats"),args[2],game.data[args[2]].played,game.data[args[2]].won), name, 340, 65, 300, 300, nil, nil, 1, false)
            ui.addTextArea(9, "<p align='center'><a href='event:closeHelp'><R>X", name, 648, 58, 30, 20, nil,nil, 1, false)
        else
            eventTextAreaCallback(4, n, "Profile", n)
        end
    elseif args[1]=="c" or args[1]=="credits" then
        eventTextAreaCallback(4, n, "credits")
    elseif args[1]=="lb" or args[1]=="leaderboard" or args[1]=="rank" or args[1]=="ranking" then
        showLB(n)
    end
end
    

--[[ src/events/playerDataLoaded.lua ]]--
function eventPlayerDataLoaded(n, d)
    --tfm.exec.chatMessage(n.."-"..d)
    if d:find(";") then 
        local data = split(d, ";")

        game.data[n].won = tonumber(data[1]) or 0        
        game.data[n].played = tonumber(data[2]) or 0
        game.data[n].lang = tostring(data[3]) or "EN"
        game.data[n].skin = tonumber(data[4]) or 1
        banned[n] = data[5] or false
    end 
end

--[[ src/functions ]]--
--[[ src/functions/skins.lua ]]--
system.skins=function(n)
addWindow(300,"<B><J><p align='center'><font size='30'>"..translate(n,"skins").."</font></p></j></b>\n"..translate(n,"potatoSk").." <a href='event:cs1'>["..translate(n,"equip").."]</a>\n"..translate(n, "vSk").." <a href='event:cs2'>["..translate(n,"equip").."]</a>\n<a href='event:cs3'>"..translate(n, "seven").." ["..translate(n,"equip").."]",n,250,50,250,250)
end

--[[ src/functions/leaderboard.lua ]]--
showLB=function(n)
    plb=tfm.get.room.playerList -- Table of Players
    rkw={game.data,"won"} -- ARG1 = Data Table, ARG2 = What to rank
    sps=true -- Show the position
    spt=true -- Show the points
    pnm=translate(n,"wonR") -- The name of th points ex: "wins" is "#1. Player#0000 - 0 wins"
    lmt=100 -- Limit of players
    
    addWindow(300,"<B><J><p align='center'><font size='30'>"..translate(n,"lb").."</font></p></j></b>\n"..system.rank(plb,rkw,sps,spt,pnm,lmt),n,250,50,250,250)
end

--[[ src/functions/rank.lua ]]--
system.rank=function(players,fromValue,showPos,showPoints,pointsName,lim)
    local p,rank = {},""
    fromValue,lim = fromValue or {tfm.get.room.playerList,"score"},tonumber(lim) or 100
    for n in next,players do
        p[#p+1] = {name=n,v=fromValue[1][n][fromValue[2]]}
    end
    table.sort(p,function(f,s) return f.v>s.v end)
    for o,n in next,p do
        if o <= lim then
            if n.v > 0 then
                rank = rank .. (showPos and "<J>#"..o..". " or "") .. "<V>" .. n.name .. (showPoints and " <BL>- <VP>" .. n.v .. " "..(pointsName or "points") .."\n" or "\n")
            end
        end
    end
    return rank
end

--[[ src/functions/window.lua ]]--
function addWindow(id, text, player, x, y, width, height, isHelp)
    ui.addTextArea(id    , "", player, x              , y               , width+100   , height+70, 0x78462b, 0x78462b, 1, false)
    ui.addTextArea(id + 1, "", player, x              , y+(height+140)/4, width+100   , height/2 , 0x9d7043, 0x9d7043, 1, false)
    ui.addTextArea(id + 2, "", player, x+(width+180)/4, y               , (width+10)/2, height+70, 0x9d7043, 0x9d7043, 1, false)
    ui.addTextArea(id + 3, "", player, x              , y               , 20          , 20       , 0xbeb17d, 0xbeb17d, 1, false)
    ui.addTextArea(id + 4, "", player, x+width+80     , y               , 20          , 20       , 0xbeb17d, 0xbeb17d, 1, false)
    ui.addTextArea(id + 5, "", player, x              , y+height+50     , 20          , 20       , 0xbeb17d, 0xbeb17d, 1, false)
    ui.addTextArea(id + 6, "", player, x+width+80     , y+height+50     , 20          , 20       , 0xbeb17d, 0xbeb17d, 1, false)
    ui.addTextArea(id + 7, text, player, x+3, y+3, width+94, height+64, 0x1c3a3e, 0x232a35, 1, false)
    ui.addTextArea(id + 8,"<p align='center'><a href='event:cls"..tostring(id).."'>Close",player,255,345,337,20,nil,0x324650,1,false)
end

--[[ src/functions/message.lua ]]--
sendMessage = function(message, name)
    tfm.exec.chatMessage(message,name)
end

--[[ src/functions/translate.lua ]]--
function translate(n,mes)
    if lang[tfm.get.room.playerList[n].lang] and lang[tfm.get.room.playerList[n].lang][mes] then
        return lang[game.data[n].lang][mes]
    else
        return lang.EN[mes]
    end]]--
    return lang.EN[mes]
end

--[[ src/functions/highscore.lua ]]--
function game.highScore()
    local hs, hsName = -1, nil
    for name, player in pairs(tfm.get.room.playerList) do
        if player.score > hs and not player.isDead then
            hs = player.score
            hsName = name
        end
    end
    tfm.exec.setPlayerScore(hsName or "*Souris", 1)
    return hsName
end

--[[ src/functions/newGame.lua ]]--
function game.newGame()
    for name in next,tfm.get.room.playerList do
        ui.addTextArea(10, "<p align=\"center\"><font size=\"25\"><J><B>"..math.floor(game.currentTime/2).." (tfm.get.room.xmlMapInfo.author, tfm.get.room.currentMap, math.floor(game.currentTime/2)", nil, 367, 355, 46, 39, 0x000001, 0x000000, 0.8, false)
        ui.addTextArea(3, "<a href='event:menu'><p align='center'><font size='13'>"..translate(name,"menutxt").." »", name, 9, 29, 57, 22, 0x324650, 0x23343d, 1, false)
    end
    for n in pairs(tfm.get.room.playerList) do
        if banned[n]==true then
            tfm.exec.killPlayer(n)
        end
    end

    ui.removeTextArea(6854)
    for name in next,tfm.get.room.playerList do
        ui.addTextArea(10, "<p align=\"center\"><font size=\"25\"><J><B>"..math.floor(game.currentTime/2).." (tfm.get.room.xmlMapInfo.author, tfm.get.room.currentMap, math.floor(game.currentTime/2)", nil, 367, 355, 46, 39, 0x000001, 0x000000, 0.8, false)
        ui.addTextArea(3, "<a href='event:menu'><p align='center'><font size='13'>"..translate(name,"menutxt").." »", name, 9, 29, 57, 22, 0x324650, 0x23343d, 1, false)
    end
    tfm.exec.newGame(game.maps[math.random(#game.maps)])
end
 
--[[ src/functions/setPotato.lua ]]--
function game.setPotato(name)
	if not game.isFinished and tfm.get.room.playerList[name] then
		if game.potato then
			tfm.exec.setNameColor(game.potato, 0)
			system.bindKeyboard(game.potato, 32, false, false)
			system.bindKeyboard(game.potato, 37, false, false)
			system.bindKeyboard(game.potato, 39, false, false)
			tfm.exec.removeImage(game.potatoImage)
		end
		
		game.potato = name
        game.potatoImage = tfm.exec.addImage(game.skins[game.data[name].skin][2], "$"..name, game.skins[game.data[name].skin][5],game.skins[game.data[name].skin][6])		
        tfm.exec.setNameColor(name, 0xFFFF00)
		system.bindKeyboard(game.potato, 32, true, true)
        tfm.exec.chatMessage("<J>"..translate(name,"ugotP").."</J>",name)
          for Name in next,tfm.get.room.playerList do		
		sendMessage(translate(Name,"gotPotato"):format(name),Name)
	end
end

--[[ src/functions/contains.lua ]]--
function contains(table, val) 
    for i=1,#table do 
        if table[i] == val then
            return true 
        end 
    end 
    
    return false 
end

--[[ src/functions/delete.lua ]]--
function table.delete(tab,value)
    for pos,v in pairs(tab) do
        if v==value then
            table.remove(tab,pos)
        end
    end
end


--[[ src/functions/split.lua ]]--
function split(t,s)
    local a={}
    for i,v in string.gmatch(t,string.format("[^%s]+",s or "%s")) do
        table.insert(a,i)
    end
    return a
end

--[[ src/functions/load.lua ]]--
loaData=function(n)
    system.loadPlayerData(n)
end

--[[ src/functions/save.lua ]]--
savData=function(n)
    indexData=game.data[n]
    system.savePlayerData(n, indexData.won..";"..indexData.played..";"..indexData.lang..";"..indexData.skin..";"..banned[n])
end

--[[ src/functions/disables.lua ]]--
system.disableCommands=function(n)
n=n or true
for _,c in next,{"k", "lang", "keys", "help", "info", "controls", "h", "skins", "s", "lb", "rank", "ranking", "leaderboard", "stats", "p", "profile", "np", "m", "maps", "ls", "lsmap", "rd", "upd", "sc", "updates", "ban", "unban", "cac", "rev"} do
    system.disableChatCommandDisplay(c, n)
end
end   

main()
