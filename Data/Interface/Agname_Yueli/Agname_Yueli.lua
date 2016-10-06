local g_Agname_Yueli_Frame_UnifiedPosition;

function Agname_Yueli_PreLoad()
	this:RegisterEvent("SHOW_YUELIATTR");
	-- ��Ϸ���ڳߴ緢���˱仯
	this:RegisterEvent("ADJEST_UI_POS")
	-- ��Ϸ�ֱ��ʷ����˱仯
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
end

function Agname_Yueli_OnLoad()
  g_Agname_Yueli_Frame_UnifiedPosition=Agname_Yueli_Frame:GetProperty("UnifiedPosition");
end

-- OnEvent
function Agname_Yueli_OnEvent(event)

	if(event == "SHOW_YUELIATTR") then
		if( this:IsVisible() ) then
			this:Hide();
		else
			Agname_Yueli_Open();
		end
	end
		-- ��Ϸ���ڳߴ緢���˱仯
	if (event == "ADJEST_UI_POS" ) then
		Agname_Yueli_Frame_On_ResetPos()
	-- ��Ϸ�ֱ��ʷ����˱仯
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		Agname_Yueli_Frame_On_ResetPos()
	end
end

function Agname_Yueli_Open()

   this:Show();

	Agname_Yueli_List:RemoveAllItem();

   --�������еĸ������ԣ��ﵽ��Ϊ��ɫ���Ǵﵽ��Ϊ��ɫ
   local nNum = Player:GetYueliNum();
   local nValue = Player:GetCurAgYueLi();
   local i;
   for i=0, nNum-1 do
	 local bNeedShow = Player:IsNeedShowYueLiAttr(i);
	 if bNeedShow ~= 1 then
		continue ;
	 end
     local nPoint, effect = Player:GetYueliItem(i);

	 if nValue < nPoint then
		nPoint = "#caea17a" ..nPoint;
		effect = "#caea17a" ..effect;
	 end

	 Agname_Yueli_List:AddNewItem(nPoint, 0, i);
	 Agname_Yueli_List:AddNewItem(effect, 1, i);
   end

end

--================================================
-- �ָ������Ĭ�����λ��
--================================================
function Agname_Yueli_Frame_On_ResetPos()
  Agname_Yueli_Frame:SetProperty("UnifiedPosition", g_Yueli_Frame_UnifiedPosition);
end
