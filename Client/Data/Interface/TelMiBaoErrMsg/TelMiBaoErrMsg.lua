-- ***************************************************************
--
-- �绰�ܱ��Ĵ�����ʾ����
--
-- ***************************************************************


-- ע��onLoad�¼�
function TelMiBaoErrMsg_PreLoad()
	
	-- �򿪽���
	this:RegisterEvent("OPEN_WINDOW");
	
	-- �رս���
	this:RegisterEvent("CLOSE_WINDOW");
	
end

-- OnLoad
function TelMiBaoErrMsg_OnLoad()	
	-- �������������ϲ���ʾ
	TelMiBaoErrMsg_Frame_sub:SetProperty("AlwaysOnTop", "True");
end

-- �������ý���ߴ�
function TelMiBaoErrMsg_UpdateRect()
	local nWidth, nHeight = TelMiBaoErrMsg_InfoWindow:GetWindowSize();
	local nTitleHeight = 23;
	local nBottomHeight = 25;
	nWindowHeight = nTitleHeight + nBottomHeight + nHeight;
	TelMiBaoErrMsg_Frame_sub:SetProperty( "AbsoluteHeight", tostring( nWindowHeight ) );	
end

-- OnEvent
function TelMiBaoErrMsg_OnEvent(event)
	
	-- �򿪽���
	if (event == "OPEN_WINDOW") then		
		if( arg0 == "TelMiBaoErrMsg") then
			TelMiBaoErrMsg_Open();			
		end
		
	-- �رս���
	elseif (event == "CLOSE_WINDOW") then
		if( arg0 == "TelMiBaoErrMsg") then
			TelMiBaoErrMsg_Frame_OnHiden();
		end
	end

end

-- �򿪽���
function TelMiBaoErrMsg_Open()		
	TelMiBaoErrMsg_InfoWindow:SetText("#{DHMB_90417_14}");
	TelMiBaoErrMsg_InfoWindow:Show();
	TelMiBaoErrMsg_UpdateRect();	
	this:Show();
end

-- ��ȷ������ť����¼�
function TelMiBaoErrMsg_BnClick()
	TelMiBaoErrMsg_InfoWindow:SetText("");	
	this:Hide();
end

-- ���ؽ���
function TelMiBaoErrMsg_Frame_OnHiden()
	TelMiBaoErrMsg_InfoWindow:SetText("");	
	this:Hide();
end