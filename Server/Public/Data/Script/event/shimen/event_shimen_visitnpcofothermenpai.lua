 --Nhi�m v� s� m�n

--MisDescBegin
--�ű���
x229010_g_ScriptId = 229010

--�����
x229010_g_MissionId = 1060

--�������
x229010_g_MissionKind = 2

--��ng c�p nhi�m v� 
x229010_g_MissionLevel = 10000

--��ng����ngTinhӢ����
x229010_g_IfMissionElite = 0

--���漸����ng��̬��ʾto� � ����,����T�i �����б��ж�̬��ʾ�������**********************
--������ng���Ѿ����
x229010_g_IsMissionOkFail = 0		--����to� � ��0λ

--������ng��̬**************************************************************

--���������m�t λ�����洢��� �i�m��to� � �ű���

--�����ı�����
x229010_g_MissionName="Nhi�m v� s� m�n"
x229010_g_MissionInfo=""  --��������
x229010_g_MissionTarget ="Kh� l�m...... � b�n m�n ta, ng߽i lu�n ph�t d߽ng quang ��i, t�n t�m t�n l�c, c�n c� l�m vi�c. Ta s� giao cho ng߽i 1 nhi�m v� kh�c., #G%s#Wv�a ��a cho ta b� c�u ��a th�, n�i h� c�n gi�p ��, ng߽i �i t�m �i #G%s#W c�a#Y%s#W, �ng (b�) ta s� s�p x�p nhi�m v� c�a ng߽i."
x229010_g_ContinueInfo="L�m t�t l�m"		--δHo�n t�t nhi�m v�to� � npc�Ի�
x229010_g_MissionComplete="Vi�c ta giao �� ho�n th�nh ch�a?"					--Ho�n t�t nhi�m v�npc˵��to� � ��
x229010_g_MissionRound=17

x229010_g_DoubleExp = 48
x229010_g_AccomplishCircumstance = 1

--��ʽ�ַ�����to� � ����, ��ʾ��4��ʼ,�����λ��SetMissionByIndex(...)to� � ���ٶ���
x229010_g_StrForePart=4

x229010_g_StrList = {
						"Huy�n Tr�nh",
						"Th�p L�m ph� b�n",
						"B�n T߾ng", 
						"M�nh Thanh Thanh",
						"Ph�t �n", 
						"Ph߽ng L�p", 
						"C�c Ki�m", 
						"L�m Linh T�",
						"Ph�ng A Tam",
						"H�ng Ng�c", 
						"Th�p � ph� b�n",
						"��o Hoa Tr�n ph� b�n",
						"Ph� b�n h�m r��u",
						"Quang Minh �ng ph� b�n",
						"Chi�t Mai Phong ph� b�n",
						"Linh T�nh Phong ph� b�n",
						"C�c иa ph� b�n",
						"Ng� Th�n еng ph� b�n", 
						"Thi�u L�m",
						"Thi�n Long",
						"Nga My",
						"C�i Bang",
						"Minh Gi�o",
						"Thi�n S�n",
						"V� �ang",
						"Ti�u Dao",
						"Tinh T�c",
						}
						
--MisDescEnd

--add by xindefeng
--x229010_GetStrIndexByStrValue(),x229010_GetStrValueByStrIndex()����ʹ��x229010_g_StrList������Index��NPCT�n,�������Զ�Ѱ·��Ϣ��,�޷��ҵ���ȷIndex,��˽���
--�˱��x229010_GetStrIndexByStrValue(),x229010_GetStrValueByStrIndex()ʹ�����ҵ���ȷIndex��NPCT�n
x229010_g_StrList2 = {
						"Huy�n Tr�nh",
						"Th�p L�m ph� b�n",
						"B�n T߾ng", 
						"M�nh Thanh Thanh",
						"Ph�t �n", 
						"Ph߽ng L�p", 
						"C�c Ki�m", 
						"L�m Linh T�",
						"Ph�ng A Tam",
						"H�ng Ng�c", 
						"Th�p � ph� b�n",
						"��o Hoa Tr�n ph� b�n",
						"Ph� b�n h�m r��u",
						"Quang Minh �ng ph� b�n",
						"Chi�t Mai Phong ph� b�n",
						"Linh T�nh Phong ph� b�n",
						"C�c иa ph� b�n",
						"Ng� Th�n еng ph� b�n", 
						"Thi�u L�m",
						"Thi�n Long",
						"Nga My",
						"C�i Bang",
						"Minh Gi�o",
						"Thi�n S�n",
						"V� �ang",
						"Ti�u Dao",
						"Tinh T�c",
						}
						
--/////////////////////////////////////////////////////////////////////////////////////////////////////
            
--������to� � ���ʹ��Ŷ���
x229010_g_SubMissionTypeEnum = {XunWu=1, SongXin=2, DingDianYinDao=3, FuBenZhanDou=4, BuZhuo=5, ShouJi=6, KaiGuang=7, otherMenpaiFuben=8}

--�����б�
x229010_g_FuBen_List = {
								{menpainame="Thi�u L�m", menpai=MP_SHAOLIN  , NpcName="Huy�n Tr�nh", scene=9, posx=61, posz=61, FubenName="Th�p L�m ph� b�n"},
								{menpainame="Thi�n Long", menpai=MP_DALI     , NpcName="B�n T߾ng", scene=13, posx=35, posz=86, FubenName="Th�p � ph� b�n"},
								{menpainame="Nga My", menpai=MP_EMEI     , NpcName="M�nh Thanh Thanh", scene=15, posx=96, posz=73, FubenName="��o Hoa Tr�n ph� b�n"},
								{menpainame="C�i Bang", menpai=MP_GAIBANG  , NpcName="Ph�t �n", scene=10, posx=41, posz=144, FubenName="Ph� b�n h�m r��u"},
								{menpainame="Minh Gi�o", menpai=MP_MINGJIAO , NpcName="Ph߽ng L�p", scene=11, posx=89, posz=56, FubenName="Quang Minh �ng ph� b�n"},
								{menpainame="Thi�n S�n", menpai=MP_TIANSHAN , NpcName="C�c Ki�m", scene=17, posx=99, posz=45, FubenName="Chi�t Mai Phong ph� b�n"},
								{menpainame="V� �ang", menpai=MP_WUDANG   , NpcName="L�m Linh T�", scene=12, posx=58, posz=73, FubenName="Linh T�nh Phong ph� b�n"},
								{menpainame="Ti�u Dao", menpai=MP_XIAOYAO  , NpcName="Ph�ng A Tam", scene=14, posx=62, posz=68, FubenName="C�c иa ph� b�n"},
								{menpainame="Tinh T�c", menpai=MP_XINGSU   , NpcName="H�ng Ng�c", scene=16, posx=128, posz=78, FubenName="Ng� Th�n еng ph� b�n"},
							}
	
--changed by xindefeng                								
function x229010_GetStrIndexByStrValue(stringV)
	for i, v in x229010_g_StrList2 do
		if v == stringV then
			return i-1
		end
	end
	local strText = format("C�n ph�i %s ��ng k� StrList trong", stringV)
	--PrintStr(strText)
	return 0;
end

--changed by xindefeng
--��x229000_IsFubenMission(),x229000_SetFubenMissionSucc()����
function x229010_GetStrValueByStrIndex(sceneId, index)
	if index+1 >= 1 and index+1 <= getn(x229010_g_StrList2) then
		return x229010_g_StrList2[index+1]	
	end
	return""
end

function x229010_AddOtherMenpaiFubenMission(sceneId, selfId, missionId, targetId)
	local index	= 1
	local a = {}
		
	for i, v in x229010_g_FuBen_List do
		if v.menpai ~= GetMenPai(sceneId, selfId) then
			a[index] = i
			index = index + 1
		end	
	end
	
	index = a[random(getn(a))]
	
	local menpaiName = x229010_g_FuBen_List[index].menpainame
	local npcName =  x229010_g_FuBen_List[index].NpcName
	local fubenName =  x229010_g_FuBen_List[index].FubenName
	local nSceneId = x229010_g_FuBen_List[index].scene
	local posx = x229010_g_FuBen_List[index].posx
	local posz = x229010_g_FuBen_List[index].posz
	
	--���ӽ�������to� � ��Ҫ�ж�
	CallScriptFunction( 500501,"CheckAccept_Necessary", sceneId, selfId)
	
	--������������б�
	local bAdd = AddMission( sceneId,selfId, missionId, x229010_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	
	local nFormatIndex = GetMissionCacheData(sceneId, selfId, 0)
	local NpcNameIndex = x229010_GetStrIndexByStrValue(npcName)
	local MenpaiNameIndex = x229010_GetStrIndexByStrValue(menpaiName)
	
	-- �i�m������T�i 20c�i������to� � ���к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
		
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --����������ng�����(δ���)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229010_g_SubMissionTypeEnum.otherMenpaiFuben)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229010_g_StrForePart, MenpaiNameIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229010_g_StrForePart+1, MenpaiNameIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229010_g_StrForePart+2, NpcNameIndex)
	
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�#W: Nhi�m v� s� m�n", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID,"AskTheWay", sceneId, selfId, nSceneId, posx, posz, npcName)

	local strMissionTarget = format("Kh� l�m...... � b�n m�n ta, ng߽i lu�n ph�t d߽ng quang ��i, t�n t�m t�n l�c, c�n c� l�m vi�c. Ta s� giao cho ng߽i 1 nhi�m v� kh�c. %s v�a d�ng b� c�u ��a th� cho ta n�i h� c�n gi�p ��, ng߽i h�y �i t�m %s %s, �ng ta s� s�p x�p nhi�m v� c�a ng߽i",
			menpaiName, menpaiName, npcName)
			
	BeginEvent(sceneId)
		AddText(sceneId, strMissionTarget)
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)	
	
	-- �i�m������
	local round = GetMissionData(sceneId,selfId,MD_SHIMEN_HUAN)

	round = round + 1

	if	round >= 21 then
		SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, 1)
	else
		SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, round)
	end
	
end

--**********************************
--�о��¼�
--**********************************
function x229010_OnEnumerate( sceneId, selfId, targetId )
	return
end

--**********************************
--����
--**********************************
function x229010_OnAbandon( sceneId, selfId )
	local shimenMissionIdList = {1080, 1090, 1065, 1070, 1060, 1100, 1075, 1085, 1095}
	for i, v in shimenMissionIdList do
		if IsHaveMission(sceneId,selfId,v) > 0	 then
			--ɾ����������б��ж�Ӧto� � ����
	  	DelMission( sceneId, selfId, v )
	  	SetMissionData(sceneId,selfId,MD_SHIMEN_HUAN,0)	--������0
 			--����ͨ�÷����ӿ�
			------------------------------------------------------------------
		  CallScriptFunction( 500501,"Abandon_Necessary", sceneId, selfId )
			-------------------------------------------------------------------
			break
		end	
	end
end

