--Th�p nh� S�t Tinh
--Ph� Ph�m, Ph� Tr�n
--Author: Ho�ng Steven

--************************--
x910115_g_ScriptId=910115												
--************************--
x910115_g_Young_Monk_1="Ph� Ph�m"
x910115_g_Young_Monk_2="Ph� Tr�n"
--************************--
x910115_g_Title=																			--List danh hi�u
{
	[1]={	Name="Qu�ng M�c Thi�n V߽ng",	Won_Time=1,		Infor1="Ь ��t danh hi�u n�y c�n ��nh b�i t�t c� s�t tinh #G",	Infor2=" l�n#W."	},
	[2]={	Name="�a V�n Thi�n V߽ng",		Won_Time=10,	Infor1="Ь ��t danh hi�u n�y c�n ��nh b�i t�t c� s�t tinh #G",	Infor2=" l�n#W."	},
	[3]={	Name="T�ng Tr߷ng Thi�n V߽ng",	Won_Time=50,	Infor1="Ь ��t danh hi�u n�y c�n ��nh b�i t�t c� s�t tinh #G",	Infor2=" l�n#W."	},
	[4]={	Name="Tr� Qu�c Thi�n V߽ng",	Won_Time=200,	Infor1="Ь ��t danh hi�u n�y c�n ��nh b�i t�t c� s�t tinh #G",	Infor2=" l�n#W."	},
}
--************************--
x910115_g_Global_List=																		--Danh s�ch c�c bi�n Global
{
	[1]=SHENGSI_CONGTONTHANH,
	[2]=SHENGSI_HOADUNG,
	[3]=SHENGSI_NGOVINH,
	[4]=SHENGSI_VOTUNG,
	[5]=SHENGSI_LAMSUNG,
	[6]=SHENGSI_HODIENTRAC,
	[7]=SHENGSI_TONGKHUONG,
	[8]=SHENGSI_LUQUANDAT,
	[9]=SHENGSI_LYKHOI,
	[10]=SHENGSI_QUANTHINH,
	[11]=SHENGSI_LOCHISINH,
	[12]=SHENGSI_TANMINH,
}
--************************--
x910115_g_Impact_List={9760,9762,9772,9775,9753}											--Danh s�ch c�c hi�u �ng do Boss � l�i
--************************--

--*****************************--
--*     On Default Event      *--
--*****************************--
function x910115_OnDefaultEvent(sceneId,selfId,targetId)

	--************************--
	BeginEvent(sceneId)
		if GetName(sceneId,targetId)==x910115_g_Young_Monk_2 then
			AddText(sceneId,"Trong tr�n chi�n #GTh�p nh� S�t Tinh#W gian kh�, ch�c h�n c�c v� �u �� b� t�n h�i l�n lao. Ti�u t�ng kh�ng bi�t l�m g� � gi�p c�c v� c�, ch� c� th� gi�p c�c v� x�a �i nh�ng hi�u �ng x�u do ch�ng � l�i. Ti�u t�ng s� c� h�t s�c m�nh!")
			AddNumText(sceneId,x910115_g_ScriptId,"X�a b� hi�u �ng Boss � l�i",6,0)		--X�a b� c�c hi�u �ng do Boss c�n � l�i
			AddNumText(sceneId,x910115_g_ScriptId,"B� qua",-1,1)							--B� qua
		else
			AddText(sceneId,"Tr�n chi�n #GTh�p nh� S�t Tinh#W gian kh�, m�i l�n ��nh b�i t�t c� #G12 S�t Tinh#W th� s� t�ng #G1 �i�m#W danh v�ng. Khi danh v�ng ��t �n ng��ng n�o �� c� th� �i l�y danh hi�u #GChi�n th�ng Th�p nh� S�t Tinh#W cao qu�. Ti�u t�ng c� th� gi�p g�?")
			AddNumText(sceneId,x910115_g_ScriptId,"бi danh hi�u #GTh�p nh� S�t Tinh",6,2)	--бi danh hi�u
			AddNumText(sceneId,x910115_g_ScriptId,"V� danh hi�u #GTh�p nh� S�t Tinh",11,3)	--бi danh hi�u
			AddNumText(sceneId,x910115_g_ScriptId,"B� qua",-1,1)							--B� qua
		end
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	--************************--
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x910115_OnEventRequest(sceneId,selfId,targetId,eventId)
local key=GetNumText()

	--************************--
	if key==1 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,1000)
	end
	--************************--
	if key==0 then
		local nFind=0
		for i=1,getn(x910115_g_Impact_List) do
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910115_g_Impact_List[i])>0 then
				nFind=1
				LuaFnCancelSpecificImpact(sceneId,selfId,x910115_g_Impact_List[i])
			end
		end
		if nFind==0 then
			BeginEvent(sceneId)			
				AddText(sceneId,"Tr�n ng߶i c�c h� kh�ng c� b�t k� �nh h߷ng x�u n�o!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			BeginEvent(sceneId)			
				AddText(sceneId,"Ti�u t�ng �� ho�n th�nh c�ng vi�c c�a m�nh r�i. C�c h� c�m th�y th� n�o?")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end
	--************************--
	if key==2 then
		local Min=GetMissionData(sceneId,selfId,x910115_g_Global_List[1])
		for i=2,12 do
			if GetMissionData(sceneId,selfId,x910115_g_Global_List[i])<Min then
				Min=GetMissionData(sceneId,selfId,x910115_g_Global_List[i])
			end
		end
		if Min==0 then
			BeginEvent(sceneId)
				AddText(sceneId,"S� l�n chi�n th�ng t�t c� #G12 S�t Tinh#W c�a c�c h� l� #G0 l�n#W.")
				AddText(sceneId,"C�c h� c�n n� l�c h�n n�a, chi�n th�ng t�t c� #GS�t Tinh#W s� nh�n ���c danh hi�u cao qu� h�n!")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			local nTitle=""
			for i=1,getn(x910115_g_Title) do
				if Min<=x910115_g_Title[i].Won_Time then
					nTitle=x910115_g_Title[i].Name
				end
			end
			AwardNickTitle(sceneId,selfId,"#B#460 "..nTitle.." #461")
			DispatchAllTitle(sceneId,selfId)
			BeginEvent(sceneId)
				AddText(sceneId,"S� l�n chi�n th�ng t�t c� #G12 S�t Tinh#W c�a c�c h� l� #G"..Min.." l�n#W.")
				AddText(sceneId,"Danh hi�u t߽ng �ng hi�n t�i c�a c�c h� l� #G"..nTitle.."!")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end
	--************************--
	if key==3 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c lo�i danh hi�u cao qu� t߽ng �ng v�i n� l�c ��nh b�i #G12 S�t Tinh#W c�a c�c v�. C� th� nh� sau:")
			AddText(sceneId,"#cffcccc----------------------------------")
			for i=1,getn(x910115_g_Title) do
				AddText(sceneId,"Danh hi�u #Y"..x910115_g_Title[i].Name.."#r#W"..x910115_g_Title[i].Infor1..x910115_g_Title[i].Won_Time..x910115_g_Title[i].Infor2)
				AddText(sceneId,"#cffcccc----------------------------------")
			end
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	--************************--
	
end