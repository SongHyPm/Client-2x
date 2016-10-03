--�ʻ�to� � ����
--����С����ʱ����
--�ű���
x000174_g_scriptId = 000174

x000174_g_ItemId = 30309813

x000174_g_PlantingFlowersScriptId = 000175

x000174_g_minValue = 6000
x000174_g_maxValue = 9000

x000174_g_SceneMapDefine = {	
										{sceneId=18,	sceneName="Nh�n Nam",	CorpseMonsterId=3512},
										{sceneId=19,	sceneName="Nh�n B�c",	CorpseMonsterId=3513},
										{sceneId=20,	sceneName="Th�o Nguy�n",	CorpseMonsterId=3515},
										{sceneId=21,	sceneName="Li�u T�y",	CorpseMonsterId=3516},
										{sceneId=22,	sceneName="Tr߶ng B�ch S�n",	CorpseMonsterId=3518},
										{sceneId=23,	sceneName="Ho�ng Long Ph�",	CorpseMonsterId=3519},
										{sceneId=24,	sceneName="Nh� H�i",	CorpseMonsterId=3511},
										{sceneId=25,	sceneName="Th߽ng S�n",	CorpseMonsterId=3513},
										{sceneId=26,	sceneName="Th�ch L�m",	CorpseMonsterId=3514},
										{sceneId=27,	sceneName="Ng�c Kh�",	CorpseMonsterId=3516},
										{sceneId=28,	sceneName="Nam Chi�u",	CorpseMonsterId=3517},
										{sceneId=29,	sceneName="Mi�u C߽ng",	CorpseMonsterId=3518},
										{sceneId=30,	sceneName="T�y H�",	CorpseMonsterId=3511},
										{sceneId=31,	sceneName="Long Tuy�n",	CorpseMonsterId=3512},
										{sceneId=32,	sceneName="V� Di",	CorpseMonsterId=3514},
										{sceneId=33,	sceneName="Mai L�nh",	CorpseMonsterId=3515},
										{sceneId=34,	sceneName="Nam H�i",	CorpseMonsterId=3517},
										{sceneId=35,	sceneName="Qu�nh Ch�u",	CorpseMonsterId=3518},
									}
								 
x000174_g_GhoulMonsterTable = {
												{level=11, id=42130},{level=21, id=42131},
												{level=31, id=42132},{level=41, id=42133},
												{level=51, id=42134},{level=61, id=42135},
												{level=71, id=42136},{level=81, id=42137},
												{level=91, id=42138},{level=101, id=42139},
												{level=111, id=42140},{level=121, id=42141},
												{level=131, id=42142},{level=141, id=42143},
												{level=151, id=42144},{level=161, id=42145},
												{level=171, id=42146},{level=181, id=42147},
												{level=191, id=42148},{level=201, id=42149},
											}									 
									 
--**********************************
-- �i�m��itemto� � ������Ϣ
--**********************************
function x000174_GetItemParam(sceneId, selfId, BagPos)							
	--local BagPos = GetBagPosByItemSn(sceneId, selfId, x000174_g_ItemId)
	--PrintNum(BagPos)
	local targetsceneId = GetBagItemParam(sceneId, selfId, BagPos, 1, 1)
	--PrintNum(targetsceneId)
	local targetX = GetBagItemParam(sceneId, selfId, BagPos, 3, 1)
	--PrintNum(targetX)
  local targetZ = GetBagItemParam(sceneId, selfId, BagPos, 5, 1)
  --PrintNum(targetZ)
  local r = GetBagItemParam(sceneId, selfId, BagPos, 7, 1)
  return targetsceneId, targetX, targetZ, r
end

--**********************************
--��ֲ�ɹ� --OK
--**********************************
function x000174_DiscoverGhoulMonster(sceneId, selfId)
	local humanLevel = LuaFnGetLevel(sceneId, selfId)
	local dataId = x000174_g_GhoulMonsterTable[1].id
	local ct = getn(x000174_g_GhoulMonsterTable)
	for i=1, ct do
		if humanLevel >= x000174_g_GhoulMonsterTable[i].level then
			dataId = x000174_g_GhoulMonsterTable[i].id
		end
	end

	local aifile = random(10)
	local x, z = GetWorldPos(sceneId, selfId)
	local MonsterId = LuaFnCreateMonster(sceneId, dataId, x, z-2, 0, aifile, -1)
	SetLevel(sceneId, MonsterId, humanLevel+(random(2)-random(2)) )
	SetCharacterDieTime(sceneId, MonsterId, 60*60000)

	local strTitle, strName = CallScriptFunction(x000174_g_PlantingFlowersScriptId, "CreateTitleAndName_ForCangBaoTu", sceneId, selfId)
	SetCharacterTitle(sceneId, MonsterId, strTitle)
	SetCharacterName(sceneId, MonsterId, strName)			
		
	BeginEvent(sceneId)		
		AddText(sceneId, "Hoa t߽i m�m non gieo tr�ng th�nh c�ng");

	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
       local _, sceneName = CallScriptFunction(x000174_g_PlantingFlowersScriptId, "GetScenePosInfo", sceneId,sceneId)
		
	local playerName = GetName(sceneId,selfId)
	local strText = format("#cFF0000Hoa ti�n t� tinh linh #Wc�m trong tay #c00ffff[Ba T� M�n C�i]#W, �ang � #G%s#W �c � d�o d�t th߷ng th�c, kh�ng ng� b� #cff6633#{_INFOUSR%s}#W theo trong m�ng �p b�ng t�nh!", 
				sceneName,playerName )

	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
	
end

--**********************************
--���ݳ���Id �i�m����Ӧto� � ID
--**********************************
function x000174_GetDataIDbySceneID(sceneId)
		for i, SceneMapInfo in x000174_g_SceneMapDefine do
			if SceneMapInfo.sceneId == sceneId then
				return SceneMapInfo.CorpseMonsterId
			end
		end
		return x000174_g_DefaultCorpseDataId
end

--**********************************
--Ĭ���¼�
--**********************************
function x000174_OnDefaultEvent( sceneId, selfId, BagPos)
	
	-- /////////////////////////////////////////////////////////////////
	-- ��ȡ����Ʒ������,�����ngĬ��ֵ0��� �i�m���ng��m�t ��ʹ��,������������
	-- ����Ѿ���������ʲô������
	local targetSceneId, targetX, targetZ, r = x000174_GetItemParam(sceneId, selfId, BagPos)
	if targetSceneId==nil or targetSceneId<=0
		or targetX==nil or targetX<=0
		or targetZ==nil or targetZ<=0
		or r==nil or r<=0 then
		--PrintStr("the first time .... nil nil nil")
		--������������
		CallScriptFunction(x000174_g_PlantingFlowersScriptId, "ProduceItemParamData", sceneId, selfId, BagPos)
		--���»�ȡ��Ʒ����
		targetSceneId, targetX, targetZ, r = x000174_GetItemParam(sceneId, selfId, BagPos)
	end
	-- ��ЩBT ��������m�t �μ��
	if targetSceneId==nil or targetSceneId<=0
		or targetX==nil or targetX<=0
		or targetZ==nil or targetZ<=0
		or r==nil or r<=0 then
		--PrintStr("the second time .... nil nil nil")
		--������������
		CallScriptFunction(x000174_g_PlantingFlowersScriptId, "ProduceItemParamData", sceneId, selfId, BagPos)
		--���»�ȡ��Ʒ����
		targetSceneId, targetX, targetZ, r = x000174_GetItemParam(sceneId, selfId, BagPos)
	end
	--�����T�i ָ��to� � ����, ָ��to� � ����͵����Ի�����ʾ���ȥ�Ķ��Ķ��Ķ�
	local sceneName = CallScriptFunction(x000174_g_PlantingFlowersScriptId, "GetSceneName", sceneId, selfId, targetSceneId)
	-- /////////////////////////////////////////////////////////////////
	
	--local sceneName = GetSceneName(targetSceneId)
	--PrintStr(sceneName)
	local strText = format("Ng߽i c�n ph�i �em h�t gi�ng t�i #R%s#c66ccff[%d,%d]", sceneName, targetX, targetZ)
	
	--ȡ �i�m��ҵ�ǰ����
	local PlayerX = GetHumanWorldX(sceneId, selfId)
	local PlayerZ = GetHumanWorldZ(sceneId, selfId)
	--���������Ŀ�� �i�mto� � ����
	local Distance = floor(sqrt((targetX-PlayerX)*(targetX-PlayerX)+(targetZ-PlayerZ)*(targetZ-PlayerZ)))
	--print(PlayerX,PlayerZ)

	if targetSceneId ~= sceneId or Distance > r then
		--print(sceneId,selfId,targetId)
		BeginEvent(sceneId)
			AddText(sceneId, strText);
			AddText(sceneId, "#GHoa t��ng trong: #cffcc88h�t gi�ng hoa t߽i l� r�t sinh l�c th�n k�, c�n hi�u y�u qu� nh�n t�i c� th� ch�n ch�nh l�nh h�i, l�m ng߽i ��t ���c k�t qu� t�t �p #c66ccff[Ba T� M�n C�i]#cffcc88 v� sau, ng߽i ph�i ngh� nh� v�y.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)

		--test code begin
		--EraseItem( sceneId, selfId, BagPos )
		--test cod end
		return
	end	
	
	--ɾ������Ʒ
	if LuaFnIsItemAvailable(sceneId, selfId, BagPos) <= 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "V�t ph�m hi�n t�i kh�ng th� s� d�ng ho�c �� b� kho�.")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)	
		return	
	end	
	
	--PrintStr("begin random...")
	--���T�i ʹ�÷�Χ, ��������������¼�,���ۼ��ʶ��ٶ���ng��ֲ�ɹ�to� � 
	local ret = random(100)
	if ret < 30 then --��ֲ�ɹ�
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	elseif ret < 40 then --��ֲ�ɹ�
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	elseif ret < 80 then --��ֲ�ɹ�
		x000174_DiscoverGhoulMonster(sceneId, selfId)
		if retval == 0 then
		  --��¼ͳ����Ϣ
	    LuaFnAuditWaBao(sceneId, selfId)
			return
		end
	elseif ret < 85 then --��ֲ�ɹ�
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	elseif ret < 95 then --��ֲ�ɹ�
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	else --��ֲ�ɹ�
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	end
	
  EraseItem( sceneId, selfId, BagPos )
	
	--��¼ͳ����Ϣ
	LuaFnAuditWaBao(sceneId, selfId)
		
end

function x000174_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
