--NPC M� Dung S�n Trang
--C�ng D� Kh�n - Цy l�i �c lang
--Script by S�i �z
--ID = 960011

x960011_g_ScriptId	= 960011

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960011_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� C�ng D� Kh�n. G�n ��y, b�n ph�i th߶ng xuy�n b� l� �c lang qu�y r�y, g�y �nh h߷ng r�t nhi�u �n ho�t �ng c�a b�n ph�i.")
		AddNumText(sceneId,x960011_g_ScriptId,"Цy l�i �c lang",10,0)
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960011_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()

	if key == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"Ch�c n�ng n�y hi�n t�i ch�a ���c m�, c�c h� h�y quay l�i sau.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
end