--Ʈ��� Tang Th� C�ngAI

--A �����ݡ�BOSSto� � HPÿ��ʧ20%�m�t ���ʧ20 gi�y....ͬʱ����С������Ϊ1122ֻ..����or����Cu�c chi�n ��ʧ....
--B ��ţë���롿������״̬ʱÿ��20m�t �δ�Χ����....����״̬��CD������ֻ��ng��ʹ��....���ݽ���ʱ��CD....
--C �����������������ʱ��� ��t ���c2c�ibuff....ͬʱ����ϴ�to� � 2c�ibuff....
--D �����Cu�c chi�n 5 ph�t����Լ������н�ʬ��m�t ������buff....����ʹ��AB(C)....

--ȫ�̶����������ƶ�����to� � buff....
--����Cu�c chi�n ������ʱɾ����ʬ....


--�ű���
x402278_g_ScriptId	= 402278

--�����߼��ű���....
x402278_g_FuBenScriptId = 402276


--�����ض�����buff....
x402278_Buff_MianYi1	= 10472	--����m�t Щ����Ч��....
x402278_Buff_MianYi2	= 10471	--������ͨ����....

--A����....
x402278_SkillA_TuDun				= 1028
x402278_SkillA_ChildName		= "B�ch l�n c߽ng thi"
x402278_SkillA_ChildBuff		= 10246
x402278_SkillA_ChildTime		= 5000		--���ݶ೤ʱ���ʼˢС��....
x402278_SkillA_Time					= 20000		--���ݳ���to� � ʱ��....


--Bţë����....
x402278_SkillB_NiuMaoDuZhen = 1110	--�򵥰���翷�ʹ���˺�������to� � �汾....
--��ȴʱ��....
x402278_SkillB_CD						= 20000


--C�������＼��to� � buff�б�....
x402278_SkillC_ChutuBuff1 = { 10237, 10238 }
x402278_SkillC_ChutuBuff2 = { 10239, 10240, 10241, 10242 }


--D���....
x402278_SkillD_Buff1	= 10234
x402278_SkillD_Buff2	= 10235
--��ʼ�����״̬to� � ʱ��....
x402278_EnterKuangBaoTime	= 5*60*1000


--AI Index....
x402278_IDX_HPStep							= 1	--Ѫ��c�p��....
x402278_IDX_SkillB_CD						= 2	--B����to� � CDʱ��....
x402278_IDX_KuangBaoTimer				= 3	--��to� � ��ʱ��....
x402278_IDX_TuDunTimer					= 4	--����to� � ��ʱ��....���ڼ����ʱ���ݽ���....
x402278_IDX_NeedCreateChildNum	= 5	--C�n ����to� � С��to� � ����....

x402278_IDX_CombatFlag 			= 1	--��ng����Cu�c chi�n ״̬to� � ��־....
x402278_IDX_IsTudunMode			= 2	--��ng��������ģʽto� � ��־....
x402278_IDX_IsKuangBaoMode	= 3	--��ng���ڿ�ģʽto� � ��־....


--**********************************
--��ʼ��....
--**********************************
function x402278_OnInit(sceneId, selfId)
	--����AI....
	x402278_ResetMyAI( sceneId, selfId )

end


--**********************************
--����....
--**********************************
function x402278_OnHeartBeat(sceneId, selfId, nTick)

	--�����ng����ng����....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--�����ng��T�i Cu�c chi�n ״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402278_IDX_CombatFlag ) then
		return
	end

	--��״̬��C�n ���߼�....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402278_IDX_IsKuangBaoMode ) then
		return
	end

	--ִ�п��߼�....
	if 1 == x402278_DoSkillD_KuangBao( sceneId, selfId, nTick ) then
		return
	end

	--ִ�������߼�....
	if 1 == x402278_SkillLogicA_TunDun( sceneId, selfId, nTick ) then
		return
	end

	--ִ��ţë�����߼�....
	if 1 == x402278_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--����Cu�c chi�n ....
--**********************************
function x402278_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402278_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402278_Buff_MianYi2, 0 )

	--����AI....
	x402278_ResetMyAI( sceneId, selfId )

	--���ý���Cu�c chi�n ״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402278_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪Cu�c chi�n ....
--**********************************
function x402278_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x402278_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

	--�����Ի�NPC....
	local MstId = CallScriptFunction( x402278_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--ɱ������....
--**********************************
function x402278_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x402278_OnDie( sceneId, selfId, killerId )

	--����AI....
	x402278_ResetMyAI( sceneId, selfId )

	--�����Ѿ�Khi�u chi�n��Tang Th� C�ng....
	CallScriptFunction( x402278_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "SangTuGong", 2 )

	--�����û��Khi�u chi�n��� L�o ��i�����Khi�u chi�n� L�o ��i....
	if 2 ~= CallScriptFunction( x402278_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "WuLaoDa" )	then
		CallScriptFunction( x402278_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "WuLaoDa", 1 )
	end
	-- zchw ȫ�򹫸�
	local	playerName	= GetName( sceneId, killerId )
	
	--ɱ������to� � ��ng�����m�t �ȡ������to� � T�n....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--������������m�t �ȡ�ӳ�to� � T�n....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		str = format("#{_INFOUSR%s}#{XPM_8724_3}", playerName);             --Tang Th� C�ng
		AddGlobalCountNews( sceneId, str )
	end
end


--**********************************
--����AI....
--**********************************
function x402278_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_SkillB_CD, x402278_SkillB_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_KuangBaoTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_TuDunTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_NeedCreateChildNum, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402278_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402278_IDX_IsTudunMode, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402278_IDX_IsKuangBaoMode, 0 )

	--���buff....
	for i, buffId in x402278_SkillC_ChutuBuff1 do
		LuaFnCancelSpecificImpact( sceneId, selfId, buffId )
	end

	for i, buffId in x402278_SkillC_ChutuBuff2 do
		LuaFnCancelSpecificImpact( sceneId, selfId, buffId )
	end

	LuaFnCancelSpecificImpact( sceneId, selfId, x402278_SkillD_Buff1 )
	LuaFnCancelSpecificImpact( sceneId, selfId, x402278_SkillD_Buff2 )

	--���С��....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId) == x402278_SkillA_ChildName then
			LuaFnDeleteMonster(sceneId, MonsterId)
		end
	end

end


--**********************************
--�񱩼���....
--**********************************
function x402278_DoSkillD_KuangBao( sceneId, selfId )

	--�ӿ�buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402278_SkillD_Buff1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402278_SkillD_Buff2, 0 )

	--������С�ּӿ�....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId) == x402278_SkillA_ChildName then
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x402278_SkillD_Buff1, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x402278_SkillD_Buff2, 0 )
		end
	end

end


--**********************************
--�����߼�....
--**********************************
function x402278_SkillLogicA_TunDun( sceneId, selfId, nTick )


	--����ģʽ���������to� � ��ʱ��....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402278_IDX_IsTudunMode ) then

		local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402278_IDX_TuDunTimer )
		if cd > nTick then

			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_TuDunTimer, cd-nTick )
			--�������ˢС��to� � ʱ�䲢�ұ������ݻ�ûˢ��С��....
			if cd < (x402278_SkillA_Time-x402278_SkillA_ChildTime) then
				local needCreateNum = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402278_IDX_NeedCreateChildNum )
				if needCreateNum > 0 then
					--����С��....
					MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_NeedCreateChildNum, 0 )
					local x,z = GetWorldPos( sceneId, selfId )
					for i=1, needCreateNum do
						local MstId = CallScriptFunction( x402278_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x402278_SkillA_ChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x402278_SkillA_ChildName )
					end
				end
			end

		else

			--���ݽ���....�����뿪����״̬....
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_TuDunTimer, 0 )
			MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402278_IDX_IsTudunMode, 0 )
			--����ţë����CD....
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_SkillB_CD, x402278_SkillB_CD )

		end


	--������ģʽ������ng����Խ�������ģʽ....
	else


		--ÿ����20%Ѫʱ��������ģʽ....
		local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
		local LastStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402278_IDX_HPStep )
		local CurStep = -1
		if CurPercent <= 0.2 then
			CurStep = 4
		elseif CurPercent <= 0.4 then
		 	CurStep = 3
		elseif CurPercent <= 0.6 then
		 	CurStep = 2
		elseif CurPercent <= 0.8 then
			CurStep = 1
		end

		--��������....
		if CurStep > LastStep then
			--���Լ���������and���ܹ���....
			local x,z = GetWorldPos( sceneId, selfId )
			LuaFnUnitUseSkill( sceneId, selfId, x402278_SkillA_TuDun, selfId, x, z, 0, 1 )

			--��� ��t ���c2c�ibuff(��������)....
			local idx1 = random( getn(x402278_SkillC_ChutuBuff1) )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402278_SkillC_ChutuBuff1[idx1], 0 )
			local idx2 = random( getn(x402278_SkillC_ChutuBuff2) )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402278_SkillC_ChutuBuff2[idx2], 0 )

			local NeedCreateNum = 1
			if CurStep == 3 or CurStep == 4 then
				NeedCreateNum = 2
			end

			MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402278_IDX_IsTudunMode, 1 )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_NeedCreateChildNum, NeedCreateNum )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_HPStep, CurStep )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_TuDunTimer, x402278_SkillA_Time )
			return 1
		end


	end

	return 0

end


--**********************************
--ţë�����߼�....
--**********************************
function x402278_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402278_IDX_SkillB_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_SkillB_CD, cd-nTick )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_SkillB_CD, x402278_SkillB_CD-(nTick-cd) )
		--������״̬�ſ�����....
		if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402278_IDX_IsTudunMode ) then
			local x,z = GetWorldPos( sceneId, selfId )
			MonsterTalk( sceneId, -1, "", "#{PMF_20080530_16}" )
			LuaFnUnitUseSkill( sceneId, selfId, x402278_SkillB_NiuMaoDuZhen, selfId, x, z, 0, 0 )
			return 1
		end
	end

	return 0

end


--**********************************
--���߼�....
--**********************************
function x402278_DoSkillD_KuangBao( sceneId, selfId, nTick )

	--�����ng���˿�to� � ʱ��....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402278_IDX_KuangBaoTimer )
	if kbTime < x402278_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402278_IDX_KuangBaoTimer, kbTime+nTick )

	else

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402278_IDX_IsKuangBaoMode, 1 )
		--�ӿ�buff....
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402278_SkillD_Buff1, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402278_SkillD_Buff2, 0 )
		--������С�ּӿ�buff....
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, MonsterId) == x402278_SkillA_ChildName then
				LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x402278_SkillD_Buff1, 0 )
				LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x402278_SkillD_Buff2, 0 )
			end
		end
		return 1

	end


	return 0

end
