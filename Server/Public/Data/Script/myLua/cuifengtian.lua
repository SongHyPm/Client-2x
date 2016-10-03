--����NPC
--��վ�ϰ�
--��ͨ

x000180_g_ScriptId	= 000180

--������Ϣ(��������,SceneID,PosX,PosY,����ID)
x000180_g_mpInfo		= {}
x000180_g_mpInfo[0]	= { "Tinh T�c", 16,  96, 152, MP_XINGSU }
x000180_g_mpInfo[1]	= { "Ti�u Dao", 14,  67, 145, MP_XIAOYAO }
x000180_g_mpInfo[2]	= { "Thi�u L�m",  9,  96, 127, MP_SHAOLIN }
x000180_g_mpInfo[3]	= { "Thi�n S�n", 17,  95, 120, MP_TIANSHAN }
x000180_g_mpInfo[4]	= { "Thi�n Long", 13,  96, 120, MP_DALI }
x000180_g_mpInfo[5]	= { "Nga My", 15,  89, 139, MP_EMEI }
x000180_g_mpInfo[6]	= { "V� �ang", 12, 103, 140, MP_WUDANG }
x000180_g_mpInfo[7]	= { "Minh Gi�o", 11,  98, 167, MP_MINGJIAO }
x000180_g_mpInfo[8]	= { "C�i Bang", 10,  91, 116, MP_GAIBANG }

x000180_g_Yinpiao = 40002000
--**********************************
--�¼��������
--**********************************
function x000180_OnDefaultEvent( sceneId, selfId, targetId )

	-- ������������ng����ng�С���Ʊ��C�i n�y ����,�оͲ���ʹ������to� � ����
	if GetItemCount(sceneId, selfId, x000180_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin th� l�i tr�n ng߶i c�c h� �ang gi� ng�n phi�u ta kh�ng th� gi�p ���c." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	mp
	local	i		= 0
	BeginEvent( sceneId )
		if GetLevel( sceneId, selfId ) >= 10 then
			AddText( sceneId, "#{XIYU_20071228_01}" )
			--AddNumText( sceneId, x000180_g_ScriptId, "#gFF83FATr� v�����", 9, 1000 )
			AddNumText( sceneId, x000180_g_ScriptId, "#gFF7F24������", 9, 1001 )
			AddNumText( sceneId, x000180_g_ScriptId, "#gFF7F24ͨ��������", 9, 1002 )
			AddNumText( sceneId, x000180_g_ScriptId, "#cFF0000ͨ��������", 9, 1003 )
			AddNumText( sceneId, x000180_g_ScriptId, "#gFF7F24ͨ��������", 9, 1006 )
			AddNumText( sceneId, x000180_g_ScriptId, "#gFF7F24ͨ����m�t ��", 9, 1007 )
			AddNumText( sceneId, x000180_g_ScriptId, "#gFF34B3ͨ�����ع�", 9, 1008 )
			AddNumText( sceneId, x000180_g_ScriptId, "#gFF34B3��������", 9, 1012 )
			AddNumText( sceneId, x000180_g_ScriptId, "#gFAFAFA��ʥ����", 9, 1013 )
			AddNumText( sceneId, x000180_g_ScriptId, "���� - Ľ��ɽׯ", 9, 1014 )
			AddNumText( sceneId, x000180_g_ScriptId, "���� - ����ˮ��", 9, 1015 )
			AddNumText( sceneId, x000180_g_ScriptId, "�ֺ�Ϫ��", 9, 1016 )
			AddNumText( sceneId, x000180_g_ScriptId, "Į����ԭ", 9, 1017 )
			AddNumText( sceneId, x000180_g_ScriptId, "#G��������", 9, 1018 )
			AddNumText( sceneId, x000180_g_ScriptId, "#gFAFAFA����ϻ�", 9, 1019 )
			--AddNumText( sceneId, x000180_g_ScriptId, "#gFAFAFAҰ�� - Th�c H� C� Tr�n(BOSSר��)", 9, 1009 )
			AddNumText( sceneId, x000180_g_ScriptId, "#gFAFAFAҰ�� - ���ظ���(BOSSר��)", 9, 1010 )
			AddNumText( sceneId, x000180_g_ScriptId, "#gFFB6C1����ȥ��������", 9, 1011 )
			for i, mp in x000180_g_mpInfo do
				--AddNumText( sceneId, x000180_g_ScriptId, "���� - "..mp[1], 9, i )
			end
		else
			AddText( sceneId, "  Ng߽i c�n �ȼ�����10������,����ȥ��to� � Th�nh ph� ." )
			AddNumText( sceneId, x000180_g_ScriptId, "Th�nh ph�  - ��i L�",  9, 1003 )
			AddNumText( sceneId, x000180_g_ScriptId, "Th�nh ph�  - ��i L�2", 9, 1004 )
			AddNumText( sceneId, x000180_g_ScriptId, "Th�nh ph�  - ��i L�3", 9, 1005 )
		end

		-- ����������ȥ��n Ho�ng��Tung S�n
		--AddNumText( sceneId, x000180_g_ScriptId, "����������ȥ��n Ho�ng��Tung S�n", 11, 2000 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x000180_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1011 then
	local	mp
	local	i		= 0
		BeginEvent( sceneId )
			for i, mp in x000180_g_mpInfo do
				AddNumText( sceneId, x000180_g_ScriptId, "���� - "..mp[1], 9, i )
			end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
		--�������
	if GetTeamId(sceneId,selfId)>=0 and
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				x000180_MsgBox( sceneId, selfId, targetId, "  ������Ա������������\����T�i ��,������վ����Ϊ���ṩ���ͷ���." )
				return
			end
		end
	end

	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x000180_MsgBox( sceneId, selfId, targetId, "  ��������\����T�i ��,������վ����Ϊ���ṩ���ͷ���." )
		return
	end

	--˳������
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--Tr� v�����
		if id < 0 or id >= 9 then
			x000180_MsgBox( sceneId, selfId, targetId, "  �㻹û�м����κ�����!" )
		else
			mp	= x000180_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			end
		end
		return
	end
	if arg == 1001 then		--������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 559, 158, 115, 10 )
		return
	end
	if arg == 1002 then		--ͨ��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 548, 256,272, 10 )
		return
	end
	if arg == 1003 then		--ͨ��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 547, 258,314, 10 )
		return
	end
	if arg == 1006 then		--ͨ��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 546, 255, 367, 10 )
		return
	end
	if arg == 1007 then		--ͨ����m�t ��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 545, 255, 380, 10 )
		return
	end
	if arg == 1008 then		--ͨ�����ع�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 544, 255, 384, 10 )
		return
	end
	if arg == 1009 then		--Th�c H� C� Tr�n
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 422, 200, 211, 10 )
		return
	end
	if arg == 1010 then		--���ظ���
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 421, 93, 36, 10 )
		return
	end
	if arg == 1012 then		--��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 553, 48, 48, 10 )
		return
	end
	if arg == 1013 then		--��ʥ����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 543, 125, 139, 10 )
		return
	end
	if arg == 1014 then		--Ľ��ɽׯ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 535, 30, 134, 10 )
		return
	end
	if arg == 1015 then		--����ˮ��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 527, 16, 42, 10 )
		return
	end
	if arg == 1016 then		--�ֺ�Ϫ��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 552, 220, 196, 10 )
		return
	end
	if arg == 1017 then		--Į����ԭ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 556, 211, 207, 10 )
		return
	end
	if arg == 1018 then		--��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 557, 43, 45, 10 )
		return
	end
	if arg == 1019 then		--����ϻ�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 558, 41, 212, 10 )
		return
	end
	if arg == 1003 then		--��i L�1
		--�����Ҿ�T�i ��i L�1�򲻴���
		if sceneId == 2 then
			x000180_MsgBox( sceneId, selfId, targetId, "  ���Ѿ�T�i ��i L���." )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 138 )
		end
		return
	end
	if arg == 1004 then		--��i L�2
		--�����Ҿ�T�i ��i L�2�򲻴���
		if sceneId == 71 then
			x000180_MsgBox( sceneId, selfId, targetId, "  ���Ѿ�T�i ��i L�2��." )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 71, 241, 138 )
		end
		return
	end
	if arg == 1005 then		--��i L�3
		--�����Ҿ�T�i ��i L�3�򲻴���
		if sceneId == 72 then
			x000180_MsgBox( sceneId, selfId, targetId, "  ���Ѿ�T�i ��i L�3��." )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 72, 241, 138 )
		end
		return
	end
	for i, mp in x000180_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			return
		end
	end

	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		return
	end

end

--**********************************
--��������ID��ȡ������Ϣ
--**********************************
function x000180_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x000180_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x000180_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end