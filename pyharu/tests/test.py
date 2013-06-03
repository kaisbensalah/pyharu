import test

print(test)
from test import Canvas, inch
c = Canvas('d:/test1.pdf')
c.translate(inch, inch)
c.setStrokeColorRGB(0.2, 0.5, 0.3)
c.line(0, 0, 0, 1.7 * inch)
c.line(0, 0, 1 * inch, 0)
c.setFillColorRGB(1, 0, 1)
c.rect(0.2 * inch, 0.2 * inch, 1 * inch, 1.5 * inch, fill=True)

c.setFillColorRGB(0, 0, 0.77)
c.rotate(90)
c.drawString(0.3*inch, -inch, "Hello World")

c.save()
print(test.mm)
