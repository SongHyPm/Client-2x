--Ʈ��� B�t b�nh ��o nh�nAI

--F	�����ס����Լ���m�t c�i�ռ���....�ٸ���Ҽ�c�i��Th�c H��ص��ű�to� � buff....�ص�ʱ��BOSS������Χ�˼��˺�buff������....
--G ��Tinh�㡿���Լ���m�t c�i��buffto� � ����....
--H ���̻������Լ���m�t c�i�ռ���....�ٸ���Ҽ�c�i��Th�c H��ص��ű�to� � buff....�ص�ʱ����....
--I	�����ѡ�Tr�c B�t Ph�m��ʱ���Լ���m�t c�i��buffto� � ����....


--ȫ�̶����������ƶ�����to� � buff....
--ÿ��30 gi�y�����������ʹ��FH....
--ÿ��45 gi�y���Լ�ʹ��G....
--����������Cu�c chi�n ʱ������������FHto� � buff....
--����ʱѰ��B�t b�nh ��o nh�n....������C�n ʹ�ÿ񱩼���....
--����ʱ����B�t b�nh ��o nh�n�Ѿ�����....�򴴽���m�t c�iBOSS....


--�ű���
x402281_g_ScriptId	= 402281

--�����߼��ű���....
x402281_g_FuBenScriptId = 402276

--����Buff....
x402281_Buff_MianYi1	= 10472	--����m�t Щ����Ч��....
x402281_Buff_MianYi2	= 10471	--������ͨ����....

--����....
x402281_SkillID_F		= 1037
x402281_BuffID_F1		= 19806	--�ص��򵥰���翷�to� � �ű�....
x402281_BuffID_F2		= 19807	--�򵥰���翷�ʹ���˺�������to� � �汾....
x402281_SkillID_G		= 1038
x402281_SkillID_H		= 1037
x402281_BuffID_H		= 19899	--�ص��򵥰���翷�to� � �ű�....
x402281_SkillID_I		= 1036
x402281_BuffID_I1		= 10253
x402281_BuffID_I2		= 10254

x402281_SkillCD_FH	=	30000
x402281_SkillCD_G		=	45000


x402281_MyName			= "B�t b�nh ��o nh�n"	--�Լ�to� � T�n....
x402281_BrotherName = "Tr�c B�t Ph�m"		-- huynh �to� � T�n....


--AI Index....
x402281_IDX_KuangBaoMode	= 1	--��ģʽ....0δ�� 1C�n ����� 2�Ѿ������
x402281_IDX_CD_SkillFH		= 2	--FH����to� � CD....
x402281_IDX_CD_SkillG			= 3	--G����to� � CD....
x402281_IDX_CD_Talk				= 4	--FH���ܺ���to� � CD....

x402281_IDX_CombatFlag 		= 1	--��ng����Cu�c chi�n ״̬to� � ��־....


--**********************************
--��ʼ��....
--**********************************
function x402281_OnInit(sceneId, selfId)
	--����AI....
	x402281_ResetMyAI( sceneId, selfId )
end


--**********************************
--����....
--**********************************
function x402281_OnHeartBeat(sceneId, selfId, nTick)

	--�����ng����ng����....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--�����ng��T�i Cu�c chi�n ״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402281_IDX_CombatFlag ) then
		return
	end

	--FH��������....
	if 1 == x402281_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G��������....
	if 1 == x402281_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--I��������....
	if 1 == x402281_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--����Cu�c chi�n ....
--**********************************
function x402281_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402281_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402281_Buff_MianYi2, 0 )

	--����AI....
	x402281_ResetMyAI( sceneId, selfId )

	--���ý���Cu�c chi�n ״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402281_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪Cu�c chi�n ....
--**********************************
function x402281_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x402281_ResetMyAI( sceneId, selfId )

	--��������������to� � ��....Ѱ�� huynh 𮲢����ɾ��....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x402281_BrotherName == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--ɱ������....
--**********************************
function x402281_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x402281_OnDie( sceneId, selfId, killerId )

	--����AI....
	x402281_ResetMyAI( sceneId, selfId )

	local bFind = 0

	--��������������to� � ��....Ѱ�� huynh �....��������C�n ʹ�ÿ񱩼���....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x402281_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			bFind = 1
			MonsterAI_SetIntParamByIndex( sceneId, MonsterId, x402281_IDX_KuangBaoMode, 1 )
		end
	end

	--���û�ҵ� huynh ���� �i�m���ʣ�Լ�m�t c�i��....
	if 0 == bFind then
		--������ľԪ....
		local MstId = CallScriptFunction( x402281_g_FuBenScriptId, "CreateBOSS", sceneId, "DuanMuYuan_BOSS", -1, -1 )
		LuaFnNpcChat(sceneId, MstId, 0, "#{PMF_20080521_18}")
		--�����Ѿ�Khi�u chi�n��˫��....
		CallScriptFunction( x402281_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ShuangZi", 2 )
	end

end


--**********************************
--����AI....
--**********************************
function x402281_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402281_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402281_IDX_CD_SkillFH, x402281_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402281_IDX_CD_SkillG, x402281_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402281_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402281_IDX_CombatFlag, 0 )

	--������������FHto� � buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x402281_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x402281_BuffID_H )
		end
	end

end


--**********************************
--FH��������....
--**********************************
function x402281_TickSkillFH( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402281_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402281_IDX_CD_SkillFH, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402281_IDX_CD_SkillFH, x402281_SkillCD_FH-(nTick-cd) )

		--���ʹ��FH....
		if random(100) < 50 then
			return x402281_UseSkillF( sceneId, selfId )
		else
			return x402281_UseSkillH( sceneId, selfId )
		end

	end

end


--**********************************
--G��������....
--**********************************
function x402281_TickSkillG( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402281_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402281_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402281_IDX_CD_SkillG, x402281_SkillCD_G-(nTick-cd) )
		return x402281_UseSkillG( sceneId, selfId )
	end

end


--**********************************
--I��������....
--**********************************
function x402281_TickSkillI( sceneId, selfId, nTick )

	-- ��t ���c��ǰ��mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402281_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--�����C�n �񱩻����Ѿ�������Tr� v�....
		return 0

	elseif CurMode == 1 then

		--���C�n ����ʹ�ÿ񱩼���....
		local ret =  x402281_UseSkillI( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402281_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--ʹ��F����....
--**********************************
function x402281_UseSkillF( sceneId, selfId )

	--��������Чto� � ���to� � �б�....
	local PlayerList = {}

	--����Чto� � �˼����б�....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--�����ѡm�t c�i���....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--���Լ�ʹ�ÿռ���....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402281_SkillID_F, selfId, x, z, 0, 1 )

	--����Ҽӽ�Th�c H�ص��ű�to� � buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x402281_BuffID_F1, 0 )

	return 1

end


--**********************************
--ʹ��G����....
--**********************************
function x402281_UseSkillG( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402281_SkillID_G, selfId, x, z, 0, 1 )
	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_01}" )
	return 1

end


--**********************************
--ʹ��H����....
--**********************************
function x402281_UseSkillH( sceneId, selfId )

	--��������Чto� � ���to� � �б�....
	local PlayerList = {}

	--����Чto� � �˼����б�....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--�����ѡm�t c�i���....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--���Լ�ʹ�ÿռ���....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402281_SkillID_H, selfId, x, z, 0, 1 )

	--����Ҽӽ�Th�c H�ص��ű�to� � buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x402281_BuffID_H, 0 )

	return 1

end


--**********************************
--ʹ��I����....
--**********************************
function x402281_UseSkillI( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402281_BuffID_I1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402281_BuffID_I2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402281_SkillID_I, selfId, x, z, 0, 1 )

	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_02}" )

	return 1

end


--**********************************
--���׺��̻�to� � buff����to� � ʱ�m�t ص����ӿ�....
--**********************************
function x402281_OnImpactFadeOut( sceneId, selfId, impactId )

	--Ѱ��BOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x402281_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--û�ҵ���Tr� v�....
	if bossId == -1 then
		return
	end

	--�����ng�̻�to� � buff����BOSS����....
	if impactId == x402281_BuffID_H then
		MonsterTalk( sceneId, -1, "", "#{PMF_20080530_03}"..GetName( sceneId, selfId ).."#{PMF_20080530_04}" )
		return
	end

	--�����ng����to� � buff....����BOSS������to� � ��Ҽ�m�t c�i�˺�to� � buff������....
	if impactId == x402281_BuffID_F1 then

		MonsterTalk( sceneId, -1, "", "#{PMF_20080530_03}"..GetName( sceneId, selfId ).."#{PMF_20080530_05}" )

		local x = 0
		local z = 0
		local xx = 0
		local zz = 0
		x,z = GetWorldPos( sceneId,selfId )
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 and PlayerId ~= selfId then
				xx,zz = GetWorldPos(sceneId,PlayerId)
				if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 8*8 then
					LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, x402281_BuffID_F2, 0 )
				end
			end
		end

		return

	end

end
