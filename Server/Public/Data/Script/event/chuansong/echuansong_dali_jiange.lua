--玩家进入m祎 c醝 area 时触发
function x400007_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 7,40,278)
	--增加Ki猰 C醕2/3 到姓i L�2/3to� 鸬 传送脚本相关内容	
	if sceneId ==2 then    -- 姓i L�1就到Ki猰 C醕1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 7,40,278)
	elseif sceneId ==71 then -- 姓i L�2就到Ki猰 C醕3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 75,40,278)		
	elseif sceneId ==72 then -- 姓i L�3就到Ki猰 C醕3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 76,40,278)			
	end
end

--玩家T読 m祎 c醝 area 呆了m祎 段时间没走则定时触发
function x400007_OnTimer( sceneId, selfId )
	-- 毫 gi鈟,看T読 C醝 n鄖  area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi鈟后仍未传送
	if StandingTime >= 5000 then
		x400007_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开m祎 c醝 area 时触发
function x400007_OnLeaveArea( sceneId, selfId )
end
