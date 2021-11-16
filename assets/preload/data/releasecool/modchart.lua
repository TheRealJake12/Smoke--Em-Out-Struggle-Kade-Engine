---@diagnostic disable: lowercase-global
function start (song)
    hudX = getHudX()
    hudY = getHudY()
	
	WhiteBG = makeSprite('WhiteBG','whitebg', true)
	BlackBG = makeSprite('BlackFade','blackbg', true)
	WhiteFade = makeSprite('WhiteBG','whitefade', false)
	BlackFade = makeSprite('BlackFade','blackfade', false)
	Fading = makeSprite('Fading','fading', true)
	Smoke = makeSprite('smoke','smoke', false)
	
	setActorX(200,'whitebg')
	setActorY(500,'whitebg')
	setActorAlpha(0,'whitebg')
	setActorScale(4,'whitebg')
	
	setActorX(200,'blackbg')
	setActorY(500,'blackbg')
	setActorAlpha(1,'blackbg')
	setActorScale(4,'blackbg')

	setActorX(40,'fading')
	setActorY(443,'fading')
	setActorAlpha(0,'fading')
	setActorScale(2,'fading')
	
	setActorX(200,'blackfade')
	setActorY(500,'blackfade')
	setActorAlpha(0,'blackfade')
	setActorScale(4,'blackfade')
	
	setActorX(200,'whitefade')
	setActorY(500,'whitefade')
	setActorAlpha(0,'whitefade')
	setActorScale(4,'whitefade')
	
	setActorX(20,'smoke')
	setActorY(443,'smoke')
	setActorAlpha(0,'smoke')
	setActorScale(2,'smoke')
	
	setActorAlpha(0,'boyfriend')
	setActorAlpha(0,'girlfriend')
	setActorAlpha(0,'dad')	
	setActorY(-600,'dad')

	hide = true
	setHudPosition(0, 1000)
end

function update (elapsed)
	local currentBeat = (songPos / 1000)*(bpm/60)
	hudX = getHudX()
    hudY = getHudY()
	
	if zoom then
		setCamZoom(2)
	end
	
	if hide then
		for i=0,7 do
			setActorAlpha(0,i)
		end
	end

	setActorX(getActorX(Smoke) + 3 * math.sin(currentBeat), Smoke)
	
	if swayingsmall then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin(currentBeat), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos(currentBeat) + 10, i)
		end
	end
	if swayingmedium then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i)) + 10, i)
		end
	end
	if swayinglarge then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 28 * math.cos((currentBeat + i)) + 10, i)
		end
	end
	if swayingpog then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.5) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 28 * math.cos((currentBeat + i*0.5) * math.pi) + 10, i)
		end
	end
	if finalduet then
        camHudAngle = 5 * math.cos(currentBeat)
	end
end

function beatHit (beat)
	if camerabeat then
		setCamZoom(1)
	end
end

function stepHit (step)
	if step == 16 then
		tweenFadeIn('girlfriend',1,0.6)
		setHudPosition(0, 0)
		hide = false
	end
	if step == 48 then
		tweenFadeIn('boyfriend',1,0.6)
		for i=4,7 do
			tweenFadeIn(i,1, 0.6)
		end
	end
	if step == 80 then
		tweenFadeIn('dad',1,1.5)
		tweenPosYAngle('dad', 90, 0, 2, 'dad')
		camerabeat = true
		for i=0,3 do
			tweenFadeIn(i,1, 0.6)
		end
	end
	if step == 112 then
		tweenFadeOut(BlackBG,0,0.6)
	end
	if step == 144 then
		camerabeat = false
	end
	if step == 262 then
		tweenFadeIn(BlackBG,1,0.01)
		tweenFadeIn(WhiteFade,1,0.01)
		zoom = true
		showOnlyStrums = true
		for i=0,3 do
			tweenFadeOut(i,0,0.2)
		end
	end
	if step == 263 then
		tweenFadeOut(WhiteFade,0,0.2)
	end
	if step == 272 then
		zoom = false
		camerabeat = true
		tweenFadeOut(BlackBG,0,0.01)
		tweenFadeIn(WhiteFade,1,0.01)
		swayingsmall = true
		setHudPosition(0,0)
		for i=0,7 do
			tweenFadeIn(i,1, 0.01)
		end
	end
	if step == 273 then
		tweenFadeOut(WhiteFade,0,0.6)
	end
	if step == 528 then
		camerabeat = false
	end
	if step == 656 then
		camerabeat = true
	end
	if step == 902 then
		tweenFadeIn(BlackBG,1,0.1)
		camerabeat = false
		for i=0,7 do
			tweenFadeOut(i,0, 0.1)
		end
	end
	if step == 912 then
		tweenFadeOut(BlackBG,0,0.01)
		tweenFadeIn(WhiteFade,1,0.01)
		camerabeat = true
		swayingsmall = false
		swayingmedium = true
		for i=0,7 do
			tweenFadeIn(i,1, 0.01)
		end
	end
	if step == 913 then
		tweenFadeOut(WhiteFade,0,0.2)
	end
	if step == 1184 then
		camerabeat = false
	end
	if step == 1200 then
		tweenFadeIn(BlackFade,1,0.6)
		tweenFadeOut('dad',0, 0.6)
		for i=0,7 do
			tweenFadeOut(i,0, 0.6)
		end
	end
	if step == 1216 then
		tweenFadeOut('boyfriend',0,0.01)
		tweenFadeOut('girlfriend',0,0.01)
		tweenFadeIn(BlackBG,1,0.01)
		zoom = true
	end
	if step == 1228 then
		tweenFadeOut(BlackFade,0,0.01)
		tweenFadeIn('dad',1,0.01)
		for i=4,7 do
			tweenFadeIn(i,1, 0.01)
		end
	end
	if step == 1232 then
		tweenFadeIn('boyfriend',1,0.01)
		tweenFadeIn('girlfriend',1,0.01)
		tweenFadeOut(BlackBG,0,0.01)
		tweenFadeIn(WhiteFade,1,0.01)
		tweenFadeIn(Smoke,1,0.01)
		swayingmedium = false
		swayinglarge = true
		camerabeat = true
		for i=0,3 do
			tweenFadeIn(i,1, 0.01)
		end
		zoom = false
	end
	if step == 1233 then
		tweenFadeOut(WhiteFade,0,0.4)
	end
	if step == 1488 then
		camerabeat = false
	end
	if step == 1616 then
		camerabeat = true
	end
	if step == 1862 then
		tweenFadeIn(BlackBG,1,0.1)
		tweenFadeOut(Smoke,0,0.1)
		camerabeat = false
		for i=0,7 do
			tweenFadeOut(i,0, 0.1)
		end
	end
	if step == 1872 then
		tweenFadeOut(BlackBG,0,0.01)
		tweenFadeIn(WhiteFade,1,0.01)
		tweenFadeIn(Smoke,1,0.01)
		camerabeat = true
		swayinglarge = false
		swayingpog = true
		for i=0,7 do
			tweenFadeIn(i,1, 0.01)
		end
	end
	if step == 1873 then
		tweenFadeOut(WhiteFade,0,0.4)
	end
	if step == 2016 then
		finalduet = true
	end
	if step == 2144 then
		finalduet = false
		camHudAngle = 0
		swayingpog = false
		camerabeat = false
		tweenFadeOut(Smoke,0,2)
		for i=0,7 do
			tweenPos(i, _G['defaultStrum'..i..'X'], _G['defaultStrum'..i..'Y'] + 10, 1, i)
		end
	end
	if step == 2160 then
		tweenFadeIn(Fading,1,7)
	end
	if step == 2384 then
        tweenPos(0,getActorX(0) - 100,getActorY(0) + 300,3)
        tweenPos(2,getActorX(2) + 50,getActorY(2) + 483,3)
        tweenPos(3,getActorX(3) + 100,getActorY(3) + 602,3)
		tweenAngle(0,getActorAngle(0) - 60, 3)
		tweenAngle(2,getActorAngle(1) + 30, 3)
		tweenAngle(3,getActorAngle(1) + 60, 3)		
	
		tweenFadeOut('dad',0, 3)
		for i=0,3 do
			tweenFadeOut(i,0, 3)
		end
	end
	if step == 2432 then
		tweenFadeIn(BlackFade,1,2)
		for i=4,7 do
			tweenFadeOut(i,0, 2)
		end
	end
	if step == 2448 then
		showOnlyStrums = false
	end
end