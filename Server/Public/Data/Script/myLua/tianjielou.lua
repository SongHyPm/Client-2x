--����NPC
--��վ�ϰ�
--��ͨ

x002924_g_ScriptId	= 002924
x002924_g_Yinpiao = 40002000
--**********************************
--�¼��������
--**********************************
function x002924_OnDefaultEvent( sceneId, selfId, targetId )

	-- ������������ng����ng�С���Ʊ��C�i n�y ����,�оͲ���ʹ������to� � ����
	if GetItemCount(sceneId, selfId, x002924_g_Yinpiao)>=1  then
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
			AddText( sceneId, "#W�����ն�,�������¥�ա������¥�����ض�������֮¥,�Ƽ�����m�t ��to� � m�t Ⱥ���ˡ���Ϊ̽����ʵǱ��¥��,ȴ�������²�����,���Ҷ����ڶ�����....." )
			--AddNumText( sceneId, x002924_g_ScriptId, "#gFF83FATr� v�����", 9, 1000 )
			AddNumText( sceneId, x002924_g_ScriptId, "#gFF7F24ǰ�����¥", 9, 1001 )
			--AddNumText( sceneId, x002924_g_ScriptId, "#gFF7F24Th�nh ph�  - T� Ch�u", 9, 1002 )
			--AddNumText( sceneId, x002924_g_ScriptId, "#cFF0000Ұ�� - ����ɽ(120��)", 9, 1003 )
			--AddNumText( sceneId, x002924_g_ScriptId, "#gFF7F24Th�nh ph�  - L�c D߽ng - �����̻�", 9, 1006 )
			--AddNumText( sceneId, x002924_g_ScriptId, "#gFF7F24Th�nh ph�  - T� Ch�u - ������", 9, 1007 )
			--AddNumText( sceneId, x002924_g_ScriptId, "#gFF34B3Th�nh ph�  - L�u Lan(Ѱ���������)", 9, 1008 )
			--AddNumText( sceneId, x002924_g_ScriptId, "#gFF34B3Th�nh ph�  - L�u Lan(���������)", 9, 1012 )
			--AddNumText( sceneId, x002924_g_ScriptId, "#gFAFAFAҰ�� - ����ɽ(����ר��)", 9, 1013 )
			--AddNumText( sceneId, x002924_g_ScriptId, "Th�nh ph�  - ��Դ", 9, 1014 )
			--AddNumText( sceneId, x002924_g_ScriptId, "Th�nh ph�  - ��Դɽ��", 9, 1015 )
			--AddNumText( sceneId, x002924_g_ScriptId, "Th�nh ph�  - �����Ĺ", 9, 1016 )
			--AddNumText( sceneId, x002924_g_ScriptId, "Th�nh ph�  - ���ƽԭ", 9, 1017 )
			--AddNumText( sceneId, x002924_g_ScriptId, "#GTh�nh ph�  - ��¹ս��(������)", 9, 1018 )
			--AddNumText( sceneId, x002924_g_ScriptId, "#gFAFAFAҰ�� - ��˹���(����ר��)", 9, 1019 )
			--AddNumText( sceneId, x002924_g_ScriptId, "#gFAFAFAҰ�� - Th�c H� C� Tr�n(BOSSר��)", 9, 1009 )
			--AddNumText( sceneId, x002924_g_ScriptId, "#gFAFAFAҰ�� - ���ظ���(BOSSר��)", 9, 1010 )
			--AddNumText( sceneId, x002924_g_ScriptId, "#gFFB6C1����ȥ��������", 9, 1011 )
			for i, mp in x002924_g_mpInfo do
				--AddNumText( sceneId, x002924_g_ScriptId, "���� - "..mp[1], 9, i )
			end
		else
			AddText( sceneId, "  Ng߽i c�n �ȼ�����10������,����ȥ��to� � Th�nh ph� ." )
			AddNumText( sceneId, x002924_g_ScriptId, "Th�nh ph�  - ��i L�",  9, 1003 )
			AddNumText( sceneId, x002924_g_ScriptId, "Th�nh ph�  - ��i L�2", 9, 1004 )
			AddNumText( sceneId, x002924_g_ScriptId, "Th�nh ph�  - ��i L�3", 9, 1005 )
		end

		-- ����������ȥ��n Ho�ng��Tung S�n
		--AddNumText( sceneId, x002924_g_ScriptId, "����������ȥ��n Ho�ng��Tung S�n", 11, 2000 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x002924_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1011 then
	local	mp
	local	i		= 0
		BeginEvent( sceneId )
			for i, mp in x002924_g_mpInfo do
				AddNumText( sceneId, x002924_g_ScriptId, "���� - "..mp[1], 9, i )
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
				x002924_MsgBox( sceneId, selfId, targetId, "  ������Ա������������\����T�i ��,������վ����Ϊ���ṩ���ͷ���." )
				return
			end
		end
	end

	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x002924_MsgBox( sceneId, selfId, targetId, "  ��������\����T�i ��,������վ����Ϊ���ṩ���ͷ���." )
		return
	end

	--˳������
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--Tr� v�����
		if id < 0 or id >= 9 then
			x002924_MsgBox( sceneId, selfId, targetId, "  �㻹û�м����κ�����!" )
		else
			mp	= x002924_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			end
		end
		return
	end
	if arg == 1001 then		--�������¥
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 533, 82, 78, 10 )
		return
	end
	if arg == 1002 then		--T� Ch�u
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 114,162, 10 )
		return
	end
	if arg == 1003 then		--����ɽ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 110,18, 10 )
		return
	end
	if arg == 1006 then		--L�c D߽ng�̻�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 234, 132, 10 )
		return
	end
	if arg == 1007 then		--������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 235, 132, 10 )
		return
	end
	if arg == 1008 then		--L�u Lan�ų�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 184, 162, 75, 10 )
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
	if arg == 1012 then		--L�u Lan�������www.tlbb20 0.com �����ṩ ��Ѷ��벻Ҫ�ϵ�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 184, 290, 66, 10 )
		return
	end
	if arg == 1013 then		--����ɽ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 110, 18, 10 )
		return
	end
	if arg == 1014 then		--��Դ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 531, 272, 45, 10 )
		return
	end
	if arg == 1015 then		--��Դɽ��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 532, 45, 225, 10 )
		return
	end
	if arg == 1016 then		--�����Ĺ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 440, 93, 36, 10 )
		return
	end
	if arg == 1017 then		--���ƽԭ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 441, 93, 36, 10 )
		return
	end
	if arg == 1018 then		--��¹ս��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 402, 93, 36, 10 )
		return
	end
	if arg == 1019 then		--��˹ų�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 180, 53, 36, 10 )
		return
	end
	if arg == 1003 then		--��i L�1
		--�����Ҿ�T�i ��i L�1�򲻴���
		if sceneId == 2 then
			x002924_MsgBox( sceneId, selfId, targetId, "  ���Ѿ�T�i ��i L���." )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 138 )
		end
		return
	end
	if arg == 1004 then		--��i L�2
		--�����Ҿ�T�i ��i L�2�򲻴���
		if sceneId == 71 then
			x002924_MsgBox( sceneId, selfId, targetId, "  ���Ѿ�T�i ��i L�2��." )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 71, 241, 138 )
		end
		return
	end
	if arg == 1005 then		--��i L�3
		--�����Ҿ�T�i ��i L�3�򲻴���
		if sceneId == 72 then
			x002924_MsgBox( sceneId, selfId, targetId, "  ���Ѿ�T�i ��i L�3��." )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 72, 241, 138 )
		end
		return
	end
	for i, mp in x002924_g_mpInfo do
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
function x002924_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x002924_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x002924_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end