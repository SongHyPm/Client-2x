--���� �i�m
--����
--�ű���715006
--����100%
--��c�p1

--ÿ�δ򿪱ض� ��t ���cto� � ��Ʒ
x715006_g_MainItemId = 40003003

--���ɺ�����ʼ************************************************************************
--ÿc�iItemBox�����10c�i��Ʒ
function 		x715006_OnCreate(sceneId,growPointType,x,y)
	--����ItemBoxͬʱ����m�t c�i��Ʒ
	targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x715006_g_MainItemId)	--ÿc�i���� �i�m������ �i�m��m�t c�i��Ʒ,����ֱ�ӷ���itembox��m�t c�i
	-- ��t ���c1~3to� � �����,�����ng1��C�n ����,�������1����AddItemToBox������Ʒ
	--ItemCount = random(1,3)
	--if ItemCount ~= 1 then
	--	for i=1, (ItemCount - 1) do
			AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x715006_g_MainItemId)
	--	end
	--end
	--�����Ҫ��Ʒ
	--if random(1,100) == 1 then
	--	AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,g_SubItemId)
	--end	
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x715006_OnOpen(sceneId,selfId,targetId)
--Tr� v�����
-- 0 ��ʾ�򿪳ɹ�
	--ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	--AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	
	--if AbilityLevel<g_AbilityLevel then
	--if	IsHaveMission
	--	return OR_NO_LEVEL
	--else
		return OR_OK
	--	end
end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	 x715006_OnRecycle(sceneId,selfId,targetId)
	  --ȡ �i�m��ǰ������
		--ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
		--AbilityExp	=	GetAbilityExp(sceneId, selfId, ABilityID)
		--�ж�����T�i to� � ��c�p��ng��Ӧ������������
		--AbilityLevel	=	QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
		--if AbilityLevel - g_AbilityLevel <= 5 then
		--	ExpPlus = 1
		--elseif AbilityLevel - g_AbilityLevel <=10 then
		--	ExpPlus = 1/((AbilityLevel - g_AbilityLevel)+1)
		--else
		--	ExpPlus = 0
		--end
		--�жϵ�ǰ�����ȼ���Ҫ����to� � �����Ⱥ���ng�񳬹�����c�p����������
		--old
		--if (AbilityExp + ExpPlus) >= LEVELUP_ABILITY_PENGREN[AbilityLevel].AbilityExpLimitTop then
		--new
		--local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_PENGREN, AbilityLevel + 1);
		--if ret and ret == 1 and (AbilityExp + ExpPlus) >= currentLevelAbilityExpTop then
		--	AbilityExp = currentLevelAbilityExpTop;
		--else
		--	AbilityExp = AbilityExp + ExpPlus
		--end
		--����������
		--SetAbilityExp(sceneId, selfId, ABilityID, AbilityExp)
		--֪ͨ���������������
		--AbilityExp	=	GetAbilityExp(sceneId, selfId, ABilityID)
		--Msg2Player(sceneId,selfId,"�������Linh���"..AbilityExp,MSG2PLAYER_PARA)
		
		--Tr� v�1,���� �i�m����
		return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x715006_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x715006_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
