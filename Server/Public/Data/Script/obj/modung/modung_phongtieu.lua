--NPC M� Dung S�n Trang
--Phong Ti�u - Ng߶i truy�n th� Linh D߽ng
--Script by S�i �z
--ID = 960006

x960006_g_ScriptId	= 960006

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960006_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� Phong Ti�u, ng߶i truy�n th� k� thu�t Linh D߽ng t�i M� Dung S�n Trang. C�c h� t�m ta c� vi�c g�?")
		if GetMenPai(sceneId,selfId) == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) > 0 then
			AddNumText(sceneId,x960006_g_scriptId,"Nh�n th�ng d�ng k� thu�t",1,0)
		end
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960006_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()

	--*************--
	if key == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"Nh�n th�nh c�ng Th�ng D�ng K� Thu�t!")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		TryRecieveItem(sceneId,selfId,39920040,1)
	end
	--*************--
	
end