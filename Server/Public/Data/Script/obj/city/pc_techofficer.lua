--Th�nh ph� NPC
--�Ƽ���Ա

x805015_g_scriptId = 805015
x805015_g_BuildingID9 = 13

--��ӵ��to� � �¼�ID�б�
x805015_g_eventList = { 600012 }

-- �����¼� ID �б�,�����¼��������¼�
x805015_g_eventSetList = { 600012 }

--L�nh �̽�����C�n to� � �ﹱ �i�m��	--add by xindefeng
x805015_g_MingTieNeedBangGong = 50
--�̽�����ID	--add by xindefeng
x805015_g_TangJinMingTieID = 30505205
--ÿ�ο���L�nh �̽���������
x805015_g_TangJinMingTieCount = 1

--**********************************
--�¼��б�
--**********************************
function x805015_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0
	
	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if Humanguildid == cityguildid then
			AddText( sceneId, "    H�ng th� c�a M�n Th�nh, �u t�p trung v�o k� ngh� uy�n th�m, ch�ng ta l� huynh � c�ng bang, c� g� c�n ta gi�p, mau n�i �i." )
			for i, eventId in x805015_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			AddNumText( sceneId, x805015_g_scriptId, "Gi�i thi�u nhi�m v� khoa h�c k� thu�t", 11, 1 )
			--AddNumText( sceneId, x805015_g_scriptId, "S�a ch�a danh x�ng bang h�i", 6, 3 )	--��m�t ��Ҫ��ɵ�--del by xindefeng
			AddNumText( sceneId, x805015_g_scriptId, "Nghi�n c�u th߽ng ph�m m�i", 6, 4 )
			AddNumText( sceneId, x805015_g_scriptId, "��c t��ng th�nh th�", 6, 5 )
			AddNumText( sceneId, x805015_g_scriptId, "S�ng ch� bang huy cho bang h�i", 6, 6 )
			AddNumText( sceneId, x805015_g_scriptId, "Gi�i thi�u th� ph�ng", 11, 2 )
			AddNumText( sceneId, x805015_g_scriptId, "L�nh N�ng Kim danh thi�p", 6, 20 )	--add by xindefeng
			AddNumText( sceneId, x805015_g_scriptId, "V� l�nh bang h�i t� ��nh danh hi�u", 11, 22 )	--add by xindefeng
		
			--life ���C�i n�y ������to� � ��Ӧ�����ѡ��
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805015_g_scriptId,x805015_g_BuildingID9,888)
		else
			local PlayerGender = GetSex( sceneId, selfId )
			local rank

			if PlayerGender == 0 then
				rank = " c� n߽ng "
			elseif PlayerGender == 1 then
				rank = "Ti�n sinh"
			else
				rank = "Xin h�i"
			end

			AddText( sceneId, "    A!" .. rank .. "Kh�ng gi�ng nh� ng߶i trong b�n bang, ti�u sinh kh�ng ti�n n�i nhi�u c�i ��." )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x805015_OnDefaultEvent( sceneId, selfId, targetId )
	x805015_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- �ж�ĳc�i�¼���ng�����ͨ���� NPC ִ��
--**********************************
function x805015_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805015_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805015_g_eventSetList do
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
function x805015_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805015_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	--life ����C�i n�y ������to� � ��Ӧ�����ѡ��
	elseif eventId ~= x805015_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805015_g_scriptId, x805015_g_BuildingID9 )
		return
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Tec_Mission_Help}" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_ShuFang}" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	--elseif GetNumText() == 3 then--��m�t ��Ҫ��ɵ�--del by xindefeng
	--	BeginEvent(sceneId)
	--	AddText( sceneId, "Ch�c n�ng n�y s�p ���c th�c hi�n" )		
	--	EndEvent(sceneId)
	--	DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 4 then
		BeginEvent(sceneId)
		AddText( sceneId, "Ch�c n�ng n�y s�p ���c th�c hi�n" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 5 then
		BeginEvent(sceneId)
		AddText( sceneId, "Ch�c n�ng n�y s�p ���c th�c hi�n" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 6 then
		BeginEvent(sceneId)
		AddText( sceneId, "Ch�c n�ng n�y s�p ���c th�c hi�n" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 20 then																--L�nh �̽�����	--add by xindefeng
		-- ����ȷ��ҳ��			add by WTT
		BeginEvent(sceneId)
			-- L�nh �̽�����C�n ����50 �i�m��ṱ�׶�.��X�c nh�nҪL�nh ��?
			AddText( sceneId, "#{TJMT_090213_01}" )
			--X�c nh�n�m�t ���ť
			AddNumText(sceneId, x805015_g_scriptId, "��ng, ta x�c nh�n", 6, 201)				
			--Tr� v���m�t ҳ��ť
			AddNumText(sceneId, x805015_g_scriptId, "Kh�ng, t� b�", 6, 202)		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 201 then																-- ȷ��L�nh �̽�����		add by WTT
		x805015_GetTangJinMinTie(sceneId, selfId, targetId)

	elseif GetNumText() == 202 then																-- ����L�nh �̽�����		add by WTT
		BeginEvent( sceneId )
			x805015_OnDefaultEvent( sceneId, selfId, targetId )				-- Tr� v���m�t ҳ
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 22 then	--����L�nh ����Զ���ƺ�	--add by xindefeng
		BeginEvent(sceneId)
			AddText( sceneId, "#{TangJinMingTie_Help}")
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 888 then
		BeginEvent(sceneId)
		--life ���C�i n�y ������to� � ��Ӧ�����ѡ��
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805015_g_BuildingID9 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x805015_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805015_NotifyFailTips( sceneId, selfId, "Ng߽i hi�n kh�ng th� nh�n nhi�m v� n�y" )
		elseif ret == -2 then
			x805015_NotifyFailTips( sceneId, selfId, "Kh�ng th� ti�p nh�n nhi�u nhi�m v�" )
		end

		return
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x805015_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805015_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x805015_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x805015_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--�����¼�
--**********************************
function x805015_OnDie( sceneId, selfId, killerId )
end

function x805015_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--L�nh �̽�����	--add by xindefeng
--**********************************
function x805015_GetTangJinMinTie(sceneId, selfId, targetId)
	--���ﹱ
	local szMsg = nil
	local nBangGongPoint = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT)	--��ȡ�ﹱ����
  if nBangGongPoint < x805015_g_MingTieNeedBangGong then
  	szMsg = format("    �i�m c�ng hi�n kh�ng �� #G%d#W. Kh�ng th� �i ���c danh hi�u n�y.", x805015_g_MingTieNeedBangGong)
  	x805015_NotifyFailTips( sceneId, selfId, szMsg)
  	return
  end
  	
  --��ⱳ����ng���еط�
	if (LuaFnGetPropertyBagSpace( sceneId, selfId ) < x805015_g_TangJinMingTieCount) then
		--��Ŀ��ʾ"�ռ䲻��"
		x805015_NotifyFailTips(sceneId, selfId, "#{YRJ_BagFullTip}")
		return
	end	
	
	--����ͨ��
	
	--ɾ���ﹱ
  local ret = CityChangeAttr(sceneId, selfId, 6, -x805015_g_MingTieNeedBangGong)
	if not ret or ret ~= 1 then		
		x805015_NotifyFailTips(sceneId, selfId, "    Kh�ng th� kh�u tr� Bang c�ng!")	--��Ŀ��ʾ"�޷�ɾ���ﹱ"
		return
	end
	
	--����m�t c�i"�̽�����"
	BeginAddItem(sceneId)
		AddItem(sceneId, x805015_g_TangJinMingTieID, x805015_g_TangJinMingTieCount)
	EndAddItem(sceneId, selfId)
	AddItemListToHuman(sceneId, selfId)--����Ʒ�����
	
	--������,�½���:���պ�:)
	BeginEvent( sceneId )
		AddText( sceneId, "    ��y l� #GThi�p v�ng#W, c�m l�y v� s� d�ng t�t!" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
