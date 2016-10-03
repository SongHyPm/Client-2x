--created by WTT 2009.3.2

--�¼�: ���͵�Th�nh Th� S�n

--�ű���
x400963_g_ScriptId = 400963

--�����ı�����
x400963_g_MissionName="#{QSSS_090302_1}"		-- ȥTh�nh Th� S�n
x400963_g_MissionInfo="���͵�Th�nh Th� S�n."  		-- ��������
x400963_g_MissionTarget="���͵�Th�nh Th� S�n."		-- M�c ti�u nhi�m v�
x400963_g_ContinueInfo="���͵�Th�nh Th� S�n."			-- δHo�n t�t nhi�m v�to� � npc�Ի�
x400963_g_MissionComplete="���͵�Th�nh Th� S�n."	-- Ho�n t�t nhi�m v�npc˵��to� � ��

--**********************************
--��ں���
--**********************************
function x400963_OnDefaultEvent( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	
	-- ������������ng����ng�С���Ʊ��C�i n�y ����,�оͲ���ʹ������to� � ����
	if GetItemCount(sceneId, selfId, 40002000) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin th� l�i tr�n ng߶i c�c h� �ang gi� ng�n phi�u ta kh�ng th� gi�p ���c." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
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
				BeginEvent( sceneId )
					AddText( sceneId, "  ������Ա�����������˻���T�i ��,������վ����Ϊ���ṩ���ͷ���." )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
		end
	end
  
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Ng߽i �ang � trong tr�ng th�i T�o v�n, kh�ng th� ti�n v� c�nh tr߾c." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	-- ���ϼ���ͨ��	
	BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x400963_g_ScriptId);			
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShengShouShan");
			UICommand_AddString(sceneId, "#{QSSS_090302_2}");		-- ��Th�nh Th� S�nΪ����ɱ������,��ע�ⰲȫ.��ȷ��Ҫ������?��
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
end

--**********************************
--�о��¼�
--**********************************
function x400963_OnEnumerate( sceneId, selfId, targetId )
	
	AddNumText(sceneId,x400963_g_ScriptId,x400963_g_MissionName, 9, 1)	
	
end

--**********************************
--������Th�nh Th� S�n
--**********************************
function x400963_GotoShengShouShan( sceneId, selfId, targetId )

	CallScriptFunction((400900), "TransferFuncFromNpc", sceneId, selfId, 158, 233, 225, 21 );
	return
	
end
