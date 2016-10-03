--Th�p nh� S�t Tinh
--V� T�ng
--Author: Ho�ng Steven

--******************--
x910111_g_ScriptId=910111
--******************--
x910111_g_Boss_Name="V� T�ng"																	--T�n c�a BOSS
--******************--
x910111_g_Skill_Timer=1																			--Th�i gian d�ng k� n�ng c�a Boss
--******************--
x910111_g_Buff_Reduce_Victim_Res=9775															--Buff gi�m H�a kh�ng c�a m�c ti�u
x910111_g_Buff_Reduce_Self_Res=9762																--B�n th�n s� B�ng c�ng
--******************--
x910111_g_Skill=1319																			--K� n�ng H�a Thi�u ��i Danh Ph�
x910111_g_Skill_CD=20000																		--Th�i gian l�nh kh߾c c�a k� n�ng
x910111_g_Skill_Impact=9776																		--Hi�u �ng t�ng H�a c�ng
--******************--
x910111_g_Impact_Prepare=9777																	--�ang v�n kh�
--******************--
x910111_g_Skill_Distance_Affect=10																--Trong kho�ng c�ch n�y, ng߶i ch�i s� l�nh nh�n H�a Thi�u ��i Danh Ph�
--******************--
x910111_g_Monster_Dialogue={																	--L�i n�i c�a Boss
	[1]="Kh�ng bi�t ��u ra m�y ��a con n�t mi�ng c�n h�i s�a n�y nh�. Xem ra ta ph�i ra m�t d�y cho ch�ng m�t tr�n nh� �i ��y!",--Boss khai chi�n
	[2]="�... C�ng c� ch�t b�n l�nh. N�m th� m�i v� c�a H�a Thi�u ��i Danh Ph� �i!",			--Boss ra k� n�ng H�a Thi�u ��i Danh Ph�
	[3]=x910111_g_Boss_Name.." �� v�o chi�n �u!",												--Boss v�o chi�n �u
	[4]="Ta �� b� ��nh b�i r�i sao? Li�t H�a иa Ng�c, c�c ng߽i h�y c�u ta...",				--Boss t� n�n
}
--******************--

--**********************************--
--*             On Init            *-- 
--**********************************--
function x910111_OnInit(sceneId,selfId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910111_g_Monster_Dialogue[1])								--C�u n�i khai chi�n c�a Boss
	x910111_GlobalNews(sceneId,x910111_g_Monster_Dialogue[3])									--Th�ng b�o Boss �� v�o chi�n �u cho to�n th� ng߶i ch�i
	x910111_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*         On Heart Beat          *--
--**********************************--
function x910111_OnHeartBeat(sceneId,selfId,nTick)												--H�m n�y s� check li�n t�c m�i mili gi�y khi n�o Boss c�n s�ng

	--******************--
	if LuaFnIsCharacterLiving(sceneId,selfId)~=1 then											--N�u Boss �� ch�t th� ng�ng ho�t �ng c�a Script
		return
	end
	--******************--
	local nCheck=x910111_CheckCondition(sceneId,selfId)											--Ki�m tra xem c� ng߶i ch�i n�o ��ng xung quanh boss kh�ng
	if nCheck==0 then
		x910111_ResetMyAI(sceneId,selfId)
		return
	end
	--******************--
	x910111_ReduceAllEnemiesRest(sceneId)														--Gi�m kh�ng c�a t�t c� k� �ch xu�ng 100 �i�m
	--******************--
	x910111_UseMySkill(sceneId,selfId,nTick)													--Boss s� d�ng k� n�ng
	--******************--

end
--**********************************--
--*        Check Condition         *--
--**********************************--
function x910111_CheckCondition(sceneId,selfId,enmeyId)

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
function x910111_OnEnterCombat(sceneId,selfId,enmeyId)

	--******************--
	x910111_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910111_g_Buff_Reduce_Self_Res,0)--Gi�m kh�ng c�a b�n th�n
	--******************--

end
--**********************************--
--*        On Leave Combat         *--
--**********************************--
function x910111_OnLeaveCombat(sceneId,selfId)

	--******************--
	x910111_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*       On Kill Character        *--
--**********************************--
function x910111_OnKillCharacter(sceneId,selfId,targetId)
	
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if nHumanId==targetId then
			local PlayerName=GetName(sceneId,targetId)
			MonsterTalk(sceneId,selfId,"","�i ta l� tay r�i, "..PlayerName.." ng߽i tha th� cho ta ���c kh�ng. Ta kh�ng mu�n mang ti�ng b�t n�t con n�t ��u...")	--Boss ch� di�u ng߶i ch�i b� gi�t
		end
	end
	--******************--
	
end
--**********************************--
--*             On Die             *--
--**********************************--
function x910111_OnDie(sceneId,selfId,killerId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910111_g_Monster_Dialogue[4])								--C�u n�i c�a Boss l�c ch�t
	--******************--
	x910111_CancelAllImpacts(sceneId)
	--******************--
	local nBoss=LuaFnGetCopySceneData_Param(sceneId,22)											--Ki�m tra xem c� bao nhi�u Boss �ang chi�n �u
	LuaFnSetCopySceneData_Param(sceneId,22,nBoss-1)												--Gi�m s� Boss �ang chi�n �u xu�ng
	if nBoss-1==0 then
		LuaFnSetCopySceneData_Param(sceneId,16,30000)											--C�p nh�t th�i gian g�i Boss ti�p theo l� 30 gi�y
	end
	--******************--
	x910111_GiveAllHumanRank(sceneId,killerId)													--C�p nh�t rank cho ng߶i ch�i
	--******************--
	
end
--**********************************--
--*       Give All Human Rank      *--
--**********************************--
function x910111_GiveAllHumanRank(sceneId,killerId)

	--******************--
	local Team_Index=GetTeamId(sceneId,killerId)
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and GetTeamId(sceneId,nHumanId)==Team_Index then
			local Last_Time=GetMissionData(sceneId,nHumanId,SHENGSI_VOTUNG)
			SetMissionData(sceneId,nHumanId,SHENGSI_VOTUNG,Last_Time+1)							--C�p nh�t s� l�n th�ng Boss cho ng߶i ch�i
			BeginEvent(sceneId)
				AddText(sceneId,"S� l�n chi�n th�ng "..x910111_g_Boss_Name.." c�a c�c h� t�ng l�n "..(Last_Time+1).." l�n!")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nHumanId)
		end
	end
	--******************--

end
--**********************************--
--*          Reset My AI           *--
--**********************************--
function x910111_ResetMyAI(sceneId,selfId)

	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910111_g_Skill_Timer,x910111_g_Skill_CD)		--Th�i gian k� n�ng
	--******************--
	LuaFnCancelSpecificImpact(sceneId,selfId,x910111_g_Buff_Reduce_Self_Res)					--H�y b� hi�u �ng gi�m kh�ng c�a b�n th�n
	--******************--
	
end
--**********************************--
--*       Cancel All Impacts       *--
--**********************************--
function x910111_CancelAllImpacts(sceneId)

	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and LuaFnHaveImpactOfSpecificDataIndex(sceneId,nHumanId,x910111_g_Buff_Reduce_Victim_Res)>=1 then
			LuaFnCancelSpecificImpact(sceneId,nHumanId,x910111_g_Buff_Reduce_Victim_Res,0)		--Ng߶i ch�i b� gi�m kh�ng
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index and LuaFnHaveImpactOfSpecificDataIndex(sceneId,Pet_Index,x910111_g_Buff_Reduce_Victim_Res)>=1 then												--N�u tr�n th� n�y �ang xu�t chi�n
				LuaFnCancelSpecificImpact(sceneId,Pet_Index,x910111_g_Buff_Reduce_Victim_Res,0)	--Tr�n th� b� gi�m kh�ng
				break
			end
		end
	end
	--******************--
	
end
--**********************************--
--*    Reduce All Enemies Rest     *--
--**********************************--
function x910111_ReduceAllEnemiesRest(sceneId,selfId)

	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and LuaFnHaveImpactOfSpecificDataIndex(sceneId,nHumanId,x910111_g_Buff_Reduce_Victim_Res)<1 then--Ng߶i ch�i n�y ch�a c� tr�ng th�i gi�m kh�ng
			LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910111_g_Buff_Reduce_Victim_Res,0)--Ng߶i ch�i b� gi�m kh�ng
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index and LuaFnHaveImpactOfSpecificDataIndex(sceneId,Pet_Index,x910111_g_Buff_Reduce_Victim_Res)<1 then													--N�u tr�n th� n�y �ang xu�t chi�n
				LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910111_g_Buff_Reduce_Victim_Res,0)--Tr�n th� b� gi�m kh�ng
				break
			end
		end
	end
	--******************--
	
end
--**********************************--
--*          Use My Skill          *--
--**********************************--
function x910111_UseMySkill(sceneId,selfId,nTick)

	--******************--
	local Time_Skill=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910111_g_Skill_Timer)			--L�y th�i gian l�nh kh߾c k� n�ng c�a Boss
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910111_g_Skill_Timer,Time_Skill-nTick)			--C�p nh�t th�i gian l�nh kh߾c c�a k� n�ng
	if Time_Skill<=0 then																		--�� �n gi� d�ng k� n�ng
		x910111_UseSkill(sceneId,selfId)														--S� d�ng k� n�ng
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910111_g_Skill_Timer,x910111_g_Skill_CD)	--C�p nh�t l�i th�i gian l�nh kh߾c c�a k� n�ng
	elseif Time_Skill<=5000 and Time_Skill>4000 and LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910111_g_Impact_Prepare)<1 then--Ъn th�i gian v�n c�ng
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910111_g_Impact_Prepare,0)	--Hi�u �ng v�n c�ng
	end
	--******************--
	
end
--**********************************--
--*           Use Skill            *--
--**********************************--
function x910111_UseSkill(sceneId,selfId)

	--******************--
	local x,y=GetWorldPos(sceneId,selfId)														--L�y t�a � c�a Boss
	LuaFnUnitUseSkill(sceneId,selfId,x910111_g_Skill,x,y,0,1)									--Boss s� d�ng k� n�ng
	--******************--
	MonsterTalk(sceneId,selfId,"",x910111_g_Monster_Dialogue[2])								--Boss n�i khi xu�t chi�u
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
		and floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=x910111_g_Skill_Distance_Affect then--Ng߶i ch�i n�y kh�ng trong ph�m vi an to�n
			LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910111_g_Skill_Impact,0)--Nh�n hi�u �ng c�ng k�ch k� n�ng
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index then													--N�u tr�n th� n�y �ang xu�t chi�n
				local x,y=GetWorldPos(sceneId,Pet_Index)										--L�y t�a � c�a tr�n th� n�y
				if floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=x910111_g_Skill_Distance_Affect then--Tr�n th� trong v�ng k� n�ng
					LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910111_g_Skill_Impact,0)--Tr�n th� c�ng b� d�nh k� n�ng n�u trong v�ng k� n�ng �nh h߷ng
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
function x910111_GlobalNews(sceneId,Tips)

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