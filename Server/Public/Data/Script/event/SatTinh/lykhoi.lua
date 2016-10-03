--Th�p nh� S�t Tinh
--L� Kh�i
--Author: Ho�ng Steven

--******************--
x910103_g_ScriptId=910103
--******************--
x910103_g_Boss_Name="L� Kh�i"																	--T�n c�a BOSS
--******************--
x910103_g_Poison_Timer=1																		--Th�i gian gi�a 2 l�n li�n ti�p g�y s�t kh� �n d�ch
x910103_g_Poison_Last_Time_Actived=2															--Th�i gian s�t kh� �n d�ch l�n tr߾c ph�t n�
x910103_g_Poison_Victim=3																		--M�c ti�u b� d�nh s�t kh� �n d�ch
x910103_g_Skill_Timer=4																			--Th�i gian l�nh kh߾c k� n�ng chi�n �u c�a Boss
--******************--
x910103_g_Poison_Time_Actived=2000																--Kho�ng c�ch gi�a 2 l�n ph�t t�c kh� �c
x910103_g_Poison_Skill=1310																		--K� n�ng �n d�ch
x910103_g_Poison_Active_Impact=9754																--Hi�u �ng khi �n d�ch ph�t t�c
x910103_g_Poison_Impact=9753																	--Hi�u �ng b� d�nh s�t kh� �n d�ch
x910103_g_Poison_Distance_Time=60000															--Kho�ng c�ch gi�a 2 l�n g�y �n d�ch l�n ng߶i ch�i b�t k�
--******************--
x910103_g_Skill_Index=1314																		--K� n�ng c�ng k�ch ph� c�a Boss
x910103_g_Skill_CD=20000																		--Th�i gian ph�c h�i k� n�ng n�y
x910103_g_Skill_Distance_Affect=10																--Kho�ng c�ch b� d�nh k� n�ng qu�n th�
x910103_g_Skill_Impact=9779																		--Hi�u �ng c�a k� n�ng
--******************--
x910103_g_Impact_Prepare=9777																	--�ang v�n kh�
--******************--
x910103_g_Monster_Dialogue={																	--L�i n�i c�a Boss
	[1]="Ta ��y h�nh t�u giang h� �� nhi�u n�m, nh�ng ch�a th�y t�n n�o l� m�n nh� c�c ng߽i. Ь ta d�y cho c�c ng߽i m�t b�i h�c cho bi�t m�i �i...",--Boss khai chi�n
	[2]="Ha ha... C�c ng߽i h�y c�ng nhau chia s� th߽ng �au v�i %s �i",						--Boss g�y s�t kh� �n d�ch l�n ng߶i ch�i b�t k�
	[3]=x910103_g_Boss_Name.." �� v�o chi�n �u!",												--Boss v�o chi�n �u
	[4]="C�c ng߶i kh� l�m, th�ng ���c S�t Kh� �n D�ch c�a ta. Nh�ng xem ra c�c ng߽i ch� g�p may th�i",--Boss t� n�n
	[5]="C�c ng߶i h�y n�m m�i k� n�ng Sinh M�n h� th�c c�a ta...",								--Boss ra k� n�ng Sinh M�n
}
--******************--

--**********************************--
--*             On Init            *-- 
--**********************************--
function x910103_OnInit(sceneId,selfId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910103_g_Monster_Dialogue[1])								--C�u n�i khai chi�n c�a Boss
	x910103_GlobalNews(sceneId,x910103_g_Monster_Dialogue[3])									--Th�ng b�o Boss �� v�o chi�n �u cho to�n th� ng߶i ch�i
	x910103_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*         On Heart Beat          *--
--**********************************--
function x910103_OnHeartBeat(sceneId,selfId,nTick)												--H�m n�y s� check li�n t�c m�i mili gi�y khi n�o Boss c�n s�ng

	--******************--
	if LuaFnIsCharacterLiving(sceneId,selfId)~=1 then											--N�u Boss �� ch�t th� ng�ng ho�t �ng c�a Script
		return
	end
	--******************--
	local nCheck=x910103_CheckCondition(sceneId,selfId)											--Ki�m tra xem c� ng߶i ch�i n�o ��ng xung quanh boss kh�ng
	if nCheck==0 then
		x910103_ResetMyAI(sceneId,selfId)														--Set l�i c�c thu�c t�nh cho Boss
		return
	end
	--******************--
	x910103_UseMySkill(sceneId,selfId,nTick)													--Boss s� d�ng k� n�ng
	--******************--
	local nTime=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910103_g_Poison_Last_Time_Actived)	--Th�i gian ph�t t�c �n d�ch c�n l�i
	if nTime>0 then
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910103_g_Poison_Last_Time_Actived,nTime-nTick)--C�p nh�t th�i gian cho l�n b�c ph�t s�p t�i
	else
		x910103_ActiveMyPoison(sceneId,selfId)													--K�ch n� s�c kh� �n d�ch
	end
	--******************--
	local Poison_Time=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910103_g_Poison_Timer)		--Th�i gian c�n l�i thi tri�n �n d�ch l�n m�c ti�u b�t k�
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910103_g_Poison_Timer,Poison_Time-nTick)		--C�p nh�t th�i gian g�y �n d�ch
	if Poison_Time<=0 then
		x910103_UseMyPoisonToARandomVictim(sceneId,selfId)										--S� d�ng �n d�ch l�n m�c ti�u ng�u nhi�n
	end
	--******************--

end
--**********************************--
--*        Check Condition         *--
--**********************************--
function x910103_CheckCondition(sceneId,selfId,enmeyId)

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
function x910103_OnEnterCombat(sceneId,selfId,enmeyId)

	--******************--
	x910103_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*        On Leave Combat         *--
--**********************************--
function x910103_OnLeaveCombat(sceneId,selfId)

	--******************--
	x910103_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*       On Kill Character        *--
--**********************************--
function x910103_OnKillCharacter(sceneId,selfId,targetId)
	
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if nHumanId==targetId then
			local PlayerName=GetName(sceneId,targetId)
			MonsterTalk(sceneId,selfId,"","C�ng c� ch�t b�n l�nh nh�ng xem ra v�n kh�ng �� nh� c�i l�ng ch�n c�a ta ��u "..PlayerName.."...")	--Boss ch� di�u ng߶i ch�i b� gi�t
		end
	end
	--******************--
	
end
--**********************************--
--*             On Die             *--
--**********************************--
function x910103_OnDie(sceneId,selfId,killerId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910103_g_Monster_Dialogue[4])								--C�u n�i c�a Boss l�c ch�t
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then
			LuaFnCancelSpecificImpact(sceneId,nHumanId,x910103_g_Poison_Impact)					--X�a b� hi�u �ng �n d�ch tr�n ng߶i ch�i
		end
	end
	--******************--
	local nBoss=LuaFnGetCopySceneData_Param(sceneId,22)											--Ki�m tra xem c� bao nhi�u Boss �ang chi�n �u
	LuaFnSetCopySceneData_Param(sceneId,22,nBoss-1)												--Gi�m s� Boss �ang chi�n �u xu�ng
	if nBoss-1==0 then
		LuaFnSetCopySceneData_Param(sceneId,16,30000)											--C�p nh�t th�i gian g�i Boss ti�p theo l� 30 gi�y
	end
	--******************--
	x910103_GiveAllHumanRank(sceneId,killerId)													--C�p nh�t rank cho ng߶i ch�i
	--******************--
	
end
--**********************************--
--*       Give All Human Rank      *--
--**********************************--
function x910103_GiveAllHumanRank(sceneId,killerId)

	--******************--
	local Team_Index=GetTeamId(sceneId,killerId)
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and GetTeamId(sceneId,nHumanId)==Team_Index then
			local Last_Time=GetMissionData(sceneId,nHumanId,SHENGSI_LYKHOI)
			SetMissionData(sceneId,nHumanId,SHENGSI_LYKHOI,Last_Time+1)						--C�p nh�t s� l�n th�ng Boss cho ng߶i ch�i
			BeginEvent(sceneId)
				AddText(sceneId,"S� l�n chi�n th�ng "..x910103_g_Boss_Name.." c�a c�c h� t�ng l�n "..(Last_Time+1).." l�n!")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nHumanId)
		end
	end
	--******************--

end
--**********************************--
--*          Reset My AI           *--
--**********************************--
function x910103_ResetMyAI(sceneId,selfId)

	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910103_g_Poison_Timer,x910103_g_Poison_Distance_Time)--Th�i gian 2 l�n li�n ti�p g�y s�t kh� �n d�ch l�n ng߶i ch�i b�t k�
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910103_g_Skill_Timer,x910103_g_Skill_CD)--Th�i gian 2 l�n li�n ti�p g�y s�t kh� �n d�ch l�n ng߶i ch�i b�t k�
	--******************--
	
end
--**********************************--
--*          Use My Skill          *--
--**********************************--
function x910103_UseMySkill(sceneId,selfId,nTick)

	--******************--
	local Time_Skill=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910103_g_Skill_Timer)			--L�y th�i gian l�nh kh߾c k� n�ng c�a Boss
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910103_g_Skill_Timer,Time_Skill-nTick)			--C�p nh�t th�i gian l�nh kh߾c c�a k� n�ng
	if Time_Skill<=0 then
		x910103_UseSkill(sceneId,selfId)														--S� d�ng k� n�ng
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910103_g_Skill_Timer,x910103_g_Skill_CD)	--C�p nh�t l�i th�i gian l�nh kh߾c c�a k� n�ng
	elseif Time_Skill<=5000 and Time_Skill>4000 and LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910103_g_Impact_Prepare)<1 then
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910103_g_Impact_Prepare,0)	--Hi�u �ng v�n c�ng
	end
	--******************--
	
end
--**********************************--
--*           Use Skill            *--
--**********************************--
function x910103_UseSkill(sceneId,selfId)

	--******************--
	local x,y=GetWorldPos(sceneId,selfId)														--L�y t�a � c�a Boss
	LuaFnUnitUseSkill(sceneId,selfId,x910103_g_Skill_Index,x,y,0,1)								--Boss s� d�ng k� n�ng �n d�ch l�n n�n nh�n
	--******************--
	MonsterTalk(sceneId,selfId,"",x910103_g_Monster_Dialogue[5])								--Boss n�i khi xu�t chi�u
	--******************--
	local Pos_x,Pos_y=GetWorldPos(sceneId,selfId)												--L�y t�a � hi�n t�i c�a Boss
	local Human_List={}
	local nPlayer=0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		local x,y=GetWorldPos(sceneId,nHumanId)													--L�y t�a � hi�n t�i c�a ng߶i ch�i
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=x910103_g_Skill_Distance_Affect then--Ng߶i ch�i n�y ��ng trong v�ng �nh h߷ng c�a k� n�ng
			LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910103_g_Skill_Impact,0)--Nh�n hi�u �ng c�ng k�ch n�i c�ng
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index then													--N�u tr�n th� n�y �ang xu�t chi�n
				local x,y=GetWorldPos(sceneId,Pet_Index)										--L�y t�a � c�a tr�n th� n�y
				if floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=x910103_g_Skill_Distance_Affect then--Tr�n th� trong v�ng �t b�y
					LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910103_g_Skill_Impact,0)--Tr�n th� c�ng b� d�nh k� n�ng n�u ��ng g�n
				end
				break
			end
		end
	end
	--******************--
	
end
--**********************************--
--*Use My Poison To A Random Victim*--
--**********************************--
function x910103_UseMyPoisonToARandomVictim(sceneId,selfId)

	--******************--
	local Human_List={}
	local nPlayer=0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then
			nPlayer=nPlayer+1
			Human_List[nPlayer]=nHumanId
		end
	end
	--******************--
	local Random_Victim=random(nPlayer)																	--Ch�n n�n nh�n ng�u nhi�n
	local nTalk=format(x910103_g_Monster_Dialogue[2],GetName(sceneId,Human_List[Random_Victim]))		
	x910103_GlobalNews(sceneId,nTalk)																	--Th�ng b�o n�n nh�n b� d�nh �n d�ch
	--******************--
	LuaFnSendSpecificImpactToUnit(sceneId,Human_List[Random_Victim],Human_List[Random_Victim],Human_List[Random_Victim],x910103_g_Poison_Impact,0)--N�n nh�n �� nhi�m s�t kh� �n d�ch
	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910103_g_Poison_Timer,x910103_g_Poison_Distance_Time)	--Th�i gian c�n l�i thi tri�n �n d�ch l�n m�c ti�u b�t k�
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910103_g_Poison_Last_Time_Actived,x910103_g_Poison_Time_Actived)--Th�i gian 2 l�n li�n ti�p ph�t n� s�t kh� �n d�ch
	--******************--
	local x,y=GetWorldPos(sceneId,selfId)																--L�y t�a � c�a Boss
	LuaFnUnitUseSkill(sceneId,selfId,x910103_g_Poison_Skill,x,y,0,1)									--Boss s� d�ng k� n�ng �n d�ch l�n n�n nh�n
	--******************--
	
end
--**********************************--
--*        Active My Poison        *--
--**********************************--
function x910103_ActiveMyPoison(sceneId,selfId)

	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local Victim=LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId,Victim,x910103_g_Poison_Impact)>1 then			--Ng߶i n�y c� hi�u �ng �n d�ch
			local Pos_x,Pos_y=GetWorldPos(sceneId,Victim)														--L�y t�a � c�a n�n nh�n
			for i=0,9 do																						--Ki�m tra c�c � tr�n th� c�a n�n nh�n xem c� tr�n th� n�o �ang xu�t chi�n
				local High,Low=LuaFnGetPetGUID(sceneId,Victim,i)
				local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,Victim,High,Low)								
				if Pet_Index~=-1 and Pet_Index then																--N�u tr�n th� n�y �ang xu�t chi�n
					LuaFnSendSpecificImpactToUnit(sceneId,Victim,Victim,Victim,x910103_g_Poison_Active_Impact,0)--N�n nh�n b� �n d�ch ph�t n�
					LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910103_g_Poison_Active_Impact,0)--Tr�n th� c�a n�n nh�n b� �n d�ch ph�t n�
					break
				end
			end
			for j=0,nHumanCount-1 do
				if i~=j then
					local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,j)
					--T�t c� ng߶i ch�i quanh v�ng �n d�ch b� m�t m�u �ng th�i d�nh lu�n tr�ng th�i �n d�ch (C� c�ng d�n nhi�u l�n, c�ng nhi�u ng߶i ��ng quanh m�t m�u c�ng nhanh)
					local x,y=GetWorldPos(sceneId,nHumanId)												--L�y t�a � ng߶i ch�i xung quanh
					if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
					and floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=10 then					--Ng߶i ch�i n�y ��ng quanh v�ng b� ph�t t�c �n d�ch
						LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910103_g_Poison_Active_Impact,0)--Ng߶i ch�i n�y b� m�t m�u
						LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910103_g_Poison_Impact,0)--Ng߶i ch�i n�y b� m�t m�u v� d�nh lu�n tr�ng th�i �n d�ch
					end
					--T�t c� tr�n th� xung quanh c�ng b� m�t m�u nh�ng kh�ng d�nh �n d�ch
					for i=0,9 do																		--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
						local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
						local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
						if Pet_Index~=-1 and Pet_Index then												--N�u tr�n th� n�y �ang xu�t chi�n
							local x,y=GetWorldPos(sceneId,Pet_Index)									--L�y t�a � c�a tr�n th� n�y
							if floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=10 then			--Tr�n th� trong v�ng b� �n d�ch
								LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910103_g_Poison_Active_Impact,0)--Tr�n th� b� �n d�ch ph�t n�
							end
							break
						end
					end
				end
			end
		end
	end
	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910103_g_Poison_Last_Time_Actived,x910103_g_Poison_Time_Actived)--Th�i gian 2 l�n li�n ti�p ph�t n� s�t kh� �n d�ch
	--******************--
	
end
--**********************************--
--*           Global News          *--
--**********************************--
function x910103_GlobalNews(sceneId,Tips)

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