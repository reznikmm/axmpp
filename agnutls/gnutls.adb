------------------------------------------------------------------------------
--                                                                          --
--                          Unix Instant Messenger                          --
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
-- Public License distributed with UIM;  see file COPYING.  If not, write   --
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
--  <Unit> GNUTLS
--  <ImplementationNotes>
--
------------------------------------------------------------------------------
--  $Revision$ $Author$
--  $Date$
------------------------------------------------------------------------------
with Interfaces.C;
with Interfaces.C.Extensions;
with System;

package body GNUTLS is
   use type Ada.Streams.Stream_Element_Count;
   use type Interfaces.C.size_t;
   use type Interfaces.C.int;

   --
   function gnutls_anon_allocate_client_credentials
     (SC : access Anon_Client_Credentials) return Interfaces.C.int;
   pragma Import (C,
                  gnutls_anon_allocate_client_credentials,
                  "gnutls_anon_allocate_client_credentials");

   --
   function gnutls_global_init return Interfaces.C.int;
   pragma Import (C, gnutls_global_init, "gnutls_global_init");

   --
   function gnutls_init (S : access Session; CE : Connection_End)
      return Interfaces.C.int;
   pragma Import (C, gnutls_init, "gnutls_init");

   --
   function gnutls_priority_set_direct
     (S          : Session;
      Priorities : Interfaces.C.char_array;
      Error_Pos  : Interfaces.C.char_array)
      return Interfaces.C.int;
   pragma Import (C, gnutls_priority_set_direct, "gnutls_priority_set_direct");

   --
   function gnutls_set_default_priority (S : Session) return Interfaces.C.int;
   pragma Import
     (C, gnutls_set_default_priority, "gnutls_set_default_priority");

   --
   function gnutls_kx_set_priority
     (S : Session; Kx_Prio : System.Address)
      return Interfaces.C.int;
   pragma Import (C, gnutls_kx_set_priority, "gnutls_kx_set_priority");

   --
   function gnutls_credentials_set_anon (S      : Session;
                                         C_Type : Credentials_Type;
                                         Cred   : Anon_Client_Credentials)
     return Interfaces.C.int;
   pragma Import (C,
                  gnutls_credentials_set_anon,
                  "gnutls_credentials_set");

   --
   function gnutls_credentials_set (S      : Session;
                                    C_Type : Credentials_Type;
                                    Cred   : Certificate_Client_Credentials)
      return Interfaces.C.int;
   pragma Import (C, gnutls_credentials_set, "gnutls_credentials_set");

   --
   function gnutls_certificate_allocate_credentials
     (SC : access Certificate_Client_Credentials)
      return Interfaces.C.int;
   pragma Import (C,
                  gnutls_certificate_allocate_credentials,
                  "gnutls_certificate_allocate_credentials");

   --
   procedure gnutls_transport_set_ptr (S   : Session;
                                       Ptr : Interfaces.C.int);
   pragma Import (C, gnutls_transport_set_ptr, "gnutls_transport_set_ptr");

   --
   function gnutls_handshake (S : Session) return Interfaces.C.int;
   pragma Import (C, gnutls_handshake, "gnutls_handshake");

   --
   function gnutls_record_send
     (S         : Session;
      Data      : GNAT.Sockets.Stream_Element_Reference;
      Data_Size : Interfaces.C.size_t)
      return Interfaces.C.size_t;
   pragma Import (C, gnutls_record_send, "gnutls_record_send");

   --
   function gnutls_record_recv
     (S         : Session;
      Data      : GNAT.Sockets.Stream_Element_Reference;
      Data_Size : Interfaces.C.size_t)
     return Interfaces.C.size_t;
   pragma Import (C, gnutls_record_recv, "gnutls_record_recv");

   --
   function gnutls_bye (S : Session; How : Close_Request)
      return Interfaces.C.int;
   pragma Import (C, gnutls_bye, "gnutls_bye");

   --
   procedure gnutls_deinit (S : Session);
   pragma Import (C, gnutls_deinit, "gnutls_deinit");

   --
   procedure gnutls_anon_free_client_credentials
     (SC : Anon_Client_Credentials);
   pragma Import (C,
                  gnutls_anon_free_client_credentials,
                  "gnutls_anon_free_client_credentials");

   --
   procedure gnutls_global_deinit;
   pragma Import (C, gnutls_global_deinit, "gnutls_global_deinit");

   --
   procedure gnutls_perror (Code : Interfaces.C.int);
   pragma Import (C, gnutls_perror, "gnutls_perror");

   --
   procedure gnutls_global_set_log_level (Level : Interfaces.C.int);
   pragma Import (C,
                  gnutls_global_set_log_level,
                  "gnutls_global_set_log_level");

   --
   function gnutls_cipher_set_priority (S    : Session;
                                        List : System.Address)
     return Interfaces.C.int;
   pragma Import (C, gnutls_cipher_set_priority, "gnutls_cipher_set_priority");

   --
   function gnutls_protocol_set_priority (S    : Session;
                                          List : System.Address)
     return Interfaces.C.int;
   pragma Import (C,
                  gnutls_protocol_set_priority,
                  "gnutls_protocol_set_priority");

   --
   function gnutls_compression_set_priority
     (S : Session; List : System.Address)
      return Interfaces.C.int;
   pragma Import (C,
                  gnutls_compression_set_priority,
                  "gnutls_compression_set_priority");

   --
   function gnutls_mac_set_priority
     (S : Session; List : System.Address)
      return Interfaces.C.int;
   pragma Import (C,
                  gnutls_mac_set_priority,
                  "gnutls_mac_set_priority");

   -------------------
   --  Global_Init  --
   -------------------
   procedure Global_Init
   is
      Ret : Integer := Integer (gnutls_global_init);

   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error
           with "Some error occuered during gnutls initialization";
      end if;
   end Global_Init;

   ----------------------------------------
   --  Anon_Allocate_Client_Credentials  --
   ----------------------------------------
   procedure Anon_Allocate_Client_Credentials
     (SC : out Anon_Client_Credentials)
   is
      Tmp : aliased Anon_Client_Credentials;
      Ret : Integer
        := Integer (gnutls_anon_allocate_client_credentials (Tmp'Access));
   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "cannot do Anon_Allocate_Client_Credentials";
      end if;

      SC := Tmp;
   end Anon_Allocate_Client_Credentials;

   ----------------------------------------
   --  Certificate_Allocate_Credentials  --
   ----------------------------------------

   procedure Certificate_Allocate_Credentials
     (SC : out Certificate_Client_Credentials)
   is
      Tmp : aliased Certificate_Client_Credentials;
      Ret : Integer
        := Integer (gnutls_certificate_allocate_credentials (Tmp'Access));

   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "Certificate_Allocate_Credentials failed";
      end if;

      SC := Tmp;
   end Certificate_Allocate_Credentials;

   ------------
   --  Init  --
   ------------
   procedure Init (S : out Session; CE : Connection_End)
   is
      Tmp : aliased Session;
      Ret : Integer := Integer (gnutls_init (Tmp'Access, CE));

   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "Cannot do Init";
      end if;
      S := Tmp;
   end Init;

   ---------------------------
   --  Priority_Set_Direct  --
   ---------------------------
   procedure Priority_Set_Direct (S : Session;
                                  Priorities : String;
                                  Error_Pos  : out String)
   is
      X : Interfaces.C.char_array (1 .. 256);
      pragma Warnings (Off, X);
      Ret : Integer
        := Integer (gnutls_priority_set_direct (S,
                                                Interfaces.C.To_C (Priorities),
                                                X));

   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         Error_Pos := Interfaces.C.To_Ada (X);
         raise GNUTLS_Error with "Priority_Set_Direct error";
      end if;
   end Priority_Set_Direct;

   -----------------------
   --  Credentials_Set  --
   -----------------------
   procedure Credentials_Set (S    : Session;
                              T    : Credentials_Type;
                              Cred : Anon_Client_Credentials)
   is
      Ret : Integer := Integer (gnutls_credentials_set_anon (S, T, Cred));

   begin
      if  Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "Credentials_Set error";
      end if;
   end Credentials_Set;


   procedure Credentials_Set (S    : Session;
                              T    : Credentials_Type;
                              Cred : Certificate_Client_Credentials)
   is
      Ret : Integer := Integer (gnutls_credentials_set (S, T, Cred));

   begin
      if  Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "Credentials_Set error";
      end if;
   end Credentials_Set;

   -------------------------
   --  Transport_Set_Ptr  --
   -------------------------
   procedure Transport_Set_Ptr (S      : Session;
                                Socket : GNAT.Sockets.Socket_Type)
   is
      Sock : Interfaces.C.int
        := Interfaces.C.int (GNAT.Sockets.To_C (Socket));

   begin
      gnutls_transport_set_ptr (S, Sock);
   end Transport_Set_Ptr;

   -----------------
   --  Handshake  --
   -----------------
   procedure Handshake (S : Session)
   is
      Ret : Integer
        := Integer (gnutls_handshake (S));
   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "Handshake failed";
      end if;
   end Handshake;

   -------------------
   --  Record_Send  --
   -------------------
   procedure Record_Send (S      : Session;
                          Data   : GNAT.Sockets.Vector_Type;
                          Length : out Ada.Streams.Stream_Element_Count)
   is
      N_Write : Interfaces.C.size_t;

   begin
      Length := 0;

      for I in Data'Range loop
         N_Write := gnutls_record_send (S,
                                        Data (I).Base,
                                        Interfaces.C.size_t (Data (I).Length));

         if N_Write <= 0 then
            raise GNUTLS_Error with "Data written <= 0";
         end if;

         Length := Length + Ada.Streams.Stream_Element_Count (N_Write);

         if N_Write < Interfaces.C.size_t (Data (I).Length) then
            --  nothing to write
            return;
         end if;
      end loop;

   end Record_Send;

   -------------------
   --  Record_Recv  --
   -------------------
   procedure Record_Recv (S      : Session;
                          Data   : GNAT.Sockets.Vector_Type;
                          Length : out Ada.Streams.Stream_Element_Count)
   is
      N_Read : Interfaces.C.size_t;

   begin
      Length := 0;

      for I in Data'Range loop
         N_Read := gnutls_record_recv (S,
                                       Data (I).Base,
                                       Interfaces.C.size_t (Data (I).Length));

         if N_Read <= 0 then
            raise GNUTLS_Error with "Data read <= 0";
         end if;

         Length := Length + Ada.Streams.Stream_Element_Count (N_Read);

         if N_Read < Interfaces.C.size_t (Data (I).Length) then
            --  nothing to read
            return;
         end if;
      end loop;

   end Record_Recv;

   -----------
   --  Bye  --
   -----------
   procedure Bye (S : Session; How : Close_Request)
   is
      Ret : Integer := Integer (gnutls_bye (S, How));

   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "Bye failed";
      end if;
   end Bye;

   --------------
   --  Deinit  --
   --------------
   procedure Deinit (S : Session)
   is
   begin
      gnutls_deinit (S);
   end Deinit;

   ------------------------------------
   --  Anon_Free_Client_Credentials  --
   ------------------------------------
   procedure Anon_Free_Client_Credentials (Cert : Anon_Client_Credentials)
   is
   begin
      gnutls_anon_free_client_credentials (Cert);
   end Anon_Free_Client_Credentials;

   -------------------
   --  Global_Init  --
   -------------------
   procedure Global_Deinit
   is
   begin
      gnutls_global_deinit;
   end Global_Deinit;

   ---------------------
   --  Set_Log_Level  --
   ---------------------
   procedure Global_Set_Log_Level (Level : Integer) is
   begin
      gnutls_global_set_log_level (Interfaces.C.int (Level));
   end Global_Set_Log_Level;

   ----------------------------
   --  Set_Default_Priority  --
   ----------------------------

   procedure Set_Default_Priority (S : Session) is
      Ret : Integer := Integer (gnutls_set_default_priority (S));

   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "Set_Default_Priority failed";
      end if;
   end Set_Default_Priority;

   -----------------------
   --  KX_Set_Priority  --
   -----------------------

   procedure KX_Set_Priority (S : Session; KX_Prio : KX_Algorithm_Array)
   is
      Ret : Integer
        := Integer (gnutls_kx_set_priority
                      (S, KX_Prio (KX_Prio'First)'Address));
   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "KX_Set_Priority failed";
      end if;
   end KX_Set_Priority;

   ---------------------------
   --  Cipher_Set_Priority  --
   ---------------------------

   procedure Cipher_Set_Priority (S : Session; Prio : Cipher_Algorithm_Array)
   is
      Ret : Integer
        := Integer (gnutls_cipher_set_priority (S, Prio (Prio'First)'Address));

   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "Cipher_Set_Priority failed";
      end if;
   end Cipher_Set_Priority;

   -----------------------------
   --  Protocol_Set_Priority  --
   -----------------------------

   procedure Protocol_Set_Priority (S : Session; PA : Protocol_Array) is
      Ret : Integer
        := Integer (gnutls_protocol_set_priority (S, PA (PA'First)'Address));

   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "Protocol_Set_Priority failed";
      end if;
   end Protocol_Set_Priority;

   --------------------------------
   --  Compression_Set_Priority  --
   --------------------------------

   procedure Compression_Set_Priority (S  : Session;
                                       CM : Compression_Method_Array) is
      Ret : Integer
        := Integer (gnutls_compression_set_priority
                      (S, CM (CM'First)'Address));

   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "Compression_Set_Priority failed";
      end if;
   end Compression_Set_Priority;

   ------------------------
   --  Mac_Set_Priority  --
   ------------------------

   procedure Mac_Set_Priority (S : Session; MA : Mac_Algorithm_Array) is
      Ret : Integer
        := Integer (gnutls_mac_set_priority (S, MA (MA'First)'Address));

   begin
      if Ret /= 0 then
         gnutls_perror (Interfaces.C.int (Ret));
         raise GNUTLS_Error with "Mac_Set_Priority failed";
      end if;
   end Mac_Set_Priority;

end GNUTLS;