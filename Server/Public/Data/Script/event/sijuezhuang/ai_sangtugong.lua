--Ʈ��� ɣ����AI

--A �����ݡ�BOSS��HPÿ��ʧ20%�����ʧ20��....ͬʱ����С������Ϊ1122ֻ..����or����ս����ʧ....
--B ��ţë���롿������״̬ʱÿ��20һ�δ�Χ����....����״̬��CD������ֻ�ǲ�ʹ��....���ݽ���ʱ��CD....
--C �����������������ʱ������2��buff....ͬʱ����ϴε�2��buff....
--D �����ս��5���Ӻ���Լ������н�ʬ��һ������buff....����ʹ��AB(C)....

--ȫ�̶����������ƶ����ܵ�buff....
--����ս��������ʱɾ����ʬ....


--�ű���
x893065_g_ScriptId	= 893065

--�����߼��ű���....
x893065_g_FuBenScriptId = 893063


--�����ض�����buff....
x893065_Buff_MianYi1	= 10472	--����һЩ����Ч��....
x893065_Buff_MianYi2	= 10471	--������ͨ����....

--A����....
x893065_SkillID_H				= 1635
x893065_SkillA_TuDun				= 1028
x893065_MianYi_Buff				= 22431
x893065_SkillA_AChildName		= "M�c H�: B�ng"
x893065_SkillA_BChildName		= "M�c H�: H�a"
x893065_SkillA_CChildName		= "M�c H�: еc"
x893065_SkillA_DChildName		= "M�c H�: Huy�n"
x893065_SkillA_AChildBuff		= 22422
x893065_SkillA_BChildBuff		= 22423
x893065_SkillA_CChildBuff		= 22424
x893065_SkillA_DChildBuff		= 22425

x893065_SkillA_ChildTime		= 5000		--���ݶ೤ʱ���ʼˢС��....
x893065_SkillA_Time					= 20000		--���ݳ�����ʱ��....


--Bţë����....
x893065_SkillB_NiuMaoDuZhen = 1634
x893065_SkillE_SanFeng = 1637
x893065_SkillE_Buff				= 22429
--��ȴʱ��....
x893065_SkillB_CD						= 30000


--C�������＼�ܵ�buff�б�....
x893065_SkillC_ChutuBuff1 = { 22428, 22428 }
x893065_SkillC_ChutuBuff2 = { 22430, 22430, 22430, 22430 }


--D���....
x893065_SkillD_Buff1	= 10234
x893065_SkillD_Buff2	= 10235
--��ʼ�����״̬��ʱ��....
x893065_EnterKuangBaoTime	= 10*60*1000


--AI Index....
x893065_IDX_HPStep							= 1	--Ѫ������....
x893065_IDX_SkillB_CD						= 2	--B���ܵ�CDʱ��....
x893065_IDX_KuangBaoTimer				= 3	--�񱩵ļ�ʱ��....
x893065_IDX_TuDunTimer					= 4	--���ݵļ�ʱ��....���ڼ����ʱ���ݽ���....
x893065_IDX_NeedCreateChildNum	= 5	--��Ҫ������С�ֵ�����....

x893065_IDX_CombatFlag 			= 1	--�Ƿ���ս��״̬�ı�־....
x893065_IDX_IsTudunMode			= 2	--�Ƿ�������ģʽ�ı�־....
x893065_IDX_IsKuangBaoMode	= 3	--�Ƿ��ڿ�ģʽ�ı�־....


--**********************************
--��ʼ��....
--**********************************
function x893065_OnInit(sceneId, selfId)
	--����AI....
	x893065_ResetMyAI( sceneId, selfId )
end


--**********************************
--����....
--**********************************
function x893065_OnHeartBeat(sceneId, selfId, nTick)

	--����ǲ�������....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--����Ƿ���ս��״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x893065_IDX_CombatFlag ) then
		return
	end

	--��״̬����Ҫ���߼�....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x893065_IDX_IsKuangBaoMode ) then
		return
	end

	--ִ�п��߼�....
	if 1 == x893065_DoSkillD_KuangBao( sceneId, selfId, nTick ) then
		return
	end

	--ִ�������߼�....
	if 1 == x893065_SkillLogicA_TunDun( sceneId, selfId, nTick ) then
		return
	end

	--ִ��ţë�����߼�....
	if 1 == x893065_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--����ս��....
--**********************************
function x893065_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893065_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893065_Buff_MianYi2, 0 )

	--����AI....
	x893065_ResetMyAI( sceneId, selfId )

	--���ý���ս��״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893065_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪ս��....
--**********************************
function x893065_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x893065_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

	--�����Ի�NPC....
	local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "QinYun_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--ɱ������....
--**********************************
function x893065_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x893065_OnDie( sceneId, selfId, killerId )

	--����AI....
	x893065_ResetMyAI( sceneId, selfId )

	--�����Ѿ���ս��ɣ����....
	CallScriptFunction( x893065_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "QinYun", 2 )

	--�����û����ս�����ϴ��������ս���ϴ�....
	if 2 ~= CallScriptFunction( x893065_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "TaoQin" )	then
		CallScriptFunction( x893065_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "TaoQin", 1 )
	end
	
	-- zchw ȫ�򹫸�
	local	playerName	= GetName( sceneId, killerId )
	
	--ɱ��������ǳ������ȡ�����˵�����....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--��������������ȡ�ӳ�������....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		str = format("#{_INFOUSR%s} d�n d�t �i ng� m�t phen quy�t chi�n ��o Thanh th�ng l�i, ti�p t�c h�nh tr�nh Huy�t chi�n T� Tuy�t Trang...", playerName); --ɣ����
		AddGlobalCountNews( sceneId, str )
	end
	
end


--**********************************
--����AI....
--**********************************
function x893065_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_SkillB_CD, x893065_SkillB_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_KuangBaoTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_TuDunTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_NeedCreateChildNum, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893065_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893065_IDX_IsTudunMode, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893065_IDX_IsKuangBaoMode, 0 )

	--���buff....
	for i, buffId in x893065_SkillC_ChutuBuff1 do
		LuaFnCancelSpecificImpact( sceneId, selfId, buffId )
	end

	for i, buffId in x893065_SkillC_ChutuBuff2 do
		LuaFnCancelSpecificImpact( sceneId, selfId, buffId )
	end

	LuaFnCancelSpecificImpact( sceneId, selfId, x893065_SkillD_Buff1 )
	LuaFnCancelSpecificImpact( sceneId, selfId, x893065_SkillD_Buff2 )

	--���С��....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId) == x893065_SkillA_AChildName or GetName(sceneId, MonsterId) == x893065_SkillA_BChildName or GetName(sceneId, MonsterId) == x893065_SkillA_CChildName or GetName(sceneId, MonsterId) == x893065_SkillA_DChildName then
			LuaFnDeleteMonster(sceneId, MonsterId)
		end
	end

end


--**********************************
--�񱩼���....
--**********************************
function x893065_DoSkillD_KuangBao( sceneId, selfId )

	--�ӿ�buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893065_SkillD_Buff1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893065_SkillD_Buff2, 0 )

	--������С�ּӿ�....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId) == x893065_SkillA_ChildName then
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x893065_SkillD_Buff1, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x893065_SkillD_Buff2, 0 )
		end
	end

end


--**********************************
--�����߼�....
--**********************************
function x893065_SkillLogicA_TunDun( sceneId, selfId, nTick )


	--����ģʽ��������ݵļ�ʱ��....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x893065_IDX_IsTudunMode ) then

		local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893065_IDX_TuDunTimer )
		if cd > nTick then

			MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_TuDunTimer, cd-nTick )
			--�������ˢС�ֵ�ʱ�䲢�ұ������ݻ�ûˢ��С��....
			if cd < (x893065_SkillA_Time-x893065_SkillA_ChildTime) then
				local needCreateNum = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893065_IDX_NeedCreateChildNum )
				if needCreateNum > 0 then
					--����С��....
					MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_NeedCreateChildNum, 0 )
					local x,z = GetWorldPos( sceneId, selfId )
					if needCreateNum == 1 then
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_AChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_AChildName )
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_BChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_BChildName )
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_CChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_CChildName )
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_DChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_DChildName )
					elseif needCreateNum == 2 then
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_AChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_AChildName )
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_BChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_BChildName )
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_CChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_CChildName )
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_DChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_DChildName )
					elseif needCreateNum == 3 then
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_AChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_AChildName )
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_BChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_BChildName )
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_CChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_CChildName )
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_DChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_DChildName )
					elseif needCreateNum == 4 then
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_AChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_AChildName )
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_BChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_BChildName )
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_CChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_CChildName )
						local MstId = CallScriptFunction( x893065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x893065_SkillA_DChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x893065_SkillA_DChildName )
					end
				end
			end

		else

			--���ݽ���....�����뿪����״̬....
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_TuDunTimer, 0 )
			MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893065_IDX_IsTudunMode, 0 )
			--����ţë����CD....
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_SkillB_CD, x893065_SkillB_CD )

		end


	--������ģʽ�����Ƿ���Խ�������ģʽ....
	else

	--���ܹ���....
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, MonsterId) == x893065_SkillA_AChildName or GetName(sceneId, MonsterId) == x893065_SkillA_BChildName or GetName(sceneId, MonsterId) == x893065_SkillA_CChildName or GetName(sceneId, MonsterId) == x893065_SkillA_DChildName then
			   CallScriptFunction((200060), "Paopao",sceneId, "Phan Tinh Tinh", "T� Tuy�t Trang", "��o Thanh �� tri�u h�i M�c H�, m�i ng߶i h�y t�p trung ti�u di�t M�c H� tr߾c, n�u c�n � l� n�y l�i th� s� kh� l�ng �i ph� v�i ��o Thanh." )
			   LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893065_MianYi_Buff, 0 )
			end
		end

		--ÿ����20%Ѫʱ��������ģʽ....
		local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
		local LastStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893065_IDX_HPStep )
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
			LuaFnUnitUseSkill( sceneId, selfId, x893065_SkillA_TuDun, selfId, x, z, 0, 1 )

	              --���Լ�ʹ�ÿռ���....
			local x,z = GetWorldPos( sceneId, selfId )
			LuaFnUnitUseSkill( sceneId, selfId, x893065_SkillID_H, selfId, x, z, 0, 1 )

			--������2��buff(��������)....
			local idx1 = random( getn(x893065_SkillC_ChutuBuff1) )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893065_SkillC_ChutuBuff1[idx1], 0 )
			local idx2 = random( getn(x893065_SkillC_ChutuBuff2) )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893065_SkillC_ChutuBuff2[idx2], 0 )

			local NeedCreateNum = 0
			if CurStep == 1 then
				NeedCreateNum = 1
			elseif CurStep == 2 then
				NeedCreateNum = 2
			elseif CurStep == 3 then
				NeedCreateNum = 3
			elseif CurStep == 4 then
				NeedCreateNum = 4
			end

			MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893065_IDX_IsTudunMode, 1 )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_NeedCreateChildNum, NeedCreateNum )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_HPStep, CurStep )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_TuDunTimer, x893065_SkillA_Time )
			return 1
		end


	end

	return 0

end


--**********************************
--ţë�����߼�....
--**********************************
function x893065_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893065_IDX_SkillB_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_SkillB_CD, cd-nTick )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_SkillB_CD, x893065_SkillB_CD-(nTick-cd) )
		--������״̬�ſ�����....
		if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x893065_IDX_IsTudunMode ) then
	              --���Լ�ʹ�ÿռ���....
			local x,z = GetWorldPos( sceneId, selfId )
			LuaFnUnitUseSkill( sceneId, selfId, x893065_SkillE_SanFeng, selfId, x, z, 0, 1 )
		       LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893065_SkillE_Buff, 0 )

			local x,z = GetWorldPos( sceneId, selfId )
			CallScriptFunction((200060), "Paopao",sceneId, "T� Tuy�t Trang", "B�ng X�", "L�o phu tuy r�ng 10 n�m nay kh�ng b߾c ch�n ra kh�i n�i n�y, song c�ng phu v�n kh�ng v� th� m� mai m�t. C�c ng߽i mu�n �n �o�t b�u v�t, ��ng c� m�. Ti�p chi�u �i..." )
			LuaFnUnitUseSkill( sceneId, selfId, x893065_SkillB_NiuMaoDuZhen, selfId, x, z, 0, 0 )
			return 1
		end
	end

	return 0

end


--**********************************
--���߼�....
--**********************************
function x893065_DoSkillD_KuangBao( sceneId, selfId, nTick )

	--����Ƿ��˿񱩵�ʱ��....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893065_IDX_KuangBaoTimer )
	if kbTime < x893065_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893065_IDX_KuangBaoTimer, kbTime+nTick )

	else

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893065_IDX_IsKuangBaoMode, 1 )
		--�ӿ�buff....
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893065_SkillD_Buff1, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893065_SkillD_Buff2, 0 )
		--������С�ּӿ�buff....
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, MonsterId) == x893065_SkillA_AChildName or GetName(sceneId, MonsterId) == x893065_SkillA_BChildName or GetName(sceneId, MonsterId) == x893065_SkillA_CChildName or GetName(sceneId, MonsterId) == x893065_SkillA_DChildName then
				LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x893065_SkillD_Buff1, 0 )
				LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x893065_SkillD_Buff2, 0 )
			end
		end
		return 1

	end


	return 0

end
