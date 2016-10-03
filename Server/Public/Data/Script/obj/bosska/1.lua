--890001������Ƭ�һ�
x890001_g_ScriptId = 890001
x890001_g_itemId = 39901006
x890001_g_MonsterId = 39701


--**********************************
--�¼��б�
--**********************************
function x890001_UpdateEventList( sceneId, selfId,targetId )		 
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
			AddText( sceneId, "�ȼ�����21���޷�ʹ��" )
		EndEvent( )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	  if LuaFnDelAvailableItem(sceneId, selfId, x890001_g_itemId, 1) == 0 then
		BeginEvent(sceneId)
			 AddText( sceneId, "������ӵ��1��boss��Ƭ�Ҳſ���Ϊ���ٻ�,������Ʒ�Ƿ�������" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end
	
		local posX, posZ;
		posX, posZ = LuaFnGetWorldPos(sceneId, selfId);
		nObjID = LuaFnCreateMonster(sceneId, x890001_g_MonsterId, posX, posZ, 1, 253, 0);
		if nObjID and nObjID ~= -1 then
		--	SetCharacterDieTime(sceneId, nObjID, 600000);
			SetCharacterTitle(sceneId, nObjID, "��ħ");
		--	LuaFnSetMonsterExp(sceneId, nObjID, 0);
		--	LuaFnDisableMonsterDropBox(sceneId, nObjID);
		end
            local  nam= LuaFnGetName( sceneId, selfId )
		  local strText = format ("#b#cff00f0��ϲ��ҡ��#c00ff00"..nam.."#b#cff00f0���ɹ�ʹ��BOSS��Ƭ�ٻ�����ħ,����BOSS��Ƭ�ٻ�BOSS�����ɱ��������Լ�ʯͷ����,�ֹ����������ȸ߼�����!#Y", nam)						
		      BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		
		   return
end
--**********************************
--�¼��������
--**********************************
function x890001_OnDefaultEvent( sceneId, selfId,targetId )
	x890001_UpdateEventList( sceneId, selfId, targetId )
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x890001_OnEventRequest( sceneId, selfId, targetId, eventId )
end