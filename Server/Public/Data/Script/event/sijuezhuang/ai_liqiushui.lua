--Ʈ��� ����ˮAI

--A ��С���๦�����Լ��ø��ռ���....�ٸ������һ�����ʧ��....
--B �����衿���Լ���һ���ռ���....������15s�����θ�ȫ������Ҽ��˺�ֵ�𽥼Ӵ���˺�buff....
--C �����ѡ����Լ���һ����buff�ļ���....
--D �����������Լ��ø��ռ���....�ٸ��������ҽ��·Ÿ�����....
--E ���񱩡����Լ��ӷ���buff....����ʹ����������....

--ȫ�̶����������ƶ����ܵ�buff....
--ս����ʼͬʱÿ��10����A����....
--��HP��Ϊ66%��33%ʱ�ֱ�ʹ��B����....B���ܵĳ���ʱ����....��������CD���˲�ʹ��....
--ÿ��20����C����....
--ÿ��20����D����....


--�ű���
x893069_g_ScriptId	= 893069

--�����߼��ű���....
x893069_g_FuBenScriptId = 893063


--�����ض�����buff....
x893069_Buff_MianYi1	= 10472	--����һЩ����Ч��....
x893069_Buff_MianYi2	= 10471	--������ͨ����....

--AС���๦....
x893069_SkillA_ID			= 1640
x893069_SkillA_BID			= 1638
x893069_SkillA_Buff		=	22440
x893069_SkillA_CD			= 60000

--B����....
x893069_SkillB_SkillIDTbl = { 1043, 1044, 1045, 1046, 1047 }
x893069_SkillB_WeatherTbl = { 11, 12, 13, 14, 15 }
x893069_SkillB_LongZhuTbl = { "Mu_Boss", "Tu_Boss", "Huo_Boss", "Jin_Boss", "Shui_Boss" }
x893069_SkillB_TalkTbl =
{
	"C�c ng߽i c�n th�n, ta �� tri�u h�i Long Tr�!",
	"C�c ng߽i c�n th�n, ta �� tri�u h�i Long Tr�!",
	"C�c ng߽i c�n th�n, ta �� tri�u h�i Long Tr�!",
	"C�c ng߽i c�n th�n, ta �� tri�u h�i Long Tr�!",
	"C�c ng߽i c�n th�n, ta �� tri�u h�i Long Tr�!"
}

x893069_SkillB_Text =
{
	"Phan Tinh Tinh: Ch� �, #GB�ng X�#W �� tri�u t�p #GLong Tr�: M�c#W, mau mau kh�c ch� #GLong Tr�: M�c#W b�ng #GLong Tr�: Kim#W b�n c�nh �i, n�u kh�ng e r�ng kh�ng ai c� th� to�n m�ng c�!",
	"Phan Tinh Tinh: Ch� �, #GB�ng X�#W �� tri�u t�p #GLong Tr�: Th�#W, mau mau kh�c ch� #GLong Tr�: Th�#W b�ng #GLong Tr�: M�c#W b�n c�nh �i, n�u kh�ng e r�ng kh�ng ai c� th� to�n m�ng c�!",
	"Phan Tinh Tinh: Ch� �, #GB�ng X�#W �� tri�u t�p #GLong Tr�: H�a#W, mau mau kh�c ch� #GLong Tr�: H�a#W b�ng #GLong Tr�: Th�y#W b�n c�nh �i, n�u kh�ng e r�ng kh�ng ai c� th� to�n m�ng c�!",
	"Phan Tinh Tinh: Ch� �, #GB�ng X�#W �� tri�u t�p #GLong Tr�: Kim#W, mau mau kh�c ch� #GLong Tr�: Kim#W b�ng #GLong Tr�: H�a#W b�n c�nh �i, n�u kh�ng e r�ng kh�ng ai c� th� to�n m�ng c�!",
	"Phan Tinh Tinh: Ch� �, #GB�ng X�#W �� tri�u t�p #GLong Tr�: Th�y#W, mau mau kh�c ch� #GLong Tr�: Th�y#W b�ng #GLong Tr�: Th�#W b�n c�nh �i, n�u kh�ng e r�ng kh�ng ai c� th� to�n m�ng c�!"
}

x893069_SkillB_BuffIDTbl =
{
	[1] = {22446,22446},
	[2] = {22447,22447},
	[3] = {22448,22448},
	[4] = {22449,22449},
	[5] = {22450,22450}
}

--C����....
x893069_SkillC_ID		= 1639
x893069_SkillC_CD		= 5000

--D����....
x893069_SkillD_ID		= 1639
x893069_SkillD_CD		= 20000
x893069_SkillD_SpecObj = 59

--E��....
x893069_SkillE_Buff1	= 10234
x893069_SkillE_Buff2	= 10235
--��ʼ�����״̬��ʱ��....
x893069_EnterKuangBaoTime	= 10*60*1000

--Fʮ��һɱ....
x893069_SkillF_ID		= 1643
x893069_SkillF_SpecObjTbl = { 162, 163, 164, 165, 166, 167 }

--G��܇��˧....
x893069_SkillG_ID		= 1642

--С����
x893069_g_DogfacePos = {
	{ 41, 24, 0, 14146 }, { 41, 24, 0, 14146 }, { 41, 24, 0, 14146 }, 
    { 38, 36, 1, 14146 }, { 38, 36, 1, 14146 }, { 38, 36, 1, 14146 }, 
    { 20, 37, 2, 14146 }, { 20, 37, 2, 14146 }, { 20, 37, 2, 14146 },
    { 18, 25, 3, 14146 }, { 18, 25, 3, 14146 }, { 18, 25, 3, 14146 },
    { 29, 18, 4, 14146 }, { 29, 18, 4, 14146 }, { 29, 18, 4, 14146 }
}

x893069_g_DogfaceGroup = 0					-- ����С���� Group ID

--AI Index....
x893069_IDX_StopWatch						= 1	--���....
x893069_IDX_SkillA_CD						= 2	--A���ܵ�CDʱ��....
x893069_IDX_SkillB_HPStep				= 3	--Ѫ������....
x893069_IDX_SkillB_Step					= 4	--B���ܵ�Step....0=δ���� 15=buff1 14=buff2 ���� 1=buff15
x893069_IDX_SkillB_Type					= 5	--��ǰ����ʹ���������͵Ľ���....
x893069_IDX_SkillC_CD						= 6	--C���ܵ�CDʱ��....
x893069_IDX_SkillD_CD						= 7	--C���ܵ�CDʱ��....
x893069_IDX_KuangBaoTimer				= 8	--�񱩵ļ�ʱ��....


x893069_IDX_CombatFlag 			= 1	--�Ƿ���ս��״̬�ı�־....
x893069_IDX_IsKuangBaoMode	= 2	--�Ƿ��ڿ�ģʽ�ı�־....


--**********************************
--��ʼ��....
--**********************************
function x893069_OnInit(sceneId, selfId)
	--����AI....
	x893069_ResetMyAI( sceneId, selfId )
end


--**********************************
--����....
--**********************************
function x893069_OnHeartBeat(sceneId, selfId, nTick)

	--����ǲ�������....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--����Ƿ���ս��״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x893069_IDX_CombatFlag ) then
		return
	end

	--��״̬����Ҫ���߼�....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x893069_IDX_IsKuangBaoMode ) then
		return
	end

	--A��������....
	if 1 == x893069_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--B��������....
	if 1 == x893069_TickSkillB( sceneId, selfId, nTick ) then
		return
	end

	--C��������....
	if 1 == x893069_TickSkillC( sceneId, selfId, nTick ) then
		return
	end

	--D��������....
	if 1 == x893069_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

	--E��������....
	if 1 == x893069_TickSkillE( sceneId, selfId, nTick ) then
		return
	end

	--�������....
	x893069_TickStopWatch( sceneId, selfId, nTick )

		local monstercount = GetMonsterCount( sceneId )
		local monsterId, GroupID, DogX, DogZ
		local x, z = GetLastPatrolPoint( sceneId, 0 )

		for i = 0, monstercount - 1 do
			monsterId = GetMonsterObjID( sceneId, i )
			GroupID = GetMonsterGroupID( sceneId, monsterId )

			if GroupID == x893069_g_DogfaceGroup
			 and LuaFnIsCharacterLiving( sceneId, monsterId ) == 1 then			-- �жϻ��ŵ�С���Ƿ����ܳɹ�
				DogX, DogZ = GetWorldPos( sceneId, monsterId )

				if (x - DogX) * (x - DogX) + (z - DogZ) * (z - DogZ) < 2 then	-- ���յ㲻�� 5 ��
					LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 22456, 0 ) --��Ѫ
					LuaFnDeleteMonster( sceneId, monsterId )
				end
			end
		end
end


--**********************************
--����ս��....
--**********************************
function x893069_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893069_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893069_Buff_MianYi2, 0 )

	--����AI....
	x893069_ResetMyAI( sceneId, selfId )

	--���ý���ս��״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893069_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪ս��....
--**********************************
function x893069_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x893069_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )
	--�����Ի�NPC....
	local MstId = CallScriptFunction( x893069_g_FuBenScriptId, "CreateBOSS", sceneId, "LiFan_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )
end


--**********************************
--ɱ������....
--**********************************
function x893069_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x893069_OnDie( sceneId, selfId, killerId )

	--����AI....
	x893069_ResetMyAI( sceneId, selfId )

	--�����Ѿ���ս������ˮ....
	CallScriptFunction( x893069_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "PangQi", 2 )

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
		str = format("#ccc33cc[K� Tr�n]#c99ccff l� b� b�o m� B�ng X� d�ng � chi�m T� Tuy�t Trang, ch�ng nh�ng b� #{_INFOUSR%s} c�ng �i ng� ph� h�y m� b�n th�n B�ng X� c�ng kh�ng gi� n�i t�nh m�ng c�a m�nh!", playerName); --����ˮ
		AddGlobalCountNews( sceneId, str )
	end

	CallScriptFunction((200060), "Paopao",sceneId, "Phan Tinh Tinh", "T� Tuy�t Trang","C�c ng߶i trong l�c ��nh nhau v�i B�ng X� �� v� � ��ng ph�i c� quan m�t �n d߾i �t, ph�a tr߾c li�n xu�t hi�n T� Tuy�t B�o S߽ng, c� l� l� b�u v�t qu� gi� l�u n�m � T� Tuy�t Trang, mau mau gi�nh l�y!" )

		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				x,z = GetWorldPos( sceneId, nHumanId )
				local nBoxId = LuaFnCreateMonster(sceneId, 14156, x, z, 3, 0, 893082)
				SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
			end
		end

	--local x,z = GetWorldPos( sceneId, selfId )
	--local nBoxId = LuaFnCreateMonster(sceneId, 14156, x, z, 3, 0, 893082)
	--SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	
end


--**********************************
--����AI....
--**********************************
function x893069_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_StopWatch, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillA_CD, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_Step, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_Type, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillC_CD, x893069_SkillC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillD_CD, x893069_SkillD_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_KuangBaoTimer, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893069_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893069_IDX_IsKuangBaoMode, 0 )

end

--**********************************
--A��������....
--**********************************
function x893069_TickSkillA( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillA_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillA_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillA_CD, x893069_SkillA_CD-(nTick-cd) )
		return x893069_UseSkillA( sceneId, selfId )
	end

end

--**********************************
--B��������....
--**********************************
function x893069_TickSkillB( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	local LastStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_HPStep )
	local CurStep = 0
	if CurPercent <= 0.1333 then
		CurStep = 5
	elseif CurPercent <= 0.3666 then
		CurStep = 4
	elseif CurPercent <= 0.6666 then
		CurStep = 3
	elseif CurPercent <= 0.8333 then
		CurStep = 2
	elseif CurPercent <= 0.9333 then
		CurStep = 1
	end

	if CurStep > LastStep and CurStep < 3 then

		--���ò���....
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_HPStep, CurStep )
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_Step, 2 )
		local JianWuType = random( getn(x893069_SkillB_SkillIDTbl) )
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_Type, JianWuType )

		--����....
		MonsterTalk(sceneId, -1, "", x893069_SkillB_TalkTbl[JianWuType] )

		CallScriptFunction((200060), "Paopao",sceneId, "Phan Tinh Tinh", "T� Tuy�t Trang", x893069_SkillB_Text[JianWuType] )
		
		MonsterTalk(sceneId, -1, "", x893069_SkillB_Text[JianWuType] )
		--��ȫ�����̻�....
		LuaFnSetSceneWeather(sceneId, x893069_SkillB_WeatherTbl[JianWuType], 30000 )

		--���Լ�ʹ�ÿռ���....
		local x,z = GetWorldPos( sceneId, selfId )
		local MstId = CallScriptFunction( x893066_g_FuBenScriptId, "CreateBOSS", sceneId, x893069_SkillB_LongZhuTbl[JianWuType], x, z )
		SetCharacterDieTime( sceneId, MstId, 30000 )

		return 1

	elseif CurStep > LastStep and CurStep < 4 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_HPStep, CurStep )

		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x893069_SkillG_ID, selfId, x, z, 0, 1 )
		CallScriptFunction((200060), "Paopao",sceneId, "Phan Tinh Tinh", "T� Tuy�t Trang", "Ph�i nhanh tay ��nh ch�t tinh la ti�u t�, n�u kh�ng B�ng X� s� ph�c h�i tr� l�i, l�c �� e r�ng ta c�ng ch�ng ���c b�nh y�n ra kh�i n�i n�y n�a ��u...")

		local dogfaceId = -1
		for i = 1, getn( x893069_g_DogfacePos ) do
			if x893069_g_DogfacePos[i] then
				dogfaceId = LuaFnCreateMonster( sceneId, x893069_g_DogfacePos[i][4], x893069_g_DogfacePos[i][1], x893069_g_DogfacePos[i][2], 1, 4, -1 )
				SetMonsterGroupID( sceneId, dogfaceId, x893069_g_DogfaceGroup )
				SetPatrolId( sceneId, dogfaceId, x893069_g_DogfacePos[i][3] )		-- ����Ѳ��·��
				SetCharacterDieTime( sceneId, dogfaceId, 8000 )
			end
		end

		return 1

	elseif CurStep > LastStep then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_HPStep, CurStep )

	--ʹ�ÿռ���....
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x893069_SkillF_ID, selfId, x, z, 0, 1 )
		CallScriptFunction((200060), "Paopao",sceneId, "B�ng X�", "T� Tuy�t Trang", "Th�p b� s�t nh�t nh�n, v�n d�m b�t l�u h�nh...")
		CallScriptFunction((200060), "Paopao",sceneId, "Phan Tinh Tinh", "T� Tuy�t Trang", "B�ng X� li�n t�c ph�ng th�p ��i nh�t c߾c, m�i ng߶i ch� � coi ch�ng c�m b�y d߾i tr�n m�nh ��...")

		local SpecObj = random( getn(x893069_SkillF_SpecObjTbl) )

		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				x,z = GetWorldPos( sceneId, nHumanId )
				CreateSpecialObjByDataIndex(sceneId, selfId, x893069_SkillF_SpecObjTbl[SpecObj], x, z, 0)
			end
		end

		return 1

	end

	return 0

end

--**********************************
--C��������....
--**********************************
function x893069_TickSkillC( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillC_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillC_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillC_CD, x893069_SkillC_CD-(nTick-cd) )
		return x893069_UseSkillC( sceneId, selfId )
	end

end

--**********************************
--D��������....
--**********************************
function x893069_TickSkillD( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillD_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillD_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillD_CD, x893069_SkillD_CD-(nTick-cd) )
		return x893069_UseSkillD( sceneId, selfId )
	end

end

--**********************************
--E��������....
--**********************************
function x893069_TickSkillE( sceneId, selfId, nTick )

	--���������B�������ȵȴ�....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--����Ƿ��˿񱩵�ʱ��....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893069_IDX_KuangBaoTimer )
	if kbTime < x893069_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_KuangBaoTimer, kbTime+nTick )
		return 0

	else

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893069_IDX_IsKuangBaoMode, 1 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893069_SkillE_Buff1, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893069_SkillE_Buff2, 0 )
		return 1

	end

end

--**********************************
--�������....
--**********************************
function x893069_TickStopWatch( sceneId, selfId, nTick )

	--����ÿ��Ż�ִ��һ��....
	local time = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893069_IDX_StopWatch )
	if (time + nTick) > 1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_StopWatch, time+nTick-1000 )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_StopWatch, time+nTick )
		return
	end


	-------------------------
	--���輼���߼�....
	-------------------------
	local buffStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_Step )
	local skillType = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_Type )
	if buffStep >= 1 and buffStep <= 2 then

		--Ѱ�ҷ�����....
		--local bossId = CallScriptFunction( x893069_g_FuBenScriptId, "FindBOSS", sceneId, "LiFan_NPC" )
		--if bossId <= 0 then
			--return 0
		--end

		--�÷����Ǹ���Ҽ�buff....
		local buffTbl = x893069_SkillB_BuffIDTbl[skillType]
		local buffId = buffTbl[2-buffStep]
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, buffId, 0 )
		--local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		--for i=0, nHumanCount-1 do
			--local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			--if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				--LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
			--end
		--end

	end

	if buffStep > 0 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_Step, buffStep-1 )
	end


end

--**********************************
--ʹ��A����....
--**********************************
function x893069_UseSkillA( sceneId, selfId )

	--���������B����������....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--���Լ�ʹ��һ���ռ���....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893069_SkillA_BID, selfId, x, z, 0, 1 )

	--��������Ч����ҵ��б�....
	local PlayerList = {}

	--����Ч���˼����б�....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--�����ѡһ�����....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--���Լ�ʹ��һ���ռ���....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893069_SkillA_ID, selfId, x, z, 0, 1 )

	--����Ҽ�ʧ��buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x893069_SkillA_Buff, 0 )

	return 1

end

--**********************************
--ʹ��C����....
--**********************************
function x893069_UseSkillC( sceneId, selfId )

	--���������B����������....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_Step ) > 0 then
		return 0
	end

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893069_SkillC_ID, selfId, x, z, 0, 1 )
	return 1

end

--**********************************
--ʹ��D����....
--**********************************
function x893069_UseSkillD( sceneId, selfId )

	--���������B����������....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x893069_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--ʹ�ÿռ���....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893069_SkillD_ID, selfId, x, z, 0, 1 )

	return 1

end
