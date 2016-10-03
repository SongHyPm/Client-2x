--��i L� New
--ID: 990001
--Script: Edit by S�i �z
--**************************

x990001_g_ScriptId = 990001

--*****************************--
--*      On Default Event     *--
--*****************************--
function x990001_OnDefaultEvent(sceneId,selfId,targetId)
local nam = LuaFnGetName(sceneId,selfId)

	BeginEvent(sceneId)
		AddText(sceneId,"#G��i L� Th�nh#W l� ch�n th�nh th� ph�n vinh b�c nh�t trong #GThi�n Long B�t B�#W. Ch� ta cung c�p c�c d�ch v� li�n quan �n #GTrang b�#W. C�c h� c� mu�n th� nghi�m kh�ng?")
		AddNumText(sceneId,x990001_g_ScriptId,"��c FULL l� trang b�",2,1)
		AddNumText(sceneId,x990001_g_ScriptId,"T߽ng kh�m b�o th�ch",2,10)
		AddNumText(sceneId,x990001_g_ScriptId,"Th�o g� b�o th�ch",2,11)
		AddNumText(sceneId,x990001_g_ScriptId,"H�p th�nh b�o th�ch",2,12)
		AddNumText(sceneId,x990001_g_ScriptId,"��c l� c�c h�n",2,13)
		AddNumText(sceneId,x990001_g_ScriptId,"Kh�m n�m c�c h�n",2,14)
		AddNumText(sceneId,x990001_g_ScriptId,"Th�o g� b�o th�ch c�c h�n",2,15)
		AddNumText(sceneId,x990001_g_ScriptId,"Gi�m �nh t� ch�t trang b�",2,16)
		AddNumText(sceneId,x990001_g_ScriptId,"Gi�m �nh t� ch�t trang b� t� �u",2,17)
		AddNumText(sceneId,x990001_g_ScriptId,"Kh�c danh trang b�",2,18)
		AddNumText(sceneId,x990001_g_ScriptId,"C߶ng h�a trang b�",2,19)
		--AddNumText(sceneId,x990001_g_ScriptId,"Nh�n #GB�o Th�ch C�p 9",3,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*         On Stileto        *--
--*****************************--
function x990001_OnStileto(sceneId,selfId)

	--**************--
	local ret = AddBagItemSlot(sceneId,selfId,0)
	if ret == -1 or ret == -2 or ret == 1 then
		x990001_OnStileto(sceneId,selfId)
	elseif ret == -3 then
		x990001_NotifyFailTips(sceneId,selfId,"C�n �t v�o m�t trang b�.")
		return
	elseif ret == -4 then
		local ret1 = AddBagItemSlotFour(sceneId,selfId,0)
		if ret1 == -4 then
			x990001_NotifyFailTips(sceneId,selfId,"Trang b� n�y �� t�ng ��c l� c�c h�n r�i!")
			return
		end
		x990001_NotifyFailTips(sceneId,selfId,"��c l� th�nh c�ng!")
		return
	end
	--**************--
	
end
--*****************************--
--*      On Event Request     *--
--*****************************--
function x990001_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()

	--**************--
	if key == 1 then
	
		BeginEvent(sceneId)
			AddText(sceneId,"H�y b� trang b� c�n ��c l� v�o � �u ti�n trong tay n�i")
			AddNumText(sceneId,x990001_g_ScriptId,"��c l�",1,2)
			AddNumText(sceneId,x990001_g_ScriptId,"Tr� l�i",1,2000)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end
	--**************--
	if key == 2 then
	
		x990001_OnStileto(sceneId,selfId)
		
	end
	--**************--
	if key == 2000 then
	
		x990001_OnDefaultEvent(sceneId,selfId,targetId)
		
	end
	--**************--
	if key == 0 then
	
		BeginEvent(sceneId)
			AddText(sceneId,"M�i lo�i 5 vi�n, ng߽i mu�n l�y lo�i n�o?")
			AddNumText(sceneId,x990001_g_ScriptId,"B�o th�ch c�ng k�ch ph� th�ng",1,3)
			AddNumText(sceneId,x990001_g_ScriptId,"B�o th�ch c�ng k�ch ng� h�nh",1,4)
			AddNumText(sceneId,x990001_g_ScriptId,"B�o th�ch gi�m kh�ng",1,5)
			AddNumText(sceneId,x990001_g_ScriptId,"Minh Tinh Th�ch",1,6)
			AddNumText(sceneId,x990001_g_ScriptId,"B�o th�ch h� th�n",1,7)
			AddNumText(sceneId,x990001_g_ScriptId,"B�o th�ch ph�ng th�",1,8)
			AddNumText(sceneId,x990001_g_ScriptId,"B�o th�ch kh�ng ng� h�nh",1,9)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end
	--**************--
	if key == 3 then
	
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� mu�n l�y lo�i b�o th�ch n�o?")					
			AddRadioItemBonus(sceneId,50901003,4)
			AddRadioItemBonus(sceneId,50901004,4)
			AddRadioItemBonus(sceneId,50903002,4)
			AddRadioItemBonus(sceneId,50904003,4)
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x990001_g_ScriptId,0)
		
	end
	--**************--
	if key == 4 then
	
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� mu�n l�y lo�i b�o th�ch n�o?")					
			AddRadioItemBonus(sceneId,50902013,4)
			AddRadioItemBonus(sceneId,50902014,4)
			AddRadioItemBonus(sceneId,50902015,4)
			AddRadioItemBonus(sceneId,50902016,4)
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x990001_g_ScriptId,0)
		
	end
	--**************--
	if key == 5 then
	
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� mu�n l�y lo�i b�o th�ch n�o?")					
			AddRadioItemBonus(sceneId,50921005,4)
			AddRadioItemBonus(sceneId,50921006,4)
			AddRadioItemBonus(sceneId,50921007,4)
			AddRadioItemBonus(sceneId,50921008,4)
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x990001_g_ScriptId,0)
		
	end
	--**************--
	if key == 6 then
	
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� mu�n l�y lo�i b�o th�ch n�o?")					
			AddRadioItemBonus(sceneId,50921109,4)
			AddRadioItemBonus(sceneId,50921209,4)
			AddRadioItemBonus(sceneId,50921309,4)
			AddRadioItemBonus(sceneId,50921409,4)
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x990001_g_ScriptId,0)
		
	end
	--**************--
	if key == 7 then
	
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� mu�n l�y lo�i b�o th�ch n�o?")					
			AddRadioItemBonus(sceneId,50913007,6)
			AddRadioItemBonus(sceneId,50913008,6)
			AddRadioItemBonus(sceneId,50913009,6)
			AddRadioItemBonus(sceneId,50913010,6)
			AddRadioItemBonus(sceneId,50913011,6)
			AddRadioItemBonus(sceneId,50913012,6)
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x990001_g_ScriptId,0)
		
	end
	--**************--
	if key == 8 then
	
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� mu�n l�y lo�i b�o th�ch n�o?")					
			AddRadioItemBonus(sceneId,50914002,3)
			AddRadioItemBonus(sceneId,50911003,3)
			AddRadioItemBonus(sceneId,50911004,3)
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x990001_g_ScriptId,0)
		
	end
	--**************--
	if key == 9 then
	
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� mu�n l�y lo�i b�o th�ch n�o?")					
			AddRadioItemBonus(sceneId,50912013,4)
			AddRadioItemBonus(sceneId,50912014,4)
			AddRadioItemBonus(sceneId,50912015,4)
			AddRadioItemBonus(sceneId,50912016,4)
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x990001_g_ScriptId,0)
		
	end
	--**************--
	if key == 10 then
	
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,19830424)
		return
		
	end
	--**************--
	if key == 11 then
	
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,27)
		return
		
	end
	--**************--
	if key == 12 then
	
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,23)
		return
		
	end
	--**************--
	if key == 13 then
	
		BeginEvent(sceneId)
			AddText(sceneId,"Ch�n nguy�n li�u khoan")
			AddNumText(sceneId,x990001_g_ScriptId,"�i�m Kim Chi Ti�n",6,20)
			AddNumText(sceneId,x990001_g_ScriptId,"H�n Ng�c Tinh Tu�",6,21)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end
	--**************--
	if key == 20 then
	
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		UICommand_AddInt(sceneId,1)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,75117)
		
	end
	--**************--
	if key == 21 then
	
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		UICommand_AddInt(sceneId,2)	
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,75117)
		
	end
	--**************--
	if key == 14 then
	
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,751107)
		
	end
	--**************--
	if key == 15 then
	
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,25702)
		
	end
	--**************--
	if key == 16 then
	
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,1001)
		return
		
	end
	--**************--
	if key == 17 then
	
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,112233)
		return
		
	end
	--**************--
	if key == 18 then
	
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,1005)
		return
		
	end
	--**************--
	if key == 19 then
	
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,1002)
		return
		
	end
	--**************--
	
end
--*****************************--
--*     On Mission Submit     *--
--*****************************--
function x990001_OnMissionSubmit(sceneId,selfId,targetId,missionScriptId,selectRadioId)

	--*****************--
	TryRecieveItem(sceneId,selfId,selectRadioId,1);
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	x990001_NotifyFailTips(sceneId,selfId,"Nh�n th߷ng th�nh c�ng!")
	--*****************--
	
end
--*****************************--
--*     Notify Fail Tips      *--
--*****************************--
function x990001_NotifyFailTips(sceneId,selfId,Tip)

	BeginEvent(sceneId)
		AddText(sceneId,Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end