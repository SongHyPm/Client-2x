--方玄劳

--任务号
x009016_g_MissionId = 1060

x009016_g_scriptId=009016

function x009016_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	misIndex = GetMissionIndexByID(sceneId,selfId,x009016_g_MissionId)
	BeginEvent(sceneId)
		AddText(sceneId,"  G 疴y to鄋 c鋗 th x呓ng c痶 l鰊g l雘.")
		if	IsHaveMission(sceneId,selfId,x009016_g_MissionId) > 0	 then
			if	GetMissionParam( sceneId, selfId, misIndex,0) < 1  and  GetMissionParam( sceneId, selfId, misIndex,3) == 2 then
				AddNumText(sceneId,x009016_g_scriptId,"Cho ng呓i Tr醤g C痶 x� l�",8,0)
			end
		end
	EndEvent( )
	DispatchEventList(sceneId,selfId,targetId)
end

function x009016_OnEventRequest( sceneId, selfId, targetId, eventId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x009016_g_MissionId)
	if	GetNumText()==0	then
		if	HaveItemInBag (  sceneId, selfId, 30202022)	 > 0  then
			DelItem (  sceneId, selfId, 30202022, 1)	
			SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
			BeginEvent(sceneId)
				AddText(sceneId,"C鋗 t� Tr醤g C痶 x� l� c黙 c醕 h�")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
			BeginEvent(sceneId)
				AddText(sceneId,"Ho鄋 t nhi甿 v�!")
			EndEvent( )
			DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Tr醤g C痶 x� l�? � 疴u?")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	end
end
