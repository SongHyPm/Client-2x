--NPC H� Kh�i B��

x402297_g_ScriptId = 402297; --�ű���
x402297_g_name	="H� Kh�i";

--��ӵ��to� � �¼�ID�б�
x402297_g_eventId_yes = 0;
x402297_g_eventId_no = 1;

--**********************************
--�¼��������
--**********************************
function x402297_OnDefaultEvent( sceneId, selfId, targetId )
	x402297_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--�¼��б�
--**********************************
function x402297_UpdateEventList( sceneId, selfId, targetId )

	if CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 1 then
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_21}" );
			AddNumText( sceneId, x402297_g_ScriptId, "X�c nh�n", 9, x402297_g_eventId_yes);
			AddNumText( sceneId, x402297_g_ScriptId, "Hu� b�", 8, x402297_g_eventId_no);
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	else
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_20}" );
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	end
	
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x402297_OnEventRequest( sceneId, selfId, targetId, eventId )
	local selectEventId	= GetNumText();
	
	if selectEventId and CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 1 then
		if selectEventId == x402297_g_eventId_yes then
			--��ս��buff���ܴ���
			if CallScriptFunction(402047, "HaveTankBuff", sceneId, selfId) == 0 then
				CallScriptFunction(402047, "Exit", sceneId, selfId)
			else
				BeginEvent(sceneId);
					AddText( sceneId, "#{BHXZ_081103_77}" );
				EndEvent(sceneId);
				DispatchEventList(sceneId, selfId, targetId);
			end
		else
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x402297_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x402297_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end
