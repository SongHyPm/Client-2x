--��ȪNPC
--Th�nh ph� ������1
x031030_g_scriptId=031030

x031030_g_city0 = 208
x031030_g_city1 = 226
x031030_g_city2 = 600
x031030_g_city3 = 618

--**********************************

--�¼��������

--**********************************

function x031030_OnDefaultEvent( sceneId, selfId,targetId )

	strCity0Name = CityGetCityName(sceneId, selfId, x031030_g_city0)
	strCity1Name = CityGetCityName(sceneId, selfId, x031030_g_city1)
	strCity2Name = CityGetCityName(sceneId, selfId, x031030_g_city2)
	strCity3Name = CityGetCityName(sceneId, selfId, x031030_g_city3)


	BeginEvent(sceneId)

		AddText(sceneId,"C� g� ta c� th� gi�p ���c ng߽i kh�ng?")
		
		if(strCity0Name ~= "") then AddNumText(sceneId,x031030_g_scriptId,"Th�nh ph� 1  "..strCity0Name,9,0) end
		if(strCity1Name ~= "") then AddNumText(sceneId,x031030_g_scriptId,"Th�nh ph� 2  "..strCity1Name,9,1) end
		if(strCity2Name ~= "") then AddNumText(sceneId,x031030_g_scriptId,"Th�nh ph� 3  "..strCity2Name,9,2) end
		if(strCity3Name ~= "") then AddNumText(sceneId,x031030_g_scriptId,"Th�nh ph� 4  "..strCity3Name,9,3) end

	EndEvent(sceneId)

	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************

--�¼��б�ѡ��m�t ��

--**********************************

function x031030_OnEventRequest( sceneId, selfId, targetId, eventId )

	if	(GetNumText()==0)	then	CityMoveToScene(sceneId, selfId, x031030_g_city0, 99, 152)
	elseif	(GetNumText()==1)	then	CityMoveToScene(sceneId, selfId, x031030_g_city1, 99, 152)
	elseif	(GetNumText()==2)	then	CityMoveToScene(sceneId, selfId, x031030_g_city2, 99, 152)
	elseif	(GetNumText()==3)	then	CityMoveToScene(sceneId, selfId, x031030_g_city3, 99, 152)
	end

end
