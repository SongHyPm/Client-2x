--NPC M� Dung S�n Trang
--Phong Thi�n L� - Ng߶i qu�n l� Linh D߽ng
--Script by S�i �z
--ID = 960005

x960005_g_ScriptId	= 960005

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960005_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� Phong Thi�n L�, ng߶i qu�n l� Linh D߽ng t�i M� Dung S�n Trang. C�c h� t�m ta c� vi�c g�?")
		if GetMenPai(sceneId,selfId) == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) > 0 then
			AddNumText(sceneId,x960005_g_scriptId, "Nh�n th� c��i m�n ph�i",1,1)
			AddNumText(sceneId,x960005_g_scriptId, "T�m hi�u th� c��i m�n ph�i",8,2)
		end
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960005_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()

	--*************--
	if key == 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"Th� c��i b�n ph�i l� Linh D߽ng. C��i Linh D߽ng t�c � di chuy�n #G+40%#W, c��i Tuy�t Linh D߽ng t�c � di chuy�n #G+70%")
			AddText(sceneId,"Ь h�c k� thu�t t߽ng �ng c�n �n ch� Phong Ti�u#H[25,163]#W - Ng߶i truy�n th� k� thu�t b�n ph�i.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	--*************--
	if key == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� mu�n nh�n lo�i th� c��i n�o?")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		AddRadioItemBonus(sceneId,10149033,2)
		AddRadioItemBonus(sceneId,10149034,2)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x960005_g_ScriptId,0)
	end
	--*************--
	
end
--*****************************--
--*     On Mission Submit     *--
--*****************************--
function x960005_OnMissionSubmit(sceneId,selfId,targetId,missionScriptId,selectRadioId)

	--*****************--
	if LuaFnGetPropertyBagSpace(sceneId,selfId) < 1 then
		x960005_NotifyFailTips(sceneId,selfId,"H�y s�p x�p l�i 1 � tr�ng trong � ��o c�!")
		return
	end
	--*****************--
	TryRecieveItem(sceneId,selfId,selectRadioId,1)
	BeginEvent(sceneId)
		AddText(sceneId,"Nh�n th�nh c�ng!")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	--*****************--
	
end
--*****************************--
--*     Notify Fail Tips      *--
--*****************************--
function x960005_NotifyFailTips(sceneId,selfId,Tip)

	BeginEvent(sceneId)
		AddText(sceneId,sceneId,Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end