--Th�p nh� S�t Tinh
--L� Ch� Sinh
--Author: Ho�ng Steven

--******************--
x910104_g_ScriptId=910104
--******************--
x910104_g_Boss_Name="L� Ch� Sinh"																--T�n c�a BOSS
x910104_g_Monk_Name="Kh� Vinh ��i S�"															--T�n c�a NPC Kh� Vinh ��i S�
--******************--
x910104_g_Immue_Timer=1																			--Th�i gian gi�a 2 l�n li�n ti�p nh�n ���c tr�ng th�i v� �ch
x910104_g_Skill_Timer=2																			--Th�i gian l�nh kh߾c d�ng k� n�ng
x910104_g_Last_Time=3																			--Th�i gian l�n tr߾c Boss b� m�t m�u b�i k� n�ng c�a Kh� Vinh ��i S�
--******************--
x910104_g_Immue_Impact_Index=9764																--ID c�a hi�u �ng mi�n d�ch
x910104_g_Immue_Impact_CD=50000																	--T�ng th�i gian c�a hi�u �ng (bao g�m l�nh kh߾c v� ph�t t�c)
x910104_g_Impact_1_Time_Start=20000																--Th�i gian b�t �u hi�u �ng mi�n d�ch v� m�t m�u li�n t�c
x910104_g_Impact_2_Time_Start=10000																--Th�i gian b�t �u hi�u �ng s� h�
--******************--
x910104_g_Weak_Impact_Index=9767																--Hi�u �ng suy y�u, Boss b� ma t� trong 10 gi�y
--******************--
x910104_g_Skill_Index=1313																		--K� n�ng c�ng k�ch ph� c�a Boss
x910104_g_Skill_CD=55000																		--Th�i gian ph�c h�i k� n�ng n�y
x910104_g_Skill_Distance_Affect=10																--Kho�ng c�ch b� d�nh k� n�ng qu�n th�
x910104_g_Skill_Impact=9778																		--Hi�u �ng c�a k� n�ng
--******************--
x910104_g_Impact_Prepare=9777																	--�ang v�n kh�
--******************--
x910104_g_Monster_Dialogue={																	--L�i n�i c�a Boss
	[1]="Kh�ng n�i nhi�u. C� gi�i th� v�o c� ��y, � t�i h� l�nh gi�o cao chi�u c�a qu� v�...",	--Boss khai chi�n
	[2]="Ha ha... Ta ��y thi�n h� v� �ch, c�c ng߽i ��ng h�ng ��ng �n ta... Ha ha...",		--Boss nh�n hi�u �ng Mi�n d�ch
	[3]=x910104_g_Boss_Name.." �� v�o chi�n �u!",												--Boss v�o chi�n �u
	[4]="V� c�ng t�m th߶ng, b�n l�nh non k�m m� c�ng h� ���c ta sao?...",						--Boss t� n�n
	[5]="C�c ng߶i h�y n�m m�i k� n�ng Cu�ng Phong San c�a ta...",								--Boss ra k� n�ng Cu�ng Phong San
}
--******************--
x910104_g_Monk_Dialogue={																		--L�i n�i c�a Kh� Vinh ��i S�
	[1]=x910104_g_Boss_Name.." �ang trong tr�ng th�i Mi�n D�ch, h�n s� mi�n d�ch t�t c� s�t th߽ng nh�ng s� b� gi�m 1% HP/s trong su�t qu� tr�nh mi�n d�ch t�i khi c�n 10% m�u.",--Kh� Vinh ��i S� nh�c nh� v� hi�u �ng �u
	[2]=x910104_g_Boss_Name.." �ang ki�t s�c, suy y�u, b� ma t� trong 10 gi�y. C�c v� h�y d�n h�t c�ng l�c �� th߽ng h�n...",--Kh� Vinh ��i S� th�ng b�o Boss �ang b� h� nh��c
	
}
--******************--

--**********************************--
--*             On Init            *-- 
--**********************************--
function x910104_OnInit(sceneId,selfId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910104_g_Monster_Dialogue[1])								--C�u n�i khai chi�n c�a Boss
	x910104_GlobalNews(sceneId,x910104_g_Monster_Dialogue[3])									--Th�ng b�o Boss �� v�o chi�n �u cho to�n th� ng߶i ch�i
	x910104_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*         On Heart Beat          *--
--**********************************--
function x910104_OnHeartBeat(sceneId,selfId,nTick)												--H�m n�y s� check li�n t�c m�i mili gi�y khi n�o Boss c�n s�ng

	--******************--
	if LuaFnIsCharacterLiving(sceneId,selfId)~=1 then											--N�u Boss �� ch�t th� ng�ng ho�t �ng c�a Script
		return
	end
	--******************--
	local nCheck=x910104_CheckCondition(sceneId,selfId)											--Ki�m tra xem c� ng߶i ch�i n�o ��ng xung quanh boss kh�ng
	if nCheck==0 then
		x910104_ResetMyAI(sceneId,selfId)														--Set l�i c�c thu�c t�nh cho Boss
		return
	end
	--******************--
	x910104_UseMySkill(sceneId,selfId,nTick)													--Boss s� d�ng k� n�ng
	--******************--
	local Monk=x910104_FindTheMonk(sceneId)														--T�m ID c�a Kh� Vinh ��i S�
	local nTime=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910104_g_Immue_Timer)				--Th�i gian t�n t�i hi�u �ng
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910104_g_Immue_Timer,nTime-nTick)				--C�p nh�t th�i gian
	--******************--
	local Last_Time=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910104_g_Last_Time)			--Th�i gian l�n tr߾c Boss b� m�t m�u b�i k� n�ng c�a Kh� Vinh ��i S�
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910104_g_Immue_Impact_Index)>=1 and Last_Time-nTime>=1000 then--�� �n gi� k�ch ho�t k� n�ng
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910104_g_Last_Time,nTime)					--C�p nh�t th�i gian �nh h߷ng k� n�ng
		x910104_ActiveLoseHPSkill(sceneId,selfId)												--Boss ch�u �nh h߷ng k� n�ng c�a Kh� Vinh ��i S�
	end
	--******************--
	if nTime<=x910104_g_Impact_1_Time_Start and nTime>x910104_g_Impact_2_Time_Start 
	and LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910104_g_Immue_Impact_Index)<1 then	--N�u trong th�i gian hi�u �ng mi�n d�ch v� m�t m�u li�n t�c
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910104_g_Immue_Impact_Index,0)--Hi�u �ng mi�n d�ch c�a Boss
		MonsterTalk(sceneId,Monk,"",x910104_g_Monk_Dialogue[1])									--Kh� Vinh ��i S� th�ng b�o v� hi�u �ng s� 1
		x910104_GlobalNews(sceneId,x910104_g_Monk_Name..": "..x910104_g_Monk_Dialogue[1])		--Kh� Vinh ��i S� th�ng b�o v� hi�u �ng s� 1
	elseif nTime<=x910104_g_Impact_2_Time_Start and nTime>0 
	and LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910104_g_Weak_Impact_Index)<1 then	--N�u trong th�i gian suy y�u
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910104_g_Weak_Impact_Index,0)--Boss nh�n hi�u �ng suy nh��c sau khi mi�n d�ch
		MonsterTalk(sceneId,Monk,"",x910104_g_Monk_Dialogue[2])									--Kh� Vinh ��i S� th�ng b�o v� hi�u �ng s� 2
		x910104_GlobalNews(sceneId,x910104_g_Monk_Name..": "..x910104_g_Monk_Dialogue[2])		--Kh� Vinh ��i S� th�ng b�o v� hi�u �ng s� 2
	elseif nTime<=0 then
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910104_g_Immue_Timer,x910104_g_Immue_Impact_CD)--C�p nh�t th�i gian t�ng th�
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910104_g_Last_Time,x910104_g_Immue_Impact_CD)--C�p nh�t th�i gian �nh h߷ng k� n�ng
	end
	--******************--

end
--**********************************--
--*        Check Condition         *--
--**********************************--
function x910104_CheckCondition(sceneId,selfId,enmeyId)

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
function x910104_OnEnterCombat(sceneId,selfId,enmeyId)

	--******************--
	x910104_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*        On Leave Combat         *--
--**********************************--
function x910104_OnLeaveCombat(sceneId,selfId)

	--******************--
	x910104_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*       On Kill Character        *--
--**********************************--
function x910104_OnKillCharacter(sceneId,selfId,targetId)
	
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
function x910104_OnDie(sceneId,selfId,killerId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910104_g_Monster_Dialogue[4])								--C�u n�i c�a Boss l�c ch�t
	--******************--
	local nBoss=LuaFnGetCopySceneData_Param(sceneId,22)											--Ki�m tra xem c� bao nhi�u Boss �ang chi�n �u
	LuaFnSetCopySceneData_Param(sceneId,22,nBoss-1)												--Gi�m s� Boss �ang chi�n �u xu�ng
	if nBoss-1==0 then
		LuaFnSetCopySceneData_Param(sceneId,16,30000)											--C�p nh�t th�i gian g�i Boss ti�p theo l� 30 gi�y
	end
	--******************--
	x910104_GiveAllHumanRank(sceneId,killerId)													--C�p nh�t rank cho ng߶i ch�i
	--******************--
	
end
--**********************************--
--*       Give All Human Rank      *--
--**********************************--
function x910104_GiveAllHumanRank(sceneId,killerId)

	--******************--
	local Team_Index=GetTeamId(sceneId,killerId)
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and GetTeamId(sceneId,nHumanId)==Team_Index then
			local Last_Time=GetMissionData(sceneId,nHumanId,SHENGSI_LOCHISINH)
			SetMissionData(sceneId,nHumanId,SHENGSI_LOCHISINH,Last_Time+1)						--C�p nh�t s� l�n th�ng Boss cho ng߶i ch�i
			BeginEvent(sceneId)
				AddText(sceneId,"S� l�n chi�n th�ng "..x910104_g_Boss_Name.." c�a c�c h� t�ng l�n "..(Last_Time+1).." l�n!")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nHumanId)
		end
	end
	--******************--

end
--**********************************--
--*          Reset My AI           *--
--**********************************--
function x910104_ResetMyAI(sceneId,selfId)

	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910104_g_Immue_Timer,x910104_g_Immue_Impact_CD)--T�ng th�i gian hi�u �ng
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910104_g_Skill_Timer,x910104_g_Skill_CD)		--Th�i gian k� n�ng
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910104_g_Last_Time,x910104_g_Immue_Impact_CD)	--Th�i gian Boss m�t m�u b�i k� n�ng c�a Kh� Vinh ��i S�
	--******************--
	
end
--**********************************--
--*      Active Lose HP Skill      *--
--**********************************--
function x910104_ActiveLoseHPSkill(sceneId,selfId)

	--******************--
	local MaxHP=GetMaxHp(sceneId,selfId)														--L��ng m�u th��ng h�n c�a Boss
	local CurrentHP=GetHp(sceneId,selfId)														--L��ng m�u hi�n t�i c�a Boss
	--******************--
	if floor((CurrentHP/MaxHP)*100)<=10 then													--N�u l��ng m�u c�a Boss d߾i 10%
		return
	end
	--******************--
	local HP_Lost=floor(MaxHP*0.01)																--L��ng m�u m�t �i = 1%
	--******************--
	SetHp(sceneId,selfId,CurrentHP-HP_Lost)														--Thi�t l�p m�u cho Boss
	--******************--	
	
end
--**********************************--
--*         Find The Monk          *--
--**********************************--
function x910104_FindTheMonk(sceneId)

	--******************--
	local nMonsterNum=GetMonsterCount(sceneId)
	for i=0,nMonsterNum-1 do
		local MonsterId=GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId,MonsterId)==1 and (GetName(sceneId,MonsterId)==x910104_g_Monk_Name) then	--N�u t�m th�y Kh� Vinh ��i S�
			return MonsterId
		end
	end
	--******************--
	return -1
	--******************--
	
end
--**********************************--
--*          Use My Skill          *--
--**********************************--
function x910104_UseMySkill(sceneId,selfId,nTick)

	--******************--
	local Time_Skill=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910104_g_Skill_Timer)			--L�y th�i gian l�nh kh߾c k� n�ng c�a Boss
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910104_g_Skill_Timer,Time_Skill-nTick)			--C�p nh�t th�i gian l�nh kh߾c c�a k� n�ng
	if Time_Skill<=0 then
		x910104_UseSkill(sceneId,selfId)														--S� d�ng k� n�ng
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910104_g_Skill_Timer,x910104_g_Skill_CD)	--C�p nh�t l�i th�i gian l�nh kh߾c c�a k� n�ng
	elseif Time_Skill<=5000 and Time_Skill>4000 and LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910104_g_Impact_Prepare)<1 then
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910104_g_Impact_Prepare,0)	--Hi�u �ng v�n c�ng
	end
	--******************--
	
end
--**********************************--
--*           Use Skill            *--
--**********************************--
function x910104_UseSkill(sceneId,selfId)

	--******************--
	local x,y=GetWorldPos(sceneId,selfId)														--L�y t�a � c�a Boss
	LuaFnUnitUseSkill(sceneId,selfId,x910104_g_Skill_Index,x,y,0,1)								--Boss s� d�ng k� n�ng �n d�ch l�n n�n nh�n
	--******************--
	MonsterTalk(sceneId,selfId,"",x910104_g_Monster_Dialogue[5])								--Boss n�i khi xu�t chi�u
	--******************--
	local Pos_x,Pos_y=GetWorldPos(sceneId,selfId)												--L�y t�a � hi�n t�i c�a Boss
	local Human_List={}
	local nPlayer=0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		local x,y=GetWorldPos(sceneId,nHumanId)													--L�y t�a � hi�n t�i c�a ng߶i ch�i
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=x910104_g_Skill_Distance_Affect then--Ng߶i ch�i n�y ��ng trong v�ng �nh h߷ng c�a k� n�ng
			LuaFnSendSpecificImpactToUnit(sceneId,nHumanId,nHumanId,nHumanId,x910104_g_Skill_Impact,0)--Nh�n hi�u �ng c�ng k�ch n�i c�ng
		end
		for i=0,9 do																			--Ki�m tra c�c � tr�n th� c�a ng߶i ch�i xem c� tr�n th� n�o �ang xu�t chi�n
			local High,Low=LuaFnGetPetGUID(sceneId,nHumanId,i)
			local Pet_Index=LuaFnGetPetObjIdByGUID(sceneId,nHumanId,High,Low)								
			if Pet_Index~=-1 and Pet_Index then													--N�u tr�n th� n�y �ang xu�t chi�n
				local x,y=GetWorldPos(sceneId,Pet_Index)										--L�y t�a � c�a tr�n th� n�y
				if floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=x910104_g_Skill_Distance_Affect then--Tr�n th� trong v�ng k� n�ng
					LuaFnSendSpecificImpactToUnit(sceneId,Pet_Index,Pet_Index,Pet_Index,x910104_g_Skill_Impact,0)--Tr�n th� c�ng b� d�nh k� n�ng n�u ��ng g�n
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
function x910104_GlobalNews(sceneId,Tips)

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