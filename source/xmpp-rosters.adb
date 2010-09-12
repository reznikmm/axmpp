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

package body XMPP.Rosters is

   use XMPP.Objects;

   ----------------
   --  Get_Kind  --
   ----------------
   overriding function Get_Kind (Self : XMPP_Roster)
      return Objects.Object_Kind
   is
   begin
      return XMPP.Objects.Roster;
   end Get_Kind;

   -----------------
   --  Serialize  --
   -----------------
   overriding function Serialize (Self : in XMPP_Roster)
      return League.Strings.Universal_String
   is
   begin
      return X : League.Strings.Universal_String;
   end Serialize;

   -------------------
   --  Set_Content  --
   -------------------
   overriding
   procedure Set_Content (Self      : in out XMPP_Roster;
                          Parameter : League.Strings.Universal_String;
                          Value     : League.Strings.Universal_String) is
   begin
      raise Program_Error with "Not yet implemented";
   end Set_Content;

   -------------------
   --  Items_Count  --
   -------------------
   function Items_Count (Self : XMPP_Roster) return Natural is
   begin
      return Natural (Self.Items.Length);
   end Items_Count;

   ---------------
   --  Item_At  --
   ---------------
   function Item_At (Self : XMPP_Roster; Pos : Natural)
      return not null XMPP.Roster_Items.XMPP_Roster_Item_Access is
   begin
      return XMPP.Roster_Items.XMPP_Roster_Item_Access
               (Self.Items.Element (Pos));
   end Item_At;

   -------------------
   --  Append_Item  --
   -------------------
   procedure Append_Item
     (Self : in out XMPP_Roster;
      Item : not null XMPP.Roster_Items.XMPP_Roster_Item_Access) is
   begin
      Self.Items.Append (XMPP_Object_Access (Item));
   end Append_Item;

   --------------
   --  Create  --
   --------------
   function Create return not null Xmpp_Roster_Access is
   begin
      return new XMPP_Roster;
   end Create;

end XMPP.Rosters;