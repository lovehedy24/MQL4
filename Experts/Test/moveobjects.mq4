//--------------------------------------------------------------------
// moveobjects.mq4
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------------
extern int   Len_Cn=50;              // ����� ������ (�����)
extern color Col_Cn=Orange;          // ���� ������ 
//--------------------------------------------------------------- 1 --
int init()                             // ����. ������� init()
  {
   Create();                           // ����� �������. �-�� ��������
   return;                             // ����� �� init()
  }
//--------------------------------------------------------------- 2 --
int start()                            // ����. ������� start()
  {
   datetime T2;                        // ������ ���������� �������
   int Error;                          // ��� ������
//--------------------------------------------------------------- 3 --   
   T2=ObjectGet("Obj_Reg_Ch",OBJPROP_TIME2);// ������ �����. t2
   Error=GetLastError();               // ��������� ���� ������
   if (Error==4202)                    // ���� ������� ��� :(
     {
      Alert("����� ��������� ��������� ��� �����������",
            "\n Book_expert_82_2. ������� ������.");
      Create();                        // ����� �������. �-�� ��������
      T2=Time[0];                      // ������� �������� �����. t2
     }
//--------------------------------------------------------------- 4 --
   if (T2!=Time[0])                    // ���� ������ �� �� �����
     {
      ObjectMove("Obj_Reg_Ch", 0, Time[Len_Cn-1],0); //����� �����. t1
      ObjectMove("Obj_Reg_Ch", 1, Time[0],       0); //����� �����. t2
      WindowRedraw();                  // ����������� ����������� 
     }
   return;                             // ����� �� start()
  }
//--------------------------------------------------------------- 5 --
int deinit()                           // ����. ������� deinit()
  {
   ObjectDelete("Obj_Reg_Ch");         // �������� �������
   return;                             // ����� �� deinit()
  }
//--------------------------------------------------------------- 6 --
int Create()                           // ���������������� �������..
  {                                    // ..�������� �������
   datetime T1=Time[Len_Cn-1];         // ����������� 1 ����� �������
   datetime T2=Time[0];                // ����������� 2 ����� �������
   ObjectCreate("Obj_Reg_Ch",OBJ_REGRESSION,0,T1,0,T2,0);// ��������
   ObjectSet(   "Obj_Reg_Ch", OBJPROP_COLOR, Col_Cn);    // ����
   ObjectSet(   "Obj_Reg_Ch", OBJPROP_RAY,   false);     // ���
   ObjectSet(   "Obj_Reg_Ch", OBJPROP_STYLE, STYLE_DASH);// �����
   ObjectSetText("Obj_Reg_Ch","������ ��������� moveobjects",10);
   WindowRedraw();                     // ����������� ����������� 
  }
//--------------------------------------------------------------- 7 --