--890005������Ƭ�һ�
x890005_g_ScriptId = 890005
x890005_g_itemId = 39901010
x890005_g_MonsterId = 39705


--**********************************
--�¼��б�
--**********************************
function x890005_UpdateEventList( sceneId, selfId,targetId )		 
	if sceneId ~= 458 then
		BeginEvent(sceneId)
			AddText(sceneId,"�˳��������ٻ����뵽���������������ˡ������͵�ר�õ�ͼ��")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)
		return 0;
	end

	local level = GetLevel( sceneId, selfId )
	if not level or level < 21 then
		BeginEvent( sceneId )
			AddText( sceneId, "�ȼ�����121���޷�ʹ��" )
		EndEvent( )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	  if LuaFnDelAvailableItem(sceneId, selfId, x890005_g_itemId, 1) == 0 then
		BeginEvent(sceneId)
			 AddText( sceneId, "������ӵ��1��boss��Ƭ�Ҳſ���Ϊ���ٻ�,������Ʒ�Ƿ�������" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end
	
		local posX, posZ;
		posX, posZ = LuaFnGetWorldPos(sceneId, selfId);
		nObjID = LuaFnCreateMonster(sceneId, x890005_g_MonsterId, posX, posZ, 1, 253, 0);
		if nObjID and nObjID ~= -1 then
		--	SetCharacterDieTime(sceneId, nObjID, 600000);
			SetCharacterTitle(sceneId, nObjID, "�׵۵���Ӱ");
		--	LuaFnSetMonsterExp(sceneId, nObjID, 0);
		--	LuaFnDisableMonsterDropBox(sceneId, nObjID);
		end
            local  nam= LuaFnGetName( sceneId, selfId )
		  local strText = format ("#b#cff00f0��ϲ��ҡ��#c00ff00"..nam.."#b#cff00f0���ɹ�ʹ��BOSS��Ƭ�ٻ����׵۵���Ӱ,����BOSS��Ƭ�ٻ�BOSS�����ɱ��������Լ�ʯͷ����,�ֹ����������ȸ߼�����!#Y", nam)						
		      BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		
		   return
end
--**********************************
--�¼��������
--**********************************
function x890005_OnDefaultEvent( sceneId, selfId,targetId )
	x890005_UpdateEventList( sceneId, selfId, targetId )
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x890005_OnEventRequest( sceneId, selfId, targetId, eventId )
end