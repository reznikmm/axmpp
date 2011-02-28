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
--  <Unit> XMPP.Binds
--  <ImplementationNotes>
--
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with XMPP.IQS;
with XMPP.Objects;

with League.Strings;
with XML.SAX.Pretty_Writers;

package XMPP.Binds is

   Bind_Element : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("bind");

   Bind_URI : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String
         ("urn:ietf:params:xml:ns:xmpp-bind");

   Resource_Element : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("resource");

   type Bind_State is (Success, Error);

   type XMPP_Bind is new XMPP.IQS.XMPP_IQ with private;

   type XMPP_Bind_Access is access all XMPP_Bind'Class;

   function Create return not null XMPP_Bind_Access;
   --  returns heap allocated object

   procedure Set_Resource (Self : in out XMPP_Bind;
                           Res  : League.Strings.Universal_String);
   --  Sets resource

   procedure Set_JID (Self : in out XMPP_Bind;
                      JID  : League.Strings.Universal_String);
   --  Sets JID

   function Get_Resource (Self : XMPP_Bind)
      return League.Strings.Universal_String;
   --  Returns resource

   function Get_JID (Self : XMPP_Bind) return League.Strings.Universal_String;
   --  Returns JID

   --  Private API, should not be used by application
   overriding function Get_Kind (Self : XMPP_Bind) return Objects.Object_Kind;

   overriding procedure Serialize
    (Self   : XMPP_Bind;
     Writer : in out XML.SAX.Pretty_Writers.SAX_Pretty_Writer'Class);

   overriding
   procedure Set_Content (Self      : in out XMPP_Bind;
                          Parameter : League.Strings.Universal_String;
                          Value     : League.Strings.Universal_String);

private

   type XMPP_Bind is new XMPP.IQS.XMPP_IQ with
   record
      JID      : League.Strings.Universal_String;
      Resource : League.Strings.Universal_String;
   end record;

end XMPP.Binds;
