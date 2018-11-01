import sys
cimport cython
cimport hpdf
include "hpdf_consts.pxi"
include "units.pxi"
from libc.math cimport cos, sin

@cython.callspec("__cdecl")
cdef void error_handler(long unsigned int error_no, long unsigned int detail_no, void *user_data):
    print("ERROR: %s, detail_no=%u" % (error_detail[error_no], detail_no))

cdef class Canvas(object):

    cdef void *_pdf
    cdef bytes _filename
    cdef void *_page
    cdef void *_font
    cdef float _fontsize
    cdef float _rad

    def __cinit__(self, str filename):
        self._filename = filename.encode('utf-8')
        self._pdf = hpdf.HPDF_New(&error_handler, NULL)
        hpdf.HPDF_SetCompressionMode(self._pdf, HPDF_COMP_ALL)
        self._page = hpdf.HPDF_AddPage(self._pdf)
        self._rad = 0
        self.setFont('Helvetica', 14)

    def drawString(self, float x, float y, str text):
        hpdf.HPDF_Page_BeginText(self._page)
        cdef bytes s = text.encode('utf-8')
        # rotate text
        cdef float r = self._rad
        if r > 0:
            hpdf.HPDF_Page_SetTextMatrix(self._page, cos(r), sin(r), -sin(r), cos(r), x, y)
            hpdf.HPDF_Page_ShowText(self._page, s)
        else:
            hpdf.HPDF_Page_TextOut(self._page, x, y, s)
        hpdf.HPDF_Page_EndText(self._page)

    def line(self, float x1, float y1, float x2, float y2):
        hpdf.HPDF_Page_MoveTo(self._page, x1, y1)
        hpdf.HPDF_Page_LineTo(self._page, x2, y2)
        hpdf.HPDF_Page_Stroke(self._page)

    def save(self):
        hpdf.HPDF_SaveToFile(self._pdf, self._filename)
        hpdf.HPDF_Free(self._pdf)

    def rect(self, float x, float y, float width, float height, int fill=False, int stroke=True):
        hpdf.HPDF_Page_Rectangle(self._page, x, y, width, height)
        if fill and stroke:
            hpdf.HPDF_Page_FillStroke(self._page)
        elif fill:
            hpdf.HPDF_Page_Fill(self._page)
        else:
            hpdf.HPDF_Page_Stroke(self._page)

    def rotate(self, float angle):
        self._rad = angle / 180.0 * 3.141592; # Calcurate the radian value.

    def setFont(self, str font, float size):
        self._fontsize = size
        cdef bytes s = font.encode('utf-8')
        self._font = hpdf.HPDF_GetFont(self._pdf, s, NULL)
        hpdf.HPDF_Page_SetFontAndSize(self._page, self._font, self._fontsize)

    def setFillColorRGB(self, float r, float g, float b):
        hpdf.HPDF_Page_SetRGBFill(self._page, r, g, b)

    def setStrokeColorRGB(self, float r, float g, float b):
        hpdf.HPDF_Page_SetRGBStroke(self._page, r, g, b)

    def transform(self, float a, float b, float c, float d, float x, float y):
        hpdf.HPDF_Page_Concat(self._page, a, b, c, d, x, y)

    def translate(self, float dx, float dy):
        self.transform(1, 0, 0, 1, dx, dy)

    def __del__(self):
        hpdf.HPDF_Free(self._pdf)
