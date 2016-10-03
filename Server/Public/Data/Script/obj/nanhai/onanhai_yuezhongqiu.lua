--Nam H鋓NPC
--岳仲秋
--普通

--脚本号
x034003_g_ScriptId = 34003

--**********************************
--事件交互入口
--**********************************
function x034003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Th秈 tr呔c, Ng誧 ng� bang c鹡g r t痶, ch� c� h鄋h 鸬ng h絠 ki陁 c錸g m� th鬷, ch遖 t譶g l鄊 vi甤 g� qu� x. Nh遪g d d, ch苙g bi猼 t� 疴u, b鱪 nh骳 痼 b 馥u su痶 ng鄖 g鈟 h鱝, l鄊 sai c騨 kh鬾g ch竨 nh, 鬷... th l� nghi畃 ch呔ng..")
		
		-- 如果玩家身上有“长白————天涯海角”,C醝 n鄖 任务, c� th� � 这里 鹫t 疬㧟道具
		if IsHaveMission(sceneId,selfId,568) > 0 then
			-- 判定玩家身上喧ng不喧ng有物品了 
			local itemCount
			itemCount = GetItemCount( sceneId, selfId, 40001039 )
			if itemCount < 1   then
				AddNumText(sceneId,x034003_g_ScriptId,"羞㧟 m祎 mi猲g v� c鈟 gi痭g l�",7,666);
			end
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x034003_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if	GetNumText()==666	then
		local itemCount
		itemCount = GetItemCount( sceneId, selfId, 40001039 )
		if itemCount < 1   then
			BeginAddItem( sceneId )
				AddItem( sceneId, 40001039, 1 )
			local ret = EndAddItem( sceneId, selfId )
			if ret <= 0 then 
				--提示不能接任务了
				Msg2Player(  sceneId, selfId,"#Yh鄋h Trang nhi甿 v�#W c黙 c醕 h� 疸 馥y.", MSG2PLAYER_PARA )
			else
				AddItemListToHuman(sceneId,selfId)
			end
		end
	end
end


