--如意小子
--L頽h 花种子
--你看不到我,看不到,看不到O(∩_∩)O~ OK我们开始吧。。。。。。
x000178_g_ScriptId	= 000178
--************************************************************************
function x000178_OnDefaultEvent( sceneId, selfId, targetId )
		local CurTime = GetQuarterTime();
		local iTime = GetMissionData( sceneId, selfId, MD_XIANHUAZHONGZI );
		if iTime+3 >= CurTime then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000鲜花to� 鸬 种子每隔m祎 小时L頽h m祎 次,请过m祎 会再来." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
	    BeginEvent( sceneId )
		  AddText( sceneId, "#W姓i L嫘鷑gc醝美丽to� 鸬 地方,四季如春,对于m祎 c醝种花人来说,这里就喧ng天堂。今年我带来了m祎 些波斯to� 鸬 玫瑰,不料被Hoa ti阯 t豑inhLinh给盗走." )
		  AddNumText( sceneId, x000178_g_ScriptId, "鲜花to� 鸬 种子#G每小时L頽h m祎 次",5,10 )
	    EndEvent( sceneId )
	    DispatchEventList( sceneId, selfId, targetId )
    end
end
--************************************************************************
function x000178_OnEventRequest( sceneId, selfId, targetId, eventId )
	  local	key	= GetNumText()
	  if key == 10 then
	  local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	  if FreeSpace < 4  then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000Ch� tr痭g trong t鷌 x醕h kh鬾g 瘘,请T読 道具包保留四c醝空位." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
	 local level = GetLevel( sceneId, selfId )
	 if level < 60 then
		  BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000等级不足60级无法L頽h " )
		  EndEvent( sceneId )
		  DispatchEventList( sceneId, selfId, targetId )
		  return
		else
		  BeginEvent( sceneId ) 
			TryRecieveItem( sceneId, selfId, 30309813,1)
			TryRecieveItem( sceneId, selfId, 30309813,1)
			TryRecieveItem( sceneId, selfId, 30309813,1)
			AddText( sceneId, "#GCh鷆 m譶g你 鹫t 疬㧟三颗鲜花to� 鸬 种子!" )
			EndEvent( sceneId )
      DispatchEventList( sceneId, selfId, targetId )
	local playerName = GetName(sceneId,selfId)
	local strText = format("#G#{_INFOUSR%s}#W正T読 #c00ffff姓i L齕307,164]#cff99ff阿里#W处询问着种花to� 鸬 Kinh nghi甿,阿里竟然慷慨to� 鸬  疬a cho 他三颗#G鲜花to� 鸬 种子!",playerName ) 
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		local CurTime = GetQuarterTime();
	    SetMissionData(sceneId, selfId, MD_XIANHUAZHONGZI, CurTime);
      end
	  end
	end
end	

--如意小子写to� 鸬 ,看似简单其实很复杂,盗用to� 鸬 都喧ng菊花*************************************
