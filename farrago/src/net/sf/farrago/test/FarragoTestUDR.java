/*
// $Id$
// Farrago is a relational database management system.
// Copyright (C) 2004-2004 John V. Sichi.
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public License
// as published by the Free Software Foundation; either version 2.1
// of the License, or (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*/
package net.sf.farrago.test;

import java.sql.*;

/**
 * FarragoTestUDR contains definitions for user-defined routines used
 * by tests.
 *
 * @author John V. Sichi
 * @version $Id$
 */
public abstract class FarragoTestUDR
{
    public static String noargs()
    {
        return "get your kicks on route 66";
    }

    public static String substring24(String in)
    {
        return in.substring(2, 4);
    }

    public static String toHexString(int i)
    {
        return Integer.toHexString(i);
    }
    
    public static String toHexString(Integer i)
    {
        if (i == null) {
            return "nada";
        } else {
            return Integer.toHexString(i.intValue());
        }
    }

    public static int atoi(String s)
    {
        return Integer.parseInt(s);
    }

    public static Integer atoiWithNullForErr(String s)
    {
        try {
            return new Integer(Integer.parseInt(s));
        } catch (NumberFormatException ex) {
            return null;
        }
    }

    public static void setSystemProperty(String name, String value)
    {
        System.setProperty(name, value);
    }

    public static int accessSql()
    {
        try {
            Connection conn = DriverManager.getConnection(
                "jdbc:default:connection");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("values 777");
            rs.next();
            
            // NOTE jvs 19-Jan-2005:  no need for cleanup; default connection
            // is cleaned up automatically.
            return rs.getInt(1);
        } catch (SQLException ex) {
            return 0;
        }
    }

    public static String decryptPublicKey(byte [] keyBytes)
    {
        if (keyBytes == null) {
            return null;
        }
        return new String(keyBytes);
    }

    public static int throwSQLException() throws SQLException
    {
        throw new SQLException("nothing but a failure");
    }
    
    public static int throwNPE()
    {
        throw new NullPointerException();
    }
}

// End FarragoTestUDR.java