--Th�p nh� S�t Tinh
--T�ng Kh߽ng
--Author: Ho�ng Steven

--******************--
x910107_g_ScriptId=910107
--******************--
x910107_g_Boss_Name="T�ng Kh߽ng"																--T�n c�a BOSS
--******************--
x910107_g_Skill_Timer=1																			--Th�i gian k� n�ng Y�u Tinh T� Ngh�a k�t h�p Thi�n H�ng Ngh�ch Chuy�n v� ma t� to�n th�
x910107_g_System_Notice=2																		--Th�i gian k� n�ng Y�u Tinh T� Ngh�a k�t h�p Thi�n H�ng Ngh�ch Chuy�n v� ma t� to�n th�
--******************--
x910107_g_Skill_Vip_1=1305																		--K� n�ng Y�u Tinh T� Ngh�a (-40% HP)
x910107_g_Skill_Vip_2=1306																		--K� n�ng Thi�n H�ng Ngh�ch Chuy�n (-45% HP)
x910107_g_Skill_Vip_3=1311																		--K� n�ng S�t Kh� B�c Ph�t
x910107_g_Impact_Support=9403																	--Hi�u �ng ma t� 5s
x910107_g_Skill_CD=40000																		--Th�i gian l�nh kh߾c c�a k� n�ng
x910107_g_Skill_Impact_1=9771																	--Hi�u �ng r�t 45% m�u n�u ��ng � kho�ng c�ch d߾i 30m so v�i Boss
x910107_g_Skill_Impact_2=9774																	--Hi�u �ng r�t 40% m�u
x910107_g_Skill_Impact_3=9755																	--Hi�u �ng r�t 20% m�u n�u c� tr�n th� xu�t chi�n
--******************--
x910107_g_Impact_Prepare=9777																	--�ang v�n kh�
--******************--
x910107_g_Skill_Distance_Affect=20																--Trong kho�ng c�ch n�y, ng߶i ch�i s� l�nh nh�n Y�u Tinh T� Ngh�a �ng th�i nh�n th�m Thi�n H�ng Ngh�ch Chuy�n (T�ng c�ng m�t 85% HP)
--******************--
x910107_g_Monster_Dialogue={																	--L�i n�i c�a Boss
	[1]="H�i �a ng�c y�u ma, c�c ng߽i h�y c�ng ta d�y cho l� ��ng gh�t n�y m�t tr�n!",		--Boss khai chi�n
	[2]="Y�u tinh thi�n h�ng, y�u ma b�c ph�t. C�c ng߽i h�y n�m th� k� n�ng �c � c�a ta ��y!",--Boss ra k� n�ng Y�u Tinh T� Ngh�a + Thi�n H�ng Ngh�ch Chuy�n + S�t Kh� B�c Ph�t
	[3]=x910107_g_Boss_Name.." �� v�o chi�n �u!",												--Boss v�o chi�n �u
	[4]="H�i �a ng�c y�u ma, c�c ng߽i h�y b�o th� cho ta...",									--Boss t� n�n
	[5]="H�y thu h�i t�t c� tr�n th� v� nhanh ch�ng ch�y ra kh�i v�ng �nh h߷ng c�a k� n�ng Thi�n H�ng Ngh�ch Chuy�n v� S�t Kh� B�c Ph�t n�u c�c h� c�n mu�n s�ng...",--H� th�ng nh�c nh� ng߶i ch�i
}
--******************--

--**********************************--
--*             On Init            *-- 
--**********************************--
function x910107_OnInit(sceneId,selfId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910107_g_Monster_Dialogue[1])								--C�u n�i khai chi�n c�a Boss
	x910107_GlobalNews(sceneId,x910107_g_Monster_Dialogue[3])									--Th�ng b�o Boss �� v�o chi�n �u cho to�n th� ng߶i ch�i
	x910107_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*         On Heart Beat          *--
--**********************************--
function x910107_OnHeartBeat(sceneId,selfId,nTick)												--H�m n�y s� check li�n t�c m�i mili gi�y khi n�o Boss c�n s�ng

	--******************--
	if LuaFnIsCharacterLiving(sceneId,selfId)~=1 then											--N�u Boss �� ch�t th� ng�ng ho�t �ng c�a Script
		return
	end
	--******************--
	local nCheck=x910107_CheckCondition(sceneId,selfId)											--Ki�m tra xem c� ng߶i ch�i n�o ��ng xung quanh boss kh�ng
	if nCheck==0 then
		x910107_ResetMyAI(sceneId,selfId)
		return
	end
	--******************--
	x910107_UseMySkill(sceneId,selfId,nTick)													--Boss s� d�ng k� n�ng
	--******************--

end
--**********************************--
--*        Check Condition         *--
--**********************************--
function x910107_CheckCondition(sceneId,selfId,enmeyId)

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
function x910107_OnEnterCombat(sceneId,selfId,enmeyId)

	--******************--
	x910107_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*        On Leave Combat         *--
--**********************************--
function x910107_OnLeaveCombat(sceneId,selfId)

	--******************--
	x910107_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*       On Kill Character        *--
--**********************************--
function x910107_OnKillCharacter(sceneId,selfId,targetId)
	
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if nHumanId==targetId then
			local PlayerName=GetName(sceneId,targetId)
			MonsterTalk(sceneId,selfId,"","Ng߽i ch�t l� ��ng �i l�m, "..PlayerName.."...")	--Boss ch� di�u ng߶i ch�i b� gi�t
		end
	end
	--******************--
	
end
--**********************************--
--*             On Die             *--
--**********************************--
function x910107_OnDie(sceneId,selfId,killerId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910107_g_Monster_Dialogue[4])								--C�u n�i c�a Boss l�c ch�t
	--******************--
	local nBoss=LuaFnGetCopySceneData_Param(sceneId,22)											--Ki�m tra xem c� bao nhi�u Boss �ang chi�n �u
	LuaFnSetCopySceneData_Param(sceneId,22,nBoss-1)												--Gi�m s� Boss �ang chi�n �u xu�ng
	if nBoss-1==0 then
		LuaFnSetCopySceneData_Param(sceneId,16,30000)											--C�p nh�t th�i gian g�i Boss ti�p theo l� 30 gi�y
	end
	--******************--
	x910107_GiveAllHumanRank(sceneId,killerId)													--C�p nh�t rank cho ng߶i ch�i
	--******************--
	
end
--**********************************--
--*       Give All Human Rank      *--
--**********************************--
function x910107_GiveAllHumanRank(sceneId,killerId)

	--******************--
	local Team_Index=GetTeamId(sceneId,killerId)
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and GetTeamId(sceneId,nHumanId)==Team_Index then
			local Last_Time=GetMissionData(sceneId,nHumanId,SHENGSI_TONGKHUONG)
			SetMissionData(sceneId,nHumanId,SHENGSI_TONGKHUONG,Last_Time+1)						--C�p nh�t s� l�n th�ng Boss cho ng߶i ch�i
			BeginEvent(sceneId)
				AddText(sceneId,"S� l�n chi�n th�ng "..x910107_g_Boss_Name.." c�a c�c h� t�ng l�n "..(Last_Time+1).." l�n!")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nHumanId)
		end
	end
	--******************--

end
--**********************************--
--*          Reset My AI           *--
--**********************************--
function x910107_ResetMyAI(sceneId,selfId)

	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910107_g_Skill_Timer,x910107_g_Skill_CD)		--Th�i gian k� n�ng
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910107_g_System_Notice,0)						--Th�i gian k� n�ng
	--******************--
	
end
--**********************************--
--*       Lock All My Enemies      *--
--**********************************--
function x910107_LockAllMyEnemies(sceneId)

	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then
			LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910107_g_Impact_Support,0)--Ng߶i ch�i d�nh th�t minh
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index then													--N�u tr�n th� n�y �ang xu�t chi�n
				LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910107_g_Impact_Support,0)--Tr�n th� c�ng b� d�nh hi�u �ng th�t minh
				break
			end
		end
	end
	--******************--	
	
end
--**********************************--
--*          Use My Skill          *--
--**********************************--
function x910107_UseMySkill(sceneId,selfId,nTick)

	--******************--
	local Time_Skill=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910107_g_Skill_Timer)			--L�y th�i gian l�nh kh߾c k� n�ng c�a Boss
	local System_Notice=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910107_g_System_Notice)	--Ki�m tra xem h� th�ng �� th�ng b�o tr߾c khi Boss ra k� n�ng ch�a
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910107_g_Skill_Timer,Time_Skill-nTick)			--C�p nh�t th�i gian l�nh kh߾c c�a k� n�ng
	if Time_Skill<=0 then																		--�� �n gi� d�ng k� n�ng
		x910107_UseSkill(sceneId,selfId)														--S� d�ng k� n�ng
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910107_g_Skill_Timer,x910107_g_Skill_CD)	--C�p nh�t l�i th�i gian l�nh kh߾c c�a k� n�ng
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910107_g_System_Notice,0)					--C�p nh�t h� th�ng ch�a th�ng b�o
	elseif Time_Skill>5000 and Time_Skill<=7000 and System_Notice==0 then						--H� th�ng th�ng b�o tr߾c 2 gi�y tr߾c khi ng߶i ch�i b� Boss phong b� huy�t ��o
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910107_g_System_Notice,1)					--C�p nh�t h� th�ng �� th�ng b�o
		x910107_GlobalNews(sceneId,x910107_g_Monster_Dialogue[5])								--Ghi th�ng b�o cho t�t c� ng߶i ch�i
	elseif Time_Skill<=5000 and Time_Skill>4000 and LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910107_g_Impact_Prepare)<1 then--Ъn th�i gian v�n c�ng
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910107_g_Impact_Prepare,0)	--Hi�u �ng v�n c�ng
		x910107_LockAllMyEnemies(sceneId)														--G�y ma t� cho t�t c� ng߶i ch�i
	end
	--******************--
	
end
--**********************************--
--*           Use Skill            *--
--**********************************--
function x910107_UseSkill(sceneId,selfId)

	--******************--
	local x,y=GetWorldPos(sceneId,selfId)														--L�y t�a � c�a Boss
	LuaFnUnitUseSkill(sceneId,selfId,x910107_g_Skill_Vip_1,x,y,0,1)								--Boss s� d�ng k� n�ng qu�n th� Y�u Tinh T� Ngh�a
	LuaFnUnitUseSkill(sceneId,selfId,x910107_g_Skill_Vip_2,x,y,0,1)								--Boss s� d�ng k� n�ng qu�n th� Thi�n H�ng Ngh�ch Chuy�n
	LuaFnUnitUseSkill(sceneId,selfId,x910107_g_Skill_Vip_3,x,y,0,1)								--Boss s� d�ng k� n�ng qu�n th� S�t Kh� B�c Ph�t
	--******************--
	MonsterTalk(sceneId,selfId,"",x910107_g_Monster_Dialogue[2])								--Boss n�i khi xu�t chi�u
	--******************--
	local Pos_x,Pos_y=GetWorldPos(sceneId,selfId)												--L�y t�a � hi�n t�i c�a Boss
	local Human_List={}
	local nPlayer=0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	--******************--
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then--Ng߶i ch�i nh�n hi�u qu� c�a Y�u Tinh T� Ngh�a
			LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910107_g_Skill_Impact_2,0)--Nh�n hi�u �ng c�ng k�ch c�a Y�u Tinh T� Ngh�a
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index then													--N�u tr�n th� n�y �ang xu�t chi�n
				LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910107_g_Skill_Impact_2,0)--Tr�n th� b� d�nh Y�u Tinh T� Ngh�a
				LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910107_g_Skill_Impact_3,0)--Tr�n th� d�nh th�m S�t Kh� B�c Ph�t
				LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910107_g_Skill_Impact_3,0)--Ng߶i ch�i d�nh th�m S�t Kh� B�c Ph�t
				break
			end
		end
	end
	--******************--
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		local x,y=GetWorldPos(sceneId,nHumanId)													--L�y t�a � hi�n t�i c�a ng߶i ch�i
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=x910107_g_Skill_Distance_Affect then--Ng߶i ch�i n�y kh�ng trong ph�m vi an to�n
			LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910107_g_Skill_Impact_1,0)--Nh�n hi�u �ng c�ng k�ch c�a Thi�n H�ng Ngh�ch Chuy�n
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index then													--N�u tr�n th� n�y �ang xu�t chi�n
				local x,y=GetWorldPos(sceneId,Pet_Index)										--L�y t�a � c�a tr�n th� n�y
				if floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=x910107_g_Skill_Distance_Affect then--Tr�n th� trong v�ng k� n�ng
					LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910107_g_Skill_Impact_1,0)--Tr�n th� c�ng b� d�nh k� n�ng n�u trong v�ng k� n�ng �nh h߷ng
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
function x910107_GlobalNews(sceneId,Tips)

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