--����NPC
--��˷�
--��ͨ

x002966_g_ScriptId	= 002966

--������Ϣ(�������ƣ�SceneID��PosX��PosY������ID)
x002966_g_mpInfo		= {}
x002966_g_mpInfo[0]	= { "����", 16,  96, 152, MP_XINGSU }
x002966_g_mpInfo[1]	= { "��ң", 14,  67, 145, MP_XIAOYAO }
x002966_g_mpInfo[2]	= { "����",  9,  96, 127, MP_SHAOLIN }
x002966_g_mpInfo[3]	= { "��ɽ", 17,  95, 120, MP_TIANSHAN }
x002966_g_mpInfo[4]	= { "����", 13,  96, 120, MP_DALI }
x002966_g_mpInfo[5]	= { "����", 15,  89, 139, MP_EMEI }
x002966_g_mpInfo[6]	= { "�䵱", 12, 103, 140, MP_WUDANG }
x002966_g_mpInfo[7]	= { "����", 11,  98, 167, MP_MINGJIAO }
x002966_g_mpInfo[8]	= { "ؤ��", 10,  91, 116, MP_GAIBANG }

x002966_g_Yinpiao = 40002000

x002966_g_Impact_NotTransportList = { 5929, 5944 } -- ��ֹ���͵�Impact
x002966_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- ��ֹ���͵�Impact��ʾ��Ϣ

--**********************************
--�¼��������
--**********************************
function x002966_OnDefaultEvent( sceneId, selfId,targetId )
local	nam	= LuaFnGetName( sceneId, selfId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ����Ϊ�㿪��ʵ���ͼ���ǲ������ϴ��ͣ�")
		if nam=="������" or nam == "����baby#1" or nam == "����baby#1" or nam == "����baby#1" then
		AddText(sceneId,"  �𾴵�VIP�û���ã���ӭ��ʹ��VIP���ͷ������Ѿ�֪ͨ�ܲ��Ǳ����ýӴ������ˣ������ھ�Ҫ������")
		--AddNumText( sceneId, x002966_g_ScriptId, "���� - ����", 9, 1001 )
		--AddNumText( sceneId, x002966_g_ScriptId, "���� - ����", 9, 1002 )
		--AddNumText( sceneId, x002966_g_ScriptId, "���� - ���� - �����̻�", 9, 1006 )
              --AddNumText( sceneId, x002966_g_ScriptId, "���� - ¥��", 9, 1007 )
			AddNumText( sceneId, x002966_g_ScriptId, "���� - �´���", 9, 1102 )
			AddNumText( sceneId, x002966_g_ScriptId, "���� - ������", 9, 1103 )
			AddNumText( sceneId, x002966_g_ScriptId, "���� - ������", 9, 1104 )
			AddNumText( sceneId, x002966_g_ScriptId, "#YҰ�� - ����ս��", 9, 1116 )
		--AddNumText( sceneId, x002966_g_ScriptId, "���� - ����ս����Ϣ��", 9, 1106 )
			AddNumText( sceneId, x002966_g_ScriptId, "���� - ͨ�����ع�", 9, 1105 )
		AddNumText( sceneId, x002966_g_ScriptId, "���� - ͨ����һ��", 9, 1111 )
		AddNumText( sceneId, x002966_g_ScriptId, "���� - ͨ��������", 9, 1112 )
		AddNumText( sceneId, x002966_g_ScriptId, "���� - ͨ��������", 9, 1113 )
		AddNumText( sceneId, x002966_g_ScriptId, "���� - ͨ��������", 9, 1114 )
		AddNumText( sceneId, x002966_g_ScriptId, "���� - ������", 9, 1115 )
		AddNumText( sceneId, x002966_g_ScriptId, "���� - �ֺ�Ϫ��",9,1301 )
		AddNumText( sceneId, x002966_g_ScriptId, "���� - ��������", 9, 1302 )
		AddNumText( sceneId, x002966_g_ScriptId, "���� - Į����ԭ", 9, 1303 )
		AddNumText( sceneId, x002966_g_ScriptId, "���� - ��������", 9, 1304 )
		AddNumText( sceneId, x002966_g_ScriptId, "���� - ����ϻ�", 9, 1305 )
			--AddNumText( sceneId, x002966_g_ScriptId, "#Y���� - ���������", 9, 1235 )
			--AddNumText( sceneId, x002026_g_ScriptId, "���� - �ܾ���һ�ų���", 9, 1200 )
			--AddNumText( sceneId, x002966_g_ScriptId, "���� - Ľ��ɽׯ", 9, 1100 )
			--AddNumText( sceneId, x002966_g_ScriptId, "���� - ����ˮ��", 9, 1101 )
    --AddNumText( sceneId, x002966_g_ScriptId, "���� - ���ӹ���", 9, 1010 )
		end
    
		--AddNumText( sceneId, x002966_g_ScriptId, "����ȥ��������", 9, 1012 )
		--for i, mp in x002966_g_mpInfo do
			--AddNumText( sceneId, x002966_g_ScriptId, "���� - "..mp[1], 9, i )
		--end

	
		-- ����������ȥ�ػͺ���ɽ
		--AddNumText( sceneId, x002966_g_ScriptId, "����������ȥ�ػͺ���ɽ", 11, 2000 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002966_OnEventRequest( sceneId, selfId, targetId, eventId )
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
				x002966_MsgBox( sceneId, selfId, targetId, "  ������Ա�����������˻�������������վ����Ϊ���ṩ���ͷ���" )
				return
			end
		end
	end

	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x002966_MsgBox( sceneId, selfId, targetId, "  �������˻�������������վ����Ϊ���ṩ���ͷ���" )
		return
	end
	
	--���Impact״̬פ��Ч��
	for i, ImpactId in x002966_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x002966_MsgBox( sceneId, selfId, targetId, x002966_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end
	
	--˳������
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--��������
		if id < 0 or id >= 9 then
			x002966_MsgBox( sceneId, selfId, targetId, "  �㻹û�м����κ����ɣ�" )
		else
			mp	= x002966_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			end
		end
		return
	end 
	if arg == 1301 then		--�ֺ�Ϫ��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 348, 110, 35, 75 )
		return
	end
	if arg == 1302 then		--��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 350, 80, 80, 75 )
		return
	end
	if arg == 1303 then		--Į����ԭ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 349, 222, 213, 75 )
		return
	end
	if arg == 1304 then		--��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 351, 214, 44, 75 )
		return
	end
	if arg == 1305 then		--����ϻ�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 352, 135, 220, 75 )
		return
	end
	if arg == 1001 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 132, 183 )
		return
	end
	if arg == 1235 then		--���������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 346, 196,128, 10 )
		return
	end
	if arg == 1200 then		--�ܾ���һ�ų���
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 347, 61, 61, 75 )
		return
	end
	if arg == 1002 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 160, 164 )
		return
	end
	if arg == 1006 then		--�����̻�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 234, 132 )
		return
  end
	if arg == 1100 then		--Ľ��ɽׯ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 435, 68, 123, 75 )
		return
	end
	if arg == 1101 then		--����ˮ��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 436, 20, 46, 75 )
		return
	end
	if arg == 1102 then		--�´���
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 335, 374, 224, 75 )
		return
	end
	if arg == 1103 then		--������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 336, 230, 321, 75 )
		return
	end
	if arg == 1104 then		--������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 337, 276, 196, 75 )
		return
	end
	if arg == 1105 then		--ͨ�����ع�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 338, 258, 373, 75 )
		return
	end
  if arg == 1106 then		--����ս����Ϣ��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 345, 32, 11, 75 )
		return
	end
	if arg == 1111 then		--ͨ����һ��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 339, 254, 377, 75 )
		return
	end
	if arg == 1112 then		--ͨ��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 340, 255, 352, 75 )
		return
	end
	if arg == 1113 then		--ͨ��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 341, 255, 310, 75 )
		return
	end
	if arg == 1114 then		--ͨ��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 342, 255, 275, 75 )
		return
	end
	if arg == 1115 then		--������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 343, 156, 113, 75 )
		return
	end
	if arg == 1116 then		--����ս��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 344, 296,228, 10 )
		return
	end
  if arg == 1007 then		--¥��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 288, 136, 75 )
		return
	end
	for i, mp in x002966_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			return
		end
	end

	if GetNumText()== 1010 then		--���ӹ���
		-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x002966_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "���ӹ���Ϊ����ɱ����������ע�ⰲȫ����ȷ��Ҫ������");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	if arg == 1012 then		
		BeginEvent( sceneId )
			for i, mp in x002966_g_mpInfo do
				AddNumText( sceneId, x002966_g_ScriptId, "���� - "..mp[1], 9, i )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
		return
	end
	
	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
end
--  add by zchw
function x002966_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 200, 211, 20 );
	return
end

--**********************************
--��������ID��ȡ������Ϣ
--**********************************
function x002966_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x002966_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x002966_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
