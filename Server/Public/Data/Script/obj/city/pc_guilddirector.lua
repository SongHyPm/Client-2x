--Th�nh ph� NPC
--����

x805009_g_scriptId = 805009
x805009_g_BuildingID1 = 0

--��ӵ��to� � �¼�ID�б�
x805009_g_eventList = { 600035, 600040 }

-- �����¼� ID �б�,�����¼��������¼�
x805009_g_eventSetList = { 600035, 600040 }

--��Ʊ����ID
x805009_g_TicketItemIdx	=	40002000

-- ��ƱID
x805009_g_Yinpiao = 40002000


-- ���׶��ƺ�
x805009_g_GuildContriTitle = 
{
	{ currName="",	nextId=242, needContri=250, 	name=".Quan N�i H�u"},
	{ currName=".Quan N�i H�u",	nextId=243, needContri=750, 	name=".��nh H�u"},
	{ currName=".��nh H�u", 	nextId=244, needContri=1500, 	name=".H߽ng H�u"},
	{ currName=".H߽ng H�u", 	nextId=245, needContri=3000, 	name=".Huy�n H�u"},
	{ currName=".Huy�n H�u", 	nextId=246, needContri=7500, 	name=".Qu�n H�u"},
	{ currName=".Qu�n H�u", 	nextId=247, needContri=15000, 	name=".Huy�n C�ng"},
	{ currName=".Huy�n C�ng", 	nextId=248, needContri=30000, 	name=".Qu�n C�ng"},
	{ currName=".Qu�n C�ng", 	nextId=249, needContri=60000, 	name=".Qu�c C�ng"},
	{ currName=".Qu�c C�ng", 	nextId=250, needContri=125000, 	name=".Qu�n V߽ng"},
	{ currName=".Qu�n V߽ng", 	nextId=251, needContri=250000, 	name=".Th�n V߽ng"}
}


--**********************************
--�¼��б�
--**********************************
function x805009_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if(Humanguildid == cityguildid) then
--		if CityGetSelfCityID( sceneId, selfId ) == sceneId then
			AddText( sceneId, "    S� v� l�n nh� trong bang, c� c�n ta gi�p g� huynh kh�ng? huynh � 1 nh� kh�ng c�n kh�ch s�o." )

			--AddNumText( sceneId, x805009_g_scriptId, "���ý�����m�t c�p", 6, 1 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ý�������c�p", 6, 2 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ý�������c�p", 6, 3 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ý�������c�p", 6, 4 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ý�������c�p", 6, 5 )

			--AddNumText( sceneId, x805009_g_scriptId, "���ó�����m�t c�p", 6, 6 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ó�������c�p", 6, 7 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ó�������c�p", 6, 8 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ó�������c�p", 6, 9 )
			--AddNumText( sceneId, x805009_g_scriptId, "���ó�������c�p", 6, 10 )

			--AddNumText( sceneId, x805009_g_scriptId, "�������ʷ���", 6, 13 )
			AddNumText( sceneId, x805009_g_scriptId, "Thi�t l�p/ki�m tra tin nh�n tr�n m�ng", 6, 22 )
			AddNumText( sceneId, x805009_g_scriptId, "X�y d�ng th�nh th�", 6, 12 )
			AddNumText( sceneId, x805009_g_scriptId, "Nghi�n c�u th�nh th�", 6, 14 )

			for i, eventId in x805009_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			--AddNumText( sceneId, x805009_g_scriptId, "������", 6, 15 )
			--AddNumText( sceneId, x805009_g_scriptId, " ��t ���c���̹�Ʊ", 7, 16 )
			--AddNumText( sceneId, x805009_g_scriptId, "�������̹�Ʊ", 7, 17 )
			AddNumText( sceneId, x805009_g_scriptId, "Con �߶ng th߽ng nghi�p", 12, 18 )
			AddNumText( sceneId, x805009_g_scriptId, "Gi�i thi�u nha huy�n", 11, 19 )
			AddNumText( sceneId, x805009_g_scriptId, "Gi�i thi�u nhi�m v� x�y d�ng", 11, 20 )
			AddNumText( sceneId, x805009_g_scriptId, "Gi�i thi�u nhi�m v� nghi�n c�u", 11, 21 )
			AddNumText( sceneId, x805009_g_scriptId, "#{BGCH_8829_02}", 11, 25 )--���ڶm�t ��ﹱ��
			AddNumText( sceneId, x805009_g_scriptId, "Xin tr� th�nh Bang ch�", 11, 23 )
			AddNumText( sceneId, x805009_g_scriptId, "#{SQBZ_090205_01}", 11, 26 )
			--AddNumText( sceneId, x805009_g_scriptId, "�ص�L�c D߽ng", 9, 11 )
			--AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_02}", 9, 27 )
			--AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_03}", 9, 28 )
			AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090226_10}", 9, 29 )
			local currGuildContriSum = CityGetAttr(sceneId, selfId, 15);
			local currGuildContriTitle = GetGuildContriTitle(sceneId, selfId);
			local guildName = LuaFnGetGuildName(sceneId, selfId);
			for i, titleItem in x805009_g_GuildContriTitle do
				if currGuildContriTitle == "" then
					currGuildContriTitle = guildName
				end
				if currGuildContriTitle == guildName..titleItem.currName then
					AddNumText( sceneId, x805009_g_scriptId, "Th�ng ch�c l� "..titleItem.name, 6, 30 )
					break;
				end
			end
			
			AddNumText( sceneId, x805009_g_scriptId, "#{BGCH_8829_01}", 6, 24 )--���ﹱ�m�t ��ɰﹱ��

		else
			local PlayerGender = GetSex( sceneId, selfId )
			local rank

			if PlayerGender == 0 then
				rank = "N� hi�p"
			elseif PlayerGender == 1 then
				rank = " c�c h�"
			else
				rank = "V� n�y"
			end

			AddText( sceneId, "    " .. rank .. "M�t tr�ng l� l�m, ta l� ch� qu�n c�a b�n th�nh, c� vi�c g� ta c� th� ti�p ��i kh�ch l�." )
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x805009_OnDefaultEvent( sceneId, selfId, targetId )
	x805009_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- �ж�ĳc�i�¼���ng�����ͨ���� NPC ִ��
--**********************************
function x805009_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805009_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805009_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x805009_OnEventRequest( sceneId, selfId, targetId, eventId )
	-- ��������to� � �¼��б���to� � �¼�
	if x805009_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end

	-- �����ű��Դ��¼�,����дto� � ,δ���޸�
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 0)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 1)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 2)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 3)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 4)
	elseif GetNumText() == 6 then
		CitySetLevel(sceneId, selfId, sceneId, 0)
	elseif GetNumText() == 7 then
		CitySetLevel(sceneId, selfId, sceneId, 1)
	elseif GetNumText() == 8 then
		CitySetLevel(sceneId, selfId, sceneId, 2)
	elseif GetNumText() == 9 then
		CitySetLevel(sceneId, selfId, sceneId, 3)
	elseif GetNumText() == 10 then
		CitySetLevel(sceneId, selfId, sceneId, 4)
	elseif GetNumText() == 11 then
		-- ��������T�i ����,�Ͳ������ʹ��C�i n�y ����
		if GetItemCount(sceneId, selfId, x805009_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "  Tr�n ng߶i c�c h� c� ng�n phi�u, �ang ch�y tr�n n�! Ta kh�ng th� gi�p c�c h�." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--NewWorld(sceneId, selfId, 0, 144, 98)
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,144,98)

	elseif GetNumText() == 12 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --����Th�nh ph� ��������
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 100)
	elseif GetNumText() == 13 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --����Th�nh ph� ��չ���ƽ���
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 101)
	elseif GetNumText() == 14 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --����Th�nh ph� �о�����
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 102)
	elseif GetNumText() == 15 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --���ð��������
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 103)
	elseif GetNumText() == 18 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --����Th�nh ph� ��ҵ·�߽���
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 105)
	elseif GetNumText() == 16 then
		-- ��t ���c��Ʊ,�ر�,�Ƶ�����npc��

		--��ng����ng�����Ա
		local guildid 		= GetHumanGuildID(sceneId,selfId)
		local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)

		if(guildid ~= cityguildid) then
				BeginEvent(sceneId)
					strText = "C�c h� kh�ng ph�i l� ng߶i c�a bang h�i, nhi�m v� c�a bang h�i kh�ng ti�n n�i ra."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--��ng����ng���˻����
		local	guildpos = GetGuildPos(sceneId, selfId)
		if ((guildpos ~= GUILD_POSITION_COM) and (guildpos ~= GUILD_POSITION_CHIEFTAIN)) then
				BeginEvent(sceneId)
					strText = "Xin l�i, ch� c� quan ch�c th߽ng nghi�p ho�c bang ch� m�i c� th� l�y ���c quan phi�u."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--c�p����ng��
		local level = GetLevel(sceneId, selfId)
		if(level<40) then
				BeginEvent(sceneId)
					strText = "V� huynh � n�y b�y gi� m� kinh doanh, c� l� h�i s�m m�t ch�t. Hay l� ��i �n c�p 40 r�i quay l�i t�m ta, nh� th� s� t�t h�n."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		local curMoney = 0
		local maxMoney = 0

		if level>=40 and level<55 then
			curMoney = 20000
			maxMoney = 100000
		elseif level>=55 and level<69 then
			curMoney = 30000
			maxMoney = 150000
		elseif level>=70 and level<84 then
			curMoney = 40000
			maxMoney = 250000
		elseif level>=85 and level<100 then
			curMoney = 50000
			maxMoney = 300000
		end

		--��ng������Ʊ
		local	bagpos = GetBagPosByItemSn(sceneId, selfId, x805009_g_TicketItemIdx)

		if bagpos ~= -1	then
				BeginEvent(sceneId)
					strText = "Xin l�i, c�c h� ch� ���c l�y m�t t� quan phi�u th�i."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return

		elseif bagpos == -1 then

				--�����ʽ���ng�񹻿���m�t ����Ʊto� � 
				local GuildMoney = CityGetAttr(sceneId, selfId, GUILD_MONEY)
				if GuildMoney <= curMoney then
						BeginEvent(sceneId)
							strText = "Qu� c�a bang ph�i kh�ng �� � xu�t ng�n phi�u cho c�c h�."
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
				end

				BeginAddItem( sceneId )
				AddItem( sceneId, x805009_g_TicketItemIdx, 1 )
				ret = EndAddItem( sceneId, selfId )
				if ret > 0 then
					AddItemListToHuman(sceneId,selfId )
					bagpos = GetBagPosByItemSn(sceneId, selfId, x805009_g_TicketItemIdx)
					--������T�i ����,��Ʒ���� ��t ���cӦ��to� � ��Ʒ��ֵ
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_CUR_MONEY_START, TICKET_ITEM_PARAM_CUR_MONEY_TYPE, curMoney)
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MONEY_TYPE, maxMoney)
					CityChangeAttr(sceneId, selfId, GUILD_MONEY, (-1)*curMoney)
					LuaFnRefreshItemInfo(sceneId, selfId, bagpos)
					BeginEvent(sceneId)
						strText = "R�t t�t r�t t�t, t� ng�n phi�u n�y c�c h� t�m th�i c� th� c�m �i, gi�p b�n bang ki�m th�m m�t �t ti�n, c�ng lao kh�ng nh� ��u."
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				else
					BeginEvent(sceneId)
						strText = "T�i x�ch �� �y, kh�ng th� ti�p nh�n th�m nhi�m v�"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				end
		end

	elseif GetNumText() == 17 then
		--������Ʊ,�ر�,�Ƶ�����npc��

		--��ng����ng�����Ա
		local guildid 		= GetHumanGuildID(sceneId, selfId)
		local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)

		if(guildid ~= cityguildid) then
				BeginEvent(sceneId)
					strText = "C�c h� kh�ng ph�i l� ng߶i c�a b�n bang.."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--��ng����ng���˻����
		local	guildpos = GetGuildPos(sceneId, selfId)
		if ( (guildpos ~= GUILD_POSITION_COM) and (guildpos ~= GUILD_POSITION_CHIEFTAIN) ) then
				BeginEvent(sceneId)
					strText = "Xin l�i, ch� c� quan ch�c th߽ng nghi�p ho�c bang ch� m�i c� th� tr� ���c ng�n phi�u."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--c�p����ng��
		local level = GetLevel(sceneId, selfId)
		if(level<40) then
				BeginEvent(sceneId)
					strText = "V� huynh � n�y b�y gi� m� kinh doanh, c� l� h�i s�m m�t ch�t.."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		local	bagpos = GetBagPosByItemSn(sceneId, selfId, x805009_g_TicketItemIdx)
		if bagpos ~= -1	then
			local	TicketMoney = GetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_CUR_MONEY_START, TICKET_ITEM_PARAM_CUR_MONEY_TYPE)
			local	MaxTicketMoney = GetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MONEY_TYPE)
			if TicketMoney ~= 0 then

				if TicketMoney < MaxTicketMoney	then
						BeginEvent(sceneId)
							strText = "Ng�n phi�u c�a c�c h� kh�ng nh�n ���c s� ti�n ��ng ph�i nh�n, ti�p t�c �i ki�m ti�n �i."
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
						return
				end

				CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, 50)
				CityChangeAttr(sceneId, selfId, GUILD_MONEY, TicketMoney*0.9)
				AddMoney(sceneId, selfId, TicketMoney*0.1)
				AddExp(sceneId, selfId, 20000)
				local ReturnType = DelItem(sceneId, selfId, x805009_g_TicketItemIdx, 1)
				if ReturnType == 0 then
					BeginEvent(sceneId)
						strText = "Kh�ng th� x�a ng�n phi�u"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				else
					BeginEvent(sceneId)
						strText = "X�a ng�n phi�u th�nh c�ng"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				end

			else
				BeginEvent(sceneId)
					strText = "Xin l�i, ng�n phi�u c�a c�c h� kh�ng c� ti�n"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
		else
			BeginEvent(sceneId)
				strText = "Xin l�i, c�c h� kh�ng c� ng�n phi�u"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	elseif GetNumText() == 19 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_XianYa}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 20 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_Build}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 21 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_Research}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 22 then
		local guildpos = GetGuildPos( sceneId, selfId )
		if guildpos ~= GUILD_POSITION_ASS_CHIEFTAIN and guildpos ~= GUILD_POSITION_CHIEFTAIN then
			--�������ng�����򸱰�����򿪲鿴���Խ���....
			
			--׼���򿪲鿴���Խ���....(�ȴ�LeaveWord����....)
			--UI�ű�����ֱ�Ӵ򿪽������ng��World����������(���±��ذ������)....
			--���ͻ���to� � LeaveWord�����º�ᷢ��UI��Ϣ....����ʱ�鿴���Խ���Ż��....
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 19841120 )
			return
		else
			--�����ng�����򸱰�������������Խ���....
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 19840424 )
			return
		end
		
	elseif GetNumText() == 23 then
		GuildPromoteToChief(sceneId, selfId)
		
	--���ﹱ�m�t ��ɰﹱ��
	elseif GetNumText() == 24 then
	
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19821 )

	--���ڶm�t ��ﹱ��
	elseif GetNumText() == 25 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{BGCH_8829_05}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	
	--�������ng��Ϊ����
	elseif GetNumText() == 26 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SQBZ_090205_02}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

 --�ص���i L�
	elseif GetNumText() == 27 then
		if GetItemCount(sceneId, selfId, x805009_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "  Tr�n ng߶i c�c h� c� ng�n phi�u, �ang ch�y tr�n n�! Ta kh�ng th� gi�p c�c h�." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--NewWorld(sceneId, selfId, 0, 144, 98)
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 2,181,120)
		
	--�ص�T� Ch�u
	elseif GetNumText() == 28 then
		if GetItemCount(sceneId, selfId, x805009_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "  Tr�n ng߶i c�c h� c� ng�n phi�u, �ang ch�y tr�n n�! Ta kh�ng th� gi�p c�c h�." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--NewWorld(sceneId, selfId, 0, 144, 98)
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,224,185)
	elseif GetNumText() == 29 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{BHCS_090226_11}" )
		AddNumText( sceneId, x805009_g_scriptId, "Quay v� L�c D߽ng", 9, 11 )
		AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_02}", 9, 27 )
		AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_03}", 9, 28 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
			
	--��ṱ�׶ȳƺ�
	elseif GetNumText() == 30 then
		
		local currGuildContriSum = CityGetAttr(sceneId, selfId, 15);
		local currGuildContriTitle = GetGuildContriTitle(sceneId, selfId);
		local guildName = LuaFnGetGuildName(sceneId, selfId);
		
		for i, titleItem in x805009_g_GuildContriTitle do
			if currGuildContriTitle == "" then
				currGuildContriTitle = guildName
			end
			if currGuildContriTitle == guildName..titleItem.currName then	
				local playerName = GetName(sceneId, selfId);

				if currGuildContriSum < titleItem.needContri then
					local strTip = "#R"..playerName.."#W! Mu�n th�ng ch�c #G"..guildName..titleItem.name.."#W c�n �i�m c�ng hi�n l� #G"..titleItem.needContri.."#W �i�m! C�c h� ch�a ��, h�y c� g�ng h�n n�a.";
					BeginEvent( sceneId )
						AddText( sceneId, strTip )
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
				
				AwardGuildContriTitle( sceneId, selfId, guildName..titleItem.name);
				SetCurTitle( sceneId, selfId, 38, 0 );
				LuaFnDispatchAllTitle( sceneId, selfId )
				
				local strTip = "Ch�c m�ng #R"..playerName.."#W! Tr� th�nh th�nh vi�n Bang h�i #G"..guildName..titleItem.name.."#W! Ь Bang h�i h�ng th�ch xin h�y c� g�ng."
				
				--������Ч
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
				local sMessage = format("@*;SrvMsg;GLD:#WB�n bang #R#{_INFOUSR%s}#W v� b�n bang l�p ���c c�ng l�n, ban cho ch�c v� #G%s#W!#R#{_INFOUSR%s}#W h�y ti�p t�c c� g�ng!", playerName, guildName..titleItem.name ,playerName);	
	    		BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
			
			
				sMessage = format("#W#{_INFOUSR%s} v� #G%s#W kh�ng ng�ng c� g�ng, ban cho ch�c v�: #G%s#W!", playerName,guildName, guildName..titleItem.name );
				BroadMsgByChatPipe(sceneId, selfId, sMessage, 4);
		
				BeginEvent( sceneId )
					AddText( sceneId, strTip )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				
				break;
			end
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x805009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805009_NotifyFailTips( sceneId, selfId, "Ng߽i hi�n kh�ng th� nh�n nhi�m v� n�y" )
		elseif ret == -2 then
			x805009_NotifyFailTips( sceneId, selfId, "Kh�ng th� ti�p nh�n nhi�u nhi�m v�" )
		end

		return
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x805009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805009_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x805009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x805009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--�����¼�
--**********************************
function x805009_OnDie( sceneId, selfId, killerId )
end

function x805009_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�ﹱ����UI 19821 Banggong Exchange���õ�����
--**********************************
function x805009_BanggongExchange( sceneId, selfId, nvalue ) --C�i n�y ��ng�������ֵ,ʵ��to� � �۳�ֵ��ҪT�i �˻�����+10%to� � ˰��
	local haveBangGong = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT)
	
	--��ng��ȫʱ��,C�i n�y �жϺ��������Լ�����ʾ��Ϣ,��C�n ����д��ʾ��Ϣ
	if IsPilferLockFlag(sceneId, selfId) <= 0 then
		return
	end
	
	--������ng�񳬹���������
	if nvalue > haveBangGong then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8829_03}")
		return
	end
	
	--�ﹱ��to� � ����Ȳ��ܳ���200.
	if nvalue > 200 then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8922_25}")
		return
	end
	
	--�ﹱ��to� � ��С��Ȳ��ܵ���10.
	if nvalue < 10 then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8922_26}")
		return
	end
	
	local totalvalue = floor( nvalue*0.1 ) + nvalue

	--����˰��֮����ng�����㹻�ﹱ
	if totalvalue > haveBangGong then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8922_27}")
		return
	end
	
	--� ��o c� �� �y���ng���пռ�
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) <= 0 then
		x805009_NotifyFailTips( sceneId, selfId, "#{SJQM_8819_20}")
		return
	end
	
	local ret = CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, -totalvalue)
	if ret == 1 then
		local BagIndex = TryRecieveItem( sceneId, selfId, 30900050, QUALITY_MUST_BE_CHANGE )
		local roleBangPaiID = GetHumanGuildID(sceneId, selfId)
		
		if BagIndex ~= -1 then
			SetBagItemParam(sceneId, selfId, BagIndex, 4, 2, roleBangPaiID) --����ID
			SetBagItemParam(sceneId, selfId, BagIndex, 8, 2, nvalue) --�ﹱ��ֵ
			LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
			x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8829_10}"..nvalue.."#{BGCH_8829_11}")
		else
			x805009_NotifyFailTips( sceneId, selfId, "L�i t�o v�t ph�m")
		end
	else
		x805009_NotifyFailTips( sceneId, selfId, "Kh�u tr� th�t b�i")
	end
	
end
