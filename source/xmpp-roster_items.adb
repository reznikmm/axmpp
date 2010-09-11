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
--  <Unit> XMPP.Sessions
--  <ImplementationNotes>
--
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with XMPP.Objects;

package body XMPP.Roster_Items is

   ----------------
   --  Get_Kind  --
   ----------------
   overriding function Get_Kind (Self : XMPP_Roster_Item)
      return Objects.Object_Kind
   is
   begin
      return XMPP.Objects.Roster_Item;
   end Get_Kind;

   -----------------
   --  Serialize  --
   -----------------
   overriding function Serialize (Self : in XMPP_Roster_Item)
      return League.Strings.Universal_String
   is
   begin
      return X : League.Strings.Universal_String;
   end Serialize;

   -------------------
   --  Set_Content  --
   -------------------
   overriding
   procedure Set_Content (Self      : in out XMPP_Roster_Item;
                          Parameter : League.Strings.Universal_String;
                          Value     : League.Strings.Universal_String) is
   begin
      raise Program_Error with "Not yet implemented";
   end Set_Content;

   ------------------------
   --  Set_Subscription  --
   ------------------------
   procedure Set_Subscription (Self  : in out XMPP_Roster_Item;
                               Value : Subscription_Type) is
   begin
      Self.Subscription := Value;
   end Set_Subscription;

   ------------------------
   --  Get_Subscription  --
   ------------------------
   function Get_Subscription (Self : XMPP_Roster_Item)
      return Subscription_Type is
   begin
      return Self.Subscription;
   end Get_Subscription;

   ---------------
   --  Get_JID  --
   ---------------
   function Get_JID (Self : XMPP_Roster_Item)
      return League.Strings.Universal_String is
   begin
      return Self.JID;
   end Get_JID;

   ----------------
   --  Get_Name  --
   ----------------
   function Get_Name (Self : XMPP_Roster_Item)
      return League.Strings.Universal_String is
   begin
      return Self.Name;
   end Get_Name;

   ---------------
   --  Set_JID  --
   ---------------
   procedure Set_JID (Self : in out XMPP_Roster_Item;
                      Value : League.Strings.Universal_String) is
   begin
      Self.JID := Value;
   end Set_JID;

   ----------------
   --  Set_Name  --
   ----------------
   procedure Set_Name (Self  : in out XMPP_Roster_Item;
                       Value : League.Strings.Universal_String) is
   begin
      Self.Name := Value;
   end Set_Name;

end XMPP.Roster_Items;
