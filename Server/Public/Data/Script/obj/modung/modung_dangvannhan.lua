--NPC M� Dung S�n Trang
--D�ch tr�m - Уng V�n Nh�n
--Script by S�i �z
--ID = 960000

x960000_g_ScriptId	= 960000

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960000_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"N�i n�y l� #GM� Dung S�n Trang#W, t�ng �� m�n ph�i #GM� Dung#W t�i #GC� T�#W. Ch� ta cung c�p d�ch v� truy�n t�ng �n c�c m�n ph�i v� th�nh th�. C�c h� mu�n �i ��u?")
		AddNumText(sceneId,x960000_g_ScriptId,"Th�nh th� - T� Ch�u",9,0)
		AddNumText(sceneId,x960000_g_ScriptId,"Th�nh th� - T� Ch�u - Thi�t T߶ng Ph�",9,1)
		AddNumText(sceneId,x960000_g_ScriptId,"Th�nh th� - L�c D߽ng",9,2)
		AddNumText(sceneId,x960000_g_ScriptId,"Th�nh th� - L�c D߽ng - C�u Ch�u Th߽ng H�i",9,3)
		AddNumText(sceneId,x960000_g_ScriptId,"Th�nh th� - ��i L�",9,4)
		AddNumText(sceneId,x960000_g_ScriptId,"Th�nh th� - L�u Lan",9,5)
		AddNumText(sceneId,x960000_g_ScriptId,"Th�nh th� - Th�c H� C� Tr�n",9,6)
		AddNumText(sceneId,x960000_g_ScriptId,"Th�nh th� - #GPh��ng Minh Tr�n",9,7)
		AddNumText(sceneId,x960000_g_ScriptId,"Ъn c�c m�n ph�i kh�c",9,8)
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960000_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()

	--*****************--
	if key == 0 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,1,202,257)
	elseif key == 1 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,1,331,226)
	elseif key == 2 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,0,233,321)
	elseif key == 3 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,0,325,270)
	elseif key == 4 then
		CallScriptFunction((400900),"TransferFuncFromNpc",sceneId,selfId,2,376,222)
	elseif key == 5 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,186,286,129)
	elseif key == 6 then
		BeginEvent(sceneId)
			AddText(sceneId,"Th�c H� C� Tr�n l� khu v�c kh�ng t�ng s�t kh�, c�c h� x�c nh�n ti�n v�o?")
			AddNumText(sceneId,x960000_g_ScriptId,"X�c nh�n",-1,1000)
			AddNumText(sceneId,x960000_g_ScriptId,"Tr� l�i",-1,1001)
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 7 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,580,158,120)
	end
	--*****************--
	if key == 8 then
		BeginEvent(sceneId)
			AddNumText(sceneId,x960000_g_ScriptId,"M�n ph�i - Tinh T�c",9,90)
			AddNumText(sceneId,x960000_g_ScriptId,"M�n ph�i - Ti�u Dao",9,91)
			AddNumText(sceneId,x960000_g_ScriptId,"M�n ph�i - Thi�u L�m",9,92)
			AddNumText(sceneId,x960000_g_ScriptId,"M�n ph�i - Thi�n S�n",9,93)
			AddNumText(sceneId,x960000_g_ScriptId,"M�n ph�i - Thi�n Long",9,94)
			AddNumText(sceneId,x960000_g_ScriptId,"M�n ph�i - Nga My",9,95)
			AddNumText(sceneId,x960000_g_ScriptId,"M�n ph�i - V� �ang",9,96)
			AddNumText(sceneId,x960000_g_ScriptId,"M�n ph�i - Minh Gi�o",9,97)
			AddNumText(sceneId,x960000_g_ScriptId,"M�n ph�i - C�i Bang",9,98)
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	--*****************--
	if key == 90 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,16,96,152)
	elseif key == 91 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,14,67,145)
	elseif key == 92 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,9,96,127)
	elseif key == 93 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,17,95,120)
	elseif key == 94 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,13,96,120)
	elseif key == 95 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,15,89,139)
	elseif key == 96 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,12,103,140)
	elseif key == 97 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,11,98,167)
	elseif key == 98 then
		CallScriptFunction((400900),"TransferFunc",sceneId,selfId,10,91,116)
	end
	--*****************--
	if key == 1000 then
		CallScriptFunction((400900),"TransferFuncFromNpc",sceneId,selfId,420,200,211)
	elseif key == 1001 then
		x960000_OnDefaultEvent(sceneId,selfId,targetId)
	end
	
end
--*****************************--
--*       Messenge Box        *--
--*****************************--
function x960000_MsgBox(sceneId,selfId,targetId,msg)

	BeginEvent(sceneId)
		AddText(sceneId,sceneId,msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	
end

