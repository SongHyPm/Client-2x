--��ͼ���� �i�mNPC
--����
--��������

x002938_g_ScriptId	= 002938
x002938_g_Yinpiao = 40002000
--**********************************
--�¼��������
--**********************************
function x002938_OnDefaultEvent( sceneId, selfId, targetId )

	-- ������������ng����ng�С���Ʊ��C�i n�y ����,�оͲ���ʹ������to� � ����
	if GetItemCount(sceneId, selfId, x002938_g_Yinpiao)>=1  then
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
			--AddText( sceneId, "#W�����֪�Ӻδ�����ʮ��c�i����,�Գ�ʮ��ɷ��,T�i ����i L��ں����޼�,�������,��ʮ�������ո�ǿ,���Ű���,���ո���ng�в��ٽ�����С֮��Ͷ������,ʹ����������,���������ź�Ѹ�ٸ���,�κ��ƹ�����,��������ng��?" )
			AddNumText( sceneId, x002938_g_ScriptId, "��ʱ�뿪������̨", 9, 101 )
			--AddNumText( sceneId, x002938_g_ScriptId, "T� Ch�u", 9, 200 )
			--AddNumText( sceneId, x002938_g_ScriptId, "��i L�", 9, 300 )
			--AddNumText( sceneId, x002938_g_ScriptId, "L�u Lan", 9, 400 )
			--AddNumText( sceneId, x002938_g_ScriptId, "Nam H�i", 9, 500 )
			--AddNumText( sceneId, x002938_g_ScriptId, "Nam H�i", 9, 600 )
			--AddNumText( sceneId, x002938_g_ScriptId, "Tr߶ng B�ch S�n", 9, 700 )
						for i, mp in x002026_g_mpInfo do
			end
		else
			AddText( sceneId, "  Ng߽i c�n �ȼ�����10������,����ȥ��to� � Th�nh ph� ." )
			AddNumText( sceneId, x002938_g_ScriptId, "Th�nh ph�  - ��i L�",  9, 1003 )
			AddNumText( sceneId, x002938_g_ScriptId, "Th�nh ph�  - ��i L�2", 9, 1004 )
			AddNumText( sceneId, x002938_g_ScriptId, "Th�nh ph�  - ��i L�3", 9, 1005 )
		end


	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x002938_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 100 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����X�c nh�n������?" )
			AddNumText( sceneId, x002938_g_scriptId, "X�c nh�n", -1, 101)
			AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 101 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 130, 78, 10 )
	end

	if GetNumText() == 200 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����X�c nh�n������?" )
			AddNumText( sceneId, x002938_g_scriptId, "X�c nh�n", -1, 201)
			AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 201 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �Բ�����to� � Kh�ng �� ng�n l��ng���޷�����" )
		AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 235, 156, 10 )
	end

	if GetNumText() == 300 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����X�c nh�n������?" )
			AddNumText( sceneId, x002938_g_scriptId, "X�c nh�n", -1, 301)
			AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 301 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �Բ�����to� � Kh�ng �� ng�n l��ng���޷�����" )
		AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 246, 106, 10 )
	end

	if GetNumText() == 400 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����X�c nh�n������?" )
			AddNumText( sceneId, x002938_g_scriptId, "X�c nh�n", -1, 401)
			AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 401 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �Բ�����to� � Kh�ng �� ng�n l��ng���޷�����" )
		AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 184, 294, 90, 10 )
	end

	if GetNumText() == 500 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����X�c nh�n������?" )
			AddNumText( sceneId, x002938_g_scriptId, "X�c nh�n", -1, 501)
			AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 501 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �Բ�����to� � Kh�ng �� ng�n l��ng���޷�����" )
		AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 34, 206, 266, 10 )
	end

	if GetNumText() == 600 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����X�c nh�n������?" )
			AddNumText( sceneId, x002938_g_scriptId, "X�c nh�n", -1, 601)
			AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 601 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �Բ�����to� � Kh�ng �� ng�n l��ng���޷�����" )
		AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 28, 186, 43, 10 )
	end

	if GetNumText() == 700 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����X�c nh�n������?" )
			AddNumText( sceneId, x002938_g_scriptId, "X�c nh�n", -1, 701)
			AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 701 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �Բ�����to� � Kh�ng �� ng�n l��ng���޷�����" )
		AddNumText( sceneId, x002938_g_scriptId, "H�y b�", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 22, 158, 113, 10 )
	end

	if GetNumText() == 4   then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
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
				x002938_MsgBox( sceneId, selfId, targetId, "  ������Ա������������\����T�i ��,������վ����Ϊ���ṩ���ͷ���." )
				return
			end
		end
	end

	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x002938_MsgBox( sceneId, selfId, targetId, "  ��������\����T�i ��,������վ����Ϊ���ṩ���ͷ���." )
		return
	end

	--˳������
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--Tr� v�����
		if id < 0 or id >= 9 then
			x002938_MsgBox( sceneId, selfId, targetId, "  �㻹û�м����κ�����!" )
		else
			mp	= x002938_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			end
		end
		return
	end
	if arg == 1001 then		--L�c D߽ng
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 132, 183, 10 )
		return
	end
	if arg == 1002 then		--T� Ch�u
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 114,162, 10 )
		return
	end
	if arg == 1006 then		--L�c D߽ng�̻�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 234, 132, 10 )
		return
	end
	if arg == 1003 then		--��i L�1
		--�����Ҿ�T�i ��i L�1�򲻴���
		if sceneId == 2 then
			x002938_MsgBox( sceneId, selfId, targetId, "  ���Ѿ�T�i ��i L���." )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 138 )
		end
		return
	end
	if arg == 1004 then		--��i L�2
		--�����Ҿ�T�i ��i L�2�򲻴���
		if sceneId == 71 then
			x002938_MsgBox( sceneId, selfId, targetId, "  ���Ѿ�T�i ��i L�2��." )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 71, 241, 138 )
		end
		return
	end
	if arg == 1005 then		--��i L�3
		--�����Ҿ�T�i ��i L�3�򲻴���
		if sceneId == 72 then
			x002938_MsgBox( sceneId, selfId, targetId, "  ���Ѿ�T�i ��i L�3��." )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 72, 241, 138 )
		end
		return
	end
	for i, mp in x002938_g_mpInfo do
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
function x002938_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x002938_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x002938_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
