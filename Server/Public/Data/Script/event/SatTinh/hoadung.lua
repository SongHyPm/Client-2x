--Th�p nh� S�t Tinh
--Hoa Dung
--Author: Ho�ng Steven

--******************--
x910101_g_ScriptId=910101
--******************--
x910101_g_Boss_Name="Hoa Dung"																	--T�n c�a BOSS
--******************--
x910101_g_Last_Time=1																			--Th�i gian l�n tr߾c �t c�m b�y
x910101_g_Trap_Index=2																			--��nh s� c�m b�y �ang k�ch ho�t
x910101_g_Trap_Pos_X=3																			--T�a � X c�a c�m b�y �ang k�ch ho�t
x910101_g_Trap_Pos_Y=4																			--T�a � Y c�a c�m b�y �ang k�ch ho�t
x910101_g_Trap_Timer=5																			--Th�i gian t�n t�i c�m b�y
x910101_g_Tick_Time=6																			--T�nh th�i gian m�i gi�y
x910101_g_Trap_Color_Now=7																		--M�u s�c c�m b�y hi�n t�i
--******************--
x910101_g_Trap_Color={																			--M�u c�a b�y
	[1]=151,																					--иa S�t Tr�n
	[2]=151,																					--Thi�n Cang Tr�n
	[3]=147,																					--Nh�n Vong Tr�n
	[4]=150																						--C߶ng H�a Tr�n
}
x910101_g_Trap_Skill={																			--Skill b�y
	[1]=1326,																					--иa S�t Tr�n
	[2]=1325,																					--Thi�n Cang Tr�n
	[3]=1327,																					--Nh�n Vong Tr�n
	[4]=1328																					--C߶ng H�a Tr�n
}
x910101_g_Trap_Impact={																			--Impact b�y
	[1]=9755,																					--иa S�t Tr�n
	[2]=9756,																					--Thi�n Cang Tr�n
	[3]=9757,																					--Nh�n Vong Tr�n
	[4]=9758																					--C߶ng H�a Tr�n
}
x910101_g_Trap_Name={
	[1]="иa S�t Tr�n",																			--иa S�t Tr�n
	[2]="Thi�n Cang Tr�n",																		--Thi�n Cang Tr�n
	[3]="Nh�n Vong Tr�n",																		--Nh�n Vong Tr�n
	[4]="C߶ng H�a Tr�n"																		--C߶ng H�a Tr�n
}
--******************--
x910101_g_Next_Time_Trap=30000																	--Kho�ng c�ch 2 l�n �t c�m b�y li�n ti�p
x910101_g_Timelife_Traps=10000																	--Th�i gian duy tr� c�m b�y
x910101_g_Time_Per_Trap=1000																	--Th�i gian m�i l�n c�m b�y ph�t n�
x910101_g_Distance_Trap_Affect=3																--Kho�ng c�ch ng߶i ch�i nh� h�n gi� tr� n�y th� d� d�nh �nh h߷ng c�a b�y
--******************--
x910101_g_Monster_Dialogue={																	--L�i n�i c�a Boss
	[1]="T�i h� v�n mong m�t ng�y n�o �� ���c l�nh gi�o cao chi�u c�a cao th� Trung Nguy�n...",	--Boss m�i xu�t hi�n
	[2]="Th�t tinh chi�u r�i...B�t �u иa S�t Tr�n",											--Tri�u t�p иa S�t Tr�n
	[3]="Th�t tinh chi�u r�i...B�t �u Thi�n Cang Tr�n",										--Tri�u t�p Thi�n Cang Tr�n
	[4]="Th�t tinh chi�u r�i...B�t �u Nh�n Vong Tr�n",											--Tri�u t�p Nh�n Vong Tr�n
	[5]="Th�t tinh chi�u r�i...B�t �u C߶ng H�a Tr�n",											--Tri�u t�p C߶ng H�a Tr�n
	[6]=x910101_g_Boss_Name.." �� v�o chi�n �u!",												--Boss v�o chi�n �u
	[7]="V� l�m Trung Nguy�n qu� nhi�n cao th� nhi�u v� k�. T�i h� b�i ph�c, b�i ph�c...!",		--Boss t� n�n
}
--******************--
x910101_g_Trap_Flag_Index=14126																	--D�u hi�u c�m b�y �� k�ch ho�t
--******************--

--**********************************--
--*             On Init            *-- 
--**********************************--
function x910101_OnInit(sceneId,selfId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910101_g_Monster_Dialogue[1])								--C�u n�i khai chi�n c�a Boss
	x910101_GlobalNews(sceneId,x910101_g_Monster_Dialogue[6])									--Th�ng b�o Boss �� v�o chi�n �u cho to�n th� ng߶i ch�i
	x910101_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--
	
end
--**********************************--
--*         On Heart Beat          *--
--**********************************--
function x910101_OnHeartBeat(sceneId,selfId,nTick)												--H�m n�y s� check li�n t�c m�i mili gi�y khi n�o Boss c�n s�ng

	--******************--
	if LuaFnIsCharacterLiving(sceneId,selfId)~=1 then											--N�u Boss �� ch�t th� ng�ng ho�t �ng c�a Script
		return
	end
	--******************--
	local nCheck=x910101_CheckCondition(sceneId,selfId)											--Ki�m tra xem c� ng߶i ch�i n�o ��ng xung quanh boss kh�ng, n�u kh�ng c�n th� Boss t� reset
	if nCheck==0 then
		x910101_ResetMyAI(sceneId,selfId)														--Set l�i c�c thu�c t�nh cho Boss
		x910101_DeleteMyTrap(sceneId,selfId)													--X�a t�t c� c�c c�m b�y �ang ph�t t�c
		return
	end
	--******************--
	local Time_Life=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Timer)			--Th�i gian t�n t�i c�m b�y hi�n t�i
	local Tick_Time=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910101_g_Tick_Time)			--T�nh th�i gian m�i gi�y
	if Time_Life>0 then																			--V�n c�n th�i gian t�n t�i
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Timer,Time_Life-nTick)		--C�p nh�t th�i gian t�n t�i c�m b�y
		if Tick_Time-Time_Life>=x910101_g_Time_Per_Trap then									--N�u �� sau kho�ng c�ch 2 l�n li�n ti�p k�ch ho�t b�y
			x910101_ActiveMyTrap(sceneId,selfId)												--K�ch n� c�m b�y
			MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Tick_Time,Time_Life)			--Th�i gian m�i gi�y
		end
	else
		x910101_DeleteMyTrap(sceneId,selfId)													--X�a b� c�m b�y c�
	end
	--******************--
	local Last_Time=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910101_g_Last_Time)			--L�y th�i gian tr߾c �� �t b�y
	if Last_Time<=0 then
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Last_Time,x910101_g_Next_Time_Trap)--Reset th�i gian �t c�m b�y t�i
		x910101_UseMyTrap(sceneId,selfId)														--Boss s� s� d�ng c�m b�y th�c hi�n trong h�m n�y
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Timer,x910101_g_Timelife_Traps)--Th�i gian t�n t�i c�m b�y hi�n t�i
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Tick_Time,x910101_g_Timelife_Traps+x910101_g_Time_Per_Trap)--Th�i gian m�i gi�y
		local Trap_Color=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Color_Now)	--M�u s�c c�m b�y hi�n t�i
		MonsterTalk(sceneId,selfId,"",x910101_g_Monster_Dialogue[Trap_Color+1])					--Boss n�i khi ra c�m b�y
	else
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Last_Time,Last_Time-nTick)		--C�p nh�t l�i th�i gian �t c�m b�y ti�p theo
	end
	--******************--

end
--**********************************--
--*        Check Condition         *--
--**********************************--
function x910101_CheckCondition(sceneId,selfId,enmeyId)

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
function x910101_OnEnterCombat(sceneId,selfId,enmeyId)

	--******************--
	x910101_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--
	
end
--**********************************--
--*        On Leave Combat         *--
--**********************************--
function x910101_OnLeaveCombat(sceneId,selfId)

	--******************--
	x910101_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	x910101_DeleteMyTrap(sceneId,selfId)														--X�a t�t c� c�c c�m b�y �ang ph�t t�c
	--******************--

end
--**********************************--
--*       On Kill Character        *--
--**********************************--
function x910101_OnKillCharacter(sceneId,selfId,targetId)
	
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if nHumanId==targetId then
			local PlayerName=GetName(sceneId,targetId)
			MonsterTalk(sceneId,selfId,"","Ta kh�ng tin cao th� v� l�m Trung Nguy�n l�i y�u �u�i �n v�y... "..PlayerName..", c�c h� l�m ta th�t v�ng qu�... Ha ha...!")	--Boss ch� di�u ng߶i ch�i b� gi�t
		end
	end
	--******************--
	
end
--**********************************--
--*             On Die             *--
--**********************************--
function x910101_OnDie(sceneId,selfId,killerId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910101_g_Monster_Dialogue[7])								--C�u n�i c�a Boss l�c ch�t
	--******************--
	x910101_DeleteMyTrap(sceneId,selfId)														--X�a t�t c� c�c c�m b�y �ang ph�t t�c
	--******************--
	local nBoss=LuaFnGetCopySceneData_Param(sceneId,22)											--Ki�m tra xem c� bao nhi�u Boss �ang chi�n �u
	LuaFnSetCopySceneData_Param(sceneId,22,nBoss-1)												--Gi�m s� Boss �ang chi�n �u xu�ng
	if nBoss-1==0 then
		LuaFnSetCopySceneData_Param(sceneId,16,30000)											--C�p nh�t th�i gian g�i Boss ti�p theo l� 30 gi�y
	end
	--******************--
	x910101_GiveAllHumanRank(sceneId,killerId)													--C�p nh�t rank cho ng߶i ch�i
	--******************--
	
end
--**********************************--
--*       Give All Human Rank      *--
--**********************************--
function x910101_GiveAllHumanRank(sceneId,killerId)

	--******************--
	local Team_Index=GetTeamId(sceneId,killerId)
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and GetTeamId(sceneId,nHumanId)==Team_Index then
			local Last_Time=GetMissionData(sceneId,nHumanId,SHENGSI_HOADUNG)
			SetMissionData(sceneId,nHumanId,SHENGSI_HOADUNG,Last_Time+1)						--C�p nh�t s� l�n th�ng Boss cho ng߶i ch�i
			BeginEvent(sceneId)
				AddText(sceneId,"S� l�n chi�n th�ng "..x910101_g_Boss_Name.." c�a c�c h� t�ng l�n "..(Last_Time+1).." l�n!")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nHumanId)
		end
	end
	--******************--

end
--**********************************--
--*          Reset My AI           *--
--**********************************--
function x910101_ResetMyAI(sceneId,selfId)

	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Last_Time,x910101_g_Next_Time_Trap+1)	--Kh�i t�o th�i gian tri�u t�p c�m b�y l�n tr߾c tr� v� th�i gian xu�t hi�n Boss
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Index,0)							--C�m b�y v�a �t l�n tr߾c l�
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Pos_X,0)							--T�a � X c�a c�m b�y �ang k�ch ho�t
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Pos_Y,0)							--T�a � Y c�a c�m b�y �ang k�ch ho�t
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Timer,0)							--Th�i gian t�n t�i c�m b�y hi�n t�i
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Tick_Time,x910101_g_Timelife_Traps+x910101_g_Time_Per_Trap)--Th�i gian m�i gi�y
	--******************--
	
end
--**********************************--
--*          Use My Trap           *--
--**********************************--
function x910101_UseMyTrap(sceneId,selfId)

	--******************--
	local Last_Trap_Color=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Color_Now)		--M�u s�c c�m b�y c�
	local ran=Last_Trap_Color
	while ran==Last_Trap_Color do
		ran=random(4)																				--Random c�m b�y b�t k�
	end
	--******************--
	local PlayerList={}
	local nHumanCount=LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId=LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then
			PlayerList[i+1]=nHumanId
		end
	end
	local nPlayer=getn(PlayerList)																	--T�ng s� ng߶i ch�i
	if nPlayer<=0 then																				--Kh�ng ai c�n s�ng ho�c � trong ph� b�n n�y
		return
	end
	--******************--
	local Random_Player=random(nPlayer)																--Random ng߶i ch�i b� d�nh b�y
	--******************--
	local x,y=GetWorldPos(sceneId,PlayerList[Random_Player])										--L�y t�a � c�a ng߶i ch�i x�c �nh d�nh b�y				
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Pos_X,x)								--T�a � X c�a c�m b�y �ang k�ch ho�t
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Pos_Y,y)								--T�a � Y c�a c�m b�y �ang k�ch ho�t
	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Color_Now,ran)						--C�m b�y v�a �t l�n tr߾c l� c�m b�y Random
	--******************--
	local Flag_Index=LuaFnCreateMonster(sceneId,x910101_g_Trap_Flag_Index,x,y,3,0,-1)				--Kh�i t�o d�u hi�u k�ch ho�t c�m b�y
	SetCharacterName(sceneId,Flag_Index,"")															--Kh�ng c� t�n
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Index,Flag_Index)					--C�p nh�t s� hi�u c�m b�y �ang k�ch ho�t
	--******************--
	local x,y=GetWorldPos(sceneId,selfId)															--L�y t�a � Boss
	LuaFnUnitUseSkill(sceneId,selfId,x910101_g_Trap_Skill[ran],x,y,0,1)								--Boss s� d�ng c�m b�y
	--******************--
	
end
--**********************************--
--*         Delete My Trap         *--
--**********************************--
function x910101_DeleteMyTrap(sceneId,selfId)

	--******************--
	local Trap_Index=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Index)				--S� hi�u c�m b�y hi�n t�i
	--******************--
	SetCharacterDieTime(sceneId,Trap_Index,100)														--X�a c�i c� k�ch ho�t c�m b�y
	--******************--
	local nHumanCount=LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then
			LuaFnCancelSpecificImpact(sceneId,nHumanId,x910101_g_Trap_Impact[3])					--X�a hi�u �ng h� nh��c tr�n ng߶i
		end
	end
	--******************--
	
end
--**********************************--
--*         Active My Trap         *--
--**********************************--
function x910101_ActiveMyTrap(sceneId,selfId)

	--******************--
	local Trap_Color=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Color_Now)			--M�u s�c c�m b�y hi�n t�i
	local Trap_Index=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Index)				--S� hi�u c�m b�y hi�n t�i
	--******************--
	LuaFnSendSpecificImpactToUnit(sceneId,Trap_Index,Trap_Index,Trap_Index,x910101_g_Trap_Color[Trap_Color],0)--T� m�u cho c�m b�y �ang k�ch ho�t
	--******************--
	local nImpact=x910101_g_Trap_Impact[Trap_Color]													--Hi�u �ng c�a b�y
	if Trap_Color==4 then
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,nImpact,0)						--B�y g�y h�i cho Boss
		return
	end
	--******************--
	local Trap_x=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Pos_X)					--T�a � X c�a c�m b�y �ang k�ch ho�t
	local Trap_y=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910101_g_Trap_Pos_Y)					--T�a � Y c�a c�m b�y �ang k�ch ho�t
	local nHumanCount=LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId=LuaFnGetCopyScene_HumanObjId(sceneId,i)
		local x,y=GetWorldPos(sceneId,nHumanId)														--L�y t�a � c�a ng߶i ch�i
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and floor(sqrt((Trap_x-x)*(Trap_x-x)+(Trap_y-y)*(Trap_y-y)))<=x910101_g_Distance_Trap_Affect 
		and LuaFnHaveImpactOfSpecificDataIndex(sceneId,nHumanId,nImpact)<1 then						--Ng߶i ch�i n�y t�n t�i v� �ang ��ng g�n c�i b�y
			LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,nImpact,0)				--Ng߶i ch�i n�y s� b� d�nh hi�u �ng c�a b�y
		end
		for i=0,9 do																				--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index then														--N�u tr�n th� n�y �ang xu�t chi�n
				local x,y=GetWorldPos(sceneId,Pet_Index)											--L�y t�a � c�a tr�n th� n�y
				if floor(sqrt((Trap_x-x)*(Trap_x-x)+(Trap_y-y)*(Trap_y-y)))<=10
				and LuaFnHaveImpactOfSpecificDataIndex(sceneId,Pet_Index,nImpact)<1 then			--Tr�n th� trong v�ng �t b�y
					LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,nImpact,0)	--Tr�n th� c�ng b� d�nh b�y
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
function x910101_GlobalNews(sceneId,Tips)

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