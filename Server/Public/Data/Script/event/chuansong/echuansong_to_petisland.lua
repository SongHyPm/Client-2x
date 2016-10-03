--�¼�
--���͵����޵�

--�ű���
x400918_g_ScriptId = 400918

--�����ı�����
x400918_g_MissionName="Ъn Huy�n V� ��o"
x400918_g_MissionInfo="Chuy�n �n Tr�n th� ��o"  --��������
x400918_g_MissionTarget="Chuy�n �n Tr�n th� ��o"		--M�c ti�u nhi�m v�
x400918_g_ContinueInfo="Chuy�n �n Tr�n th� ��o"		--δHo�n t�t nhi�m v�to� � npc�Ի�
x400918_g_MissionComplete="Chuy�n �n Tr�n th� ��o"					--Ho�n t�t nhi�m v�npc˵��to� � ��

--**********************************
--��ں���
--**********************************
function x400918_OnDefaultEvent( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�

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
					AddText( sceneId, "  Trong �i ng� c�a c�c h� c� ng߶i �ang l�m nhi�m v� v�n chuy�n, th߽ng nh�n ta kh�ng th� cung c�p d�ch v� cho c�c h� ���c." )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
		end
	end

	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin th� l�i! C�c h� �ang mang trong m�nh nhi�m v� v�n chuy�n, th߽ng nh�n ta kh�ng th� cung c�p d�ch v� cho c�c h�." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 39, 109, 25)

end

--**********************************
--�о��¼�
--**********************************
function x400918_OnEnumerate( sceneId, selfId, targetId )
	--��c�p�ﵽ10c�p����ʾ����ѡ��
	if GetLevel( sceneId, selfId ) >= 10 then
		AddNumText(sceneId,x400918_g_ScriptId,x400918_g_MissionName, 9, -1)
	else
		return
	end
end
