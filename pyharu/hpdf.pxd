
cdef extern from "hpdf.h":
    ctypedef void         *HPDF_HANDLE
    ctypedef HPDF_HANDLE   HPDF_Doc
    ctypedef HPDF_HANDLE   HPDF_Page
    ctypedef HPDF_HANDLE   HPDF_Pages
    ctypedef HPDF_HANDLE   HPDF_Stream
    ctypedef HPDF_HANDLE   HPDF_Image
    ctypedef HPDF_HANDLE   HPDF_Font
    ctypedef HPDF_HANDLE   HPDF_Outline
    ctypedef HPDF_HANDLE   HPDF_Encoder
    ctypedef HPDF_HANDLE   HPDF_3DMeasure
    ctypedef HPDF_HANDLE   HPDF_ExData
    ctypedef HPDF_HANDLE   HPDF_Destination
    ctypedef HPDF_HANDLE   HPDF_XObject
    ctypedef HPDF_HANDLE   HPDF_Annotation
    ctypedef HPDF_HANDLE   HPDF_ExtGState
    ctypedef HPDF_HANDLE   HPDF_FontDef
    ctypedef HPDF_HANDLE   HPDF_U3D
    ctypedef HPDF_HANDLE   HPDF_JavaScript
    ctypedef HPDF_HANDLE   HPDF_Error
    ctypedef HPDF_HANDLE   HPDF_MMgr
    ctypedef HPDF_HANDLE   HPDF_Dict
    ctypedef HPDF_HANDLE   HPDF_EmbeddedFile
    ctypedef HPDF_HANDLE   HPDF_OutputIntent
    ctypedef HPDF_HANDLE   HPDF_Xref

    ctypedef unsigned long HPDF_STATUS
    ctypedef float HPDF_REAL
    ctypedef unsigned int HPDF_UINT
    ctypedef unsigned short HPDF_UINT16
    ctypedef int HPDF_BOOL
    ctypedef unsigned int HPDF_UINT32
    ctypedef unsigned char HPDF_BYTE
    ctypedef int HPDF_InfoType
    ctypedef int HPDF_INT

    ctypedef HPDF_UINT16 HPDF_UNICODE
    ctypedef HPDF_INT HPDF_LineCap
    ctypedef HPDF_INT HPDF_LineJoin
    ctypedef HPDF_INT HPDF_ColorSpace
    ctypedef HPDF_INT HPDF_TextRenderingMode
    ctypedef HPDF_INT HPDF_AnnotIcon
    ctypedef HPDF_INT HPDF_AnnotHighlightMode


    cdef struct HPDF_RGBColor:
        HPDF_REAL r
        HPDF_REAL g
        HPDF_REAL b

    cdef struct HPDF_Point:
        HPDF_REAL x
        HPDF_REAL y

    cdef struct HPDF_Rect:
        HPDF_REAL left
        HPDF_REAL bottom
        HPDF_REAL right
        HPDF_REAL top

    cdef struct HPDF_Date:
        HPDF_INT year
        HPDF_INT month
        HPDF_INT day
        HPDF_INT hour
        HPDF_INT minutes
        HPDF_INT seconds
        char ind
        HPDF_INT off_hour
        HPDF_INT off_minutes

    cdef struct HPDF_TextWidth:
        HPDF_UINT numchars
        HPDF_UINT numwords
        HPDF_UINT width
        HPDF_UINT numspace

    cdef struct HPDF_TransMatrix:
        HPDF_REAL a
        HPDF_REAL b
        HPDF_REAL c
        HPDF_REAL d
        HPDF_REAL x
        HPDF_REAL y

    cdef struct HPDF_CMYKColor:
        HPDF_REAL c
        HPDF_REAL m
        HPDF_REAL y
        HPDF_REAL k

    cdef struct HPDF_DashMode:
        void *ptn
        HPDF_UINT num_ptn
        HPDF_UINT phase



    HPDF_Doc HPDF_NewEx (void *user_error_fn, void *user_alloc_fn, void *user_free_fn, HPDF_UINT mem_pool_buf_size, void *user_data)
    HPDF_Doc HPDF_New (void *user_error_fn, void *user_data)
    HPDF_STATUS HPDF_SetErrorHandler (HPDF_Doc pdf, void *user_error_fn)
    void HPDF_Free (HPDF_Doc pdf)
    HPDF_STATUS HPDF_NewDoc (HPDF_Doc pdf)
    void HPDF_FreeDoc (HPDF_Doc pdf)
    HPDF_BOOL HPDF_HasDoc (HPDF_Doc pdf)
    void HPDF_FreeDocAll (HPDF_Doc pdf)
    HPDF_STATUS HPDF_SaveToStream (HPDF_Doc pdf)
    HPDF_UINT32 HPDF_GetStreamSize (HPDF_Doc pdf)
    HPDF_STATUS HPDF_ReadFromStream (HPDF_Doc pdf, HPDF_BYTE *buf, HPDF_UINT32 *size)
    HPDF_STATUS HPDF_ResetStream (HPDF_Doc pdf)
    HPDF_STATUS HPDF_SaveToFile (HPDF_Doc pdf, const char *file_name)
    HPDF_STATUS HPDF_GetError (HPDF_Doc pdf)
    HPDF_STATUS HPDF_GetErrorDetail (HPDF_Doc pdf)
    void HPDF_ResetError (HPDF_Doc pdf)
    HPDF_STATUS HPDF_SetPagesConfiguration (HPDF_Doc pdf, HPDF_UINT page_per_pages)
    HPDF_Page HPDF_GetPageByIndex (HPDF_Doc pdf, HPDF_UINT index)
    #HPDF_PageLayout HPDF_GetPageLayout (HPDF_Doc pdf)
    #HPDF_STATUS HPDF_SetPageLayout (HPDF_Doc pdf, HPDF_PageLayout layout)
    #HPDF_PageMode HPDF_GetPageMode (HPDF_Doc pdf)
    #HPDF_STATUS HPDF_SetPageMode (HPDF_Doc pdf, HPDF_PageMode mode)
    HPDF_UINT HPDF_GetViewerPreference (HPDF_Doc pdf)
    HPDF_STATUS HPDF_SetViewerPreference (HPDF_Doc pdf, HPDF_UINT value)
    HPDF_STATUS HPDF_SetOpenAction (HPDF_Doc pdf, HPDF_Destination open_action)
    HPDF_Page HPDF_GetCurrentPage (HPDF_Doc pdf)
    HPDF_Page HPDF_AddPage (HPDF_Doc pdf)
    HPDF_Page HPDF_InsertPage (HPDF_Doc pdf, HPDF_Page page)
    HPDF_STATUS HPDF_Page_SetWidth (HPDF_Page page, HPDF_REAL value)
    HPDF_STATUS HPDF_Page_SetHeight (HPDF_Page page, HPDF_REAL value)
    #HPDF_STATUS HPDF_Page_SetSize  (HPDF_Page page, HPDF_PageSizes size, HPDF_PageDirection direction);
    HPDF_STATUS HPDF_Page_SetRotate (HPDF_Page page, HPDF_UINT16 angle)
    HPDF_Font HPDF_GetFont (HPDF_Doc pdf, const char *font_name, const char *encoding_name)
    const char* HPDF_LoadType1FontFromFile (HPDF_Doc pdf, const char *afm_file_name, const char *data_file_name)
    const char* HPDF_LoadTTFontFromFile (HPDF_Doc pdf, const char *file_name, HPDF_BOOL embedding)
    const char* HPDF_LoadTTFontFromFile2 (HPDF_Doc pdf, const char *file_name, HPDF_UINT index, HPDF_BOOL embedding)
    #HPDF_STATUS HPDF_AddPageLabel (HPDF_Doc pdf, HPDF_UINT page_num, HPDF_PageNumStyle style, HPDF_UINT first_page, const char *prefix)
    HPDF_STATUS HPDF_UseJPFonts (HPDF_Doc pdf)
    HPDF_STATUS HPDF_UseKRFonts (HPDF_Doc pdf)
    HPDF_STATUS HPDF_UseCNSFonts (HPDF_Doc pdf)
    HPDF_STATUS HPDF_UseCNTFonts (HPDF_Doc pdf)
    HPDF_Outline HPDF_CreateOutline (HPDF_Doc pdf, HPDF_Outline parent, const char *title, HPDF_Encoder encoder)
    HPDF_STATUS HPDF_Outline_SetOpened (HPDF_Outline outline, HPDF_BOOL opened)
    HPDF_STATUS HPDF_Outline_SetDestination (HPDF_Outline outline, HPDF_Destination dst)
    HPDF_Destination HPDF_Page_CreateDestination (HPDF_Page page)
    HPDF_STATUS HPDF_Destination_SetXYZ (HPDF_Destination dst, HPDF_REAL left, HPDF_REAL top, HPDF_REAL zoom)
    HPDF_STATUS HPDF_Destination_SetFit (HPDF_Destination dst)
    HPDF_STATUS HPDF_Destination_SetFitH (HPDF_Destination dst, HPDF_REAL top)
    HPDF_STATUS HPDF_Destination_SetFitV (HPDF_Destination dst, HPDF_REAL left)
    HPDF_STATUS HPDF_Destination_SetFitR (HPDF_Destination dst, HPDF_REAL left, HPDF_REAL bottom, HPDF_REAL right, HPDF_REAL top)
    HPDF_STATUS HPDF_Destination_SetFitB (HPDF_Destination dst)
    HPDF_STATUS HPDF_Destination_SetFitBH (HPDF_Destination dst, HPDF_REAL top)
    HPDF_STATUS HPDF_Destination_SetFitBV (HPDF_Destination dst, HPDF_REAL left)
    HPDF_Encoder HPDF_GetEncoder (HPDF_Doc pdf, const char *encoding_name)
    HPDF_Encoder HPDF_GetCurrentEncoder (HPDF_Doc pdf)
    HPDF_STATUS HPDF_SetCurrentEncoder (HPDF_Doc pdf, const char *encoding_name)
    #HPDF_EncoderType HPDF_Encoder_GetType (HPDF_Encoder encoder)
    #HPDF_ByteType HPDF_Encoder_GetByteType (HPDF_Encoder encoder, const char *text, HPDF_UINT index)
    #HPDF_UNICODE HPDF_Encoder_GetUnicode (HPDF_Encoder encoder, HPDF_UINT16 code)
    #HPDF_WritingMode HPDF_Encoder_GetWritingMode (HPDF_Encoder encoder)
    HPDF_STATUS HPDF_UseJPEncodings (HPDF_Doc pdf)
    HPDF_STATUS HPDF_UseKREncodings (HPDF_Doc pdf)
    HPDF_STATUS HPDF_UseCNSEncodings (HPDF_Doc pdf)
    HPDF_STATUS HPDF_UseCNTEncodings (HPDF_Doc pdf)
    HPDF_Annotation HPDF_Page_CreateTextAnnot (HPDF_Page page, HPDF_Rect rect, const char *text, HPDF_Encoder encoder)
    HPDF_Annotation HPDF_Page_CreateLinkAnnot (HPDF_Page page, HPDF_Rect rect, HPDF_Destination dst)
    HPDF_Annotation HPDF_Page_CreateURILinkAnnot (HPDF_Page page, HPDF_Rect rect, const char *uri)
    HPDF_STATUS HPDF_LinkAnnot_SetHighlightMode (HPDF_Annotation annot, HPDF_AnnotHighlightMode mode)
    HPDF_STATUS HPDF_LinkAnnot_SetBorderStyle (HPDF_Annotation annot, HPDF_REAL width, HPDF_UINT16 dash_on, HPDF_UINT16 dash_off)
    HPDF_STATUS HPDF_TextAnnot_SetIcon (HPDF_Annotation annot, HPDF_AnnotIcon icon)
    HPDF_STATUS HPDF_TextAnnot_SetOpened (HPDF_Annotation annot, HPDF_BOOL opened)
    HPDF_Image HPDF_LoadPngImageFromFile (HPDF_Doc pdf, const char *filename)
    HPDF_Image HPDF_LoadPngImageFromFile2 (HPDF_Doc pdf, const char *filename)
    HPDF_Image HPDF_LoadJpegImageFromFile (HPDF_Doc pdf, const char *filename)
    HPDF_Image HPDF_LoadRawImageFromFile (HPDF_Doc pdf, const char *filename, HPDF_UINT width, HPDF_UINT height, HPDF_ColorSpace color_space)
    HPDF_Image HPDF_LoadRawImageFromMem (HPDF_Doc pdf, const HPDF_BYTE *buf, HPDF_UINT width, HPDF_UINT height, HPDF_ColorSpace color_space, HPDF_UINT bits_per_component)
    HPDF_Point HPDF_Image_GetSize (HPDF_Image image)
    HPDF_STATUS HPDF_Image_GetSize2 (HPDF_Image image, HPDF_Point *size)
    HPDF_UINT HPDF_Image_GetWidth (HPDF_Image image)
    HPDF_UINT HPDF_Image_GetHeight (HPDF_Image image)
    HPDF_UINT HPDF_Image_GetBitsPerComponent (HPDF_Image image)
    const char* HPDF_Image_GetColorSpace (HPDF_Image image)
    HPDF_STATUS HPDF_Image_SetColorMask (HPDF_Image image, HPDF_UINT rmin, HPDF_UINT rmax, HPDF_UINT gmin, HPDF_UINT gmax, HPDF_UINT bmin, HPDF_UINT bmax)
    HPDF_STATUS HPDF_Image_SetMaskImage (HPDF_Image image, HPDF_Image mask_image)
    HPDF_STATUS HPDF_SetInfoAttr (HPDF_Doc pdf, HPDF_InfoType type, const char *value)
    const char* HPDF_GetInfoAttr (HPDF_Doc pdf, HPDF_InfoType type)
    HPDF_STATUS HPDF_SetInfoDateAttr (HPDF_Doc pdf, HPDF_InfoType type, HPDF_Date value)
    HPDF_STATUS HPDF_SetPassword (HPDF_Doc pdf, const char *owner_passwd, const char *user_passwd)
    HPDF_STATUS HPDF_SetPermission (HPDF_Doc pdf, HPDF_UINT permission)
    #HPDF_STATUS HPDF_SetEncryptionMode (HPDF_Doc pdf, HPDF_EncryptMode mode, HPDF_UINT key_len)
    HPDF_STATUS HPDF_SetCompressionMode (HPDF_Doc pdf, HPDF_UINT mode)
    const char* HPDF_Font_GetFontName (HPDF_Font font)
    const char* HPDF_Font_GetEncodingName (HPDF_Font font)
    HPDF_INT HPDF_Font_GetUnicodeWidth (HPDF_Font font, HPDF_UNICODE code)
    HPDF_Rect HPDF_Font_GetBBox (HPDF_Font font)
    HPDF_INT HPDF_Font_GetAscent (HPDF_Font font)
    HPDF_INT HPDF_Font_GetDescent (HPDF_Font font)
    HPDF_UINT HPDF_Font_GetXHeight (HPDF_Font font)
    HPDF_UINT HPDF_Font_GetCapHeight (HPDF_Font font)
    HPDF_TextWidth HPDF_Font_TextWidth (HPDF_Font font, const HPDF_BYTE *text, HPDF_UINT len)
    HPDF_UINT HPDF_Font_MeasureText (HPDF_Font font, const HPDF_BYTE *text, HPDF_UINT len, HPDF_REAL width, HPDF_REAL font_size, HPDF_REAL char_space, HPDF_REAL word_space, HPDF_BOOL wordwrap, HPDF_REAL *real_width)
    HPDF_ExtGState HPDF_CreateExtGState (HPDF_Doc pdf)
    HPDF_STATUS HPDF_ExtGState_SetAlphaStroke (HPDF_ExtGState ext_gstate, HPDF_REAL value)
    HPDF_STATUS HPDF_ExtGState_SetAlphaFill (HPDF_ExtGState ext_gstate, HPDF_REAL value)
    #HPDF_STATUS HPDF_ExtGState_SetBlendMode (HPDF_ExtGState ext_gstate, HPDF_BlendMode mode)
    HPDF_REAL HPDF_Page_TextWidth (HPDF_Page page, const char *text)
    HPDF_UINT HPDF_Page_MeasureText (HPDF_Page page, const char *text, HPDF_REAL width, HPDF_BOOL wordwrap, HPDF_REAL *real_width)
    HPDF_REAL HPDF_Page_GetWidth  (HPDF_Page   page)
    HPDF_REAL HPDF_Page_GetHeight (HPDF_Page page)
    HPDF_UINT16 HPDF_Page_GetGMode (HPDF_Page page)
    HPDF_Point HPDF_Page_GetCurrentPos (HPDF_Page page)
    HPDF_STATUS HPDF_Page_GetCurrentPos2 (HPDF_Page page, HPDF_Point *pos)
    HPDF_Point HPDF_Page_GetCurrentTextPos (HPDF_Page page)
    HPDF_STATUS HPDF_Page_GetCurrentTextPos2 (HPDF_Page page, HPDF_Point *pos)
    HPDF_Font HPDF_Page_GetCurrentFont (HPDF_Page page)
    HPDF_REAL HPDF_Page_GetCurrentFontSize (HPDF_Page page)
    HPDF_TransMatrix HPDF_Page_GetTransMatrix (HPDF_Page page)
    HPDF_REAL HPDF_Page_GetLineWidth (HPDF_Page page)
    HPDF_LineCap HPDF_Page_GetLineCap (HPDF_Page page)
    HPDF_LineJoin HPDF_Page_GetLineJoin (HPDF_Page page)
    HPDF_REAL HPDF_Page_GetMiterLimit (HPDF_Page page)
    HPDF_DashMode HPDF_Page_GetDash (HPDF_Page page)
    HPDF_REAL HPDF_Page_GetFlat (HPDF_Page page)
    HPDF_REAL HPDF_Page_GetCharSpace (HPDF_Page page)
    HPDF_REAL HPDF_Page_GetWordSpace (HPDF_Page page)
    HPDF_REAL HPDF_Page_GetHorizontalScalling (HPDF_Page page)
    HPDF_REAL HPDF_Page_GetTextLeading (HPDF_Page page)
    HPDF_TextRenderingMode HPDF_Page_GetTextRenderingMode (HPDF_Page page)
    HPDF_REAL HPDF_Page_GetTextRaise (HPDF_Page page)
    HPDF_REAL HPDF_Page_GetTextRise (HPDF_Page page)
    HPDF_RGBColor HPDF_Page_GetRGBFill (HPDF_Page page)
    HPDF_RGBColor HPDF_Page_GetRGBStroke (HPDF_Page page)
    HPDF_CMYKColor HPDF_Page_GetCMYKFill (HPDF_Page page)
    HPDF_CMYKColor HPDF_Page_GetCMYKStroke (HPDF_Page page)
    HPDF_REAL HPDF_Page_GetGrayFill (HPDF_Page page)
    HPDF_REAL HPDF_Page_GetGrayStroke (HPDF_Page page)
    HPDF_ColorSpace HPDF_Page_GetStrokingColorSpace (HPDF_Page page)
    HPDF_ColorSpace HPDF_Page_GetFillingColorSpace (HPDF_Page page)
    HPDF_TransMatrix HPDF_Page_GetTextMatrix (HPDF_Page page)
    HPDF_UINT HPDF_Page_GetGStateDepth (HPDF_Page page)
    HPDF_STATUS HPDF_Page_SetLineWidth (HPDF_Page page, HPDF_REAL line_width)
    HPDF_STATUS HPDF_Page_SetLineCap (HPDF_Page page, HPDF_LineCap line_cap)
    HPDF_STATUS HPDF_Page_SetLineJoin (HPDF_Page page, HPDF_LineJoin line_join)
    HPDF_STATUS HPDF_Page_SetDash (HPDF_Page page, const HPDF_UINT16 *dash_ptn, HPDF_UINT num_param, HPDF_UINT phase)
    HPDF_STATUS HPDF_Page_GSave (HPDF_Page page)
    HPDF_STATUS HPDF_Page_GRestore (HPDF_Page page)
    HPDF_STATUS HPDF_Page_MoveTo (HPDF_Page page, HPDF_REAL x, HPDF_REAL y)
    HPDF_STATUS HPDF_Page_LineTo (HPDF_Page page, HPDF_REAL x, HPDF_REAL y)
    HPDF_STATUS HPDF_Page_CurveTo2 (HPDF_Page page, HPDF_REAL x2, HPDF_REAL y2, HPDF_REAL x3, HPDF_REAL y3)
    HPDF_STATUS HPDF_Page_CurveTo3 (HPDF_Page page, HPDF_REAL x1, HPDF_REAL y1, HPDF_REAL x3, HPDF_REAL y3)
    HPDF_STATUS HPDF_Page_ClosePath (HPDF_Page page)
    HPDF_STATUS HPDF_Page_Rectangle (HPDF_Page page, HPDF_REAL x, HPDF_REAL y, HPDF_REAL width, HPDF_REAL height)
    HPDF_STATUS HPDF_Page_Stroke (HPDF_Page page)
    HPDF_STATUS HPDF_Page_Fill (HPDF_Page page)
    HPDF_STATUS HPDF_Page_Eofill (HPDF_Page page)
    HPDF_STATUS HPDF_Page_FillStroke (HPDF_Page page)
    HPDF_STATUS HPDF_Page_Clip (HPDF_Page page)
    HPDF_STATUS HPDF_Page_Eoclip (HPDF_Page page)
    HPDF_STATUS HPDF_Page_BeginText (HPDF_Page page)
    HPDF_STATUS HPDF_Page_EndText (HPDF_Page page)
    HPDF_STATUS HPDF_Page_SetTextLeading (HPDF_Page page, HPDF_REAL value)
    HPDF_STATUS HPDF_Page_SetFontAndSize (HPDF_Page page, HPDF_Font font, HPDF_REAL size)
    HPDF_STATUS HPDF_Page_MoveTextPos (HPDF_Page page, HPDF_REAL x, HPDF_REAL y)
    HPDF_STATUS HPDF_Page_ShowText (HPDF_Page page, const char *text)
    HPDF_STATUS HPDF_Page_ShowTextNextLine (HPDF_Page page, const char *text)
    HPDF_STATUS HPDF_Page_SetGrayFill (HPDF_Page page, HPDF_REAL gray)
    HPDF_STATUS HPDF_Page_SetRGBFill (HPDF_Page page, HPDF_REAL r, HPDF_REAL g, HPDF_REAL b)
    HPDF_STATUS HPDF_Page_SetRGBStroke (HPDF_Page page, HPDF_REAL r, HPDF_REAL g, HPDF_REAL b)
    HPDF_STATUS HPDF_Page_TextOut (HPDF_Page page, HPDF_REAL xpos, HPDF_REAL ypos, const char *text)
    HPDF_STATUS HPDF_Page_SetTextMatrix (HPDF_Page page, HPDF_REAL a, HPDF_REAL b, HPDF_REAL c, HPDF_REAL d, HPDF_REAL x, HPDF_REAL y)
    HPDF_STATUS HPDF_Page_Concat (HPDF_Page page, HPDF_REAL a, HPDF_REAL b, HPDF_REAL c, HPDF_REAL d, HPDF_REAL x, HPDF_REAL y)
