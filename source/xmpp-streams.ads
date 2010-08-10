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
--  <Unit> XMPP.Streams
--  <ImplementationNotes>
--
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with XMPP.Objects;
with League.Strings;

package XMPP.Streams is

   type XMPP_Stream is new XMPP.Objects.XMPP_Object (XMPP.Objects.Stream)
     with private;

   -----------------
   --  Serialize  --
   -----------------
   overriding
   function Serialize (Self : in XMPP_Stream)
      return League.Strings.Universal_String;

   -------------------
   --  Set_Content  --
   -------------------
   overriding
   procedure Set_Content (Self      : in out XMPP_Stream;
                          Parameter : League.Strings.Universal_String;
                          Value     : League.Strings.Universal_String);

private

   type XMPP_Stream is new XMPP.Objects.XMPP_Object (XMPP.Objects.Stream) with
   record
      Id : League.Strings.Universal_String;
   end record;

end XMPP.Streams;
