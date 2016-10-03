--NPC Tong Hop Chuc Nang
x000163_g_ScriptId = 000163
--So Script 000163

--**********************************
--By Tandat102 TIEN KIEM KY HIEP
--**********************************
function x000163_OnDefaultEvent( sceneId, selfId,targetId )
     local 	nam	= LuaFnGetName( sceneId, selfId )
	local msgStr = format ( "#e0e8de5#c00ffffCh�o m�ng "..nam.." �n v�i Ti�n Ki�m K� Hi�p")
	BeginEvent(sceneId)
		AddText(sceneId,msgStr)
		--AddNumText( sceneId, x000163_g_ScriptId, "Nh�n l�i skill c� b�n", 6, 1000 )		
		--AddNumText( sceneId, x000163_g_ScriptId, "#GNh�n #{_EXCHG10000000} ��n Xu�n 1 ng�y/L�n", 5, 1010 )		
		AddNumText( sceneId, x000163_g_ScriptId, "M�t #{_EXCHG500000} � �i 1000 KNB", 6, 100 )
		AddNumText( sceneId, x000163_g_ScriptId, "#GM�t #{_EXCHG5000000} � �i 10000 KNB", 6, 300 )
		AddNumText( sceneId, x000163_g_ScriptId, "M�t #{_MONEY1000000} � �i 2500 KNB", 6, 200 )
		AddNumText( sceneId, x000163_g_ScriptId, "#GNh�n �m kh� Phi ho�n th�ch", 6, 4444 )

		AddNumText( sceneId, x000163_g_ScriptId, "Сt v�y! Ta kh�ng c�n...", 8, 4 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--Thuc thien chuc nang
--**********************************
function x000163_OnEventRequest( sceneId, selfId, targetId, eventId)

--Nhan lai skill co ban
	if GetNumText() == 1000 then 
		x000163_g_skillList = { 
				{id=241,name=" Ngo�i c�ng h� th�"},
				{id=242,name=" D�c s�c t�n c�ng"},
				{id=243,name=" C�ng k�ch y�u �i�m"},
				{id=244,name=" C�ng k�ch b�ng ngo�i k�nh"},
				{id=245,name=" Tr� li�u s� c�p"},
				{id=246,name=" N�i c�ng h� th�"},
				{id=247,name=" C�ng k�ch v�o n�i s� h�"},
				{id=248,name=" �n �n s� c�p"},
				{id=249,name=" C�m b�y th�u �t"}};
		BeginEvent( sceneId )
			AddText( sceneId, "#YKhi b� m�t c�c k� n�ng c� b�n. C�c h� c� th� quay l�i ��y � l�nh nh�n l�i!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
			
	end
--nhan vat pham
	if GetNumText()  == 4444 then 
		BeginAddItem(sceneId)
			AddItem( sceneId,10155001,1)
		EndAddItem(sceneId,selfId)
		       AddItemListToHuman(sceneId,selfId)
		       x000163_NotifyFailBox( sceneId, selfId, targetId, "C�c h� �� nh�n th�nh c�ng �m kh�." )

	end
 -- Nhan vang don xuan	
	if GetNumText() == 1010 then
        local day = GetDayTime();
        local lastDay = GetMissionData(sceneId, selfId, AddMoneyJZ );
            if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "#gffff00Ch�o b�n, h�m nay b�n �� s� d�ng ch�c n�ng n�y. M�i ng�y ch� ���c d�ng ch�c n�ng n�y m�t l�n. #rH�y quay l�i v�o h�m sau." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
            end
			AddMoneyJZ( sceneId, selfId, 10000000 )
            local	nam	= LuaFnGetName( sceneId, selfId )
            BroadMsgByChatPipe( sceneId, selfId, "#HCh�c m�ng #cFF0000"..nam.." #H�� nh�n V�ng ��n xu�n th�nh c�ng!", 4 )
			SetMissionData(sceneId, selfId, AddMoneyJZ, day);

		BeginEvent(sceneId)
        local	nam	= LuaFnGetName( sceneId, selfId )
			AddText(sceneId,"#HCh�c m�ng #cFF0000"..nam.." #H�� nh�n th�nh c�ng #G#{_EXCHG10000000}#H. C�m �n �� �ng h� #e0e8de5#c00ffffTi�n Ki�m K� Hi�p. #HCh�c b�n n�m m�i #PAn Khang Th�nh V��ng.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
-- doi 50 vang lay 1000 diem tang
	if GetNumText() == 100 then
		BeginEvent( sceneId )
					AddText( sceneId, "Ь nh�n KNB c�n ph�i t�n #G#{_EXCHG500000}#W. Ng߽i x�c nh�n chuy�n d�i ch�ng?" )
			AddNumText( sceneId, x000163_g_scriptId, "аng �", -1, 101)
			AddNumText( sceneId, x000163_g_scriptId, "Ta hi�n gi� ch�a c�n KNB", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 101 then
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		if (nMoneyJZ + nMoney <500000) then
			--x000163_NotifyFailTips( sceneId, selfId, "#G#{_EXCHG500000}#W m� c�ng ko c� sao?" )
			x000163_NotifyFailBox( sceneId, selfId, targetId, "Kh�ng c� �� #G#{_EXCHG500000}#W m� ��i KNB �? Kh�n th�?" )
			return
		end
		local reply = LuaFnCostMoneyWithPriority(sceneId,selfId,500000)
		if reply == -1 then
			x000163_NotifyFailTips( sceneId, selfId, "#G#{_EXCHG500000}#W  m� c�ng ko c� sao? ngh�o qu�, �i ki�m �i r�i quay v� ��y v�i ta." )
			x000163_NotifyFailBox( sceneId, selfId, targetId, "Kh�ng c� �� #G#{_EXCHG500000}#W m� ��i KNB �? Kh�n th�?" )
			return
		else
			local result =	YuanBao(sceneId,selfId,targetId,1,1000)
			local str = "#PXin ch�c m�ng, c�c h� �� nh�n ���c #G1000 KNB #Pv� m�t #G#{_EXCHG500000}#W."
			x000163_NotifyFailTips( sceneId, selfId, str )
			x000163_NotifyFailBox( sceneId, selfId, targetId, str )
		end
		end
-- doi 100 vang lay 2500 diem tang		
	if GetNumText() == 200 then
		BeginEvent( sceneId )
					AddText( sceneId, "Ь nh�n KNB c�n ph�i t�n #G#{_MONEY1000000}#W. Ng߽i x�c nh�n chuy�n d�i ch�ng?" )
			AddNumText( sceneId, x000163_g_scriptId, "аng �", -1, 201)
			AddNumText( sceneId, x000163_g_scriptId, "Ta hi�n gi� ch�a c�n KNB", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 201 then
		local	SelfMoney = GetMoney(sceneId, selfId)
		if SelfMoney<1000000 then
			--x000163_NotifyFailTips( sceneId, selfId,  "#G#{_MONEY1000000}#W m� c�ng ko c� sao?" )
			x000163_NotifyFailBox( sceneId, selfId, targetId, "Kh�ng c� �� 100 V�ng  m� ��i KNB �? Kh�n th�?" )
			return
		end
		local reply = CostMoney(sceneId,selfId,1000000)
		if reply == -1 then
			x000163_NotifyFailTips( sceneId, selfId, "#G#{_MONEY1000000}#W  m� c�ng ko c� sao? ngh�o qu� ,�i ki�m �i r�i quay v� ��y v�i ta." )
			x000163_NotifyFailBox( sceneId, selfId, targetId, "Kh�ng c� �� #G#{_MONEY1000000}#W m� ��i KNB �? Kh�n th�?" )
			return
		else
			local result =	YuanBao(sceneId,selfId,targetId,1,2500)
			local str = "#PXin ch�c m�ng, c�c h� �� nh�n ���c #G2500 KNB #Pv� m�t #G#{_MONEY1000000}#W."
			x000163_NotifyFailTips( sceneId, selfId, str )
			x000163_NotifyFailBox( sceneId, selfId, targetId, str )
		end
				end
				
-- doi 500 vang lay 10000 diem tang
	if GetNumText() == 300 then
		BeginEvent( sceneId )
					AddText( sceneId, "Ь nh�n KNB c�n ph�i t�n #G#{_EXCHG5000000}#W. Ng߽i x�c nh�n chuy�n d�i ch�ng?" )
			AddNumText( sceneId, x000163_g_scriptId, "аng �", -1, 301)
			AddNumText( sceneId, x000163_g_scriptId, "Ta hi�n gi� ch�a c�n KNB", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 301 then
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		if (nMoneyJZ + nMoney <5000000) then
			--x000163_NotifyFailTips( sceneId, selfId,"#G#{_MONEY3000000}#W m� c�ng ko c� sao?" )
			x000163_NotifyFailBox( sceneId, selfId, targetId,  "Kh�ng c� �� #G#{_EXCHG5000000}#W  m� ��i KNB �? Kh�n th�?" )
			return
		end
		local reply = LuaFnCostMoneyWithPriority(sceneId,selfId,5000000)
		if reply == -1 then
			x000163_NotifyFailTips( sceneId, selfId, "#G#{_EXCHG5000000}#W  m� c�ng ko c� sao? ngh�o qu� �i ki�m �i r�i quay v� ��y v�i ta." )
			x000163_NotifyFailBox( sceneId, selfId, targetId,"Kh�ng c� �� #G#{_EXCHG5000000}#W m� ��i KNB �? Kh�n th�?" )
			return
		else
			local result =	YuanBao(sceneId,selfId,targetId,1,10000)
			local str = "#PXin ch�c m�ng, c�c h� �� nh�n ���c #G10000 KNB #Pv� m�t #G#{_EXCHG5000000}#W."
			x000163_NotifyFailTips( sceneId, selfId, str )
			x000163_NotifyFailBox( sceneId, selfId, targetId, str )
		end
		end
	if GetNumText() == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
end
--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x000163_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x000163_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
