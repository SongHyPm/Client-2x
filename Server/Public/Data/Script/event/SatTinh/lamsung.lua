--Th�p nh� S�t Tinh
--L�m Sung
--Author: Ho�ng Steven

--******************--
x910109_g_ScriptId=910109
--******************--
x910109_g_Boss_Name="L�m Sung"																	--T�n c�a BOSS
--******************--
x910109_g_Skill_Timer=1																			--Th�i gian d�ng k� n�ng c�a Boss
--******************--
x910109_g_Buff_Reduce_Victim_Res=9762															--Buff gi�m B�ng kh�ng c�a m�c ti�u
x910109_g_Buff_Reduce_Self_Res=9775																--B�n th�n s� H�a c�ng
--******************--
x910109_g_Skill=1317																			--K� n�ng H�n B�ng Ch�n Kh�
x910109_g_Skill_CD=20000																		--Th�i gian l�nh kh߾c c�a k� n�ng
x910109_g_Skill_Impact=9763																		--Hi�u �ng t�ng B�ng c�ng
--******************--
x910109_g_Impact_Prepare=9777																	--�ang v�n kh�
--******************--
x910109_g_Skill_Distance_Affect=10																--Trong kho�ng c�ch n�y, ng߶i ch�i s� l�nh nh�n H�n B�ng Ch�n Kh�
--******************--
x910109_g_Monster_Dialogue={																	--L�i n�i c�a Boss
	[1]="C�c ng߽i ch�c mu�n n�m th� H�n B�ng Ch�n Kh� C�a ta ��y. Chu�n b� �� ��n �i!",		--Boss khai chi�n
	[2]="��y l� �a b�n c�a ta. B�t k� B�ng kh�ng n�o c�ng �u b� ta ph� v� c� th�i...!",		--Boss ra k� n�ng H�n B�ng Ch�n Kh�
	[3]=x910109_g_Boss_Name.." �� v�o chi�n �u!",												--Boss v�o chi�n �u
	[4]="A... C�c ng߽i... C�c ng߽i �� ph� v� H�n B�ng H� Th� c�a ta r�i. Ta...",				--Boss t� n�n
}
--******************--

--**********************************--
--*             On Init            *-- 
--**********************************--
function x910109_OnInit(sceneId,selfId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910109_g_Monster_Dialogue[1])								--C�u n�i khai chi�n c�a Boss
	x910109_GlobalNews(sceneId,x910109_g_Monster_Dialogue[3])									--Th�ng b�o Boss �� v�o chi�n �u cho to�n th� ng߶i ch�i
	x910109_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*         On Heart Beat          *--
--**********************************--
function x910109_OnHeartBeat(sceneId,selfId,nTick)												--H�m n�y s� check li�n t�c m�i mili gi�y khi n�o Boss c�n s�ng

	--******************--
	if LuaFnIsCharacterLiving(sceneId,selfId)~=1 then											--N�u Boss �� ch�t th� ng�ng ho�t �ng c�a Script
		return
	end
	--******************--
	local nCheck=x910109_CheckCondition(sceneId,selfId)											--Ki�m tra xem c� ng߶i ch�i n�o ��ng xung quanh boss kh�ng
	if nCheck==0 then
		x910109_ResetMyAI(sceneId,selfId)														--Set l�i c�c thu�c t�nh cho Boss
		return
	end
	--******************--
	x910109_ReduceAllEnemiesRest(sceneId)														--Gi�m kh�ng c�a t�t c� k� �ch xu�ng 100 �i�m
	--******************--
	x910109_UseMySkill(sceneId,selfId,nTick)													--Boss s� d�ng k� n�ng
	--******************--

end
--**********************************--
--*        Check Condition         *--
--**********************************--
function x910109_CheckCondition(sceneId,selfId,enmeyId)

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
function x910109_OnEnterCombat(sceneId,selfId,enmeyId)

	--******************--
	x910109_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910109_g_Buff_Reduce_Self_Res,0)--Gi�m kh�ng c�a b�n th�n
	--******************--

end
--**********************************--
--*        On Leave Combat         *--
--**********************************--
function x910109_OnLeaveCombat(sceneId,selfId)

	--******************--
	x910109_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*       On Kill Character        *--
--**********************************--
function x910109_OnKillCharacter(sceneId,selfId,targetId)
	
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if nHumanId==targetId then
			local PlayerName=GetName(sceneId,targetId)
			MonsterTalk(sceneId,selfId,"","C� b�n l� ng߽i kh�ng ch�u n�i H�n B�ng Ch�n Kh� ��u, "..PlayerName.."...")	--Boss ch� di�u ng߶i ch�i b� gi�t
		end
	end
	--******************--
	
end
--**********************************--
--*             On Die             *--
--**********************************--
function x910109_OnDie(sceneId,selfId,killerId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910109_g_Monster_Dialogue[4])								--C�u n�i c�a Boss l�c ch�t
	--******************--
	x910109_CancelAllImpacts(sceneId)
	--******************--
	local nBoss=LuaFnGetCopySceneData_Param(sceneId,22)											--Ki�m tra xem c� bao nhi�u Boss �ang chi�n �u
	LuaFnSetCopySceneData_Param(sceneId,22,nBoss-1)												--Gi�m s� Boss �ang chi�n �u xu�ng
	if nBoss-1==0 then
		LuaFnSetCopySceneData_Param(sceneId,16,30000)											--C�p nh�t th�i gian g�i Boss ti�p theo l� 30 gi�y
	end
	--******************--
	x910109_GiveAllHumanRank(sceneId,killerId)													--C�p nh�t rank cho ng߶i ch�i
	--******************--
	
end
--**********************************--
--*       Give All Human Rank      *--
--**********************************--
function x910109_GiveAllHumanRank(sceneId,killerId)

	--******************--
	local Team_Index=GetTeamId(sceneId,killerId)
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and GetTeamId(sceneId,nHumanId)==Team_Index then
			local Last_Time=GetMissionData(sceneId,nHumanId,SHENGSI_LAMSUNG)
			SetMissionData(sceneId,nHumanId,SHENGSI_LAMSUNG,Last_Time+1)						--C�p nh�t s� l�n th�ng Boss cho ng߶i ch�i
			BeginEvent(sceneId)
				AddText(sceneId,"S� l�n chi�n th�ng "..x910109_g_Boss_Name.." c�a c�c h� t�ng l�n "..(Last_Time+1).." l�n!")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nHumanId)
		end
	end
	--******************--

end
--**********************************--
--*          Reset My AI           *--
--**********************************--
function x910109_ResetMyAI(sceneId,selfId)

	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910109_g_Skill_Timer,x910109_g_Skill_CD)		--Th�i gian k� n�ng
	--******************--
	LuaFnCancelSpecificImpact(sceneId,selfId,x910109_g_Buff_Reduce_Self_Res)					--H�y b� hi�u �ng gi�m kh�ng c�a b�n th�n
	--******************--
	
end
--**********************************--
--*       Cancel All Impacts       *--
--**********************************--
function x910109_CancelAllImpacts(sceneId)

	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and LuaFnHaveImpactOfSpecificDataIndex(sceneId,nHumanId,x910109_g_Buff_Reduce_Victim_Res)>=1 then
			LuaFnCancelSpecificImpact(sceneId,nHumanId,x910109_g_Buff_Reduce_Victim_Res,0)		--Ng߶i ch�i b� gi�m kh�ng
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index and LuaFnHaveImpactOfSpecificDataIndex(sceneId,Pet_Index,x910109_g_Buff_Reduce_Victim_Res)>=1 then												--N�u tr�n th� n�y �ang xu�t chi�n
				LuaFnCancelSpecificImpact(sceneId,Pet_Index,x910109_g_Buff_Reduce_Victim_Res,0)	--Tr�n th� b� gi�m kh�ng
				break
			end
		end
	end
	--******************--
	
end
--**********************************--
--*    Reduce All Enemies Rest     *--
--**********************************--
function x910109_ReduceAllEnemiesRest(sceneId,selfId)

	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and LuaFnHaveImpactOfSpecificDataIndex(sceneId,nHumanId,x910109_g_Buff_Reduce_Victim_Res)<1 then--Ng߶i ch�i n�y ch�a c� tr�ng th�i gi�m kh�ng
			LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910109_g_Buff_Reduce_Victim_Res,0)--Ng߶i ch�i b� gi�m kh�ng
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index and LuaFnHaveImpactOfSpecificDataIndex(sceneId,Pet_Index,x910109_g_Buff_Reduce_Victim_Res)<1 then													--N�u tr�n th� n�y �ang xu�t chi�n
				LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910109_g_Buff_Reduce_Victim_Res,0)--Tr�n th� b� gi�m kh�ng
				break
			end
		end
	end
	--******************--
	
end
--**********************************--
--*          Use My Skill          *--
--**********************************--
function x910109_UseMySkill(sceneId,selfId,nTick)

	--******************--
	local Time_Skill=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910109_g_Skill_Timer)			--L�y th�i gian l�nh kh߾c k� n�ng c�a Boss
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910109_g_Skill_Timer,Time_Skill-nTick)			--C�p nh�t th�i gian l�nh kh߾c c�a k� n�ng
	if Time_Skill<=0 then																		--�� �n gi� d�ng k� n�ng
		x910109_UseSkill(sceneId,selfId)														--S� d�ng k� n�ng
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910109_g_Skill_Timer,x910109_g_Skill_CD)	--C�p nh�t l�i th�i gian l�nh kh߾c c�a k� n�ng
	elseif Time_Skill<=5000 and Time_Skill>4000 and LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910109_g_Impact_Prepare)<1 then--Ъn th�i gian v�n c�ng
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910109_g_Impact_Prepare,0)	--Hi�u �ng v�n c�ng
	end
	--******************--
	
end
--**********************************--
--*           Use Skill            *--
--**********************************--
function x910109_UseSkill(sceneId,selfId)

	--******************--
	local x,y=GetWorldPos(sceneId,selfId)														--L�y t�a � c�a Boss
	LuaFnUnitUseSkill(sceneId,selfId,x910109_g_Skill,x,y,0,1)									--Boss s� d�ng k� n�ng
	--******************--
	MonsterTalk(sceneId,selfId,"",x910109_g_Monster_Dialogue[2])								--Boss n�i khi xu�t chi�u
	--******************--
	local Pos_x,Pos_y=GetWorldPos(sceneId,selfId)												--L�y t�a � hi�n t�i c�a Boss
	local Human_List={}
	local nPlayer=0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	--******************--
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		local x,y=GetWorldPos(sceneId,nHumanId)													--L�y t�a � hi�n t�i c�a ng߶i ch�i
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=x910109_g_Skill_Distance_Affect then--Ng߶i ch�i n�y kh�ng trong ph�m vi an to�n
			LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910109_g_Skill_Impact,0)--Nh�n hi�u �ng c�ng k�ch k� n�ng
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index then													--N�u tr�n th� n�y �ang xu�t chi�n
				local x,y=GetWorldPos(sceneId,Pet_Index)										--L�y t�a � c�a tr�n th� n�y
				if floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=x910109_g_Skill_Distance_Affect then--Tr�n th� trong v�ng k� n�ng
					LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910109_g_Skill_Impact,0)--Tr�n th� c�ng b� d�nh k� n�ng n�u trong v�ng k� n�ng �nh h߷ng
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
function x910109_GlobalNews(sceneId,Tips)

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