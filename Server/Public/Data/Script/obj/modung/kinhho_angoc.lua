--NPC K�nh H�
--A Ng�c - Truy�n T�ng M� Dung S�n Trang
--Script by S�i �z
--ID = 960024

x960024_g_ScriptId	= 960024

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960024_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"M� Dung S�n Trang th�y ��o r�t r�ng l�n, n�u kh�ng ph�i ng߶i th�ng thu�c �a h�nh c� l� kh� c� th� �n ���c.")
		AddNumText(sceneId,x960024_g_scriptId, "Ъn M� Dung S�n Trang",9,0)
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960024_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()

	--*****************--
	if key == 0 then
		CallScriptFunction((400900),"TransferFunc",sceneId, selfId,435,160,166)
	end
	--*****************--
	
end