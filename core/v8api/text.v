﻿// Описание интерфейсов работы с текстом
:tdef wchar_t uint16
:enum ControlMode
    ctrlDesign
    ctrlRunning

:iface IControlDesign {65901BA0-F124-11d3-93F7-008048DA11F9}
:virt
    void setMode(ControlMode mode)
    ControlMode getMode()

:iface ITextManager {2663F1E1-DB40-11d4-B009-004095E12DE6}
:virt
	+1
	+1
	+1
	+1
	+1
	+1
	+1
	TextManager@ getTextManager()
#if ver<1
	+1
	bool isEmpty()
	int linesCnt()
	uint32 getCheckSum()
	bool getSelLine(int nLine, v8string& str, bool bInScreenCoords = true)
	bool getLine(int nLine, v8string& str, bool bInScreenCoords = true)
	bool replaceLine(int nLine, v8string& str, bool bInScreenCoords = true)
	bool insertLine(int nLine, const v8string& str, bool bAfter)
	bool replaceLine(int nLine)
	bool appendLine(const v8string& str)
	void clear()
	bool getManagerReadOnly()
	void setManagerReadOnly(bool bReadOnly)
	void setExtenderCLSID(const CLSID& clsid)
	CLSID getExtenderCLSID()
	TextPosition getTillPos(bool bDirection)
	ITextEditorPtr getActiveTextEditor()
	void clearTextSelection();
	void updateAllViews(UINT updateType, bool bErase, LPVOID pData)
	void updateAllViews(UINT updateType, bool bErase, int nLine)
	void updateAllViews(UINT updateType, bool bErase, int nLine, int nPosFrom, int nPosTo)
	void updateAllViews(UINT updateType, bool bErase, int nLineFrom, int nLineTo)
	void setTemplateLangeageCode(const astring& strCode)
	astring getTemplateLangeageCode()
#endif
	
:iface ITextEditor {E82EFAF1-28B8-11d5-B08A-008048DA0765}
:virt
	uint getITextManager(ITextManager@&out)
	TextManager& getTextManager()
	void updateView()
  #if ver >= 8.3.7
    +1
  #endif
	void updateLine(int nLine, bool bInScreenCoords = false)
	bool isELVisible(int nLine)
	int getVisibleLines()
	int getFirstVisible()
	int setFirstVisible(int nLine, bool bInScreenCoords = false)
	bool isSelectionEmpty()
	void setSelectionNull()
	uint getCaretPosition(TextPosition& out, bool bInScreenCoords = false)
	void setCaretPosition(const TextPosition&in tp, bool bInScreenCoords = false)
	void scrollToCaretPos()
	void getSelection(TextPosition&out tpStart, TextPosition&out tpStop,bool bInScreenCoords = false)
	void getSelectionText(v8string&out str)
	void setSelectionText(const v8string&in str)
	void getTextUnderCaretPos(v8string&in str)
	void setSelection(const TextPosition&in tpStart, const TextPosition&in tpStop, bool bCaretToStart, bool bInScreenCoords = false)
	+1
	void setSepcialSel(int nLine, bool bInScreenCoords = true)
	int getSepcialSel(bool bInScreenCoords = true)
	+1
	+1
	void setUseContextMenu(bool bEnable = true)
	bool getUseContextMenu()
	void setUseProperty(bool bEnable = true)
	bool getUseProperty()
	void setAutomaticOfficeAreaUpdate(bool bNeedUpdateOfficeArea)
	bool getAutomaticOfficeAreaUpdate()
	UINT getBookmarkColumnID()
	UINT getOutlineColumnID()
	HWND getWindowHandle()

:iface ITextManager_Operations {FDA50A42-C578-405A-AB09-739B1EFF0AC5}
:virt
#if ver>=8.3
	+1
#endif
	save int setExtenderCLSID(const Guid&)
	int getExtenderCLSID(Guid&out)
	+5
	void updateAllViews(int reason = 1, bool erase=false)

:iface ITextParserCache {9FCB75A7-B688-4069-9B25-FC9F7F06358D}
:virt
	+1
	+1
	+1
	void clearCache()

:iface ITxtEdtOptions {F7016521-5751-11d5-B0B7-008048DA0765}
:virt
	void loadDefault()
	void getFont(Font&out font)

:iface IModuleEdit {6DA9E947-156D-4239-8475-5DED35CEA1F4}
	:virt
		void f()

:iface ISourceLexer {8EC5EC11-8D62-4CCC-8C5A-5C8880179C7F}
:virt
	save void splitToLexems(const v8string& source, Vector& lexems)

:iface ITxtEdtExtender {6A93A253-50F8-11D5-B0B3-008048DA0765}
:virt
	const Guid& getGuid()
	v8string getName()

:service ITxtEdtService {32632921-50C4-11D5-B0B3-008048DA0765}
:virt
	+4
	void setTxtDocExtender(ITextManager@+ itm, ITxtEdtExtender@+ tee)
	+4
	thiscall uint getExtender(ITxtEdtExtender@&, ITextManager@+ pITextManager, const Guid& clsid) 
	+4
	uint getTemplateProcessor(ITemplateProcessor@&)

:iface ITemplateProcessor {BE7E8365-EC19-4804-A04B-2CA31436BF21}
:virt
	15
	void processTemplate(const v8string&in templName, const v8string&in templStr, v8string&out result, uint&out nCaretStartOffset, const v8string&in indent)

:iface IEdit {103E3E6D-F9C7-4C5C-A82B-857387E59971}
:virt
	+3
    bool getText(v8string& str)

:iface IDataControl {FCE82550-7907-11D4-9422-008048DA11F9}
:virt
	bool setValue(const Value& value)
	+1
	void getValue(Value& value, bool bMake = true)

:iface IFldEdit {4F663FCF-8942-4475-9E36-4D2ED7405F40}
:virt
	void test()

:iface IControlContext {1CA43100-85F2-11D5-A3BE-0050BAE0A776}
:virt
    uint getControlId()
    uint getControl(IUnknown@& res, const Guid& iid)

:global
:dlls
#if ver < 8.3
    core82.dll
#else
    core83.dll
#endif
	bool is_alnum(wchar_t)|?is_alnum@core@@YA_N_W@Z
	bool is_alpha(wchar_t)|?is_alpha@core@@YA_N_W@Z
	bool is_cntrl(wchar_t)|?is_cntrl@core@@YA_N_W@Z
	bool is_digit(wchar_t)|?is_digit@core@@YA_N_W@Z
	bool is_graph(wchar_t)|?is_graph@core@@YA_N_W@Z
	bool is_lower(wchar_t)|?is_lower@core@@YA_N_W@Z
	bool is_print(wchar_t)|?is_print@core@@YA_N_W@Z
	bool is_punct(wchar_t)|?is_punct@core@@YA_N_W@Z
	bool is_space(wchar_t)|?is_space@core@@YA_N_W@Z
	bool is_title(wchar_t)|?is_title@core@@YA_N_W@Z
	bool is_upper(wchar_t)|?is_upper@core@@YA_N_W@Z
	bool is_valid_name(const v8string&in)|?is_valid_name@core@@YA_NABV?$basic_string@_WV?$char_traits@_W@stlp_std@@V?$allocator@_W@2@@stlp_std@@@Z
	bool is_valid_path(const v8string&in)|?is_valid_path@core@@YA_NABV?$basic_string@_WV?$char_traits@_W@stlp_std@@V?$allocator@_W@2@@stlp_std@@@Z
	long hash(const v8string&in)|?hash@core@@YAJABV?$basic_string@_WV?$char_traits@_W@stlp_std@@V?$allocator@_W@2@@stlp_std@@@Z
	long hash_nocase(const v8string&in)|?hash_nocase@core@@YAJABV?$basic_string@_WV?$char_traits@_W@stlp_std@@V?$allocator@_W@2@@stlp_std@@@Z
:meths
	ITxtEdtService@ getTxtEdtService()
	{
		return currentProcess().getService(IID_ITxtEdtService);
	}
	---
	

:guid CLSID_TxtEdtDoc 		{5C84ACF4-DB1C-11d4-B008-004095E12DE6}
:guid CLSID_TxtEdtView 		{4A844271-DB1E-11d4-B008-004095E12DE6}
:guid CLSID_TxtEdtCtrl 		{14C4A229-BFC3-42fe-9CE1-2DA049FD0109}
:guid gTextExtModule 		{3FF80E32-091C-436E-90A8-308CD4A510E4}
:guid gTextExtModule1 		{24CE9616-6389-4edd-A904-9437BE47D5EC}
:guid eTxtEdtOptionChanged  {1B93C2C2-5A8E-11D5-B0BA-008048DA0765}
:guid cmdGroupTxtEdt		{FFE26CB2-322B-11D5-B096-008048DA0765}
:guid CLSID_SourceLexer		{597341A4-21AE-4EFC-A92A-68782E8EB648}
:guid evActivateAssist		{2D590B96-03BC-4DC2-B347-673B636C6A07}

:enum Symbols
	166 symbCaret

:enum TxtEdtCommand
	 1 cmdTxtToggleBookmark
	 2 cmdTxtNextBookmark
	 3 cmdTxtPrevBookmark
	 4 cmdTxtClearBookmarks
	 6 cmdTxtFormatBlock
	 7 cmdTxtMoveBlockRight
	 8 cmdTxtMoveBlockLeft
	11 cmdTxtInsertPageBreak
	12 cmdTxtParams
	15 cmdTxtGotoLine

:enum TxtOffsets
  #if ver < 8.3
	0x224 ModuleTxtExtSettingsMap
  #elif ver < 8.3.6
	0x24C ModuleTxtExtSettingsMap
  #elif ver < 8.3.8
	0x290 ModuleTxtExtSettingsMap
  #else
	0x294 ModuleTxtExtSettingsMap
  #endif