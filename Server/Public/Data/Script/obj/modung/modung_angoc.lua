--NPC M� Dung S�n Trang
--A Ng�c - Truy�n T�ng K�nh H�
--Script by S�i �z
--ID = 960023

x960023_g_ScriptId	= 960023

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960023_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Th�y ��o n�i n�y r�t r�ng l�n, n�u kh�ng ph�i ng߶i th�ng thu�c �a h�nh c� l� kh� c� th� r�i kh�i n�i ��y ���c.")
		AddNumText(sceneId,x960023_g_scriptId, "Ъn K�nh H�",9,0)
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960023_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()

	--*****************--
	if key == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"K�nh H� l� khu v�c kh�ng t�ng s�t kh�, c�c h� x�c nh�n ti�n v�o?")
			AddNumText(sceneId,x960023_g_scriptId, "X�c nh�n",-1,1)
			AddNumText(sceneId,x960023_g_scriptId, "Tr� l�i",-1,2)
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	--*****************--
	if key == 1 then
		CallScriptFunction((400900),"TransferFunc",sceneId, selfId,5,49,141)
	elseif key == 2 then
		x960023_OnDefaultEvent(sceneId,selfId,targetId)
	end
	--*****************--
	
end