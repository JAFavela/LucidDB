/*
// $Id$
// Fennel is a library of data storage and processing components.
// Copyright (C) 2005-2005 LucidEra, Inc.
// Copyright (C) 2005-2005 The Eigenbase Project
//
// This program is free software; you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the Free
// Software Foundation; either version 2 of the License, or (at your option)
// any later version approved by The Eigenbase Project.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#include "fennel/common/CommonPreamble.h"
#include "fennel/test/ExecStreamUnitTestBase.h"
#include "fennel/tuple/StandardTypeDescriptor.h"
#include "fennel/exec/ValuesExecStream.h"
#include "fennel/exec/ExecStreamEmbryo.h"
#include "fennel/lucidera/bitmap/LbmEntry.h"
#include "fennel/lucidera/bitmap/LbmUnionExecStream.h"
#include <stdarg.h>

#include <boost/test/test_tools.hpp>

using namespace fennel;

class LbmUnionExecStreamTest : public ExecStreamUnitTestBase
{
public:
    explicit LbmUnionExecStreamTest()
    {
        FENNEL_UNIT_TEST_CASE(LbmUnionExecStreamTest, testBuffer);
    }

    void testBuffer();
};

void LbmUnionExecStreamTest::testBuffer()
{

}

FENNEL_UNIT_TEST_SUITE(LbmUnionExecStreamTest);

// End LbmUnionExecStreamTest.cpp