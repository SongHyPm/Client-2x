--���� �i�m
--ө���
--�ű���712527
--ˮ����ʯ1	0.6		2	0.3		3	0.1		�ʯ1%
--��20%���� �i�m������Ʒ20103019,20103031,20103043,20103055 ��to� � m�t ��,����1	0.6		2	0.3		3	0.1
--��c�p1

--ÿ�δ򿪱ض� ��t ���cto� � ��Ʒ
x712527_g_MainItemId = 30501104
--���� �i�m��to� � ��Ʒ
x712527_g_SubItemId = 30501105
--����Ʒ
x712527_g_Byproduct = {20103019,20103031,20103043,20103055}
--C�n ����Id
x712527_g_AbilityId = 7
--C�n ���ܵ�c�p
x712527_g_AbilityLevel = 0


--���ɺ�����ʼ************************************************************************
--ÿc�iItemBox�����10c�i��Ʒ
function 		x712527_OnCreate(sceneId,growPointType,x,y)
	--����ItemBoxͬʱ����m�t c�i��Ʒ
	targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x712527_g_MainItemId)	--ÿc�i���� �i�m������ �i�m��m�t c�i��Ʒ,����ֱ�ӷ���itembox��m�t c�i
	-- ��t ���c1~100to� � �����,������������Ʒ�͸���Ʒ�Լ���Ҫ��Ʒ(��ʯ)
	--����Ʒ1~60����,61~90��1c�i,91~100��2c�i
	--����Ʒ1~12��1c�i,13~18��2c�i,19~20��3c�i
	--��Ҫ��Ʒ(��ʯ)1��1c�i
	local ItemCount = random(1,4);
	for n = 1, ItemCount do
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x712527_g_MainItemId)
	end
	
	--�����Ҫ��Ʒ
	if random(1,9) == 1 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x712527_g_SubItemId)
	end
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x712527_OnOpen(sceneId,selfId,targetId)
--Tr� v�����
-- 0 ��ʾ�򿪳ɹ�
	ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	res = x712527_OpenCheck(sceneId,selfId,ABilityID,AbilityLevel)
	return res
	end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	 x712527_OnRecycle(sceneId,selfId,targetId)
	-- ����������
		ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
	CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x712527_g_AbilityLevel)
		--Tr� v�1,���� �i�m����
		return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x712527_OnProcOver( sceneId, selfId, targetId )
	--local ABilityID = GetItemBoxRequireAbilityID( sceneId, targetId )
	--CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, ABilityID, x712527_g_AbilityLevel )
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x712527_OpenCheck(sceneId,selfId,AbilityId,AbilityLevel)
	--�������ܵ�c�p
	if AbilityLevel<x712527_g_AbilityLevel then
		return OR_NO_LEVEL
	end
	--���Tinh��
	--if GetHumanEnergy(sceneId,selfId)< (floor(x712527_g_AbilityLevel * 1.5 +2) * 2) then
	--	return OR_NOT_ENOUGH_ENERGY
	--end
	return OR_OK
end

--m�t �δ�����c�i����to� � ��ɺ�����ʼ****************************************************
function x712527_OnTickCreateFinish( sceneId, growPointType, tickCount )
	--if(strlen(x712508_g_TickCreate_Msg) > 0) then
	--	--2006-8-22 14:37 �ȴ�����to� � server�Ի�ƽ̨
	--	print( sceneId .. " Tr߶ng c�nh s� "..x712508_g_TickCreate_Msg)
	--end
end
--m�t �δ�����c�i����to� � ��ɺ�������****************************************************
