--�ķ���c�p
--************************************************************************
--MisDescBegin
--�ű���
x890212_g_ScriptId	= 890212

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x890212_OnDefaultEvent( sceneId, selfId, targetId )
	if GetLevel(sceneId,selfId) >= 90  then
		BeginEvent( sceneId )
		AddText( sceneId, "   #WCh�o b�n! n�u b�n mu�n thay �i m�n ph�i th� t�i g�p t�i h�  #r#G L�u �: #WC�n c� #YM�n Ph�i Chuy�n Ho�n L�nh #Wc� th� mua trong Shop �i�m T�ng. T�t c� t�m ph�p s� v� 80." )
		    --AddText( sceneId, "T�m ng�ng thay �i m�n ph�i" )
			--AddNumText( sceneId, x890012_g_ScriptId, "Ta mu�n n�ng t�m ph�p",6,14 )
			AddNumText( sceneId, x002095_g_ScriptId, "#GTa mu�n thay �i m�n ph�i",6,120 )
    		EndEvent( sceneId )
	else
		BeginEvent( sceneId )
			AddText(sceneId,"Thay �i m�n ph�i ch� h� tr� cho ai c� c�p � 90 tr� l�n")
		EndEvent( sceneId )
	end
end
--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x890212_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
       x890212_g_MenPai = GetMenPai(sceneId, selfId)	
	if key == 14 then
	BeginEvent( sceneId )
		AddText( sceneId, "Ь n�ng c�p vui l�ng �n v�o m�n ph�i t߽ng �ng c�a b�n." )
		AddNumText( sceneId, x002093_g_ScriptId, "Tinh T�c",3,20 )
		AddNumText( sceneId, x002093_g_ScriptId, "Ti�u Giao",3,21 )
		AddNumText( sceneId, x002093_g_ScriptId, "Thi�u L�m",3,22 )
		AddNumText( sceneId, x002093_g_ScriptId, "Thi�n S�n",3,23 )
		AddNumText( sceneId, x002093_g_ScriptId, "Thi�n Long",3,24 )
		AddNumText( sceneId, x002093_g_ScriptId, "Nga My",3,25 )
		AddNumText( sceneId, x002093_g_ScriptId, "V� �ang",3,26 )
		AddNumText( sceneId, x002093_g_ScriptId, "Minh Gi�o",3,27 )
		AddNumText( sceneId, x002093_g_ScriptId, "C�i Bang",3,28 )
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 20 then
		if x890212_g_MenPai == 5   then
			local	Xingxiulevel = LuaFnGetXinFaLevel(sceneId,selfId,60 )
			if Xingxiulevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,31,80)
				LuaFnSetXinFaLevel(sceneId,selfId,32,80)
				LuaFnSetXinFaLevel(sceneId,selfId,33,80)
				LuaFnSetXinFaLevel(sceneId,selfId,34,80)
				LuaFnSetXinFaLevel(sceneId,selfId,35,80)
				LuaFnSetXinFaLevel(sceneId,selfId,36,80)
				LuaFnSetXinFaLevel(sceneId,selfId,60,80)
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Ch�c m�ng b�n �� n�ng c�p T�m ph�p 80 th�nh c�ng" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Xin vui l�ng n�ng t�m ph�p l�n 119 r�i h�y quay tr� l�i!" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#GH�y ch�n ��ng m�n ph�i � n�ng c�p T�m ph�p." )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 21 then
		if x890212_g_MenPai == 8   then
			local	Xiaoyaolevel = LuaFnGetXinFaLevel(sceneId,selfId,63 )
			if Xiaoyaolevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,49,80)
				LuaFnSetXinFaLevel(sceneId,selfId,50,80)
				LuaFnSetXinFaLevel(sceneId,selfId,51,80)
				LuaFnSetXinFaLevel(sceneId,selfId,52,80)
				LuaFnSetXinFaLevel(sceneId,selfId,53,80)
				LuaFnSetXinFaLevel(sceneId,selfId,54,80)
				LuaFnSetXinFaLevel(sceneId,selfId,63,80)
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Ch�c m�ng b�n �� n�ng c�p T�m ph�p 80 th�nh c�ng" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Xin vui l�ng n�ng t�m ph�p l�n 119 r�i h�y quay tr� l�i!" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#GH�y ch�n ��ng m�n ph�i � n�ng c�p T�m ph�p." )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 22 then
		if x890212_g_MenPai == 0   then
			local	Shaolinlevel = LuaFnGetXinFaLevel(sceneId,selfId,55 )
			if Shaolinlevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,1,80)
				LuaFnSetXinFaLevel(sceneId,selfId,2,80)
				LuaFnSetXinFaLevel(sceneId,selfId,3,80)
				LuaFnSetXinFaLevel(sceneId,selfId,4,80)
				LuaFnSetXinFaLevel(sceneId,selfId,5,80)
				LuaFnSetXinFaLevel(sceneId,selfId,6,80)
				LuaFnSetXinFaLevel(sceneId,selfId,55,80)
				LuaFnSetXinFaLevel(sceneId,selfId,72,80)
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Ch�c m�ng b�n �� n�ng c�p T�m ph�p 80 th�nh c�ng" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Xin vui l�ng n�ng t�m ph�p l�n 119 r�i h�y quay tr� l�i!" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#GH�y ch�n ��ng m�n ph�i � n�ng c�p T�m ph�p." )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 23 then
		if x890212_g_MenPai == 7   then
			local	Tianshanlevel = LuaFnGetXinFaLevel(sceneId,selfId,62 )
			if Tianshanlevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,43,80)
				LuaFnSetXinFaLevel(sceneId,selfId,44,80)
				LuaFnSetXinFaLevel(sceneId,selfId,45,80)
				LuaFnSetXinFaLevel(sceneId,selfId,46,80)
				LuaFnSetXinFaLevel(sceneId,selfId,47,80)
				LuaFnSetXinFaLevel(sceneId,selfId,48,80)
				LuaFnSetXinFaLevel(sceneId,selfId,62,80)
				LuaFnSetXinFaLevel(sceneId,selfId,79,80)
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Ch�c m�ng b�n �� n�ng c�p T�m ph�p 80 th�nh c�ng" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Xin vui l�ng n�ng t�m ph�p l�n 119 r�i h�y quay tr� l�i!" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#GH�y ch�n ��ng m�n ph�i � n�ng c�p T�m ph�p." )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 24 then
		if x890212_g_MenPai == 6   then
			local	Tianlonglevel = LuaFnGetXinFaLevel(sceneId,selfId,61 )
			if Tianlonglevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,37,80)
				LuaFnSetXinFaLevel(sceneId,selfId,38,80)
				LuaFnSetXinFaLevel(sceneId,selfId,39,80)
				LuaFnSetXinFaLevel(sceneId,selfId,40,80)
				LuaFnSetXinFaLevel(sceneId,selfId,41,80)
				LuaFnSetXinFaLevel(sceneId,selfId,42,80)
				LuaFnSetXinFaLevel(sceneId,selfId,61,80)
				LuaFnSetXinFaLevel(sceneId,selfId,78,80)
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Ch�c m�ng b�n �� n�ng c�p T�m ph�p 80 th�nh c�ng" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Xin vui l�ng n�ng t�m ph�p l�n 119 r�i h�y quay tr� l�i!" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#GH�y ch�n ��ng m�n ph�i � n�ng c�p T�m ph�p." )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 25 then
		if x890212_g_MenPai == 4   then
			local	Ermeilevel = LuaFnGetXinFaLevel(sceneId,selfId,59 )
			if Ermeilevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,25,80)
				LuaFnSetXinFaLevel(sceneId,selfId,26,80)
				LuaFnSetXinFaLevel(sceneId,selfId,27,80)
				LuaFnSetXinFaLevel(sceneId,selfId,28,80)
				LuaFnSetXinFaLevel(sceneId,selfId,29,80)
				LuaFnSetXinFaLevel(sceneId,selfId,30,80)
				LuaFnSetXinFaLevel(sceneId,selfId,59,80)
				LuaFnSetXinFaLevel(sceneId,selfId,76,80)
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Ch�c m�ng b�n �� n�ng c�p T�m ph�p 80 th�nh c�ng" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Xin vui l�ng n�ng t�m ph�p l�n 119 r�i h�y quay tr� l�i!" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#GH�y ch�n ��ng m�n ph�i � n�ng c�p T�m ph�p." )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 26 then
		if x890212_g_MenPai == 3   then
			local	Wudanglevel = LuaFnGetXinFaLevel(sceneId,selfId,58 )
			if Wudanglevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,19,80)
				LuaFnSetXinFaLevel(sceneId,selfId,20,80)
				LuaFnSetXinFaLevel(sceneId,selfId,21,80)
				LuaFnSetXinFaLevel(sceneId,selfId,22,80)
				LuaFnSetXinFaLevel(sceneId,selfId,23,80)
				LuaFnSetXinFaLevel(sceneId,selfId,24,80)
				LuaFnSetXinFaLevel(sceneId,selfId,58,80)
				LuaFnSetXinFaLevel(sceneId,selfId,75,80)
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Ch�c m�ng b�n �� n�ng c�p T�m ph�p 80 th�nh c�ng" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Xin vui l�ng n�ng t�m ph�p l�n 119 r�i h�y quay tr� l�i!" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#GH�y ch�n ��ng m�n ph�i � n�ng c�p T�m ph�p." )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 27 then
		if x890212_g_MenPai == 1   then
			local	Mingjiaolevel = LuaFnGetXinFaLevel(sceneId,selfId,56 )
			if Mingjiaolevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,7,80)
				LuaFnSetXinFaLevel(sceneId,selfId,8,80)
				LuaFnSetXinFaLevel(sceneId,selfId,9,80)
				LuaFnSetXinFaLevel(sceneId,selfId,10,80)
				LuaFnSetXinFaLevel(sceneId,selfId,11,80)
				LuaFnSetXinFaLevel(sceneId,selfId,12,80)
				LuaFnSetXinFaLevel(sceneId,selfId,56,80)
				LuaFnSetXinFaLevel(sceneId,selfId,73,80)
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Ch�c m�ng b�n �� n�ng c�p T�m ph�p 80 th�nh c�ng" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Xin vui l�ng n�ng t�m ph�p l�n 119 r�i h�y quay tr� l�i!" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#GH�y ch�n ��ng m�n ph�i � n�ng c�p T�m ph�p." )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 28 then
		if x890212_g_MenPai == 2   then
			local	Xingxiulevel = LuaFnGetXinFaLevel(sceneId,selfId,57 )
			if Xingxiulevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,13,80)
				LuaFnSetXinFaLevel(sceneId,selfId,14,80)
				LuaFnSetXinFaLevel(sceneId,selfId,15,80)
				LuaFnSetXinFaLevel(sceneId,selfId,16,80)
				LuaFnSetXinFaLevel(sceneId,selfId,17,80)
				LuaFnSetXinFaLevel(sceneId,selfId,18,80)
				LuaFnSetXinFaLevel(sceneId,selfId,57,80)
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Ch�c m�ng b�n �� n�ng c�p T�m ph�p 80 th�nh c�ng" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#ebb3e9f#cfd94b0Xin vui l�ng n�ng t�m ph�p l�n 119 r�i h�y quay tr� l�i!" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#GH�y ch�n ��ng m�n ph�i � n�ng c�p T�m ph�p." )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	
----------	�oi mon phai ------------
	if key == 120 then
		local	nam	= LuaFnGetName( sceneId, selfId )
		if LuaFnGetAvailableItemCount(sceneId, selfId, 39901003) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "H�y ch�n m�n ph�i mu�n thay �i. Ch�c c�c h� ch�i game vui v�!" )	
			AddNumText( sceneId, x002095_g_ScriptId, "Tinh T�c",3,121 )
			AddNumText( sceneId, x002095_g_ScriptId, "Ti�u Dao",3,122 )
			AddNumText( sceneId, x002095_g_ScriptId, "Thi�u L�m",3,123 )
			AddNumText( sceneId, x002095_g_ScriptId, "Thi�n S�n",3,124 )
			AddNumText( sceneId, x002095_g_ScriptId, "Thi�n Long",3,125 )
			AddNumText( sceneId, x002095_g_ScriptId, "Nga My",3,126 )
			AddNumText( sceneId, x002095_g_ScriptId, "V� �ang",3,127 )
			AddNumText( sceneId, x002095_g_ScriptId, "Minh Gi�o",3,128 )
			AddNumText( sceneId, x002095_g_ScriptId, "C�i Bang",3,129 )
    		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		else
		BeginEvent(sceneId)
			AddText(sceneId, "C�c h� kh�ng �� �i�u ki�n. Ь thay �i m�n ph�i c�n c�#Y M�n Ph�i Chuy�n Ho�n L�nh")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId) 
		end
	end
	if key == 121 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
		LuaFnSetXinFaLevel(sceneId,selfId,31,80)
		LuaFnSetXinFaLevel(sceneId,selfId,32,80)
		LuaFnSetXinFaLevel(sceneId,selfId,33,80)
		LuaFnSetXinFaLevel(sceneId,selfId,34,80)
		LuaFnSetXinFaLevel(sceneId,selfId,35,80)
		LuaFnSetXinFaLevel(sceneId,selfId,36,80)
		LuaFnSetXinFaLevel(sceneId,selfId,60,80)
		LuaFnSetXinFaLevel(sceneId,selfId,77,80)
		LuaFnDelAvailableItem(sceneId,selfId,39901003,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GHoang ngh�nh c�c h� gia nh�p #B[Ph�i Tinh T�c] #GCh�c c�c h� c� nh�ng tr�i nghi�m vui v�!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 122 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
		LuaFnSetXinFaLevel(sceneId,selfId,49,80)
		LuaFnSetXinFaLevel(sceneId,selfId,50,80)
		LuaFnSetXinFaLevel(sceneId,selfId,51,80)
		LuaFnSetXinFaLevel(sceneId,selfId,52,80)
		LuaFnSetXinFaLevel(sceneId,selfId,53,80)
		LuaFnSetXinFaLevel(sceneId,selfId,54,80)
		LuaFnSetXinFaLevel(sceneId,selfId,63,80)
		LuaFnSetXinFaLevel(sceneId,selfId,80,80)
		LuaFnDelAvailableItem(sceneId,selfId,39901003,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GHoang ngh�nh c�c h� gia nh�p #B[Ph�i Ti�u Dao] #GCh�c c�c h� c� nh�ng tr�i nghi�m vui v�!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 123 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
		LuaFnSetXinFaLevel(sceneId,selfId,1,80)
		LuaFnSetXinFaLevel(sceneId,selfId,2,80)
		LuaFnSetXinFaLevel(sceneId,selfId,3,80)
		LuaFnSetXinFaLevel(sceneId,selfId,4,80)
		LuaFnSetXinFaLevel(sceneId,selfId,5,80)
		LuaFnSetXinFaLevel(sceneId,selfId,6,80)
		LuaFnSetXinFaLevel(sceneId,selfId,55,80)
		LuaFnSetXinFaLevel(sceneId,selfId,72,80)
		LuaFnDelAvailableItem(sceneId,selfId,39901003,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GHoang ngh�nh c�c h� gia nh�p #B[Ph�i Thi�u L�m] #GCh�c c�c h� c� nh�ng tr�i nghi�m vui v�!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 124 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
		LuaFnSetXinFaLevel(sceneId,selfId,43,80)
		LuaFnSetXinFaLevel(sceneId,selfId,44,80)
		LuaFnSetXinFaLevel(sceneId,selfId,45,80)
		LuaFnSetXinFaLevel(sceneId,selfId,46,80)
		LuaFnSetXinFaLevel(sceneId,selfId,47,80)
		LuaFnSetXinFaLevel(sceneId,selfId,48,80)
		LuaFnSetXinFaLevel(sceneId,selfId,62,80)
		LuaFnSetXinFaLevel(sceneId,selfId,79,80)
		LuaFnDelAvailableItem(sceneId,selfId,39901003,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GHoang ngh�nh c�c h� gia nh�p #B[Ph�i Thi�n S�n] #GCh�c c�c h� c� nh�ng tr�i nghi�m vui v�!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 125 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
		LuaFnSetXinFaLevel(sceneId,selfId,37,80)
		LuaFnSetXinFaLevel(sceneId,selfId,38,80)
		LuaFnSetXinFaLevel(sceneId,selfId,39,80)
		LuaFnSetXinFaLevel(sceneId,selfId,40,80)
		LuaFnSetXinFaLevel(sceneId,selfId,41,80)
		LuaFnSetXinFaLevel(sceneId,selfId,42,80)
		LuaFnSetXinFaLevel(sceneId,selfId,61,80)
		LuaFnSetXinFaLevel(sceneId,selfId,78,80)
		LuaFnDelAvailableItem(sceneId,selfId,39901003,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GHoang ngh�nh c�c h� gia nh�p #B[Ph�i Thi�n Long] #GCh�c c�c h� c� nh�ng tr�i nghi�m vui v�!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 126 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
		LuaFnSetXinFaLevel(sceneId,selfId,25,80)
		LuaFnSetXinFaLevel(sceneId,selfId,26,80)
		LuaFnSetXinFaLevel(sceneId,selfId,27,80)
		LuaFnSetXinFaLevel(sceneId,selfId,28,80)
		LuaFnSetXinFaLevel(sceneId,selfId,29,80)
		LuaFnSetXinFaLevel(sceneId,selfId,30,80)
		LuaFnSetXinFaLevel(sceneId,selfId,59,80)
		LuaFnSetXinFaLevel(sceneId,selfId,76,80)
		LuaFnDelAvailableItem(sceneId,selfId,39901003,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GHoang ngh�nh c�c h� gia nh�p #B[Ph�i Nga Mi] #GCh�c c�c h� c� nh�ng tr�i nghi�m vui v�!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 127 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
		LuaFnSetXinFaLevel(sceneId,selfId,19,80)
		LuaFnSetXinFaLevel(sceneId,selfId,20,80)
		LuaFnSetXinFaLevel(sceneId,selfId,21,80)
		LuaFnSetXinFaLevel(sceneId,selfId,22,80)
		LuaFnSetXinFaLevel(sceneId,selfId,23,80)
		LuaFnSetXinFaLevel(sceneId,selfId,24,80)
		LuaFnSetXinFaLevel(sceneId,selfId,58,80)
		LuaFnSetXinFaLevel(sceneId,selfId,75,80)
		LuaFnDelAvailableItem(sceneId,selfId,39901003,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GHoang ngh�nh c�c h� gia nh�p #B[Ph�i V� �ang] #GCh�c c�c h� c� nh�ng tr�i nghi�m vui v�!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 128 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
		LuaFnSetXinFaLevel(sceneId,selfId,7,80)
		LuaFnSetXinFaLevel(sceneId,selfId,8,80)
		LuaFnSetXinFaLevel(sceneId,selfId,9,80)
		LuaFnSetXinFaLevel(sceneId,selfId,10,80)
		LuaFnSetXinFaLevel(sceneId,selfId,11,80)
		LuaFnSetXinFaLevel(sceneId,selfId,12,80)
		LuaFnSetXinFaLevel(sceneId,selfId,56,80)
		LuaFnSetXinFaLevel(sceneId,selfId,73,80)
		LuaFnDelAvailableItem(sceneId,selfId,39901003,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GHoang ngh�nh c�c h� gia nh�p #B[Ph�i Minh Gi�o] #GCh�c c�c h� c� nh�ng tr�i nghi�m vui v�!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 129 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
		LuaFnSetXinFaLevel(sceneId,selfId,13,80)
		LuaFnSetXinFaLevel(sceneId,selfId,14,80)
		LuaFnSetXinFaLevel(sceneId,selfId,15,80)
		LuaFnSetXinFaLevel(sceneId,selfId,16,80)
		LuaFnSetXinFaLevel(sceneId,selfId,17,80)
		LuaFnSetXinFaLevel(sceneId,selfId,18,80)
		LuaFnSetXinFaLevel(sceneId,selfId,57,80)
		LuaFnSetXinFaLevel(sceneId,selfId,74,80)
		LuaFnDelAvailableItem(sceneId,selfId,39901003,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GHoang ngh�nh c�c h� gia nh�p #B[ph�i C�i Bang] #GCh�c c�c h� c� nh�ng tr�i nghi�m vui v�!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end