------------------------------------------------------------------------------
--                                                                          --
--                                 AXMPP                                    --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Copyright © 2010 Alexander Basov <coopht@gmail.com>                      --
--                                                                          --
-- This is free software;  you can  redistribute it and/or modify it under  --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 2,  or (at your option) any later ver- --
-- sion. UIM is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License distributed with UIM;  see file COPYING.  If not, write --
-- to  the  Free Software Foundation,  51  Franklin  Street,  Fifth  Floor, --
-- Boston, MA 02110-1301, USA.                                              --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable  to  be --
-- covered  by the  GNU  General  Public  License.  This exception does not --
-- however invalidate  any other reasons why  the executable file  might be --
-- covered by the  GNU Public License.                                      --
--                                                                          --
------------------------------------------------------------------------------
--
--  <Unit> XMPP.Objects
--  <ImplementationNotes>
--
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with League.Strings;

package XMPP.Objects is

   type Object_Kind is
     (Challenge,
      IQ,
      Null_Object,
      Stream,
      Stream_Features);

   type XMPP_Object is limited interface;

   type XMPP_Object_Access is access all XMPP_Object'Class;

   ----------------
   --  Get_Kind  --
   ----------------
   not overriding
   function Get_Kind (Self : XMPP_Object) return XMPP.Objects.Object_Kind
      is abstract;
   -----------------
   --  Serialize  --
   -----------------
   not overriding
   function Serialize (Self : in XMPP_Object)
      return League.Strings.Universal_String is abstract;

   -------------------
   --  Set_Content  --
   -------------------
   not overriding
   procedure Set_Content (Self      : in out XMPP_Object;
                          Parameter : League.Strings.Universal_String;
                          Value     : League.Strings.Universal_String)
      is abstract;

end XMPP.Objects;
