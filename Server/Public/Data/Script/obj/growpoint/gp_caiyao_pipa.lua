--���� �i�m
--��Ӧ�����: ��ҩ	�ɿ���to� � ���8
--����
--�ű���710504
--����1	0.6		2	0.3		3	0.1		�������to� � ������ng0.2		����1	0.6		2	0.3		3	0.1
--��c�p1

--ÿ�δ򿪱ض� ��t ���cto� � ��Ʒ
x710504_g_MainItemId = 20101005
--���� �i�m��to� � ��Ʒ
x710504_g_SubItemId = 20304006
--C�n ����Id
x710504_g_AbilityId = 8
--C�n ���ܵ�c�p
x710504_g_AbilityLevel = 2


--���ɺ�����ʼ************************************************************************
--ÿc�iItemBox�����10c�i��Ʒ
function 		x710504_OnCreate(sceneId,growPointType,x,y)
	--����ItemBoxͬʱ����m�t c�i��Ʒ
	targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x710504_g_MainItemId)	--ÿc�i���� �i�m������ �i�m��m�t c�i��Ʒ,����ֱ�ӷ���itembox��m�t c�i
	-- ��t ���c1~100to� � �����,������������Ʒ�͸���Ʒ
	--����Ʒ1~60����,61~90��1c�i,91~100��2c�i
	--����Ʒ1~12��1c�i,13~18��2c�i,19~20��3c�i
	local ItemCount = random(1,100)
	if ItemCount >= 61 and ItemCount <= 90 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710504_g_MainItemId)
	elseif ItemCount >= 91 and ItemCount <= 100 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,2,x710504_g_MainItemId,x710504_g_MainItemId)
	end
	--�����Ҫ��Ʒ
	if ItemCount >= 1 and ItemCount <= 12 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710504_g_SubItemId)
	elseif ItemCount >= 13 and ItemCount <= 18 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,2,x710504_g_SubItemId,x710504_g_SubItemId)
	elseif ItemCount >= 19 and ItemCount <= 20 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,3,x710504_g_SubItemId,x710504_g_SubItemId,x710504_g_SubItemId)
	end
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x710504_OnOpen(sceneId,selfId,targetId)
--Tr� v�����
-- 0 ��ʾ�򿪳ɹ�
	ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	res = x710504_OpenCheck(sceneId,selfId,ABilityID,AbilityLevel)
	return res
	end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	 x710504_OnRecycle(sceneId,selfId,targetId)
	-- ����������
		ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
	CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x710504_g_AbilityLevel)
		--Tr� v�1,���� �i�m����
		return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710504_OnProcOver( sceneId, selfId, targetId )
	local ABilityID = GetItemBoxRequireAbilityID( sceneId, targetId )
	CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, ABilityID, x710504_g_AbilityLevel )
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710504_OpenCheck(sceneId,selfId,AbilityId,AbilityLevel)
	--�������ܵ�c�p
	if AbilityLevel<x710504_g_AbilityLevel then
		return OR_NO_LEVEL
	end
	--���Tinh��
	if GetHumanEnergy(sceneId,selfId)< (floor(x710504_g_AbilityLevel * 1.5 +2) * 2) then
		return OR_NOT_ENOUGH_ENERGY
	end
	return OR_OK
end
