--Th�p nh� S�t Tinh
--Kh� Vinh ��i S�
--Author: Ho�ng Steven

--************************--
x910113_g_ScriptId=910113												
x910113_g_Event_ScriptId=910112												--Script event
--************************--
x910113_g_Introduce="Kh�ng bi�t t� ��u ra c� #G12 t�n#W t� x�ng #GTh�p nh� S�t Tinh#W ho�nh h�nh ngang ng��c, uy hi�p b� t�nh. Thi�n h� anh h�ng, ph�m l� ng߶i h�nh hi�p tr��ng ngh�a, c�c h� kh�ng th� b� qua cho ch�ng!"
--************************--

--*****************************--
--*     On Default Event      *--
--*****************************--
function x910113_OnDefaultEvent(sceneId,selfId,targetId)

	--************************--
	BeginEvent(sceneId)
		AddText(sceneId,x910113_g_Introduce)
		CallScriptFunction(x910113_g_Event_ScriptId,"OnEnumerate",sceneId,selfId,targetId)
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,x910113_g_ScriptId)
	--************************--
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x910113_OnEventRequest(sceneId,selfId,targetId,eventId)

	if eventId==x910113_g_Event_ScriptId then
		CallScriptFunction(eventId,"OnDefaultEvent",sceneId,selfId,targetId)
		return
	end
	
end