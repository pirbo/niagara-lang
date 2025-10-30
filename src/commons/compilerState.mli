(** Some generation functions uses encapsulated mutable states. This module
    allows a global state reset of the compiler without braking encapsulation by
    provinding a local way to react to a reset command. *)

val register_on_reset : (unit -> unit) -> unit
(** Register function called on reset *)

val reset : unit -> unit
(** Global reset *)
