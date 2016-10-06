local Current = -1;
local Question = 0;
local Question_Sequence = 0;
local Examination_Buttons = {}
local Button_Answer = {}
local objCared = -1;
local MAX_OBJ_DISTANCE = 3.0;
local g_Object = -1;
local HaveClicked = 0
function Examination_PreLoad()
	this:RegisterEvent("UI_COMMAND");	
	this:RegisterEvent("OBJECT_CARED_EVENT");
end

function Examination_OnLoad()
	Examination_Buttons[1] = Examination_Button_1;
	Examination_Buttons[2] = Examination_Button_2;
	Examination_Buttons[3] = Examination_Button_3;
	Examination_Buttons[4] = Examination_Button_4;
	Examination_Buttons[5] = Examination_Button_5;

end

function Examination_OnEvent(event)
	if ( event == "UI_COMMAND" and tonumber(arg0) == 28) then
			Examination_OnShown();
	elseif ( event == "OBJECT_CARED_EVENT" ) then
		
		if(tonumber(arg0) ~= objCared) then
			return
		end
		
		--如果和NPC的距离大于一定距离或者被删除，自动关闭
		if(arg1 == "distance" and tonumber(arg2)>MAX_OBJ_DISTANCE or arg1=="destroy") then
			
			--取消关心
			Examination_Cancel_Clicked()
		end
	end
end

function Examination_OnShown()
	--Examination_StopWatch : Hide()
	local UI_ID = Get_XParam_INT(0);
	local need_money = Get_XParam_INT(2);

	if UI_ID == 1 then

			Examination_Text : SetText("#r Sao? Mu痭 tham gia Khoa C� Kh鋙 Th�? Trong th秈 bu眎 tr鱪g v� n鄖, v錸 nh鈔 ch鷑g ta th kh� s痭g? Th鬷, kh鬾g n骾 n鎍, c醕 h� mu痭 tham gia khoa c� c ti陁 hao #{_EXCHG"..need_money.."} ph� b醥 danh");
			Examination_Button_1 : Show();
			Examination_Button_1 : SetText("T痶 r癷, 疴y l� ph� b醥 danh")
			Examination_Button_2 : Show();
			Examination_Button_2 : SetText("T鬷 ngh� l読...")
			Examination_Button_3 : Hide();
			Examination_Button_4 : Hide();
			Examination_Button_5 : Hide();
			
			--Examination_StopWatch : Hide()
			Examination_NPCName_Text : Hide()
			Examination_Type_Text : Hide()
			Examination_Number_Text : Hide()
			Examination_Fault_Text : Hide()
			
			Examination_Pageheader : SetText("#gFF0FA0Thi c�"..Get_XParam_STR(0));
			
			local xx = Get_XParam_INT(1);
			objCared = DataPool : GetNPCIDByServerID(xx);
			if objCared == -1 then
					PushDebugMessage("Server v 皤 s� li畊");
					return;
			end
			BeginCareObject_Examination(objCared)
			
			Current = UI_ID;
			this:Show();
	elseif UI_ID == 2 then

			Question = Get_XParam_INT(2)
			Question_Sequence = Get_XParam_INT(1)

			local NPCName =	Target:GetDialogNpcName();
			Examination_NPCName_Text: SetText(NPCName.."(T眓g c祅g 10 c鈛)")
			Examination_NPCName_Text:Show()
			Examination_Pageheader : SetText("#gFF0FA0Thi c�");
			Examination_Pageheader : Show()
			Examination_Text : SetText(Get_XParam_STR(0) .. "#rT c� 疳p 醤 tr阯 ch� c� m祎 c鈛 l� ch韓h x醕, h銀 suy ngh� k� tr呔c khi ch鱪");
			Examination_Text : Show();
			Examination_Type_Text : SetText("Lo読 h靚h: "..Get_XParam_STR(7))
			Examination_Type_Text : Show();
			Examination_Number_Text : SetText("Th� "..Question_Sequence.."C鈛 ")
			Examination_Number_Text : Show();
			--Examination_StopWatch : SetProperty("Timer","30");
			--Examination_StopWatch : Show();
			Examination_Fault_Text : SetText("S� l tr� l秈 sai c騨 l読     "..Get_XParam_INT(10))
			Examination_Fault_Text : Show()
											
			for i=1,3 do
				local str_temp = Get_XParam_STR(i);
				local answer_position = Get_XParam_INT(2+i)
				if  str_temp~= "#" and str_temp~="" then
					Examination_Buttons[answer_position+1] : Show();
					Examination_Buttons[answer_position+1] : SetText(str_temp)
					Button_Answer[answer_position+1] = i;
				end
			end

			if Get_XParam_INT(11) == 0 then			
				Examination_Buttons[4] : Show();
				Examination_Buttons[4] : SetText("#cFFCC99H痠 l� gi醡 quan")
			else
				Examination_Buttons[4] : Hide();
			end

			if Get_XParam_INT(12) == 0 then	
				Examination_Buttons[5] : Show();
				Examination_Buttons[5] : SetText("#cFFCC99D鵱g v� 瓞 n骾 chuy畁")
			else
				Examination_Buttons[5] : Hide();
			end
			HaveClicked = 0
			
			local xx = Get_XParam_INT(13);
			objCared = DataPool : GetNPCIDByServerID(xx);
			if objCared == -1 then
					return;
			end
			BeginCareObject_Examination(objCared)
			Current = UI_ID;
			this:Show();
	elseif UI_ID == 3 then

			Examination_Pageheader : SetText("#gFF0FA0Thi c�");
			Examination_Text : SetText("Th 疳ng ti猚, c鈛 tr� l秈 c黙 c醕 h� 疸 sai. Th鬷 鹱ng n鋘 l騨g, c� gg l sau nh�");
			Question_Sequence = 0;
			Examination_Button_1 : Show();
			Examination_Button_1 : SetText("B 馥u ki琺 tra");
			Examination_Button_2 : Hide();
			Examination_Button_3 : Hide();
			Examination_Button_4 : Hide();
			Examination_Button_5 : Hide();
			
			--Examination_StopWatch : Hide()
			Examination_NPCName_Text : Hide()
			Examination_Type_Text : Hide()
			Examination_Number_Text : Hide()
			Examination_Fault_Text : Hide()
			
			Current = UI_ID;
			this:Show();
		elseif UI_ID == 4 then

			Examination_Pageheader : SetText("#gFF0FA0Thi c�");
			Examination_Text : SetText("Ch鷆 m譶g c醕 h� tr� l秈 瘊ng t c� c醕 c鈛 h鰅!#rL sau 鹱ng qu阯 nh� ti猵 t鴆 tham gia ^_^");
			Examination_Button_2 : SetText("T誱 bi畉")
			Examination_Button_2 : Show();
			Examination_Button_1 : Hide();
			Examination_Button_3 : Hide();
			Examination_Button_4 : Hide();
			Examination_Button_5 : Hide();
			
			--Examination_StopWatch : Hide()
			Examination_NPCName_Text : Hide()
			Examination_Type_Text : Hide()
			Examination_Number_Text : Hide()
			Examination_Fault_Text : Hide()
			
			Current = UI_ID;
			this:Show();
	end
	Examination_Time_Text : Show();			
	Examination_Time_Text : SetProperty("Timer","1");
	Examination_Button_1:Disable()
	Examination_Button_2:Disable()
	Examination_Button_3:Disable()
end

function Examination_Button_Clicked(nAnswerNumber)

	if nAnswerNumber == 1 and Current == 1 then
		Question_Sequence = 0
		Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name("AskQuestion");
				Set_XSCRIPT_ScriptID(801016);
				Set_XSCRIPT_ParamCount(0);
		Send_XSCRIPT();
		return
	end
	
	if nAnswerNumber == 2 and Current == 1 then
		this : Hide()
		return
	end

	if nAnswerNumber == 1 and Current == 3 then
		Question_Sequence = 0
		Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name("AskQuestion");
				Set_XSCRIPT_ScriptID(801016);
				Set_XSCRIPT_ParamCount(0);
		Send_XSCRIPT();
		return
	end

	if nAnswerNumber == 2 and Current == 4 then
		Examination_Cancel_Clicked();
		return;
	end
	
	if Question > 0 then
		if nAnswerNumber > 0 and nAnswerNumber < 4 then
			if HaveClicked == 1 then
				return
			end
			HaveClicked = 1
			Examination_Button_1 : Hide();
			Examination_Button_2 : Hide();
			Examination_Button_3 : Hide();
			Examination_Button_4 : Hide();
			Examination_Button_5 : Hide();
			
			--Examination_StopWatch : Hide()
			Examination_NPCName_Text : Hide()
			Examination_Type_Text : Hide()
			Examination_Number_Text : Hide()
			Examination_Fault_Text : Hide()
			
			Clear_XSCRIPT();
					Set_XSCRIPT_Function_Name("AnswerQuestion");
					Set_XSCRIPT_ScriptID(801016);
					Set_XSCRIPT_Parameter(0,Question);
					Set_XSCRIPT_Parameter(1,Button_Answer[nAnswerNumber]);
					Set_XSCRIPT_ParamCount(2);
			Send_XSCRIPT();
			return
		elseif nAnswerNumber == 4 then
			Clear_XSCRIPT();
					Set_XSCRIPT_Function_Name("OnBribe");
					Set_XSCRIPT_ScriptID(801016);
					Set_XSCRIPT_Parameter(0,Question);
					Set_XSCRIPT_ParamCount(1);
			Send_XSCRIPT();
			return
		elseif nAnswerNumber == 5 then
			Clear_XSCRIPT();
					Set_XSCRIPT_Function_Name("OnDefaultEvent");
					Set_XSCRIPT_ScriptID(801018);
					Set_XSCRIPT_ParamCount(0);
			Send_XSCRIPT();
			StopCareObject_Examination(objCared)
			this:Hide();
			return
		end
	end

end

function Examination_Cancel_Clicked()

	if Current == 4 and Question > 0 then
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("OnOverTime");
			Set_XSCRIPT_ScriptID(801016);
			Set_XSCRIPT_ParamCount(0);
		Send_XSCRIPT();
	end
	
	StopCareObject_Examination(objCared)
	this:Hide();
end

--=========================================================
--开始关心NPC，
--在开始关心之前需要先确定这个界面是不是已经有“关心”的NPC，
--如果有的话，先取消已经有的“关心”
--=========================================================
function BeginCareObject_Examination(objCaredId)
	g_Object = objCaredId;
	this:CareObject(g_Object, 1, "Examination");
end

--=========================================================
--停止对某NPC的关心
--=========================================================
function StopCareObject_Examination(objCaredId)
	this:CareObject(objCaredId, 0, "Examination");
	g_Object = -1;

end

--记时到0后
function Examination_OverTime()
--	Clear_XSCRIPT();
--			Set_XSCRIPT_Function_Name("OnOverTime");
--			Set_XSCRIPT_ScriptID(801016);
--			Set_XSCRIPT_ParamCount(0);
--	Send_XSCRIPT();
end

--记时到0后
function Examination_TimeOut()
		Examination_Button_1:Enable()
		Examination_Button_2:Enable()
		Examination_Button_3:Enable()
		--this:Hide();
end
