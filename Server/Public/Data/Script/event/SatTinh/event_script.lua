--Ph� b�n Th�p Nh� S�t Tinh
--Author: Ho�ng Steven

--******************--
x910112_g_ScriptId=910112
--******************--
x910112_g_CopySceneType=FUBEN_SHENGSILEITAI										--C�c tham s� c�a ph� b�n. Tham kh�o "ScriptGlobal.lua"
--******************--
x910112_g_TickTime=1															--Th�i gian hi�n t�i c�a ph� b�n
x910112_g_NoUserTime=5000														--Th�i gian l�u l�i ph� b�n khi kh�ng c�n ai trong ph� b�n (нn v� Mili Gi�y)
x910112_g_Fuben_X=14															--Pos X �i�m h�i sinh ph� b�n
x910112_g_Fuben_Y=34															--Pos Y �i�m h�i sinh ph� b�n
x910112_g_Time_Leave=15000														--Th�i gian r�i ph� b�n khi ho�n th�nh nhi�m v�
x910112_g_FuBenTime=3600000														--Th�i gian ph� b�n (нn v� Mili Gi�y)
x910112_g_Limit_Member=1														--S� l��ng th�nh vi�n t�i thi�u trong �i ng�
x910112_g_Day_Time=4															--S� l��t tham gia trong ng�y
x910112_g_Fuben_Map="shengsileitai_monster.ini"									--Load file Monster
x910112_g_Fuben_Scene="shengsileitai.nav"										--Load file Scene
x910112_g_Fuben_Area="shengsileitai_area.ini"									--Load file Area
--******************--
x910112_g_Need_Level=80															--Level t�i thi�u tham gia ph� b�n
--******************--
x910112_g_NPC_Boss_List=														--Danh s�ch c�c NPC Boss
{
	[1]		=	{	Index=13554,	Name="C�ng T�n Th�nh",		Title="Thi�n Nh�n Tinh"		},
	[2]		=	{	Index=13557,	Name="H� Di�n Tr�c",		Title="Thi�n Uy Tinh"		},
	[3]		=	{	Index=13560,	Name="Hoa Dung",			Title="Thi�n Anh Tinh"		},
	[4]		=	{	Index=13558,	Name="L�m Sung",			Title="Thi�n H�ng Tinh"		},
	[5]		=	{	Index=13556,	Name="L� Ch� Sinh",			Title="Thi�n C� Tinh"		},
	[6]		=	{	Index=13553,	Name="L� Qu�n D�t",			Title="Thi�n C߽ng Tinh"	},
	[7]		=	{	Index=13551,	Name="L� Kh�i",				Title="Thi�n S�t Tinh"		},
	[8]		=	{	Index=13552,	Name="Ng� V�nh",			Title="Thi�n C� Tinh"		},
	[9]		=	{	Index=13555,	Name="Quan Th�nh",			Title="Thi�n D�ng Tinh"		},
	[10]	=	{	Index=13559,	Name="T�n Minh",			Title="Thi�n M�nh Tinh"		},
	[11]	=	{	Index=13550,	Name="T�ng Kh߽ng",			Title="Thi�n Kh�i Tinh"		},
	[12]	=	{	Index=13561,	Name="V� T�ng",				Title="Thi�n Th߽ng Tinh"	},
}
--******************--
x910112_g_Boss_List=															--Danh s�ch c�c Boss
{
	[1]		=	{	Index=13713,	Name="C�ng T�n Th�nh",		Title="Thi�n Nh�n Tinh",		AIScript=0,		ScriptID=910102		},
	[2]		=	{	Index=13497,	Name="H� Di�n Tr�c",		Title="Thi�n Uy Tinh",			AIScript=0,		ScriptID=910108		},
	[3]		=	{	Index=13524,	Name="Hoa Dung",			Title="Thi�n Anh Tinh",			AIScript=0,		ScriptID=910101		},
	[4]		=	{	Index=13506,	Name="L�m Sung",			Title="Thi�n H�ng Tinh",		AIScript=0,		ScriptID=910109		},
	[5]		=	{	Index=13488,	Name="L� Ch� Sinh",			Title="Thi�n C� Tinh",			AIScript=0,		ScriptID=910104		},
	[6]		=	{	Index=13461,	Name="L� Qu�n D�t",			Title="Thi�n C߽ng Tinh",		AIScript=0,		ScriptID=910105		},
	[7]		=	{	Index=13443,	Name="L� Kh�i",				Title="Thi�n S�t Tinh",			AIScript=0,		ScriptID=910103		},
	[8]		=	{	Index=13452,	Name="Ng� V�nh",			Title="Thi�n C� Tinh",			AIScript=0,		ScriptID=910100		},
	[9]		=	{	Index=13479,	Name="Quan Th�nh",			Title="Thi�n D�ng Tinh",		AIScript=0,		ScriptID=910106		},
	[10]	=	{	Index=13515,	Name="T�n Minh",			Title="Thi�n M�nh Tinh",		AIScript=0,		ScriptID=910110		},
	[11]	=	{	Index=13434,	Name="T�ng Kh߽ng",			Title="Thi�n Kh�i Tinh",		AIScript=0,		ScriptID=910107		},
	[12]	=	{	Index=13533,	Name="V� T�ng",				Title="Thi�n Th߽ng Tinh",		AIScript=0,		ScriptID=910111		},
}
--******************--
x910112_g_NPC_Boss_Pos=															--T�a � trong ph� b�n c�a 5 NPC Boss
{	
	[1]		=	{	Pos_X=45.0,		Pos_Y=26.0	},
	[2]		=	{	Pos_X=45.0,		Pos_Y=29.5	},
	[3]		=	{	Pos_X=45.0,		Pos_Y=33.0	},
	[4]		=	{	Pos_X=45.0,		Pos_Y=36.5	},
	[5]		=	{	Pos_X=45.0,		Pos_Y=40.0	},
}
--******************--
x910112_g_Number_Per_Choose=5													--S� l��ng Boss ���c ch�n v�o chi�n �u
--******************--
x910112_g_Script_NPC_Talk=910114												--Script c�a NPC Boss
--******************--
x910112_g_Card_Index=30010098													--ID S�t Tinh D� Dung �an
--******************--
x910112_g_Boss_1=8																--Boss s� 1
x910112_g_Boss_2=9																--Boss s� 2
x910112_g_Boss_3=10																--Boss s� 3
x910112_g_Boss_4=11																--Boss s� 4
x910112_g_Boss_5=12																--Boss s� 5
x910112_g_Next_Step=13															--Thao t�c chuy�n �i khi Boss ch�t
x910112_g_Fuben_Level=14														--C�p � Boss trong ph� b�n
x910112_g_Fuben_Timer=15														--Bi�n c�p nh�t gi� tr� th�i gian c�a ph� b�n
x910112_g_Next_Time_Call=16														--Th�i gian ra Boss c�n l�i
x910112_g_Fuben_On_Time=17														--Th�i gian ph� b�n (T�nh t� l�c b�t �u v�o+th�i gian l�c v�o c�nh)
x910112_g_Info_Step=18															--L�n th�ng b�o
x910112_g_Boss_Step=19															--L�n th�ng b�o boss ti�n v�o chi�n �u
x910112_g_Mission_Completed=20													--Nhi�m v� �� ho�n th�nh
x910112_g_Exit_Time_Fuben=21													--Th�i gian k�t th�c ph� b�n khi th�ng
x910112_g_Is_On_Combat=22														--Boss �ang trong tr�ng th�i chi�n �u
--******************--
x910112_g_Monk={	Index=13547,	Name="Kh� Vinh ��i S�",		Title="Th�p nh� S�t Tinh",		Pos_X=11,	Pos_Y=34,	ScriptID=910114		}--Kh� Vinh ��i S�
--******************--
x910112_g_First_Battle_Time=60000												--Th�i gian chu�n b� chi�n �u l�n �u ti�n (нn v� Mili Gi�y)
x910112_g_Creat_Boss_Timer=300000												--Th�i gian c�ch nhau m�i l�n ra Boss (нn v� Mili Gi�y)
--******************--
x910112_g_Fight_Pos_X=31														--T�a � X c�a Boss khi chi�n �u
x910112_g_Fight_Pos_Y=33														--T�a � Y c�a Boss khi chi�n �u
--******************--
x910112_g_Impact=18																--Impact NPC Boss b� thay th� b�i Boss	
--******************--
x910112_g_Notice=
{
	[1]="Ph� b�n hi�n t�i s� ��ng sau 1 gi� n�a!",								--Th�ng b�o khi m�i v�o ph� b�n
	[2]="Ph� b�n hi�n t�i s� ��ng sau 30 ph�t n�a!",							--Th�ng b�o khi c�n 30 ph�t
	[3]="Ph� b�n hi�n t�i s� ��ng sau 15 ph�t n�a!",							--Th�ng b�o khi c�n 15 ph�t
	[4]="Ph� b�n hi�n t�i s� ��ng sau 5 ph�t n�a!",								--Th�ng b�o khi c�n 5 ph�t
	[5]="Ph� b�n hi�n t�i s� ��ng sau 1 ph�t n�a!",								--Th�ng b�o khi c�n 1 ph�t
	[6]="Ph� b�n hi�n t�i s� ��ng sau 30 gi�y n�a!",							--Th�ng b�o khi c�n 30 gi�y
	[7]="Ph� b�n hi�n t�i s� ��ng sau 15 gi�y n�a!",							--Th�ng b�o khi c�n 15 gi�y
	[8]="Ph� b�n hi�n t�i s� ��ng sau 5 gi�y n�a!",								--Th�ng b�o khi c�n 5 gi�y
	[9]="Nhi�m v� th�t b�i. C�c h� s� t� r�i kh�i ��y!",						--Th�ng b�o khi h�t ph� b�n
	[10]="S�t Tinh ti�p theo s� ti�n v�o sau 1 ph�t!",								--Th�ng b�o s�t tinh ti�p theo ti�n v�o sau 1 ph�t
	[11]="S�t Tinh ti�p theo s� ti�n v�o sau 30 gi�y!",							--Th�ng b�o s�t tinh ti�p theo ti�n v�o sau 30 gi�y
	[12]="S�t Tinh ti�p theo s� ti�n v�o sau 15 gi�y!",							--Th�ng b�o s�t tinh ti�p theo ti�n v�o sau 15 gi�y
	[13]="S�t Tinh ti�p theo s� ti�n v�o sau 5 gi�y!",							--Th�ng b�o s�t tinh ti�p theo ti�n v�o sau 5 gi�y
	[14]="Nhi�m v� ho�n th�nh. C�c h� s� r�i kh�i ��y sau 15 gi�y!",			--Th�ng b�o ho�n th�nh nhi�m v�
}
--******************--
x910112_g_Back_Scene_Index=2													--ID c�nh quay tr� l�i
x910112_g_Back_Pos_X=129														--Pos X c�nh quay tr� l�i
x910112_g_Back_Pos_Y=76														--Pos Y c�nh quay tr� l�i
--******************--
x910112_g_Information=															--Th�ng tin c�c �o�n h�i tho�is
{
	[1]="Mu�n khi�u chi�n #GTh�p nh� S�t Tinh#W, c�c h� ph�i ��t c�p #G"..x910112_g_Need_Level.." tr� l�n#W, m�i ng�y c� t�i �a #G"..x910112_g_Day_Time.." l��t#W. N�u �� tham gia qu� #G"..x910112_g_Day_Time.." l��t#W r�i, c� th� d�ng #GS�t Tinh D� Dung �an#W c� b�n trong ti�m #GNguy�n b�o#W �i l�y m�t c� h�i n�a.",
	[2]="C�ng T�n Th�nh",
	[3]="H� Di�n Tr�c",
	[4]="Hoa Dung",
	[5]="L�m Sung",
	[6]="L� Ch� Sinh",
	[7]="L� Qu�n D�t",
	[8]="L� Kh�i",
	[9]="Ng� V�nh",
	[10]="Quan Th�nh",
	[11]="T�n Minh",
	[12]="T�ng Kh߽ng",
	[13]="V� T�ng",
	[14]="#GC�ng T�n Th�nh#W ngo�i hi�u #GThi�n Nh�n Tinh#W.#r#GУc �i�m:#W S� d�ng b�a ch� g�y h�i cho �i th�.#r#GK� n�ng:#W #YPh�n Th�n Ph�#W, #YPhong Huy�t Ph�#W, #Yиnh Th�n Ph�#W, #YH�n Th�y Ph�#W.",
	[15]="#GH� Di�n Tr�c#W ngo�i hi�u #GThi�n Uy Tinh#W.#r#GУc �i�m:#W K� n�ng qu�n th� #GHuy�n C�ng#W l�n c�c �i th�, s� #Gеc C�ng#W.#r#GK� n�ng:#W #YPh� Huy�n#W, #YL�i ��nh V�n Qu�n#W.",
	[16]="#GHoa Dung#W ngo�i hi�u #GThi�n Anh Tinh#W.#r#GУc �i�m:#W S� d�ng c�m b�y t�n c�ng �i th�.#r#GK� n�ng:#W #Yиa S�t Tr�n#W, #YNh�n Vong Tr�n#W, #YThi�n Cang Tr�n#W, #YC߶ng H�a Tr�n#W.",
	[17]="#GL�m Sung#W ngo�i hi�u #GThi�n H�ng Tinh#W.#r#GУc �i�m:#W K� n�ng qu�n th� #GB�ng C�ng#W l�n c�c �i th�, s� #GH�a C�ng#W.#r#GK� n�ng:#W #YPh� B�ng#W, #YH�n B�ng Ch�n Kh�#W.",
	[18]="#GL� Ch� Sinh#W ngo�i hi�u #GThi�n C� Tinh#W.#r#GУc �i�m:#W C� th� mi�n d�ch m�i s�t th߽ng trong th�i gian ng�n, qu�n th� c�ng k�ch #GNgo�i C�ng#W.#r#GK� n�ng:#W #YC� Ph߽ng T� Th߷ng#W, #YCu�ng Phong San#W.",
	[19]="#GL� Qu�n D�t#W ngo�i hi�u #GThi�n C߽ng Tinh#W.#r#GУc �i�m:#W C� th� gi�m s�t th߽ng l�n b�n th�n, ph�n ��n s�t th߽ng nh�ng s� suy y�u sau ��.#r#GK� n�ng:#W #YThi�n Cang Ho�ng Kh�#W, #YThi�n Cang B� Kh�#W, #YThi�n Nh�n Ng� Suy#W.",
	[20]="#GL� Kh�i#W ngo�i hi�u #GThi�n S�t Tinh#W.#r#GУc �i�m:#W Ph�ng th�ch s�t kh� #G�n D�ch#W, qu�n th� c�ng k�ch #GNgo�i C�ng#W.#r#GK� n�ng:#W #YS�t Kh� �n D�ch#W, #YSinh M�n#W.",
	[21]="#GNg� V�nh#W ngo�i hi�u #GThi�n C� Tinh#W.#r#GУc �i�m:#W G�i #Gph�c binh#W h� tr�, mi�n d�ch v� �ch v�i ph�c binh m�u t߽ng �ng, m�t m�u v� h�t mi�n d�ch sau khi ph�c binh ��ng lo�i ch�t.#r#GK� n�ng:#W #YTri�u t�p Ph�c Binh#W.",
	[22]="#GQuan Th�nh#W ngo�i hi�u #GThi�n D�ng Tinh#W.#r#GУc �i�m:#W K� n�ng qu�n th� #GHuy�n C�ng#W g�y th߽ng t�n l�n.#r#GK� n�ng:#W #YDi�t Th� �ao Tr�n#W.",
	[23]="#GT�n Minh#W ngo�i hi�u #GThi�n M�nh Tinh#W.#r#GУc �i�m:#W K� n�ng qu�n th� #Gеc C�ng#W l�n c�c �i th�, s� #GHuy�n C�ng#W.#r#GK� n�ng:#W #YPh� еc#W, #YH� C�t Xuy�n T�m#W.",
	[24]="#GT�ng Kh߽ng#W ngo�i hi�u #GThi�n Kh�i Tinh#W.#r#GУc �i�m:#W K� n�ng qu�n th� b� ��o nh�t trong #G12 s�t tinh#W, c� th� khi�n �i ph߽ng t� n�n ngay trong m�t chi�u.#r#GK� n�ng:#W #YY�u Tinh T� Ngh�a#W, #YThi�n H�ng Ngh�ch Chuy�n#W, #YS�t Kh� B�c Ph�t#W.",
	[25]="#V� T�ng#W ngo�i hi�u #GThi�n Th߽ng Tinh#W.#r#GУc �i�m:#W K� n�ng qu�n th� #GH�a C�ng#W l�n c�c �i th�, s� #GB�ng C�ng#W.#r#GK� n�ng:#W #YPh� H�a#W, #YH�a Thi�u ��i Danh Ph�#W.",
	[26]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[27]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[28]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[29]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[30]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[31]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[32]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[33]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[34]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[35]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[36]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[37]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[38]="#GV�t ph�m r�i ra:#r#W#YC�ng L�c �an#W #r#YLinh H�n To�i Phi�n#W #r#YNg� Dao B�n#W #r#YL�u Ly Di�m#W #r#YThi�n Ni�n Ti�n Th�o",
	[39]="#GS�t Tinh D� Dung �an#W, m�t vi�n ng�c qu� hi�m, t߽ng truy�n c� th� d�ng � #GT�i chi�n Th�p nh� S�t Tinh#W. Kh�ng bi�t v� sao ��i nh�n #GT�n Ti�n B�o#W l�i c� n�, c�c h� c� th� t�m mua n� � #GTi�m Nguy�n B�o#W.",
}
--******************--
x910112_g_Introduce="Kh�ng bi�t t� ��u ra c� #G12 t�n#W t� x�ng #GTh�p nh� S�t Tinh#W ho�nh h�nh ngang ng��c, uy hi�p b� t�nh. Thi�n h� anh h�ng, ph�m l� ng߶i h�nh hi�p tr��ng ngh�a, c�c h� kh�ng th� b� qua cho ch�ng!"
--******************--

--**********************************--
--*          On Enumerate          *--
--**********************************--
function x910112_OnEnumerate(sceneId,selfId,targetId)

	--******************--
	AddNumText(sceneId,x910112_g_ScriptId,"Khi�u chi�n Th�p Nh� S�t Tinh",6,1)	--Khi�u chi�n
	AddNumText(sceneId,x910112_g_ScriptId,"T�i chi�n Th�p Nh� S�t Tinh",6,2)	--T�i chi�n
	AddNumText(sceneId,x910112_g_ScriptId,"V� Th�p nh� S�t Tinh",11,0)			--T�m hi�u
	AddNumText(sceneId,x910112_g_ScriptId,"V� S�t Tinh D� Dung �an",11,22)		--T�m hi�u S�t tinh d� dung �an
	--******************--

end
--**********************************--
--*        On Default Event        *--
--**********************************--
function x910112_OnDefaultEvent(sceneId,selfId,targetId)
local key=GetNumText()

	--******************--
	if key==0 then
	
		BeginEvent(sceneId)
			AddText(sceneId,x910112_g_Introduce)
			for i=2,13 do
				AddNumText(sceneId,x910112_g_ScriptId,x910112_g_Information[i],11,i+8)
			end
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end
	--******************--
	if key==22 then
	
		BeginEvent(sceneId)
			AddText(sceneId,x910112_g_Information[39])
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end
	--******************--
	if key>=10 and key<=21 then
		
		BeginEvent(sceneId)
			AddText(sceneId,x910112_g_Information[key+4])
			AddText(sceneId,x910112_g_Information[key+16])
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end
	--******************--
	if key==1 then
		
		local nTime=GetMissionData(sceneId,selfId,SHENGSI_DAYTIME)				--S� l��t tham gia ph� b�n trong ng�y
		if nTime>=x910112_g_Day_Time then
			BeginEvent(sceneId)
				AddText(sceneId,x910112_g_Information[1])
				AddText(sceneId,"Ng�y h�m nay c�c h� �� tham gia #G"..nTime.." l�n#W r�i, xin ng�y mai h�y quay l�i. Ho�c c� th� s� d�ng #GS�t Tinh D� Dung �an#W c� b�n trong ti�m #GNguy�n b�o#W �i l�y m�t c� h�i n�a.")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		BeginEvent(sceneId)
			AddText(sceneId,x910112_g_Information[1])
			AddText(sceneId,"Ng�y h�m nay c�c h� �� tham gia #G"..nTime.." l�n#W, c�n l�i #G"..(x910112_g_Day_Time-nTime).." l��t n�a. C�c h� c� x�c nh�n tham gia kh�ng?")
			AddNumText(sceneId,x910112_g_ScriptId,"Khi�u chi�n Th�p nh� S�t Tinh",10,3)
			AddNumText(sceneId,x910112_g_ScriptId,"R�i b�",-1,4)
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end
	--******************--
	if key==2 then
	
		local nTime=GetMissionData(sceneId,selfId,SHENGSI_DAYTIME)				--S� l��t tham gia ph� b�n trong ng�y
		if nTime<x910112_g_Day_Time then
			BeginEvent(sceneId)
				AddText(sceneId,x910112_g_Information[1])
				AddText(sceneId,"Ng�y h�m nay c�c h� �� tham gia #G"..nTime.." l�n#W r�i, v�n c�n #G"..(x910112_g_Day_Time-nTime).." l��t#W n�a. C�c h� xin ��ng l�ng ph� c� h�i n�y.")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		BeginEvent(sceneId)
			AddText(sceneId,x910112_g_Information[1])
			AddText(sceneId,"Ng�y h�m nay c�c h� �� tham gia #G"..nTime.." l�n#W. Ь c� th�m m�t c� h�i n�a, c�c h� ph�i ��a cho ta m�t t�m #GS�t Tinh D� Dung �an#W?")
			AddNumText(sceneId,x910112_g_ScriptId,"T�i chi�n Th�p nh� S�t Tinh",10,5)
			AddNumText(sceneId,x910112_g_ScriptId,"R�i b�",-1,4)
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end
	--******************--
	if key==4 then
	
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,1000)
		
	end
	--******************--
	if key==5 or key==3 then
	
		if key==5 and LuaFnGetAvailableItemCount(sceneId,selfId,x910112_g_Card_Index)<1 then
			BeginEvent(sceneId)
				AddText(sceneId,"Xin l�i, tr�n ng߶i c�c h� kh�ng c� #GS�t Tinh D� Dung �an#W. Vi�n ng�c n�y c� b�n � th߽ng ti�m #GNguy�n b�o#W. C�c h� th� gh� qua �� xem sao!")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		local Check,nTip=x910112_CheckCanEnter(sceneId,selfId)
		if Check==0 then
			BeginEvent(sceneId)
				AddText(sceneId,nTip)
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		x910112_MakeCopyScene(sceneId,selfId)									--Kh�i t�o ph� b�n
		
	end
	--******************--
	
end
--**********************************--
--*         Check Can Enter        *--
--**********************************--
function x910112_CheckCanEnter(sceneId,selfId,targetId)

	--******************--
	if LuaFnHasTeam(sceneId,selfId)~=1 then										--Ng߶i ch�i n�y kh�ng c� �i ng�
		return 0,"C�c h� c�n gia nh�p v�o m�t �i ng� t�i thi�u #G"..x910112_g_Limit_Member.."#W th�nh vi�n m�i c� th� tham gia!"
	end
	--******************--
	if GetTeamLeader(sceneId,selfId)~=selfId then								--Ng߶i ch�i kh�ng ph�i �i tr߷ng
		return 0,"Ch� c� �i tr߷ng m�i c� th� quy�t �nh c� tham gia hay kh�ng. C�c h� h�y g�i �i tr߷ng c�a c�c h� �n n�i chuy�n v�i ta!"
	end
	--******************--
	if GetTeamSize(sceneId,selfId)<x910112_g_Limit_Member then					--S� l��ng th�nh vi�n kh�ng ��
		return 0,"T� �i c�n c� t�i thi�u #G"..x910112_g_Limit_Member.."#W th�nh vi�n m�i c� th� tham gia!"
	end
	--******************--
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)						--еi ng� c� th�nh vi�n kh�ng � g�n
	if GetTeamSize(sceneId,selfId)~=NearTeamSize then
		return 0,"C�c h� c�n tri�u t�p �� �i ng� c�a m�nh �n ch� ta m�i c� th� ti�n v�o ph� b�n!"
	end
	--******************--
	local Humanlist={}
	local nHumanNum=0
	for i=0,NearTeamSize-1 do
		local PlayerId=GetNearTeamMember(sceneId,selfId,i)
		if GetLevel(sceneId,PlayerId)<x910112_g_Need_Level then					--C� th�nh vi�n kh�ng �� c�p � y�u c�u
			Humanlist[nHumanNum]=GetName(sceneId,PlayerId)
			nHumanNum = nHumanNum+1
		end
	end
	if nHumanNum > 0 then
		local msg="Trong t� �i c�a c�c h� c� "
		for i=0,nHumanNum-2 do
			msg=msg..Humanlist[i]..", "
		end
		msg=msg..Humanlist[nHumanNum-1].." c�p � kh�ng �� c�p #G"..x910112_g_Need_Level..", kh�ng �� �i�u ki�n tham gia ph� b�n!"
		return 0,msg
	end
	--******************--
	nHumanNum = 0
	local CurDayTime = GetDayTime()
	for i=0,NearTeamSize-1 do
		local PlayerId=GetNearTeamMember(sceneId,selfId,i)
		local nTime=GetMissionData(sceneId,PlayerId,SHENGSI_DAYTIME)			--S� l�n tham gia ph� b�n h�m nay
		if nTime>=x910112_g_Day_Time then
			Humanlist[nHumanNum]=GetName(sceneId,PlayerId)
			nHumanNum=nHumanNum+1
		end
	end
	if nHumanNum > 0 then
		local msg="Trong t� �i c�a c�c h� c� "
		for i=0,nHumanNum-2 do
			msg=msg..Humanlist[i]..", "
		end
		msg=msg..Humanlist[nHumanNum-1].." �� tham gia ph� b�n #G"..x910112_g_Day_Time.." l�n#W trong ng�y h�m nay!"
		return 0,msg
	end
	--******************--
	return 1
	--******************--

end
--**********************************--
--*         Make Copy Scene        *--
--**********************************--
function x910112_MakeCopyScene(sceneId,selfId)

	--******************--
	local x,y=GetWorldPos(sceneId,selfId)
	--******************--
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	--******************--
	LuaFnSetSceneLoad_Map(sceneId,x910112_g_Fuben_Scene)								--Load file scene
	LuaFnSetCopySceneData_TeamLeader(sceneId,leaderguid)								--ID �i tr߷ng
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId,x910112_g_NoUserTime)					--Th�i gian l�u ph� b�n khi kh�ng c�n ai
	LuaFnSetCopySceneData_Timer(sceneId,x910112_g_TickTime)								--Th�i gian ph� b�n
	LuaFnSetCopySceneData_Param(sceneId,0,x910112_g_CopySceneType)						--Set th�ng s� ph� b�n (ScriptGlobal.lua)
	LuaFnSetCopySceneData_Param(sceneId,1,x910112_g_ScriptId)							--ID script ph� b�n
	LuaFnSetCopySceneData_Param(sceneId,2,0)
	LuaFnSetCopySceneData_Param(sceneId,3,sceneId)										--C�nh t��ng hi�n t�i
	LuaFnSetCopySceneData_Param(sceneId,4,x)											--T�a � X c�a ng߶i ch�i
	LuaFnSetCopySceneData_Param(sceneId,5,y)											--T�a � Y c�a ng߶i ch�i
	LuaFnSetCopySceneData_Param(sceneId,6,GetTeamId(sceneId,selfId))					--ID nh�m ng߶i ch�i
	LuaFnSetCopySceneData_Param(sceneId,7,0)
	--******************--
	for i=8,31 do
		LuaFnSetCopySceneData_Param(sceneId,i,0)										--Reset l�i c�c th�ng s� cho ph� b�n
	end
	--******************--
	LuaFnSetSceneLoad_Area(sceneId,x910112_g_Fuben_Area)								--Load area
	LuaFnSetSceneLoad_Monster(sceneId,x910112_g_Fuben_Map)								--Load file monster
	--******************--
	local bRetSceneID=LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D�ch chuy�n th�nh c�ng!")									--S� b�n sao qu� t�i
		else
			AddText(sceneId,"S� l��ng b�n sao �� qu� t�i, � ngh� l�t n�a th� l�i!")	--C� th� t�o b�n sao m�i
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--******************--

end
--**********************************--
--*      Make Copy Scene Ready     *--
--**********************************--
function x910112_OnCopySceneReady(sceneId,destsceneId)

	--******************--
	LuaFnSetCopySceneData_Param(destsceneId,3,sceneId)										--Th�ng b�o kh�i t�o ph� b�n
	leaderguid=LuaFnGetCopySceneData_TeamLeader(destsceneId) 
	leaderObjId=LuaFnGuid2ObjId(sceneId,leaderguid);
	--******************--
	local nearteammembercount=GetNearTeamCount(sceneId,leaderObjId) 
	local mems={}
	for	i=0,nearteammembercount-1 do
		mems[i]=GetNearTeamMember(sceneId,leaderObjId,i)	
		NewWorld(sceneId,mems[i],destsceneId,x910112_g_Fuben_X,x910112_g_Fuben_Y) 		--��a t�t c� th�nh vi�n nh�m �n ph� b�n
	end
	--******************--

end
--**********************************--
--*       On Copy Scene Timer      *--
--**********************************--
function x910112_OnCopySceneTimer(sceneId,nowTime)											--H�m n�y check li�n t�c m�i Mili gi�y khi ph� b�n c�n t�n t�i

	--******************--
	local nStep=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Next_Step)					--L�y thao t�c tr�n ph� b�n
	if nStep==0 then																		--L�n �u trong ph� b�n
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Fuben_Timer,x910112_g_FuBenTime)		--C�p nh�t th�i gian b�t �u ph� b�n
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Fuben_On_Time,nowTime)				--C�p nh�t th�i gian ph� b�n (нn v� Mili gi�y)
		x910112_CreatMyNPC(sceneId)															--Kh�i t�o c�c NPC
	elseif nStep==1 then																	--Giai �o�n chi�n �u
		local Is_Winner=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Mission_Completed)	--Nhi�m v� �� ho�n th�nh ch�a
		if Is_Winner==1 then																--Ho�n th�nh nhi�m v� r�i
			local Time_Left=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Exit_Time_Fuben)	--L�y th�i gian l�c th�ng cu�c
			if nowTime-Time_Left>=x910112_g_Time_Leave then
				x910112_KickOutAllPlayer(sceneId)											--��a t�t c� ng߶i ch�i r�i kh�i ph� b�n
			end
			return
		end
		local Total_Boss_Left=x910112_CheckHaveBossLeft(sceneId)							--Ki�m tra c�n l�i bao nhi�u Boss ho�c NPC Boss. N�u kh�ng c�n th� th�ng
		if Total_Boss_Left==0 then
			x910112_OnCompleteMission(sceneId)												--Ho�n th�nh nhi�m v�
			LuaFnSetCopySceneData_Param(sceneId,x910112_g_Exit_Time_Fuben,nowTime)			--C�p nh�t th�i gian b�t �u t�nh chu�n b� r�i ph� b�n
			return
		end
		local nTick=nowTime-LuaFnGetCopySceneData_Param(sceneId,x910112_g_Fuben_On_Time)	--L�y t�ch t�c m�t c�a ph� b�n
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Fuben_On_Time,nowTime)				--C�p nh�t th�i gian ph� b�n (нn v� Mili gi�y)
		local nTime=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Fuben_Timer)				--L�y th�i gian hi�n t�i c�a ph� b�n (нn v� Mili gi�y)
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Fuben_Timer,nTime-nTick)				--C�p nh�t th�i gian ph� b�n (нn v� Mili gi�y)
		local Next_Time=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Next_Time_Call)		--L�y th�i gian ra Boss ti�p theo (нn v� Mili gi�y)
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Next_Time_Call,Next_Time-nTick)		--C�p nh�t th�i gian ra Boss ti�p theo (нn v� Mili gi�y)
		if Next_Time-nTick<=0 then															--�� �n gi� kh�i t�o Boss ti�p theo
			x910112_CreatMyBoss(sceneId)													--Kh�i t�o Boss
		end
		x910112_ShowNotices(sceneId,nTime-nTick)											--Ki�m tra v� th�ng b�o n�u �n gi�
		x910112_BossNotices(sceneId,Next_Time-nTick)										--Th�ng b�o ra Boss
	elseif nStep==2 then																	--�� h�t th�i gian ph� b�n
		x910112_KickOutAllPlayer(sceneId)													--��a t�t c� ng߶i ch�i r�i kh�i ph� b�n
	end
	--******************--

end
--**********************************--
--*         On Player Enter        *--
--**********************************--
function x910112_OnPlayerEnter(sceneId,selfId)

	--******************--
	SetPlayerDefaultReliveInfo(sceneId,selfId,"%10",-1,"0",sceneId,x910112_g_Fuben_X,x910112_g_Fuben_Y)		--Уt �i�m h�i sinh t�i ph� b�n
	--******************--
	local nTime=GetMissionData(sceneId,selfId,SHENGSI_DAYTIME)												--L�y s� l��t tham gia ph� b�n trong ng�y
	SetMissionData(sceneId,selfId,SHENGSI_DAYTIME,nTime+1)													--C�p nh�t l�i s� l��t tham gia ph� b�n trong ng�y
	--******************--
	
end
--**********************************--
--*          On Human Die          *--
--**********************************--
function x910112_OnHumanDie(sceneId,selfId,killerId)
	
	--******************--
	--******************--
	
end
--**********************************--
--*      On Complete Mission       *--
--**********************************--
function x910112_OnCompleteMission(sceneId)
	
	--******************--
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Mission_Completed,1)					--C�p nh�t ch�a ho�n th�nh nhi�m v�
	--******************--
	x910112_TipAllHuman(sceneId,x910112_g_Notice[14])
	--******************--
	
end
--**********************************--
--*      Check Have Boss Left      *--
--**********************************--
function x910112_CheckHaveBossLeft(sceneId)
	
	--******************--
	local nMonsterNum=GetMonsterCount(sceneId)
	for i=0,nMonsterNum-1 do
		local MonsterId=GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId,MonsterId)==1 then
			for j=1,12 do
				if GetName(sceneId,MonsterId)==x910112_g_Boss_List[j].Name or GetName(sceneId,MonsterId)==x910112_g_NPC_Boss_List[j].Name then
					return 1
				end
			end
		end
	end
	--******************--
	return 0
	--******************--
	
end
--**********************************--
--*          Show Notices          *--
--**********************************--
function x910112_ShowNotices(sceneId,nTime)
	
	--******************--
	local nNotice=""															--Th�ng b�o
	if nTime<=0 then															--H�t th�i gian ph� b�n
		local nStep=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Info_Step)	--B߾c th�ng b�o l�n tr߾c
		if nStep==9 then
			return
		end
		nNotice=x910112_g_Notice[9]
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Next_Step,2)				--�� h�t th�i gian ph� b�n
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Info_Step,9)				--C�p nh�t �� th�ng b�o lo�i n�y
	elseif nTime<=5000 then														--C�n 5 gi�y
		local nStep=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Info_Step)	--B߾c th�ng b�o l�n tr߾c
		if nStep==8 then
			return
		end
		nNotice=x910112_g_Notice[8]
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Info_Step,8)				--C�p nh�t �� th�ng b�o lo�i n�y
	elseif nTime<=15000 then													--C�n 15 gi�y
		local nStep=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Info_Step)	--B߾c th�ng b�o l�n tr߾c
		if nStep==7 then
			return
		end
		nNotice=x910112_g_Notice[7]
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Info_Step,7)				--C�p nh�t �� th�ng b�o lo�i n�y
	elseif nTime<=30000 then													--C�n 30 gi�y
		local nStep=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Info_Step)	--B߾c th�ng b�o l�n tr߾c
		if nStep==6 then
			return
		end
		nNotice=x910112_g_Notice[6]
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Info_Step,6)				--C�p nh�t �� th�ng b�o lo�i n�y
	elseif nTime<=60000 then													--C�n 1 ph�t
		local nStep=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Info_Step)	--B߾c th�ng b�o l�n tr߾c
		if nStep==5 then
			return
		end
		nNotice=x910112_g_Notice[5]
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Info_Step,5)				--C�p nh�t �� th�ng b�o lo�i n�y
	elseif nTime<=300000 then													--C�n 5 ph�t
		local nStep=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Info_Step)	--B߾c th�ng b�o l�n tr߾c
		if nStep==4 then
			return
		end
		nNotice=x910112_g_Notice[4]
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Info_Step,4)				--C�p nh�t �� th�ng b�o lo�i n�y
	elseif nTime<=900000 then													--C�n 15 ph�t
		local nStep=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Info_Step)	--B߾c th�ng b�o l�n tr߾c
		if nStep==3 then
			return
		end
		nNotice=x910112_g_Notice[3]
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Info_Step,3)				--C�p nh�t �� th�ng b�o lo�i n�y
	elseif nTime<=1800000 then													--C�n 30 ph�t
		local nStep=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Info_Step)	--B߾c th�ng b�o l�n tr߾c
		if nStep==2 then
			return
		end
		nNotice=x910112_g_Notice[2]
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Info_Step,2)				--C�p nh�t �� th�ng b�o lo�i n�y
	elseif nTime<=3595000 then													--C�n 1 gi�
		local nStep=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Info_Step)	--B߾c th�ng b�o l�n tr߾c
		if nStep==1 then
			return
		end
		nNotice=x910112_g_Notice[1]
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Info_Step,1)				--C�p nh�t �� th�ng b�o lo�i n�y
	end
	--******************--
	if nNotice~="" then
		x910112_TipAllHuman(sceneId,nNotice)									--Th�ng b�o cho to�n th� ng߶i ch�i
	end
	--******************--
	
end
--**********************************--
--*          Boss Notices          *--
--**********************************--
function x910112_BossNotices(sceneId,nTime)
	
	local Boss_Notice=""
	local nBossStep=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Boss_Step)	--B߾c th�ng b�o l�n tr߾c ra Boss
	if nTime<=5000 then															--C�n 5 gi�y s� ra Boss m�i
		if nBossStep==13 then
			return
		end
		Boss_Notice=x910112_g_Notice[13]										
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_Step,13)
	elseif nTime<=15000 then													--C�n 15 gi�y s� ra Boss m�i
		if nBossStep==12 then
			return
		end
		Boss_Notice=x910112_g_Notice[12]										
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_Step,12)
	elseif nTime<=30000 then													--C�n 30 gi�y s� ra Boss m�i
		if nBossStep==11 then
			return
		end
		Boss_Notice=x910112_g_Notice[11]										
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_Step,11)
	elseif nTime<=55000 then													--C�n 1 ph�t s� ra Boss m�i
		if nBossStep==10 then
			return
		end
		Boss_Notice=x910112_g_Notice[10]										
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_Step,10)
	end
	--******************--
	if Boss_Notice~="" then
		x910112_TipAllHuman(sceneId,Boss_Notice)								--Th�ng b�o cho to�n th� ng߶i ch�i
	end
	--******************--
	
end
--**********************************--
--*      Kick Out All Player       *--
--**********************************--
function x910112_KickOutAllPlayer(sceneId)
	
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then
			CallScriptFunction((400900),"TransferFunc",sceneId,nHumanId,x910112_g_Back_Scene_Index,x910112_g_Back_Pos_X,x910112_g_Back_Pos_Y)	--��a ng߶i ch�i tr� v� th�nh th�
		end
	end
	--******************--
	
end
--**********************************--
--*     Delete All Old Monster     *--
--**********************************--
function x910112_DeleteAllOldMonster(sceneId)
	
	--******************--
	local nMonsterNum=GetMonsterCount(sceneId)
	for i=0,nMonsterNum-1 do
		local MonsterId=GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId,MonsterId)==1 then	
			SetCharacterDieTime(sceneId,MonsterId,100)					
		end
	end
	--******************--
	
end
--**********************************--
--*         Creat My NPC           *--
--**********************************--
function x910112_CreatMyNPC(sceneId)
	
	--******************--
	x910112_DeleteAllOldMonster(sceneId)									--Just fix a bug...
	--******************--
	local Monk_Index=LuaFnCreateMonster(sceneId,x910112_g_Monk.Index,x910112_g_Monk.Pos_X,x910112_g_Monk.Pos_Y,3,0,x910112_g_Monk.ScriptID)	---Kh�i t�o NPC Kh� Vinh ��i S�
	SetCharacterName(sceneId,Monk_Index,x910112_g_Monk.Name)				--C�p nh�t t�n Kh� Vinh ��i S�
	SetCharacterTitle(sceneId,Monk_Index,x910112_g_Monk.Title)				--C�p nh�t Title cho Kh� Vinh ��i S�
	--******************--
	local nBossList={0,0,0,0,0}												--Danh s�ch 5 Boss ���c ch�n
	for i=1,x910112_g_Number_Per_Choose do
		local Ran=random(12)												--Ch�n ng�u nhi�n m�t trong 12 Boss
		local Found=0
		for j=1,i-1 do
			if Ran==nBossList[j] then										--T�m th�y Boss �� ���c ch�n tr߾c ��
				Found=1
				break
			end
		end
		if Found==0 then													--Boss n�y ch�a ���c ch�n tr߾c ��
			nBossList[i]=Ran												--C�p nh�t
		end
	end
	--******************--
	local nSum=0
	local nHumanCount=LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId=LuaFnGetCopyScene_HumanObjId(sceneId,i)
		nSum=nSum+GetLevel(sceneId,nHumanId)
	end
	--******************--
	local Current_Level=floor(nSum/nHumanCount)								--Level c�a Boss trong ph� b�n
	local nDec
	if Current_Level>=80 and Current_Level<90 then
		nDec=0
	elseif Current_Level>=90 and Current_Level<100 then
		nDec=1
	elseif Current_Level>=100 and Current_Level<110 then
		nDec=2
	elseif Current_Level>=110 and Current_Level<120 then
		nDec=3
	else
		nDec=4
	end
	--******************--
	for i=1,5 do
		local Boss_ID=x910112_g_NPC_Boss_List[nBossList[i]].Index			--ID NPC Boss
		local Boss_Name=x910112_g_NPC_Boss_List[nBossList[i]].Name			--T�n NPC Boss
		local Boss_Title=x910112_g_NPC_Boss_List[nBossList[i]].Title		--Danh hi�u NPC Boss
		local Pos_X=x910112_g_NPC_Boss_Pos[i].Pos_X				--T�a � X c�a NPC Boss
		local Pos_Y=x910112_g_NPC_Boss_Pos[i].Pos_Y				--T�a � Y c�a NPC Boss
		local Boss_Index=LuaFnCreateMonster(sceneId,Boss_ID,Pos_X,Pos_Y,3,0,x910112_g_Script_NPC_Talk)	--Kh�i t�o NPC Boss
		SetCharacterName(sceneId,Boss_Index,Boss_Name)						--Set t�n cho NPC Boss
		SetCharacterTitle(sceneId,Boss_Index,Boss_Title)					--Set danh hi�u cho NPC Boss
	end
	--******************--
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Next_Step,1)				--�� xong c�ng �o�n kh�i t�o
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Fuben_Level,nDec)			--C�p nh�t c�p � 
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_1,nBossList[1])		--Boss ���c ch�n s� 1
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_2,nBossList[2])		--Boss ���c ch�n s� 2
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_3,nBossList[3])		--Boss ���c ch�n s� 3
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_4,nBossList[4])		--Boss ���c ch�n s� 4
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_5,nBossList[5])		--Boss ���c ch�n s� 5
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Next_Time_Call,x910112_g_First_Battle_Time)--C�p nh�t th�i gian g�i Boss ti�p theo
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Info_Step,0)				--C�p nh�t ch�a c� th�ng b�o n�o
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Mission_Completed,0)		--C�p nh�t ch�a ho�n th�nh nhi�m v�
	--******************--
	
end
--**********************************--
--*         Creat My Boss          *--
--**********************************--
function x910112_CreatMyBoss(sceneId)
	
	--******************--
	local nBossList={}
	nBossList[1]=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Boss_1)		--Boss s� 1
	nBossList[2]=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Boss_2)		--Boss s� 2
	nBossList[3]=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Boss_3)		--Boss s� 3
	nBossList[4]=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Boss_4)		--Boss s� 4
	nBossList[5]=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Boss_5)		--Boss s� 5
	nBossList[6]=0															--Just a trap...
	--******************--
	local nDec=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Fuben_Level)	--L�y c�p � qu�i trong ph� b�n
	local Ran=6
	local nCheck=0
	while nBossList[Ran]==0 do
		Ran=random(x910112_g_Number_Per_Choose)								--Ch�n ng�u nhi�n m�t Boss trong danh s�ch 5 Boss ���c ch�n
		nCheck=nCheck+1
		if nCheck>100 then													--A trap destroy "Dead Lock"
			for i=1,5 do
				if nBossList[i]~=0 then
					Ran=i
					break
				end
			end
			break
		end
	end
	--******************--
	local Boss_Name=x910112_g_Boss_List[nBossList[Ran]].Name				--T�n Boss
	local nMonsterNum=GetMonsterCount(sceneId)
	for i=0,nMonsterNum-1 do
		local MonsterId=GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId,MonsterId)==1 and (GetName(sceneId,MonsterId)==Boss_Name) then	
			LuaFnSendSpecificImpactToUnit(sceneId,MonsterId,MonsterId,MonsterId,x910112_g_Impact,0)
			SetCharacterDieTime(sceneId,MonsterId,100)						--X�a �i NPC Boss
			break
		end
	end
	--******************--
	local Boss_ID=x910112_g_Boss_List[nBossList[Ran]].Index+nDec			--ID Boss
	local Boss_Title=x910112_g_Boss_List[nBossList[Ran]].Title				--Danh hi�u Boss
	local AI_Script=x910112_g_Boss_List[nBossList[Ran]].AIScript			--AI script c�a Boss
	local Pos_X=x910112_g_Fight_Pos_X										--T�a � X ra Boss
	local Pos_Y=x910112_g_Fight_Pos_Y										--T�a � Y ra Boss
	local Boss_Script=x910112_g_Boss_List[nBossList[Ran]].ScriptID			--Script c�a Boss
	local Boss_Index=LuaFnCreateMonster(sceneId,Boss_ID,Pos_X,Pos_Y,27,AI_Script,Boss_Script)--Kh�i t�o Boss
	SetCharacterName(sceneId,Boss_Index,Boss_Name)							--Set t�n cho Boss
	SetCharacterTitle(sceneId,Boss_Index,Boss_Title)						--Set danh hi�u cho Boss
	LuaFnSendSpecificImpactToUnit(sceneId,Boss_Index,Boss_Index,Boss_Index,x910112_g_Impact,0)
	--******************--
	if Ran==1 then
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_1,0)				--Boss s� 1 �� ���c g�i
	elseif Ran==2 then
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_2,0)				--Boss s� 2 �� ���c g�i
	elseif Ran==3 then
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_3,0)				--Boss s� 3 �� ���c g�i
	elseif Ran==4 then
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_4,0)				--Boss s� 4 �� ���c g�i
	elseif Ran==5 then
		LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_5,0)				--Boss s� 5 �� ���c g�i
	end
	--******************--
	local nSet																--L�y bi�n gi� tr� c�a Boss t߽ng �ng
	if Ran==1 then
		nSet=x910112_g_Boss_1
	elseif Ran==2 then
		nSet=x910112_g_Boss_2
	elseif Ran==3 then
		nSet=x910112_g_Boss_3
	elseif Ran==4 then
		nSet=x910112_g_Boss_4
	elseif Ran==5 then
		nSet=x910112_g_Boss_5
	end
	--******************--
	LuaFnSetCopySceneData_Param(sceneId,nSet,0)								--Boss n�y �� ra chi�n �u
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Next_Time_Call,x910112_g_Creat_Boss_Timer)--C�p nh�t th�i gian g�i Boss ti�p theo
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Boss_Step,0)				--C�p nh�t th�i gian th�ng b�o ra Boss ti�p theo
	--******************--
	local nBoss=LuaFnGetCopySceneData_Param(sceneId,x910112_g_Is_On_Combat)	--Ki�m tra xem c� bao nhi�u Boss �ang chi�n �u
	LuaFnSetCopySceneData_Param(sceneId,x910112_g_Is_On_Combat,nBoss+1)		--T�ng s� Boss �ang chi�n �u l�n
	--******************--
	
end
--**********************************--
--*          Tip All Human         *--
--**********************************--
function x910112_TipAllHuman(sceneId,nTip)

	--******************--
	local nHumanNum=LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanNum-1  do
		local PlayerId=LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,PlayerId)==1 and LuaFnIsCanDoScriptLogic(sceneId,PlayerId)==1 then
			BeginEvent(sceneId)
				AddText(sceneId,nTip)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,PlayerId)
		end
	end
	--******************--

end