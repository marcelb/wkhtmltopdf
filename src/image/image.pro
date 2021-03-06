# Copyright 2010 wkhtmltopdf authors
#
# This file is part of wkhtmltopdf.
#
# wkhtmltopdf is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# wkhtmltopdf is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with wkhtmltopdf.  If not, see <http:#www.gnu.org/licenses/>.

include(../../version.pri)
include(../../common.pri)

QT += svg

MOC_DIR = ../../build/image
OBJECTS_DIR = ../../build/image
UI_DIR = ../../build/image

TEMPLATE = app
TARGET = wkhtmltoimage
DESTDIR = ../../bin
DEPENDPATH += . ../shared
INCLUDEPATH += . ../shared

readme.target=README_WKHTMLTOIMAGE
readme.commands=./wkhtmltoimage --readme > README_WKHTMLTOIMAGE
readme.depends=wkhtmltoimage

QMAKE_EXTRA_TARGETS += readme

unix {
    man.target=wkhtmltoimage.1.gz
    man.commands=./wkhtmltoimage --manpage | gzip > $@
    man.depends=wkhtmltoimage

    manins.target=manins
    manins.depends=man
    manins.files=wkhtmltoimage.1.gz
    manins.path=$$INSTALLBASE/share/man/man1

    QMAKE_EXTRA_TARGETS += manins man
    INSTALLS += manins
}

INSTALLS += target
target.path=$$INSTALLBASE/bin

include(../shared/shared.pri)

# Input
HEADERS += imageconverter.hh imageconverter_p.hh settings.hh converter.hh
SOURCES += wkhtmltoimage.cc arguments.cc commandlineparser.cc docparts.cc \
           imageconverter.cc settings.cc
