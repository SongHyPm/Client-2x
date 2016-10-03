--L�c D߽ngNPC
--��ҽ
--��ͨ

--�ű���
x000064_g_scriptId = 000064

--��ӵ��to� � �¼�ID�б�
x000064_g_eventList={701603}	

-- C�n ��ŭ��to� � ����NPC
x000064_g_SpecialNPC = "Long B� Thi�n"
x000064_g_SpecialNPC2 = "��ݱ"
x000064_g_SpecialNPC3 = "���"

--Th�nh ph� ��û������޵й���to� � ����NPC
x000064_g_SpecialNPC_City = "L� Ho�ng Li�n"

--Tr� li�u�趨
--�����to� � ��c�pT�i 10c�p����to� � ʱ��,Tr� li�u���շѣ�
--���ڵ���10c�p������ȡto� � ����Ϊ: 
--Tr� li�u���ã�(����������ֵ����ǰ����ֵ)��a+(��������ֵ����ǰ��ֵ)��b
--a��bT�i ��ͬ��c�p��to� � ϵ���涨����: ��c�p��aϵ����bϵ��
x000064_g_rat	=	{
	{"0~9",0,0},	{"10~19",0.0079375,0.02480469},
	{"20~29",0.018375,0.05742188},	{"30~39",0.0313125,0.09785157},
	{"40~49",0.04675,0.14609376},		{"50~59",0.0646875,0.20214845},
	{"60~69",0.085125,0.26601564},	{"70~79",0.1080625,0.33769533},
	{"80~89",0.1335,0.41718752},	  {"90~99",0.162,0.50625},
	{"100~109",0.3,0.8},	          {"110~119",0.352,0.935}, 
	{"120~129",0.408,1.08},	      {"130~139",0.468,1.235}, 
	{"140~149",0.532,1.4}	
	}

--**********************************
--�¼��б�
--**********************************
function x000064_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0019}")
		AddNumText(sceneId,x000064_g_scriptId,"Tr� li�u",6,0)
	EndEvent(sceneId)
	for i, eventId in x000064_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000064_OnDefaultEvent( sceneId, selfId,targetId )
	x000064_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x000064_OnEventRequest( sceneId, selfId, targetId, eventId )

	--����ָ�Ѫ��������
	local	gld	= x000064_CalcMoney_hpmp( sceneId, selfId )
	local	key	= GetNumText()

	if key == 1000 then	--��Ը��Tr� li�u
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	if key == 1001 then	--ȷ��ҪTr� li�u
		--����ָ�Ѫ��������
		gld	= x000064_CalcMoney_hpmp( sceneId, selfId )
		
		--  �i�m�����Ӻͽ�Ǯ��Ŀ
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		
		--��������ng�����㹻to� � �ֽ�
		if (nMoneyJZ + nMoney >= gld) then
			--��Ǯ
			LuaFnCostMoneyWithPriority (sceneId, selfId, gld)
			--�ָ�Ѫ����
			x000064_Restore_hpmp( sceneId, selfId, targetId )			
			return
		
		--Ǯ����	
		else		
			BeginEvent( sceneId )
				AddText( sceneId, "  C�c h� kh�ng �� ng�n l��ng" )
				EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	
	--��Ѫ
	if key == 0 then
		if GetHp( sceneId, selfId ) == GetMaxHp( sceneId, selfId ) and
			 GetMp( sceneId, selfId ) == GetMaxMp( sceneId, selfId ) then
			BeginEvent( sceneId )
			AddText( sceneId, "  Ng߽i hi�n r�t kh�e m�nh, kh�ng c�n ch�a tr�!" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			--Hu� b�ָ���������to� � ���ежԿ���ɢפ��Ч��
			LuaFnDispelAllHostileImpacts( sceneId, selfId )
			return
		end
	
		if gld <= 0 then
			x000064_Restore_hpmp( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
				AddText( sceneId, "  C�c h� ph�i tr� #G#{_EXCHG"..gld.."}#W Ь h�i ph�c Huy�t v� kh�, c�c h� c� �ng � ch�a tr� kh�ng?" )
				AddNumText( sceneId, x000064_g_scriptId, "C�", -1, 1001 )
				AddNumText( sceneId, x000064_g_scriptId, "Kh�ng", -1, 1000 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	else
		for i, findId in x000064_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()��ngaddnumtext�����to� � ����
				return
			end
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x000064_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000064_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x000064_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x000064_g_eventList do
		if missionScriptId == findId then
			x000064_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x000064_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000064_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x000064_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000064_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000064_OnDie( sceneId, selfId, killerId )
end

--**********************************
--�ָ�Ѫ����
--**********************************
function x000064_Restore_hpmp( sceneId, selfId, targetId )
	RestoreHp( sceneId, selfId )
	RestoreMp( sceneId, selfId )
	
	local msg = ""
	-- �жϸ�npc��ng����ng������
	if LuaFnGetName( sceneId, targetId ) == x000064_g_SpecialNPC 
		or LuaFnGetName( sceneId, targetId ) == x000064_g_SpecialNPC2
		or LuaFnGetName( sceneId, targetId ) == x000064_g_SpecialNPC3 then
		RestoreRage( sceneId, selfId )
		msg = "Kh� huy�t v� n� c�a c�c h� �� ���c h�i ph�c ho�n to�n"
	else
		msg = "Huy�t v� kh� �� h�i ph�c"
	end
	--Hu� b�ָ���������to� � ���ежԿ���ɢפ��Ч��
	LuaFnDispelAllHostileImpacts( sceneId, selfId )
	
	BeginEvent( sceneId )
		AddText( sceneId, msg );
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
end

--**********************************
--����ָ�Ѫ��������
--**********************************
--�����to� � ��c�pT�i 10c�p����to� � ʱ��,Tr� li�u���շѣ�
--���ڵ���10c�p������ȡto� � ����Ϊ: 
--Tr� li�u���ã�(����������ֵ����ǰ����ֵ)��a+(��������ֵ����ǰ��ֵ)��b
function x000064_CalcMoney_hpmp( sceneId, selfId )
  
  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local	level	= GetLevel( sceneId, selfId )
	if level < 10 then	--�����ҵ�c�p<10,��C�n Ǯ
		return 0
	elseif level > PlayerMaxLevel then
		level	= PlayerMaxLevel
	end

	local	rat		= x000064_g_rat[ floor(level/10) + 1 ]
	local hp		= GetHp( sceneId, selfId )
	local maxhp	= GetMaxHp( sceneId, selfId )
	local mp		= GetMp( sceneId, selfId )
	local maxmp	= GetMaxMp( sceneId, selfId )
	local	gld		= floor( (maxhp-hp) * rat[2] + (maxmp-mp) * rat[3] )
	if gld < 1 then
		gld				= 100
	end
	return gld
end
