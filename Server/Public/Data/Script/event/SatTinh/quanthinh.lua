--Th�p nh� S�t Tinh
--Quan Th�nh
--Author: Ho�ng Steven

--******************--
x910106_g_ScriptId=910106
--******************--
x910106_g_Boss_Name="Quan Th�nh"																--T�n c�a BOSS
--******************--
x910106_g_Skill_Timer=1																			--Th�i gian k� n�ng Di�t Th� �ao Tr�n k�t h�p th�t minh to�n th�
--******************--
x910106_g_Skill_Vip=1315																		--K� n�ng Di�t Th� �ao Tr�n
x910106_g_Impact_Support=5983																	--Hi�u �ng th�t minh 10 gi�y
x910106_g_Skill_CD=30000																		--Th�i gian l�nh kh߾c c�a k� n�ng
x910106_g_Skill_Impact=9771																		--Hi�u �ng r�t 45% m�u n�u ��ng � kho�ng c�ch xa h�n 5m so v�i Boss
--******************--
x910106_g_Impact_Prepare=9777																	--�ang v�n kh�
--******************--
x910106_g_Skill_Distance_Affect=5																--Kho�ng c�ch t�i thi�u t� ch� ng߶i ch�i �n ch� Boss b� �nh h߷ng b�i k� n�ng Di�t Th� ��o Tr�n
--******************--
x910106_g_Monster_Dialogue={																	--L�i n�i c�a Boss
	[1]="D�m khi�u chi�n Quan Th�nh n�y, xem ra b�n l�nh c�ng kh�ng v�a. L�nh gi�o!",			--Boss khai chi�n
	[2]="Di�t th� chi tr�n, c�u t� nh�t sinh... C�c ng߽i ch�u ch�t �i!",						--Boss ra k� n�ng Di�t Th� �ao Tr�n
	[3]=x910106_g_Boss_Name.." �� v�o chi�n �u!",												--Boss v�o chi�n �u
	[4]="Xem ra ta qu� coi th߶ng c�c ng߽i. Kh� l�m...",										--Boss t� n�n
}
--******************--

--**********************************--
--*             On Init            *-- 
--**********************************--
function x910106_OnInit(sceneId,selfId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910106_g_Monster_Dialogue[1])								--C�u n�i khai chi�n c�a Boss
	x910106_GlobalNews(sceneId,x910106_g_Monster_Dialogue[3])									--Th�ng b�o Boss �� v�o chi�n �u cho to�n th� ng߶i ch�i
	x910106_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*         On Heart Beat          *--
--**********************************--
function x910106_OnHeartBeat(sceneId,selfId,nTick)												--H�m n�y s� check li�n t�c m�i mili gi�y khi n�o Boss c�n s�ng

	--******************--
	if LuaFnIsCharacterLiving(sceneId,selfId)~=1 then											--N�u Boss �� ch�t th� ng�ng ho�t �ng c�a Script
		return
	end
	--******************--
	local nCheck=x910106_CheckCondition(sceneId,selfId)											--Ki�m tra xem c� ng߶i ch�i n�o ��ng xung quanh boss kh�ng
	if nCheck==0 then
		x910106_ResetMyAI(sceneId,selfId)														--Set l�i c�c thu�c t�nh cho Boss
		return
	end
	--******************--
	x910106_UseMySkill(sceneId,selfId,nTick)													--Boss s� d�ng k� n�ng
	--******************--

end
--**********************************--
--*        Check Condition         *--
--**********************************--
function x910106_CheckCondition(sceneId,selfId,enmeyId)

	--******************--
	local Pos_x,Pos_y=GetWorldPos(sceneId,selfId)												--L�y t�a � hi�n t�i c�a Boss
	local PlayerList={}
	local nHumanCount=LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId=LuaFnGetCopyScene_HumanObjId(sceneId,i)
		local x,y=GetWorldPos(sceneId,nHumanId)													--L�y t�a � hi�n t�i c�a ng߶i ch�i
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=100 then						--N�u ng߶i ch�i v�n ��ng g�n Boss
			return 1
		end
	end
	--******************--
	return 0
	--******************--

end
--**********************************--
--*        On Enter Combat         *--
--**********************************--
function x910106_OnEnterCombat(sceneId,selfId,enmeyId)

	--******************--
	x910106_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*        On Leave Combat         *--
--**********************************--
function x910106_OnLeaveCombat(sceneId,selfId)

	--******************--
	x910106_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*       On Kill Character        *--
--**********************************--
function x910106_OnKillCharacter(sceneId,selfId,targetId)
	
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if nHumanId==targetId then
			local PlayerName=GetName(sceneId,targetId)
			MonsterTalk(sceneId,selfId,"","C�c h� l�m ta r�t th�t v�ng �� "..PlayerName.."...")	--Boss ch� di�u ng߶i ch�i b� gi�t
		end
	end
	--******************--
	
end
--**********************************--
--*             On Die             *--
--**********************************--
function x910106_OnDie(sceneId,selfId,killerId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910106_g_Monster_Dialogue[4])								--C�u n�i c�a Boss l�c ch�t
	--******************--
	local nBoss=LuaFnGetCopySceneData_Param(sceneId,22)											--Ki�m tra xem c� bao nhi�u Boss �ang chi�n �u
	LuaFnSetCopySceneData_Param(sceneId,22,nBoss-1)												--Gi�m s� Boss �ang chi�n �u xu�ng
	if nBoss-1==0 then
		LuaFnSetCopySceneData_Param(sceneId,16,30000)											--C�p nh�t th�i gian g�i Boss ti�p theo l� 30 gi�y
	end
	--******************--
	x910106_GiveAllHumanRank(sceneId,killerId)													--C�p nh�t rank cho ng߶i ch�i
	--******************--
	
end
--**********************************--
--*       Give All Human Rank      *--
--**********************************--
function x910106_GiveAllHumanRank(sceneId,killerId)

	--******************--
	local Team_Index=GetTeamId(sceneId,killerId)
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and GetTeamId(sceneId,nHumanId)==Team_Index then
			local Last_Time=GetMissionData(sceneId,nHumanId,SHENGSI_QUANTHINH)
			SetMissionData(sceneId,nHumanId,SHENGSI_QUANTHINH,Last_Time+1)						--C�p nh�t s� l�n th�ng Boss cho ng߶i ch�i
			BeginEvent(sceneId)
				AddText(sceneId,"S� l�n chi�n th�ng "..x910106_g_Boss_Name.." c�a c�c h� t�ng l�n "..(Last_Time+1).." l�n!")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nHumanId)
		end
	end
	--******************--

end
--**********************************--
--*          Reset My AI           *--
--**********************************--
function x910106_ResetMyAI(sceneId,selfId)

	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910106_g_Skill_Timer,x910106_g_Skill_CD)		--Th�i gian k� n�ng
	--******************--
	
end
--**********************************--
--*      Blind All My Enemies      *--
--**********************************--
function x910106_BlindAllMyEnemies(sceneId)

	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then
			LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910106_g_Impact_Support,0)--Ng߶i ch�i d�nh th�t minh
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index then													--N�u tr�n th� n�y �ang xu�t chi�n
				LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910106_g_Impact_Support,0)--Tr�n th� c�ng b� d�nh hi�u �ng th�t minh
				break
			end
		end
	end
	--******************--	
	
end
--**********************************--
--*          Use My Skill          *--
--**********************************--
function x910106_UseMySkill(sceneId,selfId,nTick)

	--******************--
	local Time_Skill=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910106_g_Skill_Timer)			--L�y th�i gian l�nh kh߾c k� n�ng c�a Boss
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910106_g_Skill_Timer,Time_Skill-nTick)			--C�p nh�t th�i gian l�nh kh߾c c�a k� n�ng
	if Time_Skill<=0 then
		x910106_UseSkill(sceneId,selfId)														--S� d�ng k� n�ng
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910106_g_Skill_Timer,x910106_g_Skill_CD)	--C�p nh�t l�i th�i gian l�nh kh߾c c�a k� n�ng
	elseif Time_Skill<=5000 and Time_Skill>4000 and LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910106_g_Impact_Prepare)<1 then
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910106_g_Impact_Prepare,0)	--Hi�u �ng v�n c�ng
		x910106_BlindAllMyEnemies(sceneId)														--G�y m� cho t�t c� ng߶i ch�i
	end
	--******************--
	
end
--**********************************--
--*           Use Skill            *--
--**********************************--
function x910106_UseSkill(sceneId,selfId)

	--******************--
	local x,y=GetWorldPos(sceneId,selfId)														--L�y t�a � c�a Boss
	LuaFnUnitUseSkill(sceneId,selfId,x910106_g_Skill_Vip,x,y,0,1)								--Boss s� d�ng k� n�ng qu�n th� Di�t Th� �ao Tr�n
	--******************--
	MonsterTalk(sceneId,selfId,"",x910106_g_Monster_Dialogue[2])								--Boss n�i khi xu�t chi�u
	--******************--
	local Pos_x,Pos_y=GetWorldPos(sceneId,selfId)												--L�y t�a � hi�n t�i c�a Boss
	local Human_List={}
	local nPlayer=0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		local x,y=GetWorldPos(sceneId,nHumanId)													--L�y t�a � hi�n t�i c�a ng߶i ch�i
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))>=x910106_g_Skill_Distance_Affect then--Ng߶i ch�i n�y kh�ng trong ph�m vi an to�n
			LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910106_g_Skill_Impact,0)--Nh�n hi�u �ng c�ng k�ch c�a Di�t Th� �ao Tr�n
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index then													--N�u tr�n th� n�y �ang xu�t chi�n
				local x,y=GetWorldPos(sceneId,Pet_Index)										--L�y t�a � c�a tr�n th� n�y
				if floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))>=x910106_g_Skill_Distance_Affect then--Tr�n th� trong v�ng k� n�ng
					LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910106_g_Skill_Impact,0)--Tr�n th� c�ng b� d�nh k� n�ng n�u kh�ng trong ph�m vi an to�n
				end
				break
			end
		end
	end
	--******************--
	
end
--**********************************--
--*           Global News          *--
--**********************************--
function x910106_GlobalNews(sceneId,Tips)

	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then
			BeginEvent(sceneId)
				AddText(sceneId,Tips)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nHumanId)
		end
	end
	--******************--

end