--����NPC
--�齱
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000159_OnDefaultEvent( sceneId, selfId,targetId )
	local temp = random(10)
	local msgStr = format( "  #GB�n mu�n th� t�i v�n may ? H�y �em 15 con th�o ng� � c� th� tham gia s� ki�n n�y. Nh�ng vi�n b�o th�ch c�p 5 v� c�ng gi� tr� �ang ch� c�c b�n.")
	BeginEvent(sceneId)
		AddText(sceneId,msgStr)
		AddNumText( sceneId, x000160_g_ScriptId, "C� ! T�i c� mang theo 15 con Th�o Ng�", 10, 1 )
		AddNumText( sceneId, x000160_g_ScriptId, "Kh�ng ! T�i ch�a �� s� c� n�y", 10, 2 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000159_OnEventRequest( sceneId, selfId, targetId, eventId)
	if GetNumText() == 1 then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x000159_NotifyFailTips( sceneId, selfId, "Tay n�y �� �y" )
			x000159_NotifyFailBox( sceneId, selfId, targetId, "  Tay n�i �� �y" )
			return
		end
		local number = LuaFnGetAvailableItemCount(sceneId, selfId, 20102001)
		if number<1 then
			x000159_NotifyFailBox( sceneId, selfId, targetId, " B�n kh�ng c� Th�o Ng� h�y h�c ngh� c�u c� v� t�i Ki�m C�c, V� L��ng S�n, Th�i H�... thu th�p �� 15 con Th�o Ng� r�i h�y t�m ta." )
			return
		else
			local reply = LuaFnDelAvailableItem(sceneId,selfId,20102001,15)
			if reply > 0 then
				local temp = random(60)
			local equipID
			if temp==1 then
				equipID=50514001
			elseif temp==2 then
				equipID=50513006
			elseif temp==3 then
				equipID=20102001
			elseif temp==4 then
				equipID=50513005
			elseif temp==5 then
				equipID=50513005
			elseif temp==6 then
				equipID=50513004
			elseif temp==7 then
				equipID=50513004
			elseif temp==8 then
				equipID=50513003
			elseif temp==9 then
				equipID=50513003
			elseif temp==10 then
				equipID=50513003
			elseif temp==11 then
				equipID=50513002
			elseif temp==12 then
				equipID=50513002
			elseif temp==13 then
				equipID=50513001
			elseif temp==14 then
				equipID=50513001
			elseif temp==15 then
				equipID=50512008
			elseif temp==16 then
				equipID=50512008
			elseif temp==17 then
				equipID=50512007
			elseif temp==18 then
				equipID=50512007
			elseif temp==19 then
				equipID=50512006
			elseif temp==20 then
				equipID=50512006
			elseif temp==21 then
				equipID=50512005
			elseif temp==22 then
				equipID=50501001
			elseif temp==23 then
				equipID=50512004
			elseif temp==24 then
				equipID=50512004
			elseif temp==25 then
				equipID=50512003
			elseif temp==26 then
				equipID=50512003
			elseif temp==27 then
				equipID=50512002
			elseif temp==28 then
				equipID=50501001
			elseif temp==29 then
				equipID=50512002
			elseif temp==30 then
				equipID=50512001
			elseif temp==31 then
				equipID=50512001
			elseif temp==32 then
				equipID=50512001
			elseif temp==33 then
				equipID=50511002
			elseif temp==34 then
				equipID=50511001
			elseif temp==35 then
				equipID=50504002
			elseif temp==36 then
				equipID=50503001
			elseif temp==37 then
				equipID=50502008
			elseif temp==38 then
				equipID=50502007
			elseif temp==39 then
				equipID=50502006
			elseif temp==40 then
				equipID=50502005
			elseif temp==41 then
				equipID=50502004
			elseif temp==42 then
				equipID=50502003
			elseif temp==43 then
				equipID=50502002
			elseif temp==44 then
				equipID=50502001
			elseif temp==45 then
				equipID=50501002
			else
				equipID=0
			end
			local str = "  #YXin ch�c m�ng b�n �� ��t 1 #W"..GetItemName( sceneId, equipID ).."��"
			if equipID~=0 then
				if TryRecieveItem( sceneId, selfId, equipID, 1 ) >= 0 then
					x000159_NotifyFailTips( sceneId, selfId, str )
					x000159_NotifyFailBox( sceneId, selfId, targetId, str )
				end
			else
				local str = "  H�m nay b�n kh�ng may m�n."
				x000159_NotifyFailTips( sceneId, selfId, str )
				x000159_NotifyFailBox( sceneId, selfId, targetId, str )
			end
			else
				x000159_NotifyFailBox( sceneId, selfId, targetId, "Thao t�c sai, kh�ng th�c hi�n trao �i." )
			end
		end
	elseif GetNumText() == 2 then
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
function x000159_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x000159_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
