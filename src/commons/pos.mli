(** This module gives positions related oprations.

    Positions in the source code are tracked in order to return useful
    informations to user. *)

type t
(** Position type with generalized payload *)

val dummy : t
(** A dummy position corresponding to unspecified position. *)

module Text : sig
  type text = {
    start_line : int;
    start_column : int;
    stop_line : int;
    stop_column : int;
  }
  (** Source code location *)

  val make : start:Lexing.position -> stop:Lexing.position -> t
  (** [make ~start ~stop] creates a new position according to [start] and [stop]
      {!Lexing.position}s. *)

  val from_lexbuf : Sedlexing.lexbuf -> t
  (** [from_lexbuf lexbuf] returns a position from the given
      {!Sedlexing.lexbuf}. *)

  val set_gnu_style : bool -> unit
  (** Sets the GNU conventions for printing positions. *)

  val pp : t Fmt.t
  (** Position pretty-printer. *)
end
