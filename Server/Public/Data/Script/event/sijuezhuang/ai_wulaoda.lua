--Ʈ��� ��ƽ����AI

--F	�����ס����Լ���һ���ռ���....�ٸ���ҼӸ��������ص��ű���buff....�ص�ʱ��BOSS������Χ�˼��˺�buff������....
--G �����㡿���Լ���һ����buff�ļ���....
--H ���̻������Լ���һ���ռ���....�ٸ���ҼӸ��������ص��ű���buff....�ص�ʱ����....
--I	�����ѡ�׿������ʱ���Լ���һ����buff�ļ���....


--ȫ�̶����������ƶ����ܵ�buff....
--ÿ��30������������ʹ��FH....
--ÿ��45����Լ�ʹ��G....
--����������ս��ʱ������������FH��buff....
--����ʱѰ�Ҳ�ƽ����....��������Ҫʹ�ÿ񱩼���....
--����ʱ���ֲ�ƽ�����Ѿ�����....�򴴽���һ��BOSS....


--�ű���
x893066_g_ScriptId	= 893066

--�����߼��ű���....
x893066_g_FuBenScriptId = 893063
x893066_MyName			= "T�n V�n"	--�Լ�������....

--����Buff....
x893066_Buff_MianYi1	= 10472	--����һЩ����Ч��....
x893066_Buff_MianYi2	= 10471	--������ͨ����....

--����....
x893066_SkillID_F		= 1631
x893066_BuffID_F1		= 22443
x893066_BuffID_F2		= 22444
x893066_BuffID_F3		= 22445
x893066_SkillID_G		= 1632
x893066_SkillID_G_SpecObj		= 161
x893066_SkillID_H		= 1630
x893066_BuffID_H		= 22405
x893066_SkillID_I		= 1036
x893066_BuffID_I1		= 10253
x893066_BuffID_I2		= 10254

x893066_SkillCD_FH	=	20000
x893066_SkillCD_G		=	10000


x893066_BrotherName = "Tr�c B�t Ph�m"		--�ֵܵ�����....


--AI Index....
x893066_IDX_KuangBaoMode	= 1	--��ģʽ....0δ�� 1��Ҫ����� 2�Ѿ������
x893066_IDX_CD_SkillFH		= 2	--FH���ܵ�CD....
x893066_IDX_CD_SkillG			= 3	--G���ܵ�CD....
x893066_IDX_CD_Talk				= 4	--FH���ܺ�����CD....

x893066_IDX_CombatFlag 		= 1	--�Ƿ���ս��״̬�ı�־....


--**********************************
--��ʼ��....
--**********************************
function x893066_OnInit(sceneId, selfId)
	--����AI....
	x893066_ResetMyAI( sceneId, selfId )
end


--**********************************
--����....
--**********************************
function x893066_OnHeartBeat(sceneId, selfId, nTick)

	--����ǲ�������....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--����Ƿ���ս��״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x893066_IDX_CombatFlag ) then
		return
	end

	--FH��������....
	if 1 == x893066_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G��������....
	if 1 == x893066_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--I��������....
	if 1 == x893066_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--����ս��....
--**********************************
function x893066_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893066_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893066_Buff_MianYi2, 0 )

	--����AI....
	x893066_ResetMyAI( sceneId, selfId )

	--���ý���ս��״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893066_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪ս��....
--**********************************
function x893066_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x893066_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )
	--�����Ի�NPC....
	local MstId = CallScriptFunction( x893066_g_FuBenScriptId, "CreateBOSS", sceneId, "TaoQin_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )
end


--**********************************
--ɱ������....
--**********************************
function x893066_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x893066_OnDie( sceneId, selfId, killerId )

	--����AI....
	x893066_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--�������ϴ������ļ�ʱ��....
	--local x,z = GetWorldPos( sceneId, selfId )
	--CallScriptFunction( x893066_g_FuBenScriptId, "OpenTaoQinDieTimer", sceneId, 4, x893066_g_ScriptId, x, z )

	--�����Ѿ���ս�����ϴ�....
	CallScriptFunction( x893066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "TaoQin", 2 )

	--�����û����ս��˫���������ս˫��....
	if 2 ~= CallScriptFunction( x893066_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PangQi" )	then
		CallScriptFunction( x893066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "PangQi", 1 )
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
		str = format("#ccc33ccK� l� thay, #c99ccff#{_INFOUSR%s}#ccc33cc th�ng l�nh �i ng� ��nh b�i T� Tuy�t Trang - T�n V�n, ch�ng may ��ng ph�i c� quan, c� ti�ng ��n tru tr�o ph�t ra th�t r�n ng߶i...",playerName); --����
		AddGlobalCountNews( sceneId, str )
	end
	MonsterTalk(sceneId, -1, "T�n V�n", "B� b�o...Th�ng ng�...C�m t�u..." )
	MonsterTalk(sceneId, -1, "T�n V�n", "..." )
	MonsterTalk(sceneId, -1, "T�n V�n", "...Nh��c..." )
	MonsterTalk(sceneId, -1, "T�n V�n", "...Phi�n...Lai..." )
	MonsterTalk(sceneId, -1, "T�n V�n", "...V�...Kh�i..." )
	MonsterTalk(sceneId, -1, "T�n V�n", "...C߶ng..." )
	MonsterTalk(sceneId, -1, "T�n V�n", "...Li�n...V�..." )
	MonsterTalk(sceneId, -1, "T�n V�n", "...B�i...Tinh la ��n...B�ng X�..." )
	MonsterTalk(sceneId, -1, "", "T�n V�n ch�ng nh�ng c� th� d�ng ti�ng ��n � n�i chuy�n m� c�ng phu th� l�i r�t cao c߶ng, qu� th�t l�i h�i. Xem c�u h�t c�a m� tr߾c khi ch�t th�t khi�n ta � m� h�i l�nh. Xem ra m� ta �� �o�n ���c ch�ng ta �n ��y l� � t�m Tinh La ��n - B�ng X�..." )
end


--**********************************
--����AI....
--**********************************
function x893066_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillFH, x893066_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillG, x893066_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893066_IDX_CombatFlag, 0 )

	--������������FH��buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x893066_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x893066_BuffID_H )
		end
	end

end


--**********************************
--FH��������....
--**********************************
function x893066_TickSkillFH( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillFH, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillFH, x893066_SkillCD_FH-(nTick-cd) )

		--���ʹ��FH....
		if random(100) < 50 then
			return x893066_UseSkillF( sceneId, selfId )
		else
			return x893066_UseSkillH( sceneId, selfId )
		end

	end

end


--**********************************
--G��������....
--**********************************
function x893066_TickSkillG( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillG, x893066_SkillCD_G-(nTick-cd) )
		return x893066_UseSkillG( sceneId, selfId )
	end

end


--**********************************
--I��������....
--**********************************
function x893066_TickSkillI( sceneId, selfId, nTick )

	--��õ�ǰ��mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893066_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--�������Ҫ�񱩻����Ѿ������򷵻�....
		return 0

	elseif CurMode == 1 then

		--�����Ҫ����ʹ�ÿ񱩼���....
		local ret =  x893066_UseSkillI( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--ʹ��F����....
--**********************************
function x893066_UseSkillF( sceneId, selfId )

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

	--���Լ�ʹ�ÿռ���....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893066_SkillID_F, selfId, x, z, 0, 1 )

	--����Ҽӽ�����ص��ű���buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x893066_BuffID_F1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x893066_BuffID_F3, 0 )

	return 1

end


--**********************************
--ʹ��G����....
--**********************************
function x893066_UseSkillG( sceneId, selfId )


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

	--ʹ�ÿռ���....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893066_x893066_SkillID_G, selfId, x, z, 0, 1 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstId = CallScriptFunction( x893066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuiYinFan_BOSS", x, z )
	SetCharacterDieTime( sceneId, MstId, 14500 )

	--�ڸ���ҽŵ��·�����....
	x,z = GetWorldPos( sceneId, PlayerId )
	CreateSpecialObjByDataIndex(sceneId, selfId, x893066_SkillID_G_SpecObj, x, z, 0)

	CallScriptFunction((200060), "Paopao",sceneId, "Phan Tinh Tinh", "T� Tuy�t Trang", "T�n V�n �ang ng�y c�ng �y nhanh �c t�c g�y ��n, xem ra m� ta �nh tri�u t�p H�i �m Phi�n khu�ch ��i �m thanh. M�i ng߶i ph�i ch� � c�n th�n!" )
	return 1

end


--**********************************
--ʹ��H����....
--**********************************
function x893066_UseSkillH( sceneId, selfId )

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

	--���Լ�ʹ�ÿռ���....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893066_SkillID_H, selfId, x, z, 0, 1 )

	--����Ҽӽ�����ص��ű���buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x893066_BuffID_H, 0 )

	return 1

end


--**********************************
--ʹ��I����....
--**********************************
function x893066_UseSkillI( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893066_BuffID_I1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893066_BuffID_I2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893066_SkillID_I, selfId, x, z, 0, 1 )

	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_02}" )

	return 1

end


--**********************************
--���׺��̻���buff������ʱ��ص����ӿ�....
--**********************************
function x893066_OnImpactFadeOut( sceneId, selfId, impactId )

	--Ѱ��BOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x893066_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--û�ҵ��򷵻�....
	if bossId == -1 then
		return
	end

	--������̻���buff����BOSS����....
	if impactId == x893066_BuffID_H then
		MonsterTalk( sceneId, -1, "", "#{PMF_20080530_03}"..GetName( sceneId, selfId ).."#{PMF_20080530_04}" )
		return
	end

	--����ǰ��׵�buff....����BOSS����������Ҽ�һ���˺���buff������....
	if impactId == x893066_BuffID_F1 then

		CallScriptFunction((200060), "Paopao",sceneId, "Phan Tinh Tinh", "T� Tuy�t Trang", "Ch� � k�a "..GetName( sceneId, selfId )..", ng߽i �� tr�ng ph�i Tr�c �nh Di�u H�ng c�a T�n V�n. Mau r�i xa �i ng� n�u kh�ng s� �nh h߷ng t�i t�t c� th�nh vi�n ��..." )

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
				if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 16*16 then
					LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, x893066_BuffID_F2, 0 )
				end
			end
		end

		return

	end

end
