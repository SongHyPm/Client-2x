--����NPC
--�޷��
--��ͨ

x002026_g_ScriptId	= 002026

--������Ϣ(�������ƣ�SceneID��PosX��PosY������ID)
x002026_g_mpInfo		= {}
x002026_g_mpInfo[0]	= { "����", 16,  96, 152, MP_XINGSU }
x002026_g_mpInfo[1]	= { "��ң", 14,  67, 145, MP_XIAOYAO }
x002026_g_mpInfo[2]	= { "����",  9,  96, 127, MP_SHAOLIN }
x002026_g_mpInfo[3]	= { "��ɽ", 17,  95, 120, MP_TIANSHAN }
x002026_g_mpInfo[4]	= { "����", 13,  96, 120, MP_DALI }
x002026_g_mpInfo[5]	= { "����", 15,  89, 139, MP_EMEI }
x002026_g_mpInfo[6]	= { "�䵱", 12, 103, 140, MP_WUDANG }
x002026_g_mpInfo[7]	= { "����", 11,  98, 167, MP_MINGJIAO }
x002026_g_mpInfo[8]	= { "ؤ��", 10,  91, 116, MP_GAIBANG }

x002026_g_Yinpiao = 40002000

x002026_g_Impact_NotTransportList = { 5929, 5944 } -- ��ֹ���͵�Impact
x002026_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- ��ֹ���͵�Impact��ʾ��Ϣ

--**********************************
--�¼��������
--**********************************
function x002026_OnDefaultEvent( sceneId, selfId, targetId )
	CallScriptFunction( (300053), "ChuanSong", sceneId, selfId, 400, 1 )
end

--**********************************
--���ͼ�飬����͵ȼ���Ҵ��ߵȼ���ҵ�����2��3������
--**********************************
function x002026_EnterConditionCheck(sceneId, selfId)
	local teamSize = GetNearTeamCount(sceneId, selfId); 
	if teamSize > 1 then
		for i=0, teamSize-1 do
	  	local objId = GetNearTeamMember(sceneId, selfId, i);
	  	if GetLevel(sceneId, objId) > 9 and IsTeamFollow(sceneId, objId) == 1 then
	  		local name = GetName(sceneId, objId);
	  		local msg = format("  ��Ա%s�ȼ����ߣ����ܽ��룡", name);
	  		return 0, msg;
	  	end  	
	  end
  end
	return 1, "ok";
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002026_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction( (300053), "ChuanSong", sceneId, selfId, GetNumText(),1)
end
--  add by zchw
function x002026_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
--**********************************
--��������ID��ȡ������Ϣ
--**********************************
function x002026_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x002026_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x002026_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
